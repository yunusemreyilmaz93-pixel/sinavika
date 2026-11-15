import { useQuery } from '@tanstack/react-query'
import { createAudioSink, type MediaDevice, type SinkApi } from 'partytracks/client'
import { useObservableAsValue } from 'partytracks/react'
import {
  CalendarPlus,
  Mic,
  MicOff,
  MonitorUp,
  MonitorX,
  NotebookPen,
  PhoneOff,
  RotateCw,
  Settings2,
  Video,
  VideoOff,
  WifiOff,
  X,
} from 'lucide-react'
import { useEffect, useRef, useState, type ReactNode } from 'react'
import { Link, useParams } from 'react-router'
import { filter } from 'rxjs'
import { Avatar } from '@/components/ui/avatar'
import { Button } from '@/components/ui/button'
import { Confirm } from '@/components/ui/confirm'
import { EmptyState } from '@/components/ui/empty-state'
import { Field, Select, Textarea } from '@/components/ui/field'
import { Modal } from '@/components/ui/modal'
import { Skeleton } from '@/components/ui/skeleton'
import { useProfile } from '@/features/auth/session'
import { NoteForm } from '@/features/notes/note-form'
import { TaskFormModal } from '@/features/plan/task-form'
import { WeekCard } from '@/features/student/today-hero'
import { useTeacherOverview } from '@/features/teacher/overview'
import { cn } from '@/lib/cn'
import { formatDate } from '@/lib/dates'
import { supabase, unwrap } from '@/lib/supabase'
import { durationMinutes, MEETING_MINUTES, phaseOf, useMeeting } from './queries'
import { MeetingRoom } from './room'

const WARN_MINUTES = 5
const canShareScreen = typeof navigator !== 'undefined' && Boolean(navigator.mediaDevices && 'getDisplayMedia' in navigator.mediaDevices)

function clock(ms: number) {
  const s = Math.max(0, Math.round(ms / 1000))
  return `${Math.floor(s / 60)}:${String(s % 60).padStart(2, '0')}`
}

function TrackVideo({
  track,
  mirrored,
  contain,
  className,
}: {
  track: MediaStreamTrack | null | undefined
  mirrored?: boolean
  contain?: boolean
  className?: string
}) {
  const ref = useRef<HTMLVideoElement>(null)
  useEffect(() => {
    if (ref.current) ref.current.srcObject = track ? new MediaStream([track]) : null
  }, [track])
  return (
    <video
      ref={ref}
      autoPlay
      playsInline
      muted
      className={cn('h-full w-full', contain ? 'object-contain' : 'object-cover', mirrored && '-scale-x-100', className)}
    />
  )
}

// Konuşma göstergesi için ses düzeyi (0 ile 1 arası), saniyede 8 kez ölçülür
function useAudioLevel(track: MediaStreamTrack | null | undefined) {
  const [level, setLevel] = useState(0)
  useEffect(() => {
    if (!track || typeof AudioContext === 'undefined') return
    const ctx = new AudioContext()
    const source = ctx.createMediaStreamSource(new MediaStream([track]))
    const analyser = ctx.createAnalyser()
    analyser.fftSize = 512
    source.connect(analyser)
    const data = new Uint8Array(analyser.fftSize)
    const id = setInterval(() => {
      analyser.getByteTimeDomainData(data)
      let sum = 0
      for (const v of data) sum += ((v - 128) / 128) ** 2
      setLevel(Math.min(1, Math.sqrt(sum / data.length) * 4))
    }, 125)
    return () => {
      clearInterval(id)
      source.disconnect()
      void ctx.close()
    }
  }, [track])
  return track ? level : 0
}

function DeviceSelect({ label, device }: { label: string; device: MediaDevice }) {
  const devices = useObservableAsValue(device.devices$, [])
  const active = useObservableAsValue(device.activeDevice$)
  return (
    <Field label={label}>
      {(p) => (
        <Select
          {...p}
          value={active?.deviceId ?? ''}
          onChange={(e) => {
            const next = devices.find((d) => d.deviceId === e.target.value)
            if (next) device.setPreferredDevice(next)
          }}
        >
          {devices.map((d, i) => (
            <option key={d.deviceId} value={d.deviceId}>
              {d.label || `${label} ${i + 1}`}
            </option>
          ))}
        </Select>
      )}
    </Field>
  )
}

