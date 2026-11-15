import { useQuery } from '@tanstack/react-query'
import { Mic, MicOff, PhoneOff, RotateCw, Video, VideoOff } from 'lucide-react'
import { useEffect, useRef, useState } from 'react'
import { Link, useParams } from 'react-router'
import { Avatar } from '@/components/ui/avatar'
import { Button } from '@/components/ui/button'
import { Confirm } from '@/components/ui/confirm'
import { EmptyState } from '@/components/ui/empty-state'
import { Skeleton } from '@/components/ui/skeleton'
import { useProfile } from '@/features/auth/session'
import { NoteForm } from '@/features/notes/note-form'
import { useTeacherOverview } from '@/features/teacher/overview'
import { cn } from '@/lib/cn'
import { formatDate } from '@/lib/dates'
import { supabase, unwrap } from '@/lib/supabase'
import { MeetingConnection, type RoomSnapshot } from './connection'
import { durationMinutes, MEETING_MINUTES, phaseOf, useMeeting } from './queries'

const WARN_MINUTES = 5

function clock(ms: number) {
  const s = Math.max(0, Math.round(ms / 1000))
  return `${Math.floor(s / 60)}:${String(s % 60).padStart(2, '0')}`
}

function VideoView({
  stream,
  muted,
  mirrored,
  className,
}: {
  stream: MediaStream | null
  muted?: boolean
  mirrored?: boolean
  className?: string
}) {
  const ref = useRef<HTMLVideoElement>(null)
  useEffect(() => {
    if (ref.current && ref.current.srcObject !== stream) ref.current.srcObject = stream
  }, [stream])
  return (
    <video
      ref={ref}
      autoPlay
      playsInline
      muted={muted}
      className={cn('h-full w-full object-cover', mirrored && '-scale-x-100', className)}
    />
  )
}

