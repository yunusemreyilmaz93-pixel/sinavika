import { Check, Clock, RotateCcw, X } from 'lucide-react'
import { useCallback, useEffect, useMemo, useRef, useState } from 'react'
import { useParams } from 'react-router'
import { PageHeader } from '@/components/app/page-header'
import { Badge } from '@/components/ui/badge'
import { Button } from '@/components/ui/button'
import { Card, CardBody } from '@/components/ui/card'
import { EmptyState } from '@/components/ui/empty-state'
import { Segmented } from '@/components/ui/segmented'
import { PageSkeleton } from '@/components/ui/skeleton'
import { useProfile } from '@/features/auth/session'
import { Md } from '@/features/lessons/markdown/render'
import { cn } from '@/lib/cn'
import { useCurriculum } from '@/lib/data'
import { formatNet, net } from '@/lib/exam'
import { useSubmitTest, useTestQuestions, useTestSets, type TestQuestion, type TestResult } from './queries'

const letters = 'ABCDE'

function clock(totalSeconds: number) {
  const s = Math.max(0, totalSeconds)
  return `${String(Math.floor(s / 60)).padStart(2, '0')}:${String(s % 60).padStart(2, '0')}`
}

export default function TestPage() {
  const setId = Number(useParams().setId)
  const sets = useTestSets()
  const questions = useTestQuestions(setId)
  const set = sets.data?.find((s) => s.id === setId)
  if (sets.isLoading || questions.isLoading) return <PageSkeleton />
  if (!set || !questions.data?.length) {
    return (
      <>
        <PageHeader title="Test" back={{ to: '/app/testler', label: 'Testler' }} />
        <EmptyState icon={X} title="Test bulunamadı" description="Bu test yayında değil ya da kaldırılmış." />
      </>
    )
  }
  return <Runner key={setId} setId={setId} title={set.title} exam={set.exam} duration={set.duration_min} questions={questions.data} />
}

function Runner({ setId, title, exam, duration, questions }: { setId: number; title: string; exam: 'LGS' | 'TYT' | 'AYT' | 'YDT'; duration: number | null; questions: TestQuestion[] }) {
  const studentId = useProfile().id
  const submit = useSubmitTest(studentId, setId)
  const [answers, setAnswers] = useState<Record<number, number | null>>({})
  const [result, setResult] = useState<TestResult | null>(null)
  const [confirming, setConfirming] = useState(false)
  const [round, setRound] = useState(0)
  const [elapsed, setElapsed] = useState(0)
  const seconds = useRef(0)
  const finishRef = useRef<() => void>(() => {})

  const answered = Object.values(answers).filter((v) => v != null).length
  const left = duration ? duration * 60 - elapsed : null

  const finish = useCallback(() => {
    if (submit.isPending) return
    setConfirming(false)
    submit.mutate({ answers, seconds: seconds.current }, { onSuccess: (r) => setResult(r) })
  }, [answers, submit])

  useEffect(() => {
    finishRef.current = finish
  }, [finish])

  useEffect(() => {
    if (result) return
    const timer = window.setInterval(() => {
      seconds.current += 1
      setElapsed(seconds.current)
      if (duration && seconds.current >= duration * 60) finishRef.current()
    }, 1000)
    return () => window.clearInterval(timer)
  }, [result, duration])

  const restart = () => {
    setAnswers({})
    setResult(null)
    setConfirming(false)
    seconds.current = 0
    setElapsed(0)
    setRound((r) => r + 1)
    submit.reset()
    window.scrollTo({ top: 0 })
  }

  if (result) return <ResultView key={round} title={title} exam={exam} questions={questions} result={result} onRestart={restart} />

  return (
    <>
      <PageHeader title={title} back={{ to: '/app/testler', label: 'Testler' }} />
      <div className="bg-bg/95 sticky top-0 z-10 -mx-4 mb-4 flex items-center justify-between gap-3 border-b border-line px-4 py-2 backdrop-blur-sm sm:mx-0 sm:rounded-xl sm:border sm:px-4">
        <p className="text-sm font-semibold">
          {answered} / {questions.length} işaretlendi
        </p>
        <span className={cn('tabular inline-flex items-center gap-1.5 text-sm font-bold', left !== null && left < 60 && 'text-danger')}>
          <Clock className="size-4" aria-hidden />
          {clock(left ?? elapsed)}
        </span>
      </div>
      <ol className="space-y-4">
        {questions.map((q, i) => (
          <li key={q.id}>
            <Card>
              <CardBody>
                <div className="flex gap-3">
                  <span className="bg-accent-soft text-accent-soft-fg grid size-7 shrink-0 place-items-center rounded-full text-sm font-bold">{i + 1}</span>
                  <div className="min-w-0 flex-1 text-[15px]">
                    <Md text={q.stem} />
                  </div>
                </div>
                <div role="radiogroup" aria-label={`Soru ${i + 1} seçenekleri`} className="mt-3 space-y-2">
                  {q.options.map((option, k) => {
                    const checked = answers[q.id] === k
                    return (
                      <button
                        key={k}
                        type="button"
                        role="radio"
                        aria-checked={checked}
                        onClick={() => setAnswers((a) => ({ ...a, [q.id]: checked ? null : k }))}
                        className={cn(
                          'flex min-h-11 w-full items-start gap-3 rounded-xl border px-3 py-2 text-left text-sm transition-colors duration-150',
                          checked ? 'border-primary bg-primary-soft text-primary-soft-fg' : 'border-line hover:border-line-strong hover:bg-surface-2',
                        )}
                      >
                        <span className={cn('mt-px grid size-6 shrink-0 place-items-center rounded-full border text-xs font-bold', checked ? 'border-primary bg-primary text-primary-fg' : 'border-line-strong text-muted')}>
                          {letters[k]}
                        </span>
                        <span className="min-w-0 flex-1 pt-0.5">
                          <Md text={option} inline />
                        </span>
                      </button>
                    )
                  })}
                </div>
              </CardBody>
            </Card>
          </li>
        ))}
      </ol>
      <div className="mt-5 flex flex-wrap items-center gap-3">
        {confirming ? (
          <>
            <p className="text-sm font-semibold">{questions.length - answered} soru boş. Yine de bitirilsin mi?</p>
            <Button onClick={finish} loading={submit.isPending}>
              Bitir
            </Button>
            <Button variant="secondary" onClick={() => setConfirming(false)}>
              Devam et
            </Button>
          </>
        ) : (
          <Button size="lg" onClick={() => (answered < questions.length ? setConfirming(true) : finish())} loading={submit.isPending}>
            Testi bitir
          </Button>
        )}
      </div>
    </>
  )
}

