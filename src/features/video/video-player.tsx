import { useQuery, useQueryClient } from '@tanstack/react-query'
import { CirclePlay, ExternalLink, RotateCw } from 'lucide-react'
import { useEffect, useRef, useState } from 'react'
import { Button } from '@/components/ui/button'
import { Modal } from '@/components/ui/modal'
import { Skeleton } from '@/components/ui/skeleton'
import { cn } from '@/lib/cn'
import { supabase, unwrap, type Tables } from '@/lib/supabase'
import { ENDED, formatClock, loadYouTube, PAUSED, PLAYING, watchUrl, type YTPlayer } from './youtube'

export type VideoProgress = Tables<'video_progress'>
type VideoTask = Pick<Tables<'tasks'>, 'id' | 'student_id' | 'title' | 'video_id' | 'video_title' | 'video_seconds' | 'done_at'>

export const videoKeys = { student: (studentId: string) => ['video-progress', studentId] as const }

export function useVideoProgress(studentId: string) {
  return useQuery({
    queryKey: videoKeys.student(studentId),
    queryFn: async () => {
      const rows = unwrap(await supabase.from('video_progress').select('*').eq('student_id', studentId))
      return new Map(rows.map((r) => [r.task_id, r]))
    },
    staleTime: 30_000,
  })
}

export function coverage(p: Pick<VideoProgress, 'watched_seconds' | 'duration_seconds'> | undefined) {
  if (!p || !p.duration_seconds) return 0
  return Math.min(100, Math.round((p.watched_seconds / p.duration_seconds) * 100))
}

export function VideoChip({ task, tracking, compact }: { task: VideoTask; tracking: boolean; compact?: boolean }) {
  const progress = useVideoProgress(task.student_id)
  const [open, setOpen] = useState(false)
  const p = progress.data?.get(task.id)
  const pct = coverage(p)

  return (
    <>
      <button
        type="button"
        onClick={() => setOpen(true)}
        className={cn(
          'inline-flex items-center gap-1.5 rounded-lg bg-accent-soft font-semibold text-accent-soft-fg transition-colors hover:brightness-95',
          compact ? 'mt-1.5 min-h-8 px-2 text-xs' : 'mt-2 min-h-11 px-3 text-sm',
        )}
      >
        <CirclePlay className={compact ? 'size-3.5' : 'size-4'} />
        {tracking ? (pct ? (pct >= 90 ? 'Tekrar izle' : 'Kaldığın yerden izle') : 'Videoyu izle') : 'Videoyu aç'}
        {pct > 0 && <span className="tabular opacity-80">%{pct}</span>}
      </button>
      <Modal open={open} onOpenChange={setOpen} title={task.video_title || task.title} size="lg">
        {open && <VideoBody task={task} tracking={tracking} progress={p} />}
      </Modal>
    </>
  )
}

function VideoBody({ task, tracking, progress }: { task: VideoTask; tracking: boolean; progress: VideoProgress | undefined }) {
  return (
    <div className="space-y-4">
      <Player task={task} tracking={tracking} resumeAt={progress?.position_seconds ?? 0} />
      {tracking ? (
        <p className="text-sm text-muted">
          İzlediğin kısımlar kaydedilir, öğretmenin de görür. Videonun en az yüzde 90'ını izleyince görev kendiliğinden
          tamamlanır. İleri sardığın kısımlar izlenmiş sayılmaz.
        </p>
      ) : (
        <VideoStats progress={progress} />
      )}
    </div>
  )
}