function ControlButton({
  on,
  onClick,
  label,
  children,
  disabled,
  danger,
}: {
  on?: boolean
  onClick: () => void
  label: string
  children: ReactNode
  disabled?: boolean
  danger?: boolean
}) {
  return (
    <button
      type="button"
      onClick={onClick}
      aria-label={label}
      title={label}
      aria-pressed={on === undefined ? undefined : !on}
      disabled={disabled}
      className={cn(
        'grid size-14 shrink-0 place-items-center rounded-full transition-colors disabled:opacity-40 [&_svg]:size-6',
        danger ? 'w-20 bg-danger text-white hover:opacity-90' : on === false ? 'bg-bg text-fg' : 'bg-bg/15 text-bg hover:bg-bg/25',
      )}
    >
      {children}
    </button>
  )
}

export default function RoomPage() {
  const { meetingId = '' } = useParams()
  const profile = useProfile()
  const meeting = useMeeting(meetingId)
  const m = meeting.data
  const isTeacher = profile.id === m?.teacher_id
  const otherId = m ? (isTeacher ? m.student_id : m.teacher_id) : null
  const other = useQuery({
    queryKey: ['profile-name', otherId],
    enabled: Boolean(otherId),
    queryFn: async () => unwrap(await supabase.from('profiles').select('id, full_name').eq('id', otherId!).maybeSingle()),
  })
  const overview = useTeacherOverview(isTeacher)
  const studentRow = overview.data?.find((r) => r.id === m?.student_id)
  const goal = useQuery({
    queryKey: ['student-goal', m?.student_id],
    enabled: isTeacher && Boolean(m?.student_id),
    queryFn: async () => unwrap(await supabase.from('students').select('daily_minutes_goal').eq('id', m!.student_id).maybeSingle()),
  })

  const [attempt, setAttempt] = useState(0)

  if (meeting.isPending) return <Skeleton className="h-[70dvh] rounded-3xl" />
  if (!m || m.mode !== 'app') {
    return (
      <EmptyState
        icon={Video}
        title="Görüşme bulunamadı"
        description="Bağlantı eski olabilir. Görüşmeler sayfasından tekrar açın."
        action={
          <Button asChild>
            <Link to="/app/gorusmeler">Görüşmelere dönün</Link>
          </Button>
        }
      />
    )
  }

  return (
    <RoomHost
      key={`${meetingId}-${attempt}`}
      meeting={m}
      isTeacher={isTeacher}
      otherId={otherId}
      otherName={other.data?.full_name ?? (isTeacher ? 'Öğrenci' : 'Öğretmen')}
      parentCount={studentRow?.parent_count ?? 0}
      dailyGoal={goal.data?.daily_minutes_goal ?? 0}
      onRetry={() => setAttempt((a) => a + 1)}
    />
  )
}

type RoomProps = {
  meeting: NonNullable<ReturnType<typeof useMeeting>['data']>
  isTeacher: boolean
  otherId: string | null
  otherName: string
  parentCount: number
  dailyGoal: number
  onRetry: () => void
}

// Her deneme yeni bir oda nesnesiyle başlar. Önizleme sayfa açıkken çalışır, sayfadan çıkınca kamera kapanır
function RoomHost(props: RoomProps) {
  const [room] = useState(() => new MeetingRoom(props.meeting.id))
  useEffect(() => {
    room.activate()
    return () => room.deactivate()
  }, [room])
  return <Room room={room} {...props} />
}

