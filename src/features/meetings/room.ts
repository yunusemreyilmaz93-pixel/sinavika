import { getCamera, getMic, getScreenshare, PartyTracks, type TrackMetadata } from 'partytracks/client'
import { BehaviorSubject, combineLatest, debounceTime, distinctUntilChanged, map, of, startWith, Subscription, switchMap } from 'rxjs'
import { callApi } from '@/lib/api'
import { supabase } from '@/lib/supabase'

export type Media = { mic: boolean; camera: boolean; screen: boolean }
type Kind = 'audio' | 'video' | 'screen'
type Announced = { trackName: string; sessionId: string; location: 'remote'; kind: Kind }
export type RoomState = { startedAt: number | null; deadline: number; other: { media: Media } | null }
export type RoomStatus = 'idle' | 'joining' | 'live' | 'ended' | 'error'

type ApiState = { startedAt: string | null; deadline: string; serverTime: string; other: { tracks: Announced[]; media: Media } | null }

const POLL_MS = 3000
const kinds: Kind[] = ['audio', 'video', 'screen']
const sameMeta = (a: TrackMetadata | null, b: TrackMetadata | null) => a?.sessionId === b?.sessionId && a?.trackName === b?.trackName

// Bir görüşme odası. Ses, kamera ve ekran Cloudflare Realtime'a partytracks ile gönderilir. Bağlantı kopması,
// cihaz değişimi ve ağ değişiminde kütüphane izleri kendiliğinden yeniden kurar. Karşı tarafın izleri /api/meeting'den öğrenilir
export class MeetingRoom {
  readonly mic = getMic({ broadcasting: true })
  readonly camera = getCamera({
    broadcasting: true,
    constraints: { width: { ideal: 1280 }, height: { ideal: 720 }, frameRate: { max: 24 } },
  })
  readonly screen = getScreenshare({ activateSource: false, audio: false })
  readonly status$ = new BehaviorSubject<RoomStatus>('idle')
  readonly error$ = new BehaviorSubject<string | null>(null)
  readonly state$ = new BehaviorSubject<RoomState | null>(null)
  readonly connection$ = new BehaviorSubject<RTCPeerConnectionState>('new')
  readonly remote = {
    audio: new BehaviorSubject<MediaStreamTrack | null>(null),
    video: new BehaviorSubject<MediaStreamTrack | null>(null),
    screen: new BehaviorSubject<MediaStreamTrack | null>(null),
  }
  readonly media$ = combineLatest([this.mic.isBroadcasting$, this.camera.isBroadcasting$, this.screen.video.isBroadcasting$]).pipe(
    map(([mic, camera, screen]): Media => ({ mic, camera, screen })),
    distinctUntilChanged((a, b) => a.mic === b.mic && a.camera === b.camera && a.screen === b.screen),
  )

  private readonly headers = new Headers()
  private readonly remoteMeta = {
    audio: new BehaviorSubject<TrackMetadata | null>(null),
    video: new BehaviorSubject<TrackMetadata | null>(null),
    screen: new BehaviorSubject<TrackMetadata | null>(null),
  }
  private readonly subs = new Subscription()
  private poll: ReturnType<typeof setInterval> | null = null
  private skew = 0
  private failures = 0
  private media: Media = { mic: true, camera: true, screen: false }
  private readonly meetingId: string

  constructor(meetingId: string) {
    this.meetingId = meetingId
    this.headers.set('x-meeting-id', meetingId)
    this.subs.add(this.media$.subscribe((m) => (this.media = m)))
  }

  // Sayfa açılınca önizleme için kamera ve mikrofon açılır, katılmadan çıkılınca kapanır
  activate() {
    if (this.status$.value !== 'idle') return
    this.mic.startBroadcasting()
    this.camera.startBroadcasting()
  }

  deactivate() {
    if (this.status$.value === 'live' || this.status$.value === 'joining') return this.leave(false)
    this.mic.disableSource()
    this.camera.disableSource()
  }

  private api<T>(action: string, extra: Record<string, unknown> = {}) {
    return callApi<T>('meeting', { action, meetingId: this.meetingId, ...extra })
  }