function ResultView({ title, exam, questions, result, onRestart }: { title: string; exam: 'LGS' | 'TYT' | 'AYT' | 'YDT'; questions: TestQuestion[]; result: TestResult; onRestart: () => void }) {
  const [only, setOnly] = useState<'wrong' | 'all'>('wrong')
  const curriculum = useCurriculum()
  const review = useMemo(() => new Map(result.review.map((r) => [r.question_id, r])), [result.review])
  const shown = questions.filter((q) => only === 'all' || !review.get(q.id)?.is_correct)
  return (
    <>
      <PageHeader title={title} back={{ to: '/app/testler', label: 'Testler' }} />
      <Card className="mb-5">
        <CardBody>
          <p className="text-muted text-sm font-semibold">Netin</p>
          <p className="font-display tabular text-4xl font-extrabold">{formatNet(net(result.correct, result.wrong, exam))}</p>
          <div className="mt-3 flex flex-wrap gap-2">
            <Badge tone="primary">
              <Check /> {result.correct} doğru
            </Badge>
            <Badge tone="danger">
              <X /> {result.wrong} yanlış
            </Badge>
            <Badge>{result.blank} boş</Badge>
            {result.seconds != null && (
              <Badge tone="accent">
                <Clock /> {clock(result.seconds)}
              </Badge>
            )}
          </div>
          <p className="text-muted mt-3 text-sm">{result.first ? 'İlk çözümün istatistiklerine işlendi.' : 'Tekrar çözümler istatistiklere eklenmez.'}</p>
          <Button variant="secondary" className="mt-4" onClick={onRestart}>
            <RotateCcw />
            Tekrar çöz
          </Button>
        </CardBody>
      </Card>

      <div className="mb-3 flex items-center justify-between gap-3">
        <h2 className="font-display text-lg font-bold">Çözümler</h2>
        <Segmented size="sm" value={only} onChange={setOnly} options={[{ value: 'wrong', label: 'Yanlış ve boş' }, { value: 'all', label: 'Hepsi' }]} />
      </div>
      {shown.length === 0 && <p className="text-muted text-sm">Hepsini doğru yaptın.</p>}
      <ol className="space-y-4">
        {shown.map((q) => {
          const r = review.get(q.id)
          if (!r) return null
          return (
            <li key={q.id}>
              <Card>
                <CardBody>
                  <div className="flex gap-3">
                    <span className={cn('grid size-7 shrink-0 place-items-center rounded-full text-sm font-bold', r.is_correct ? 'bg-primary-soft text-primary-soft-fg' : 'bg-danger-soft text-danger')}>{q.position}</span>
                    <div className="min-w-0 flex-1 text-[15px]">
                      <Md text={q.stem} />
                    </div>
                  </div>
                  <ul className="mt-3 space-y-2">
                    {q.options.map((option, k) => {
                      const right = k === r.correct_choice
                      const picked = k === r.choice
                      return (
                        <li
                          key={k}
                          className={cn('flex items-start gap-3 rounded-xl border px-3 py-2 text-sm', right ? 'border-primary bg-primary-soft text-primary-soft-fg' : picked ? 'border-danger bg-danger-soft text-danger' : 'border-line')}
                        >
                          <span className="mt-px grid size-6 shrink-0 place-items-center rounded-full border border-current text-xs font-bold">{letters[k]}</span>
                          <span className="min-w-0 flex-1 pt-0.5">
                            <Md text={option} inline />
                          </span>
                          {right && <Check className="mt-0.5 size-4 shrink-0" aria-label="Doğru cevap" />}
                          {picked && !right && <X className="mt-0.5 size-4 shrink-0" aria-label="Senin cevabın" />}
                        </li>
                      )
                    })}
                  </ul>
                  {r.choice == null && <p className="text-muted mt-2 text-sm">Boş bıraktın.</p>}
                  {r.explanation && (
                    <div className="bg-surface-2 mt-3 rounded-xl p-3 text-sm">
                      <p className="mb-1 font-bold">Çözüm</p>
                      <Md text={r.explanation} />
                    </div>
                  )}
                  {curriculum.data && q.topic_id && <p className="text-muted mt-2 text-xs">{curriculum.data.topicById.get(q.topic_id)?.name}</p>}
                </CardBody>
              </Card>
            </li>
          )
        })}
      </ol>
    </>
  )
}