function Room({ room, meeting: m, isTeacher, otherId, otherName, parentCount, dailyGoal, onRetry }: RoomProps & { room: MeetingRoom }) {
  const status = useObservableAsValue(room.status$, 'idle')
  const error = useObservableAsValue(room.error$, null)
  const state = useObservableAsValue(room.state$, null)
  const connection = useObservableAsValue(room.connection$, 'new')
  const media = useObservableAsValue(room.media$, { mic: true, camera: true, screen: false })
  const localVideo = useObservableAsValue(room.camera.localMonitorTrack$)
  const localAudio = useObservableAsValue(room.mic.localMonitorTrack$)
  const remoteVideo = useObservableAsValue(room.remote.video, null)
  const remoteScreen = useObservableAsValue(room.remote.screen, null)
  const remoteAudio = useObservableAsValue(room.remote.audio, null)
  const camError = useObservableAsValue(room.camera.error$, null)
  const micError = useObservableAsValue(room.mic.error$, null)
  const myLevel = useAudioLevel(media.mic ? localAudio : null)
  const otherLevel = useAudioLevel(remoteAudio)

  const [now, setNow] = useState(() => Date.now())
  const [settings, setSettings] = useState(false)
  const [confirmEnd, setConfirmEnd] = useState(false)
  const [panel, setPanel] = useState(false)
  const [taskOpen, setTaskOpen] = useState(false)
  const [noteOpen, setNoteOpen] = useState(false)
  const draftKey = `izlek-meeting-note-${m.id}`
  const [draft, setDraft] = useState(() => {
    try {
      return localStorage.getItem(draftKey) ?? ''
    } catch {
      return ''
    }
  })
  const audioRef = useRef<HTMLAudioElement>(null)
  const [sink, setSink] = useState<SinkApi | null>(null)
  const [speakers, setSpeakers] = useState<MediaDeviceInfo[]>([])

  useEffect(() => {
    const id = setInterval(() => setNow(Date.now()), 1000)
    return () => clearInterval(id)
  }, [])

  useEffect(() => {
    try {
      localStorage.setItem(draftKey, draft)
    } catch {
      /* depolama kapalıysa not yalnızca bu sekmede kalır */
    }
  }, [draft, draftKey])

  // Karşı tarafın sesi ayrı bir ses öğesinden çalınır, hoparlör seçimi destekleyen tarayıcılarda değiştirilebilir
  const inCall = status === 'live' || status === 'joining'
  useEffect(() => {
    if (!inCall || !audioRef.current) return
    const s = createAudioSink({ audioElement: audioRef.current })
    setSink(s)
    const subs = [s.attach(room.remote.audio.pipe(filter((t): t is MediaStreamTrack => Boolean(t)))), s.devices$.subscribe(setSpeakers)]
    return () => {
      subs.forEach((x) => x.unsubscribe())
      s.cleanup()
      setSink(null)
    }
  }, [room, inCall])

  const phase = phaseOf(m, now)
  const joined = inCall
  const remaining = state?.startedAt ? state.deadline - now : null
  const warn = remaining != null && remaining <= WARN_MINUTES * 60_000 && remaining > 0
  const otherHere = Boolean(state?.other)
  const otherMedia = state?.other?.media
  const deviceError = camError ?? micError
  const mediaMessage = deviceError
    ? deviceError.name === 'NotAllowedError'
      ? 'Kamera ve mikrofona izin verilmedi. Adres çubuğundaki kilit simgesinden izin verip sayfayı yenileyin'
      : 'Kamera ya da mikrofon açılamadı. Başka bir uygulama kullanıyor olabilir'
    : null

  const leave = (end: boolean) => {
    room.leave(end)
    if (isTeacher && draft.trim()) setNoteOpen(true)
  }

  if (status === 'ended' || (!joined && status !== 'error' && (phase === 'done' || phase === 'missed' || phase === 'cancelled'))) {
    const minutes = durationMinutes(m)
    return (
      <div className="mx-auto max-w-lg">
        <section className="rounded-3xl border border-line bg-surface p-6 text-center">
          <Avatar name={otherName} userId={otherId ?? undefined} className="mx-auto size-16 text-lg" />
          <h1 className="mt-4 text-2xl font-extrabold">{phase === 'cancelled' ? 'Görüşme iptal edildi' : 'Görüşme bitti'}</h1>
          <p className="mt-1 text-muted">
            {otherName} · {formatDate(m.starts_at, 'd MMMM, HH:mm')}
            {minutes ? ` · ${minutes} dk` : ''}
          </p>
          <div className="mt-6 flex flex-col gap-2 sm:flex-row sm:justify-center">
            {isTeacher && phase !== 'cancelled' && <Button onClick={() => setNoteOpen(true)}>Görüşme notu yazın</Button>}
            <Button variant="secondary" asChild>
              <Link to="/app/gorusmeler">Görüşmelere dönün</Link>
            </Button>
          </div>
        </section>
        {isTeacher && noteOpen && (
          <NoteForm
            open
            onOpenChange={(o) => {
              setNoteOpen(o)
              if (!o) {
                try {
                  localStorage.removeItem(draftKey)
                } catch {
                  /* yok say */
                }
              }
            }}
            studentId={m.student_id}
            note={null}
            parentCount={parentCount}
            defaults={{ kind: 'meeting', metOn: formatDate(m.starts_at, 'yyyy-MM-dd'), body: draft }}
          />
        )}
      </div>
    )
  }

  const settingsModal = (
    <Modal open={settings} onOpenChange={setSettings} title="Ses ve görüntü">
      <div className="space-y-4">
        <DeviceSelect label="Kamera" device={room.camera} />
        <DeviceSelect label="Mikrofon" device={room.mic} />
        {sink?.isSinkIdSupported && speakers.length > 0 && (
          <Field label="Hoparlör">
            {(p) => (
              <Select {...p} onChange={(e) => sink.setSinkId(e.target.value)}>
                {speakers.map((d, i) => (
                  <option key={d.deviceId} value={d.deviceId}>
                    {d.label || `Hoparlör ${i + 1}`}
                  </option>
                ))}
              </Select>
            )}
          </Field>
        )}
        <div className="flex items-center gap-3 rounded-2xl bg-bg p-3">
          <Mic className="size-5 text-muted" aria-hidden />
          <div className="h-2 flex-1 overflow-hidden rounded-full bg-surface-2" aria-label="Mikrofon düzeyi">
            <div
              className="h-full rounded-full bg-primary transition-[width] duration-150"
              style={{ width: `${Math.round(myLevel * 100)}%` }}
            />
          </div>
        </div>
      </div>
    </Modal>
  )

  const controls = (
    <div className="flex items-center justify-center gap-2.5 sm:gap-3">
      <ControlButton on={media.mic} onClick={() => room.mic.toggleBroadcasting()} label={media.mic ? 'Mikrofonu kapat' : 'Mikrofonu aç'}>
        {media.mic ? <Mic /> : <MicOff />}
      </ControlButton>
      <ControlButton
        on={media.camera}
        onClick={() => room.camera.toggleBroadcasting()}
        label={media.camera ? 'Kamerayı kapat' : 'Kamerayı aç'}
      >
        {media.camera ? <Video /> : <VideoOff />}
      </ControlButton>
      {joined && canShareScreen && (
        <ControlButton
          on={!media.screen}
          onClick={() => room.screen.video.toggleBroadcasting()}
          label={media.screen ? 'Ekran paylaşımını durdur' : 'Ekranı paylaş'}
        >
          {media.screen ? <MonitorX /> : <MonitorUp />}
        </ControlButton>
      )}
      <ControlButton onClick={() => setSettings(true)} label="Ses ve görüntü ayarları">
        <Settings2 />
      </ControlButton>
      {joined && isTeacher && (
        <ControlButton on={!panel} onClick={() => setPanel(!panel)} label="Not ve öğrencinin haftası">
          <NotebookPen />
        </ControlButton>
      )}
      {joined && (
        <ControlButton
          danger
          onClick={() => (isTeacher ? setConfirmEnd(true) : leave(false))}
          label={isTeacher ? 'Görüşmeyi bitir' : 'Görüşmeden ayrıl'}
        >
          <PhoneOff />
        </ControlButton>
      )}
    </div>
  )

  if (!joined) {
    return (
      <div className="mx-auto grid max-w-4xl gap-5 lg:grid-cols-[minmax(0,1fr)_20rem] lg:items-center">
        <div className="relative aspect-video overflow-hidden rounded-3xl bg-fg text-bg">
          {media.camera && localVideo ? (
            <TrackVideo track={localVideo} mirrored />
          ) : (
            <div className="grid h-full place-items-center px-6 text-center text-sm opacity-80">
              {mediaMessage ?? (media.camera ? 'Kamera açılıyor' : 'Kamera kapalı')}
            </div>
          )}
          <span
            aria-hidden
            className="absolute top-3 left-3 h-2 rounded-full bg-primary transition-[width] duration-150"
            style={{ width: `${Math.max(8, Math.round(myLevel * 120))}px`, opacity: media.mic ? 1 : 0.3 }}
          />
          <div className="absolute inset-x-0 bottom-4">{controls}</div>
        </div>
        <section className="rounded-3xl border border-line bg-surface p-5">
          <div className="flex items-center gap-3">
            <Avatar name={otherName} userId={otherId ?? undefined} className="size-12" />
            <div className="min-w-0">
              <p className="truncate font-bold">{otherName} ile görüşme</p>
              <p className="text-sm text-muted">
                {formatDate(m.starts_at, 'd MMMM EEEE, HH:mm')} · {MEETING_MINUTES} dk
              </p>
            </div>
          </div>
          {status === 'error' && (
            <p role="alert" className="mt-4 rounded-2xl bg-danger-soft p-3 text-sm text-danger">
              {error}
            </p>
          )}
          {phase === 'upcoming' ? (
            <p className="mt-5 rounded-2xl bg-bg p-3 text-sm text-muted">Görüşme saatinden 10 dakika önce açılır.</p>
          ) : status === 'error' ? (
            <Button className="mt-5 w-full" size="lg" onClick={onRetry}>
              <RotateCw />
              Tekrar dene
            </Button>
          ) : (
            <Button className="mt-5 w-full" size="lg" onClick={() => void room.join()}>
              <Video />
              Görüşmeye katıl
            </Button>
          )}
          <p className="mt-3 text-xs text-muted">Görüntü ve ses kaydedilmez. Süre iki taraf da bağlanınca başlar.</p>
        </section>
        {settingsModal}
      </div>
    )
  }

  const stageTrack = remoteScreen ?? (otherMedia?.camera !== false ? remoteVideo : null)
  const showingScreen = Boolean(remoteScreen)
  const reconnecting = connection === 'disconnected' || connection === 'failed'

  return (
    <div className="fixed inset-0 z-50 flex bg-fg text-bg">
      <div className="flex min-w-0 flex-1 flex-col">
        <header className="flex items-center gap-3 px-4 pt-[max(env(safe-area-inset-top),1rem)] pb-3">
          <Avatar name={otherName} userId={otherId ?? undefined} className="size-9 text-xs" />
          <div className="min-w-0 flex-1">
            <p className="truncate font-semibold">{otherName}</p>
            <p className="text-xs opacity-75">
              {reconnecting
                ? 'Bağlantı yeniden kuruluyor'
                : otherHere
                  ? showingScreen
                    ? 'Ekranını paylaşıyor'
                    : 'Görüşmede'
                  : 'Bağlanması bekleniyor'}
            </p>
          </div>
          {remaining != null && (
            <p
              className={cn('tabular rounded-full px-3 py-1 text-sm font-bold', warn ? 'bg-warning text-white' : 'bg-bg/15')}
              aria-live="polite"
            >
              {clock(remaining)} kaldı
            </p>
          )}
        </header>
        {warn && (
          <p role="status" className="mx-4 rounded-2xl bg-warning px-4 py-2 text-center text-sm font-semibold text-white">
            Görüşmenin bitmesine {Math.ceil(remaining! / 60_000)} dakika kaldı
          </p>
        )}
        {reconnecting && (
          <p role="status" className="mx-4 mt-2 flex items-center justify-center gap-2 rounded-2xl bg-bg/15 px-4 py-2 text-sm">
            <WifiOff className="size-4" aria-hidden />
            Bağlantı koptu, yeniden kuruluyor
          </p>
        )}
        <div className="relative mx-4 my-3 flex-1 overflow-hidden rounded-3xl bg-black/40">
          {stageTrack ? (
            <TrackVideo track={stageTrack} contain={showingScreen} />
          ) : (
            <div className="grid h-full place-items-center">
              <div className="text-center">
                <span
                  className="relative inline-block rounded-full transition-shadow duration-150"
                  style={{ boxShadow: otherLevel > 0.08 ? `0 0 0 ${3 + Math.round(otherLevel * 8)}px var(--primary)` : 'none' }}
                >
                  <Avatar name={otherName} userId={otherId ?? undefined} className="size-24 text-2xl" />
                </span>
                <p className="mt-3 text-sm opacity-80">{otherHere ? 'Kamera kapalı' : `${otherName} henüz bağlanmadı`}</p>
              </div>
            </div>
          )}
          {otherHere && otherMedia?.mic === false && (
            <span
              className="absolute top-3 left-3 grid size-9 place-items-center rounded-full bg-black/60"
              title={`${otherName} mikrofonu kapalı`}
            >
              <MicOff className="size-4" aria-label={`${otherName} mikrofonu kapalı`} />
            </span>
          )}
          {showingScreen && remoteVideo && otherMedia?.camera !== false && (
            <div className="absolute top-3 right-3 aspect-video w-[24%] max-w-48 min-w-24 overflow-hidden rounded-2xl border border-bg/20 bg-black/50">
              <TrackVideo track={remoteVideo} />
            </div>
          )}
          <div
            className="absolute right-3 bottom-3 aspect-video w-[30%] max-w-60 min-w-28 overflow-hidden rounded-2xl border-2 bg-black/50 transition-colors duration-150"
            style={{ borderColor: media.mic && myLevel > 0.08 ? 'var(--primary)' : 'transparent' }}
          >
            {media.camera && localVideo ? (
              <TrackVideo track={localVideo} mirrored />
            ) : (
              <div className="grid h-full place-items-center text-xs opacity-75">Kamera kapalı</div>
            )}
            {media.screen && (
              <span className="absolute inset-x-0 bottom-0 bg-black/60 px-2 py-1 text-center text-[11px]">Ekranınız paylaşılıyor</span>
            )}
          </div>
        </div>
        <footer className="pb-[max(env(safe-area-inset-bottom),1.25rem)]">{controls}</footer>
      </div>

      {isTeacher && panel && (
        <aside className="absolute inset-x-0 bottom-0 z-10 flex max-h-[75dvh] flex-col rounded-t-3xl bg-surface text-fg lg:static lg:max-h-none lg:w-96 lg:rounded-none lg:border-l lg:border-line">
          <div className="flex items-center justify-between px-4 pt-4 pb-2">
            <p className="font-bold">Görüşme notu</p>
            <button
              type="button"
              onClick={() => setPanel(false)}
              aria-label="Paneli kapat"
              className="grid size-11 place-items-center rounded-xl hover:bg-surface-2"
            >
              <X className="size-5" />
            </button>
          </div>
          <div className="min-h-0 flex-1 space-y-4 overflow-y-auto px-4 pb-4">
            <Field label="Konuşulanlar ve kararlar" hint="Görüşme bitince not olarak kaydedebilirsiniz.">
              {(p) => (
                <Textarea
                  {...p}
                  rows={6}
                  value={draft}
                  onChange={(e) => setDraft(e.target.value)}
                  placeholder="Bu hafta matematikte problemlere ağırlık, cumartesi deneme"
                />
              )}
            </Field>
            <Button variant="secondary" className="w-full" onClick={() => setTaskOpen(true)}>
              <CalendarPlus />
              Görev ver
            </Button>
            <WeekCard studentId={m.student_id} goalMinutes={dailyGoal} />
          </div>
        </aside>
      )}

      <audio ref={audioRef} autoPlay className="hidden" />
      {settingsModal}
      {isTeacher && <TaskFormModal open={taskOpen} onOpenChange={setTaskOpen} studentId={m.student_id} />}
      <Confirm
        open={confirmEnd}
        onOpenChange={setConfirmEnd}
        title="Görüşme bitirilsin mi"
        description="Görüşme iki taraf için de kapanır ve bu hafta yeniden açılamaz."
        confirmLabel="Görüşmeyi bitir"
        onConfirm={() => leave(true)}
      >
        <Button
          variant="secondary"
          className="mt-3 w-full"
          onClick={() => {
            setConfirmEnd(false)
            leave(false)
          }}
        >
          Yalnızca ben ayrılayım
        </Button>
      </Confirm>
    </div>
  )
}
