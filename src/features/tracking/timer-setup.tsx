import { Play } from 'lucide-react'
import { useState } from 'react'
import { Button } from '@/components/ui/button'
import { Card, CardBody } from '@/components/ui/card'
import { ProgressBar } from '@/components/ui/progress'
import { Stepper } from '@/components/ui/stepper'
import { formatMinutes } from '@/lib/dates'
import { ChoiceChip, FormSkeleton, Group, SubjectPicker, TopicSelect } from './form-parts'
import { useStudyActivity } from './stats'
import { useStudentSubjects } from './subjects'
import { TimerRing } from './timer-ring'
import { readPrefs, writePrefs } from './timer-store'

const PRESETS = [25, 40, 50]

export type TimerChoice = { subjectId: string; topicId: number | null; minutes: number }

export function TimerSetup({
  studentId,
  dailyGoal,
  onStart,
}: {
  studentId: string
  dailyGoal: number
  onStart: (choice: TimerChoice) => void
}) {
  const { subjects, multiExam, recent, curriculum, isPending, error } = useStudentSubjects(studentId)
  const [prefs] = useState(readPrefs)
  const [picked, setPicked] = useState<string | null>(null)
  const [topicId, setTopicId] = useState<number | null>(null)
  const [custom, setCustom] = useState(!PRESETS.includes(prefs.minutes))
  const [minutes, setMinutes] = useState(prefs.minutes)
  const subjectId = picked ?? recent

  const start = () => {
    if (!subjectId) return
    writePrefs({ minutes, custom: custom ? minutes : prefs.custom })
    onStart({ subjectId, topicId, minutes })
  }

  return (
    <div className="grid grid-cols-[minmax(0,1fr)] gap-6 lg:grid-cols-2 lg:items-center lg:gap-10">
      <div className="flex flex-col items-center gap-5">
        <TimerRing progress={0} remaining={minutes * 60_000} className="max-w-[210px] sm:max-w-[300px]">
          <span className="mt-2 text-sm font-semibold text-muted">Hazır</span>
        </TimerRing>
        <TodayLine studentId={studentId} dailyGoal={dailyGoal} />
      </div>

      <Card className="min-w-0">
        <CardBody className="flex min-w-0 flex-col gap-5">
          {isPending ? (
            <FormSkeleton />
          ) : error ? (
            <p className="py-6 text-center text-sm text-danger">Dersler yüklenemedi. Sayfayı yenileyip tekrar dene.</p>
          ) : (
            <>
              <SubjectPicker
                subjects={subjects}
                value={subjectId}
                multiExam={multiExam}
                bleed="-mx-4 px-4 scroll-px-4"
                onChange={(id) => {
                  setPicked(id)
                  if (id !== subjectId) setTopicId(null)
                }}
              />
              <TopicSelect curriculum={curriculum} subjectId={subjectId} value={topicId} onChange={setTopicId} />
              <Group label="Süre">
                <div role="radiogroup" aria-label="Süre" className="grid grid-cols-4 gap-2">
                  {PRESETS.map((m) => (
                    <ChoiceChip
                      key={m}
                      selected={!custom && minutes === m}
                      onClick={() => {
                        setCustom(false)
                        setMinutes(m)
                      }}
                      className="justify-center px-0"
                    >
                      {m} dk
                    </ChoiceChip>
                  ))}
                  <ChoiceChip
                    selected={custom}
                    onClick={() => {
                      setCustom(true)
                      setMinutes(prefs.custom)
                    }}
                    className="justify-center px-0"
                  >
                    Özel
                  </ChoiceChip>
                </div>
                {custom && (
                  <Stepper
                    label="Dakika"
                    value={minutes}
                    onChange={setMinutes}
                    min={5}
                    max={240}
                    step={5}
                    className="flex-row justify-between rounded-xl bg-surface-2 py-1 pr-1 pl-4 [&>span:first-child]:text-[13px]"
                  />
                )}
              </Group>
              <Button size="lg" onClick={start} disabled={!subjectId || minutes < 1}>
                <Play className="fill-current" />
                Başlat
              </Button>
              {!subjectId && <p className="-mt-2 text-center text-sm text-muted">Başlamak için bir ders seç.</p>}
            </>
          )}
        </CardBody>
      </Card>
    </div>
  )
}

export function TodayLine({ studentId, dailyGoal }: { studentId: string; dailyGoal: number }) {
  const { data } = useStudyActivity(studentId)
  if (!data) return <div className="h-11" aria-hidden />
  const minutes = data.todayMinutes
  return (
    <div className="mx-auto w-full max-w-[300px]">
      <div className="flex items-baseline justify-between gap-3 text-sm">
        <span className="text-muted">
          Bugün <span className="tabular font-semibold text-fg">{formatMinutes(minutes)}</span>
        </span>
        {dailyGoal > 0 && <span className="text-muted">Hedef {formatMinutes(dailyGoal)}</span>}
      </div>
      {dailyGoal > 0 && <ProgressBar value={minutes / dailyGoal} className="mt-2" />}
    </div>
  )
}
