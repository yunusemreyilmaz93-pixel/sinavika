import { callApi } from '@/lib/api'
import { AppError } from '@/lib/supabase'

type State = {
  startedAt: string | null
  deadline: string
  other: { sessionId: string } | null
  serverTime?: string
}
type Join = State & { sessionId: string; iceServers: RTCIceServer[] }
type Pull = {
  remoteSessionId: string
  renegotiate: boolean
  sdp: string | null
  tracks: { trackName: string | null; mid: string | null; failed: boolean }[]
}

export type RoomStatus = 'connecting' | 'waiting' | 'live' | 'ended' | 'error'
export type RoomSnapshot = {
  status: RoomStatus
  remote: MediaStream | null
  remoteVideo: boolean
  startedAt: number | null
  deadline: number | null
  error: string | null
}

const POLL_MS = 4000

function gathered(pc: RTCPeerConnection) {
  if (pc.iceGatheringState === 'complete') return Promise.resolve()
  return new Promise<void>((resolve) => {
    const done = () => {
      if (pc.iceGatheringState !== 'complete') return
      pc.removeEventListener('icegatheringstatechange', done)
      resolve()
    }
    pc.addEventListener('icegatheringstatechange', done)
    setTimeout(resolve, 2500)
  })
}

// Cloudflare Realtime ile iki kişilik görüşme. Her taraf kendi sesini ve görüntüsünü yayınlar, karşı tarafınkini çeker.
// Bütün SDP alışverişi /api/meeting üzerinden geçer, uygulama anahtarı tarayıcıya inmez
export class MeetingConnection {
  private pc: RTCPeerConnection | null = null
  private poll: ReturnType<typeof setInterval> | null = null
  private queue: Promise<unknown> = Promise.resolve()
  private pulledFrom: string | null = null
  private skew = 0
  private closed = false
  private snapshot: RoomSnapshot = {
    status: 'connecting',
    remote: null,
    remoteVideo: false,
    startedAt: null,
    deadline: null,
    error: null,
  }
  private readonly meetingId: string
  private readonly local: MediaStream
  private readonly onChange: (s: RoomSnapshot) => void

  constructor(meetingId: string, local: MediaStream, onChange: (s: RoomSnapshot) => void) {
    this.meetingId = meetingId
    this.local = local
    this.onChange = onChange
  }

  private set(patch: Partial<RoomSnapshot>) {
    this.snapshot = { ...this.snapshot, ...patch }
    if (!this.closed || patch.status === 'ended' || patch.status === 'error') this.onChange(this.snapshot)
  }

  private api<T>(action: string, extra: Record<string, unknown> = {}) {
    return callApi<T>('meeting', {
      action,
      meetingId: this.meetingId,
      ...extra,
    })
  }

  // Sıralı çalıştırma: aynı oturumda bir SDP alışverişi bitmeden diğeri başlamaz
  private serial<T>(fn: () => Promise<T>) {
    const next = this.queue.then(fn, fn)
    this.queue = next.catch(() => undefined)
    return next
  }

  private applyState(s: State) {
    if (s.serverTime) this.skew = Date.parse(s.serverTime) - Date.now()
    const startedAt = s.startedAt ? Date.parse(s.startedAt) - this.skew : null
    const deadline = Date.parse(s.deadline) - this.skew
    const hasMedia = Boolean(this.snapshot.remote?.getTracks().length)
    this.set({
      startedAt,
      deadline,
      status: s.other ? (hasMedia ? 'live' : 'connecting') : 'waiting',
    })
    if (s.other && s.other.sessionId !== this.pulledFrom) void this.serial(() => this.pull()).catch((e) => this.fail(e))
    if (!s.other && this.pulledFrom) {
      this.pulledFrom = null
      this.set({ remote: null, remoteVideo: false })
    }
    if (Date.now() >= deadline && startedAt) this.leave(false, 'ended')
  }

  async start() {
    try {
      const join = await this.api<Join>('join')
      const pc = new RTCPeerConnection({
        iceServers: join.iceServers,
        bundlePolicy: 'max-bundle',
      })
      this.pc = pc
      pc.addEventListener('track', (e) => {
        const stream = this.snapshot.remote ?? new MediaStream()
        stream.addTrack(e.track)
        this.set({
          remote: stream,
          remoteVideo: stream.getVideoTracks().length > 0,
          status: 'live',
        })
      })
      pc.addEventListener('connectionstatechange', () => {
        if (pc.connectionState === 'failed') this.fail(new AppError('Bağlantı koptu. Yeniden bağlanmayı deneyin'))
      })
      const tracks = this.local.getTracks().map((track) => ({
        track,
        transceiver: pc.addTransceiver(track, { direction: 'sendonly' }),
      }))
      await this.serial(async () => {
        await pc.setLocalDescription(await pc.createOffer())
        await gathered(pc)
        const res = await this.api<{ sdp: string }>('push', {
          sdp: pc.localDescription!.sdp,
          tracks: tracks.map(({ track, transceiver }) => ({
            mid: transceiver.mid!,
            trackName: track.kind,
          })),
        })
        await pc.setRemoteDescription({ type: 'answer', sdp: res.sdp })
      })
      this.applyState(join)
      this.poll = setInterval(() => {
        this.api<State>('state')
          .then((s) => !this.closed && this.applyState(s))
          .catch((e) => this.fail(e))
      }, POLL_MS)
    } catch (e) {
      this.fail(e)
    }
  }

  private async pull() {
    const pc = this.pc
    if (!pc || this.closed) return
    const res = await this.api<Pull>('pull')
    this.pulledFrom = res.remoteSessionId
    this.set({ remote: new MediaStream(), remoteVideo: false })
    if (res.renegotiate && res.sdp) {
      await pc.setRemoteDescription({ type: 'offer', sdp: res.sdp })
      await pc.setLocalDescription(await pc.createAnswer())
      await gathered(pc)
      await this.api('renegotiate', { sdp: pc.localDescription!.sdp })
    }
  }

  private fail(e: unknown) {
    if (this.closed) return
    const message = e instanceof Error ? e.message : 'Görüşme bağlantısı kurulamadı'
    if (/süresi doldu|sona erdi|iptal edildi/.test(message)) {
      this.leave(false, 'ended')
      return
    }
    this.stop()
    this.set({ status: 'error', error: message })
  }

  private stop() {
    this.closed = true
    if (this.poll) clearInterval(this.poll)
    this.poll = null
    this.pc?.close()
    this.pc = null
  }

  leave(endForBoth = false, status: RoomStatus = 'ended') {
    if (this.closed && this.snapshot.status === status) return
    this.stop()
    void callApi('meeting', {
      action: 'leave',
      meetingId: this.meetingId,
      end: endForBoth,
    }).catch(() => undefined)
    this.set({ status })
  }
}