function Player({ task, tracking, resumeAt }: { task: VideoTask; tracking: boolean; resumeAt: number }) {
  const qc = useQueryClient()
  const host = useRef<HTMLDivElement>(null)
  const [state, setState] = useState<'loading' | 'ready' | 'blocked' | 'failed'>('loading')
  const [saveError, setSaveError] = useState(false)
  const [attempt, setAttempt] = useState(0)
  const [startAt] = useState(resumeAt)

  useEffect(() => {
    if (!task.video_id || !host.current) return
    let player: YTPlayer | null = null
    let timer: number | undefined
    let flushTimer: number | undefined
    let last: number | null = null
    let rate = 1
    let firstFlush = true
    let dirty = false
    const pending = new Set<number>()
    let pass = new Set<number>()
    let destroyed = false
    const el = document.createElement('div')
    host.current.replaceChildren(el)

    const flush = async () => {
      if (!tracking || !player || (!dirty && !pending.size)) return
      const duration = Math.round(player.getDuration())
      if (!duration) return
      const watched = [...pending]
      pending.clear()
      dirty = false
      const newSession = firstFlush
      firstFlush = false
      const { error } = await supabase.rpc('save_video_progress', {
        p_task: task.id,
        p_position: Math.round(player.getCurrentTime()),
        p_duration: duration,
        p_watched: watched,
        p_rate: rate,
        p_new_session: newSession,
      })
      if (error) {
        watched.forEach((b) => pending.add(b))
        setSaveError(true)
      } else {
        setSaveError(false)
        void qc.invalidateQueries({ queryKey: videoKeys.student(task.student_id) })
      }
    }

    const tick = () => {
      if (!player || player.getPlayerState() !== PLAYING) {
        last = null
        return
      }
      const t = player.getCurrentTime()
      rate = Math.max(rate, player.getPlaybackRate() || 1)
      if (last !== null) {
        const step = t - last
        if (step < -2) pass = new Set()
        if (step >= 0 && step <= 2.5 * (player.getPlaybackRate() || 1) + 0.5) {
          for (let b = Math.floor(last / 10); b <= Math.floor(t / 10); b++) {
            if (!pass.has(b)) {
              pass.add(b)
              pending.add(b)
            }
          }
          dirty = true
        }
      }
      last = t
    }

    const onHide = () => {
      if (document.visibilityState === 'hidden') void flush()
    }

    loadYouTube()
      .then((YT) => {
        if (destroyed) return
        player = new YT.Player(el, {
          videoId: task.video_id!,
          host: 'https://www.youtube-nocookie.com',
          playerVars: { rel: 0, modestbranding: 1, playsinline: 1, hl: 'tr' },
          events: {
            onReady: (e) => {
              setState('ready')
              const duration = e.target.getDuration()
              if (startAt > 5 && (!duration || startAt < duration - 15)) e.target.seekTo(startAt, true)
            },
            onStateChange: (e) => {
              if (e.data === PAUSED || e.data === ENDED) void flush()
            },
            onError: (e) => setState(e.data === 101 || e.data === 150 || e.data === 153 ? 'blocked' : 'failed'),
          },
        })
        timer = window.setInterval(tick, 1000)
        flushTimer = window.setInterval(() => void flush(), 15000)
        document.addEventListener('visibilitychange', onHide)
      })
      .catch(() => setState('failed'))

    return () => {
      destroyed = true
      window.clearInterval(timer)
      window.clearInterval(flushTimer)
      document.removeEventListener('visibilitychange', onHide)
      void flush().finally(() => player?.destroy())
    }
  }, [task.id, task.video_id, task.student_id, tracking, startAt, qc, attempt])

  if (!task.video_id) return null

  return (
    <div className="space-y-2">
      <div className="relative aspect-video overflow-hidden rounded-xl bg-black">
        <div ref={host} className="absolute inset-0 [&_iframe]:size-full" />
        {state === 'loading' && <Skeleton className="absolute inset-0 rounded-none" />}
        {(state === 'blocked' || state === 'failed') && (
          <div className="absolute inset-0 grid place-items-center bg-surface p-4 text-center">
            <div className="max-w-sm space-y-3">
              <p className="font-semibold">
                {state === 'blocked' ? 'Bu videonun sahibi başka sitelerde oynatılmasına izin vermiyor' : 'Video açılamadı'}
              </p>
              <p className="text-sm text-muted">
                {state === 'blocked'
                  ? tracking
                    ? "YouTube'da izleyebilirsin ama o zaman izleme kaydı tutulamaz."
                    : "YouTube'da izlenebilir ama o zaman izleme kaydı tutulamaz."
                  : tracking
                    ? "Bağlantını kontrol edip tekrar dene. Sorun sürerse videoyu YouTube'da aç."
                    : "Bağlantıyı kontrol edip tekrar deneyin. Sorun sürerse videoyu YouTube'da açın."}
              </p>
              <div className="flex flex-wrap justify-center gap-2">
                {state === 'failed' && (
                  <Button variant="secondary" onClick={() => setAttempt((n) => n + 1)}>
                    <RotateCw />
                    Tekrar deneyin
                  </Button>
                )}
                <Button asChild variant="secondary">
                  <a href={watchUrl(task.video_id, resumeAt)} target="_blank" rel="noreferrer">
                    <ExternalLink />
                    YouTube'da aç
                  </a>
                </Button>
              </div>
            </div>
          </div>
        )}
      </div>
      {tracking && saveError && (
        <p role="status" className="text-sm text-warning">
          İzleme kaydı şu an kaydedilemiyor. Bağlantı gelince kaldığı yerden kaydetmeye devam eder.
        </p>
      )}
    </div>
  )
}

