import { useQueryClient } from '@tanstack/react-query'
import confetti from 'canvas-confetti'
import { motion } from 'motion/react'
import { Check, Coffee, Pause, Play, RotateCw, Square } from 'lucide-react'
import { useEffect, useRef, useState } from 'react'
import { PageHeader } from '@/components/app/page-header'
import { Button } from '@/components/ui/button'
import { Card, CardBody } from '@/components/ui/card'
import { Modal } from '@/components/ui/modal'
import { PageSkeleton } from '@/components/ui/skeleton'
import { Spinner } from '@/components/ui/spinner'
import { useAuth } from '@/features/auth/session'
import { useCurriculum } from '@/lib/data'
import { formatMinutes, formatTime } from '@/lib/dates'
import { subjectColor } from '@/lib/exam'
import { errorMessage } from '@/lib/supabase'
import { invalidateActivity } from './stats'
import { rememberSubject, subjectName } from './subjects'
import { useDocumentTitle, useNow, useWakeLock, vibrate } from './timer-hooks'
import { formatClock, TimerRing } from './timer-ring'
import { TimerSetup, TodayLine, type TimerChoice } from './timer-setup'
import {
  breakRemainingMs,
  clearFocus,
  isSaving,
  newRunId,
  remainingMs,
  saveFocusRun,
  updateTimer,
  useTimerState,
  workedMs,
  writeTimer,
  type FocusRun,
} from './timer-store'

const BREAK_SEC = 5 * 60
const STALE_BREAK_MS = 10 * 60_000

type Result = { minutes: number; subjectId: string; topicId: number | null }

export default function TimerPage() {
  const { student } = useAuth()
  if (!student) return <PageSkeleton />
  return <FocusTimer studentId={student.id} dailyGoal={student.daily_minutes_goal} />
}

function celebrate() {
  const css = getComputedStyle(document.documentElement)
  const colors = ['--primary', '--accent', '--marker'].map((v) => css.getPropertyValue(v).trim()).filter(Boolean)
  void confetti({ particleCount: 90, spread: 75, startVelocity: 38, origin: { y: 0.55 }, colors, disableForReducedMotion: true })
}