function AudioView({ stream }: { stream: MediaStream }) {
  const ref = useRef<HTMLAudioElement>(null)
  useEffect(() => {
    if (ref.current && ref.current.srcObject !== stream) ref.current.srcObject = stream
  }, [stream])
  return <audio ref={ref} autoPlay />
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
  const parentCount = overview.data?.find((r) => r.id === m?.student_id)?.parent_count ?? 0

  const [local, setLocal] = useState<MediaStream | null>(null)
  const [mediaError, setMediaError] = useState<string | null>(null)
  const [mic, setMic] = useState(true)
  const [cam, setCam] = useState(true)
  const [joined, setJoined] = useState(false)
  const [room, setRoom] = useState<RoomSnapshot | null>(null)
  const [now, setNow] = useState(() => Date.now())
  const [confirmEnd, setConfirmEnd] = useState(false)
  const [noteOpen, setNoteOpen] = useState(false)
  const connection = useRef<MeetingConnection | null>(null)

  useEffect(() => {
    let stream: MediaStream | null = null
    let cancelled = false
    navigator.mediaDevices
      ?.getUserMedia({
        audio: { echoCancellation: true, noiseSuppression: true },
        video: {
          width: { ideal: 640 },
          height: { ideal: 360 },
          frameRate: { max: 24 },
        },
      })
      .catch(() => navigator.mediaDevices.getUserMedia({ audio: true }))
      .then((s) => {
        if (cancelled) return s.getTracks().forEach((t) => t.stop())
        stream = s
        setLocal(s)
        setCam(s.getVideoTracks().length > 0)
      })
      .catch(() =>
        setMediaError('Kamera ve mikrofona izin verilmedi. Tarayıcının adres çubuğundaki kilit simgesinden izin verip sayfayı yenileyin'),
      )
    return () => {
      cancelled = true
      stream?.getTracks().forEach((t) => t.stop())
      connection.current?.leave()
    }
  }, [])

  useEffect(() => {
    const id = setInterval(() => setNow(Date.now()), 1000)
    return () => clearInterval(id)
  }, [])

  useEffect(() => {
    local?.getAudioTracks().forEach((t) => (t.enabled = mic))
  }, [local, mic])
  useEffect(() => {
    local?.getVideoTracks().forEach((t) => (t.enabled = cam))
  }, [local, cam])

  function join() {
    if (!local) return
    setJoined(true)
    const c = new MeetingConnection(meetingId, local, setRoom)
    connection.current = c
    void c.start()
  }

  function retry() {
    connection.current?.leave(false, 'connecting')
    setRoom(null)
    join()
  }

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

  const otherName = other.data?.full_name ?? (isTeacher ? 'Öğrenci' : 'Öğretmen')
  const phase = phaseOf(m, now)
  const status = room?.status
  const ended = status === 'ended' || (!joined && (phase === 'done' || phase === 'missed' || phase === 'cancelled'))
  const remaining = room?.startedAt && room.deadline ? room.deadline - now : null
  const warn = remaining != null && remaining <= WARN_MINUTES * 60_000 && remaining > 0

  if (ended) {
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
            onOpenChange={setNoteOpen}
            studentId={m.student_id}
            note={null}
            parentCount={parentCount}
            defaults={{
              kind: 'meeting',
              metOn: formatDate(m.starts_at, 'yyyy-MM-dd'),
            }}
          />
        )}
      </div>
    )
  }

  const controls = (
    <div className="flex items-center justify-center gap-3">
      <button
        type="button"
        onClick={() => setMic(!mic)}
        aria-pressed={!mic}
        aria-label={mic ? 'Mikrofonu kapat' : 'Mikrofonu aç'}
        disabled={!local?.getAudioTracks().length}
        className={cn(
          'grid size-14 place-items-center rounded-full transition-colors disabled:opacity-40',
          mic ? 'bg-bg/15 text-bg hover:bg-bg/25' : 'bg-bg text-fg',
        )}
      >
        {mic ? <Mic className="size-6" /> : <MicOff className="size-6" />}
      </button>
      <button
        type="button"
        onClick={() => setCam(!cam)}
        aria-pressed={!cam}
        aria-label={cam ? 'Kamerayı kapat' : 'Kamerayı aç'}
        disabled={!local?.getVideoTracks().length}
        className={cn(
          'grid size-14 place-items-center rounded-full transition-colors disabled:opacity-40',
          cam ? 'bg-bg/15 text-bg hover:bg-bg/25' : 'bg-bg text-fg',
        )}
      >
        {cam ? <Video className="size-6" /> : <VideoOff className="size-6" />}
      </button>
      {joined && (
        <button
          type="button"
          onClick={() => (isTeacher ? setConfirmEnd(true) : connection.current?.leave())}
          aria-label={isTeacher ? 'Görüşmeyi bitir' : 'Görüşmeden ayrıl'}
          className="grid h-14 min-w-20 place-items-center rounded-full bg-danger px-5 text-white hover:opacity-90"
        >
          <PhoneOff className="size-6" />
        </button>
      )}
    </div>
  )

  if (!joined) {
    return (
      <div className="mx-auto grid max-w-4xl gap-5 lg:grid-cols-[minmax(0,1fr)_20rem] lg:items-center">
        <div className="relative aspect-video overflow-hidden rounded-3xl bg-fg text-bg">
          {local && cam ? (
            <VideoView stream={local} muted mirrored />
          ) : (
            <div className="grid h-full place-items-center text-sm opacity-80">
              {mediaError ?? (local ? 'Kamera kapalı' : 'Kamera açılıyor')}
            </div>
          )}
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
          {phase === 'upcoming' ? (
            <p className="mt-5 rounded-2xl bg-bg p-3 text-sm text-muted">Görüşme saatinden 10 dakika önce açılır.</p>
          ) : (
            <Button className="mt-5 w-full" size="lg" onClick={join} disabled={!local}>
              <Video />
              Görüşmeye katıl
            </Button>
          )}
          <p className="mt-3 text-xs text-muted">Görüntü ve ses kaydedilmez. Süre iki taraf da bağlanınca başlar.</p>
        </section>
      </div>
    )
  }

  return (
    <div className="fixed inset-0 z-50 flex flex-col bg-fg text-bg">
      <header className="flex items-center gap-3 px-4 pt-[max(env(safe-area-inset-top),1rem)] pb-3">
        <Avatar name={otherName} userId={otherId ?? undefined} className="size-9 text-xs" />
        <div className="min-w-0 flex-1">
          <p className="truncate font-semibold">{otherName}</p>
          <p className="text-xs opacity-75">
            {status === 'waiting'
              ? 'Bağlanması bekleniyor'
              : status === 'connecting'
                ? 'Bağlanıyor'
                : status === 'error'
                  ? 'Bağlantı sorunu'
                  : 'Görüşmede'}
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
      <div className="relative mx-4 my-3 flex-1 overflow-hidden rounded-3xl bg-black/40">
        {room?.remote && room.remoteVideo ? (
          <VideoView stream={room.remote} />
        ) : (
          <div className="grid h-full place-items-center">
            <div className="text-center">
              <Avatar name={otherName} userId={otherId ?? undefined} className="mx-auto size-24 text-2xl" />
              <p className="mt-3 text-sm opacity-80">
                {status === 'error'
                  ? room?.error
                  : status === 'waiting'
                    ? `${otherName} henüz bağlanmadı`
                    : status === 'live'
                      ? 'Kamera kapalı'
                      : 'Bağlanıyor'}
              </p>
              {status === 'error' && (
                <Button variant="secondary" className="mt-4" onClick={retry}>
                  <RotateCw />
                  Yeniden bağlan
                </Button>
              )}
            </div>
          </div>
        )}
        {room?.remote && !room.remoteVideo && <AudioView stream={room.remote} />}
        {local && (
          <div className="absolute right-3 bottom-3 aspect-video w-[32%] max-w-60 min-w-28 overflow-hidden rounded-2xl border border-bg/20 bg-black/50">
            {cam ? (
              <VideoView stream={local} muted mirrored />
            ) : (
              <div className="grid h-full place-items-center text-xs opacity-75">Kamera kapalı</div>
            )}
          </div>
        )}
      </div>
      <footer className="pb-[max(env(safe-area-inset-bottom),1.25rem)]">{controls}</footer>
      <Confirm
        open={confirmEnd}
        onOpenChange={setConfirmEnd}
        title="Görüşme bitirilsin mi"
        description="Görüşme iki taraf için de kapanır ve bu hafta yeniden açılamaz."
        confirmLabel="Görüşmeyi bitir"
        onConfirm={() => connection.current?.leave(true)}
      >
        <Button variant="secondary" className="mt-3 w-full" onClick={() => (setConfirmEnd(false), connection.current?.leave(false))}>
          Yalnızca ben ayrılayım
        </Button>
      </Confirm>
    </div>
  )
}