export function VideoStats({ progress }: { progress: VideoProgress | undefined }) {
  if (!progress || !progress.duration_seconds) {
    return <p className="rounded-xl bg-surface-2 p-4 text-sm text-muted">Öğrenci bu videoyu henüz açmadı.</p>
  }
  const pct = coverage(progress)
  const buckets = progress.buckets.slice(0, Math.ceil(progress.duration_seconds / 10))
  const replayed = buckets.filter((b) => b > 1).length
  const peak = Math.max(1, ...buckets)

  return (
    <div className="space-y-4">
      <div className="grid grid-cols-2 gap-2 sm:grid-cols-4">
        <Stat label="İzlenen" value={`%${pct}`} />
        <Stat label="Kaldığı yer" value={formatClock(progress.position_seconds)} />
        <Stat label="Açma" value={`${progress.sessions} kez`} />
        <Stat label="En yüksek hız" value={`${Number(progress.max_rate).toLocaleString('tr-TR')}x`} />
      </div>
      <div>
        <p className="mb-2 text-sm font-semibold">Videonun hangi kısımları izlendi</p>
        <div
          className="flex h-10 items-end gap-px overflow-hidden rounded-lg bg-surface-2 p-1"
          role="img"
          aria-label={`Videonun yüzde ${pct} kadarı izlendi`}
        >
          {buckets.map((b, i) => (
            <span
              key={i}
              className={cn('min-w-px flex-1 rounded-sm', b === 0 ? 'bg-line' : b > 1 ? 'bg-accent' : 'bg-primary')}
              style={{ height: b === 0 ? '20%' : `${40 + (b / peak) * 60}%` }}
            />
          ))}
        </div>
        <div className="mt-1 flex justify-between text-xs text-muted tabular">
          <span>0:00</span>
          <span>{formatClock(progress.duration_seconds)}</span>
        </div>
        <p className="mt-2 text-sm text-muted">
          {progress.completed_at ? 'Öğrenci videoyu bitirdi. ' : `Öğrenci videonun yüzde ${pct} kadarını izledi. `}
          {replayed > 0
            ? `Mavi kısımlar birden fazla kez izlendi. Öğrenci buralarda takılmış olabilir.`
            : 'Tekrar tekrar izlenen bir kısım yok.'}
        </p>
      </div>
    </div>
  )
}

function Stat({ label, value }: { label: string; value: string }) {
  return (
    <div className="rounded-xl bg-surface-2 p-3">
      <p className="text-xs font-semibold text-muted">{label}</p>
      <p className="tabular mt-0.5 font-display text-lg font-bold">{value}</p>
    </div>
  )
}