  async join() {
    if (this.status$.value !== 'idle' && this.status$.value !== 'error') return
    this.status$.next('joining')
    this.error$.next(null)
    try {
      const { data } = await supabase.auth.getSession()
      if (!data.session) throw new Error('Oturum sona ermiş, tekrar giriş yapın')
      this.headers.set('x-izlek-auth', data.session.access_token)
      const auth = supabase.auth.onAuthStateChange((_event, session) => {
        if (session) this.headers.set('x-izlek-auth', session.access_token)
      })
      this.subs.add(() => auth.data.subscription.unsubscribe())
      this.applyState(await this.api<ApiState>('join'))

      const pt = new PartyTracks({ prefix: '/api/partytracks', headers: this.headers })
      this.subs.add(pt.peerConnectionState$.subscribe((s) => this.connection$.next(s)))
      this.subs.add(pt.sessionError$.subscribe(() => this.connection$.next('failed')))

      const audio$ = pt.push(this.mic.broadcastTrack$)
      const video$ = pt.push(this.camera.broadcastTrack$, { sendEncodings$: of([{ maxBitrate: 1_200_000, maxFramerate: 24 }]) })
      const screen$ = pt
        .push(this.screen.video.broadcastTrack$, { sendEncodings$: of([{ maxBitrate: 1_500_000, maxFramerate: 12 }]) })
        .pipe(startWith(null))

      this.subs.add(
        combineLatest([audio$, video$, screen$, this.media$])
          .pipe(debounceTime(200))
          .subscribe(([audio, video, screen, media]) => {
            const tracks = (
              [
                ['audio', audio],
                ['video', video],
                ['screen', screen],
              ] as const
            )
              .filter((entry): entry is readonly [Kind, TrackMetadata] => Boolean(entry[1]?.sessionId && entry[1]?.trackName))
              .map(([kind, meta]): Announced => ({ kind, trackName: meta.trackName!, sessionId: meta.sessionId!, location: 'remote' }))
            this.api<ApiState>('announce', { tracks, media })
              .then((s) => this.applyState(s))
              .catch((e) => this.fail(e))
          }),
      )

      for (const kind of kinds) {
        this.subs.add(
          this.remoteMeta[kind]
            .pipe(
              distinctUntilChanged(sameMeta),
              switchMap((meta) => (meta ? pt.pull(of(meta)) : of(null))),
            )
            .subscribe((track) => this.remote[kind].next(track)),
        )
      }

      this.poll = setInterval(() => {
        this.api<ApiState>('state', { media: this.media })
          .then((s) => {
            this.failures = 0
            this.applyState(s)
          })
          .catch((e) => {
            if (++this.failures >= 5 || !/Bağlantı kurulamadı|Sunucuda geçici/.test(String(e?.message))) this.fail(e)
          })
      }, POLL_MS)
      this.status$.next('live')
    } catch (e) {
      this.fail(e)
    }
  }

  private applyState(s: ApiState) {
    this.skew = Date.parse(s.serverTime) - Date.now()
    const startedAt = s.startedAt ? Date.parse(s.startedAt) - this.skew : null
    const deadline = Date.parse(s.deadline) - this.skew
    this.state$.next({ startedAt, deadline, other: s.other ? { media: s.other.media } : null })
    for (const kind of kinds) {
      const t = s.other?.tracks.find((x) => x.kind === kind)
      this.remoteMeta[kind].next(t ? { location: 'remote', sessionId: t.sessionId, trackName: t.trackName } : null)
    }
    if (startedAt && Date.now() >= deadline) this.leave(false)
  }

  private fail(e: unknown) {
    const message = e instanceof Error ? e.message : 'Görüşme bağlantısı kurulamadı'
    if (/süresi doldu|sona erdi|iptal edildi/.test(message)) return this.leave(false)
    this.error$.next(message)
    this.status$.next('error')
    this.dispose()
  }

  private stop() {
    if (this.poll) clearInterval(this.poll)
    this.poll = null
  }

  leave(endForBoth = false) {
    if (this.status$.value === 'ended') return
    this.stop()
    if (this.status$.value === 'live' || this.status$.value === 'joining') {
      void this.api('leave', { end: endForBoth }).catch(() => undefined)
    }
    this.status$.next('ended')
    this.dispose()
  }

  dispose() {
    this.stop()
    this.subs.unsubscribe()
    this.mic.disableSource()
    this.camera.disableSource()
    this.screen.disableSource()
    for (const kind of kinds) this.remote[kind].next(null)
  }
}