function FocusTimer({ studentId, dailyGoal }: { studentId: string; dailyGoal: number }) {
  const queryClient = useQueryClient()
  const curriculum = useCurriculum()
  const state = useTimerState()
  const focus = state.focus?.studentId === studentId ? state.focus : null
  const rawRest = state.rest?.studentId === studentId ? state.rest : null
  const now = useNow(Boolean(focus || rawRest))
  const rest = rawRest && breakRemainingMs(rawRest, now) > -STALE_BREAK_MS ? rawRest : null

  const [result, setResult] = useState<Result | null>(null)
  const [saveError, setSaveError] = useState<string | null>(null)
  const [finishOpen, setFinishOpen] = useState(false)
  const attempted = useRef(new Set<string>())
  const breakBuzzed = useRef<number | null>(null)

  const remaining = focus ? remainingMs(focus, now) : 0
  const completed = Boolean(focus) && remaining <= 0
  const restLeft = rest ? breakRemainingMs(rest, now) : 0
  const restDone = Boolean(rest) && restLeft <= 0
  const saving = Boolean(focus && isSaving(focus, now))

  const save = (run: FocusRun, workedSec: number) => {
    saveFocusRun(run.id, workedSec, false).then(
      (saved) => {
        if (!saved) return
        setResult(saved)
        setSaveError(null)
        clearFocus(run.id)
        rememberSubject(studentId, saved.subjectId)
        invalidateActivity(queryClient, studentId)
        celebrate()
      },
      (err) => setSaveError(errorMessage(err)),
    )
  }

  useEffect(() => {
    if (!focus || !completed || attempted.current.has(focus.id)) return
    attempted.current.add(focus.id)
    vibrate([200, 100, 200, 100, 200])
    save(focus, focus.durationSec)
  })

  useEffect(() => {
    if (!rest || !restDone || breakBuzzed.current === rest.startedAt) return
    breakBuzzed.current = rest.startedAt
    if (restLeft > -60_000) vibrate([120, 60, 120])
  })

  const subject = focus ? curriculum.data?.subjectById.get(focus.subjectId) : undefined
  const topic = focus?.topicId ? curriculum.data?.topicById.get(focus.topicId) : undefined
  const paused = focus?.pausedAt != null

  useWakeLock(Boolean((focus && !paused && !completed) || (rest && !restDone)))
  useDocumentTitle(
    focus && !completed
      ? paused
        ? `Duraklatıldı · ${formatClock(remaining)}`
        : `${formatClock(remaining)} · ${subject?.short ?? 'Odak'}`
      : rest && !restDone
        ? `Mola · ${formatClock(restLeft)}`
        : null,
  )

  const start = (choice: TimerChoice) => {
    rememberSubject(studentId, choice.subjectId)
    setResult(null)
    setSaveError(null)
    writeTimer({
      focus: {
        id: newRunId(),
        studentId,
        subjectId: choice.subjectId,
        topicId: choice.topicId,
        durationSec: choice.minutes * 60,
        startedAt: Date.now(),
        pausedAt: null,
        pausedMs: 0,
        savingAt: null,
      },
      rest: null,
    })
  }

  const togglePause = () =>
    updateTimer((s) => {
      if (!s.focus) return s
      const t = Date.now()
      return s.focus.pausedAt == null
        ? { ...s, focus: { ...s.focus, pausedAt: t } }
        : { ...s, focus: { ...s.focus, pausedAt: null, pausedMs: s.focus.pausedMs + (t - s.focus.pausedAt) } }
    })

  const startBreak = () => {
    setResult(null)
    writeTimer({ focus: null, rest: { studentId, startedAt: Date.now(), durationSec: BREAK_SEC } })
  }
  const endBreak = () => updateTimer((s) => ({ ...s, rest: null }))

  if (focus && (completed || saving)) {
    return (
      <>
        <PageHeader title="Sayaç" />
        <Card className="mx-auto max-w-md">
          <CardBody className="flex flex-col items-center gap-4 py-10 text-center">
            {saveError ? (
              <>
                <p className="font-display text-lg font-bold">Oturum kaydedilemedi</p>
                <p className="text-sm text-muted">{saveError}</p>
                <Button onClick={() => save(focus, Math.floor(workedMs(focus, Date.now()) / 1000))}>
                  <RotateCw />
                  Tekrar dene
                </Button>
              </>
            ) : (
              <>
                <Spinner className="size-6 text-primary" />
                <p className="text-sm font-semibold text-muted">Oturum kaydediliyor</p>
              </>
            )}
          </CardBody>
        </Card>
      </>
    )
  }

  if (focus) {
    const worked = workedMs(focus, now)
    const enough = worked >= 60_000
    return (
      <>
        <PageHeader title="Sayaç" />
        <div className="mx-auto flex max-w-md flex-col items-center">
          <p className="flex max-w-full items-center gap-2 rounded-full bg-surface px-3.5 py-1.5 text-sm font-semibold shadow-card">
            <span aria-hidden className="size-2.5 shrink-0 rounded-full" style={{ backgroundColor: subjectColor(subject) }} />
            <span className="truncate">
              {subjectName(subject, { exam: true })}
              {topic && <span className="font-medium text-muted"> · {topic.name}</span>}
            </span>
          </p>
          <TimerRing
            progress={worked / (focus.durationSec * 1000)}
            remaining={remaining}
            dim={paused}
            className="mt-6 max-w-[320px]"
          >
            <span className="mt-3 text-sm font-semibold text-muted">
              {paused ? 'Duraklatıldı' : `Bitiş ${formatTime(new Date(now + remaining).toISOString())}`}
            </span>
          </TimerRing>
          <div className="mt-8 grid w-full grid-cols-[1fr_auto] gap-3">
            <Button size="lg" onClick={togglePause}>
              {paused ? <Play className="fill-current" /> : <Pause className="fill-current" />}
              {paused ? 'Devam et' : 'Duraklat'}
            </Button>
            <Button size="lg" variant="secondary" onClick={() => setFinishOpen(true)}>
              <Square className="fill-current" />
              Bitir
            </Button>
          </div>
          <p className="mt-4 text-center text-sm text-muted">Sayfayı kapatsan da süre işlemeye devam eder.</p>
        </div>

        <Modal
          open={finishOpen}
          onOpenChange={setFinishOpen}
          size="sm"
          title="Oturumu bitir"
          description={
            enough
              ? `Şimdiye kadar ${formatMinutes(Math.round(worked / 60_000))} çalıştın.`
              : '1 dakikadan kısa oturumlar kaydedilmez.'
          }
          footer={
            enough ? (
              <>
                <Button
                  variant="secondary"
                  onClick={() => {
                    setFinishOpen(false)
                    clearFocus(focus.id)
                  }}
                >
                  Kaydetme
                </Button>
                <Button
                  onClick={() => {
                    setFinishOpen(false)
                    attempted.current.add(focus.id)
                    save(focus, Math.floor(workedMs(focus, Date.now()) / 1000))
                  }}
                >
                  Erken bitir ve kaydet
                </Button>
              </>
            ) : (
              <>
                <Button variant="secondary" onClick={() => setFinishOpen(false)}>
                  Devam et
                </Button>
                <Button
                  variant="danger"
                  onClick={() => {
                    setFinishOpen(false)
                    clearFocus(focus.id)
                  }}
                >
                  Oturumu bitir
                </Button>
              </>
            )
          }
        >
          {enough && <p className="text-sm text-muted">Kaydedersen çalışma süren bugüne eklenir.</p>}
        </Modal>
      </>
    )
  }

  if (rest) {
    return (
      <>
        <PageHeader title="Mola" />
        <div className="mx-auto flex max-w-md flex-col items-center text-center">
          <TimerRing
            tone="accent"
            progress={1 - Math.max(0, restLeft) / (rest.durationSec * 1000)}
            remaining={restLeft}
            className="max-w-[300px]"
          >
            <Coffee className="mt-3 size-5 text-accent" aria-hidden />
          </TimerRing>
          <h2 className="mt-6 text-xl font-bold">{restDone ? 'Mola bitti' : 'Biraz dinlen'}</h2>
          <p className="mt-1 text-[15px] text-muted">
            {restDone ? 'Hazırsan yeni bir oturuma başla.' : 'Kalk, biraz su iç, gözlerini ekrandan ayır.'}
          </p>
          <Button size="lg" variant={restDone ? 'primary' : 'secondary'} className="mt-6 w-full" onClick={endBreak}>
            {restDone ? 'Yeni oturum' : 'Molayı bitir'}
          </Button>
        </div>
      </>
    )
  }

  if (result) {
    const done = curriculum.data?.subjectById.get(result.subjectId)
    return (
      <>
        <PageHeader title="Sayaç" />
        <div className="mx-auto flex max-w-md flex-col items-center text-center">
          <motion.div
            initial={{ scale: 0.6, opacity: 0 }}
            animate={{ scale: 1, opacity: 1 }}
            transition={{ type: 'spring', bounce: 0.45, duration: 0.4 }}
            className="grid size-20 place-items-center rounded-full bg-primary text-primary-fg shadow-pop"
          >
            <Check className="size-10" strokeWidth={3} />
          </motion.div>
          <h2 className="mt-5 text-2xl font-extrabold">Oturum tamamlandı</h2>
          <p className="mt-1 text-[15px] text-muted">
            <span className="marker font-semibold text-fg">{formatMinutes(result.minutes)}</span> {subjectName(done)} kaydedildi.
          </p>
          <div className="mt-6 w-full">
            <TodayLine studentId={studentId} dailyGoal={dailyGoal} />
          </div>

          <Card className="mt-8 w-full text-left">
            <CardBody className="flex items-start gap-3">
              <span className="grid size-11 shrink-0 place-items-center rounded-xl bg-accent-soft text-accent-soft-fg">
                <Coffee className="size-5" />
              </span>
              <div className="min-w-0">
                <h3 className="font-bold">5 dakika mola ver</h3>
                <p className="mt-0.5 text-sm text-muted">Kısa bir ara sonraki oturumda odaklanmanı kolaylaştırır.</p>
              </div>
            </CardBody>
          </Card>
          <div className="mt-4 grid w-full gap-3 sm:grid-cols-2">
            <Button size="lg" variant="accent" onClick={startBreak}>
              Molayı başlat
            </Button>
            <Button size="lg" variant="secondary" onClick={() => setResult(null)}>
              Yeni oturum
            </Button>
          </div>
        </div>
      </>
    )
  }

  return (
    <>
      <PageHeader title="Sayaç" description="Süreyi seç ve başlat. Bitince çalışman kendiliğinden kaydedilir." />
      <TimerSetup studentId={studentId} dailyGoal={dailyGoal} onStart={start} />
    </>
  )
}
