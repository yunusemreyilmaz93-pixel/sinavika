import { useQuery } from '@tanstack/react-query'
import { useState } from 'react'
import { toast } from 'sonner'
import { Button } from '@/components/ui/button'
import { Card, CardBody, CardHeader } from '@/components/ui/card'
import { Skeleton } from '@/components/ui/skeleton'
import { useCurriculum } from '@/lib/data'
import { subjectsFor, type ExamKind } from '@/lib/exam'
import { errorMessage, supabase, unwrap } from '@/lib/supabase'
import { sheetRows, useExamAnswers, useKeyDonor, useSaveExamAnswers } from './queries'
import { evaluate, normalizeKey } from './sheet'
import { emptySheet, KeyDonorBanner, SubjectSheet, type SheetState } from './subject-sheet'

export function ExamAnswers({
  examId,
  studentId,
  title,
  kind,
  canEdit,
}: {
  examId: number
  studentId: string
  title: string
  kind: ExamKind
  canEdit: boolean
}) {
  const curriculum = useCurriculum()
  const saved = useExamAnswers(examId)
  const save = useSaveExamAnswers(examId)
  const field = useQuery({
    queryKey: ['student', studentId, 'field'],
    queryFn: async () => unwrap(await supabase.from('students').select('field').eq('id', studentId).maybeSingle())?.field ?? null,
  })
  const [draft, setDraft] = useState<Record<string, SheetState>>({})
  const donor = useKeyDonor(kind, canEdit ? title : '', examId)

  if (saved.isPending || curriculum.isPending || field.isPending) return <Skeleton className="h-24" />
  if (!curriculum.data || saved.error) return null

  const subjects = subjectsFor(curriculum.data.subjects, kind, field.data ?? null).filter((s) => canEdit || saved.data.has(s.id))
  if (!subjects.length) return null

  const dirty = subjects.filter((s) => draft[s.id])

  const submit = async () => {
    for (const subject of dirty) {
      const sheet = draft[subject.id]
      if (evaluate(sheet.key, sheet.answers, subject.question_count, kind).missingKey) {
        return void toast.error(`${subject.name} için cevabı olan her sorunun anahtarı girilmeli`)
      }
    }
    try {
      for (const subject of dirty) {
        const sheet = draft[subject.id]
        if (!evaluate(sheet.key, sheet.answers, subject.question_count, kind).filled) continue
        await save.mutateAsync({ subjectId: subject.id, rows: sheetRows(sheet, subject.question_count, kind) })
      }
      setDraft({})
      toast.success('Cevaplar kaydedildi')
    } catch (err) {
      toast.error(errorMessage(err))
    }
  }

  return (
    <Card>
      <CardHeader
        title="Soru bazlı sonuç"
        description={canEdit ? 'Ders sonucu ve konu analizi cevaplardan hesaplanır' : 'Cevap anahtarı ve öğrenci cevapları'}
      />
      <CardBody className="space-y-2 pt-3">
        {canEdit && donor.data && subjects.some((s) => donor.data?.keys.has(s.id) && !saved.data.get(s.id)?.key && !draft[s.id]?.key) && (
          <KeyDonorBanner
            takenOn={donor.data.takenOn}
            onApply={() =>
              setDraft((all) => {
                const next = { ...all }
                for (const subject of subjects) {
                  const key = donor.data?.keys.get(subject.id)
                  const current = all[subject.id] ?? saved.data.get(subject.id) ?? emptySheet
                  if (key && !current.key) next[subject.id] = { ...current, key: normalizeKey(key, kind, subject.question_count) }
                }
                return next
              })
            }
          />
        )}
        {subjects.map((subject) => (
          <SubjectSheet
            key={subject.id}
            subject={subject}
            kind={kind}
            topics={curriculum.data.topicsBySubject.get(subject.id) ?? []}
            value={draft[subject.id] ?? saved.data.get(subject.id) ?? emptySheet}
            onChange={canEdit ? (next) => setDraft((all) => ({ ...all, [subject.id]: next })) : undefined}
          />
        ))}
        {canEdit && dirty.length > 0 && (
          <div className="flex justify-end gap-2 pt-2">
            <Button variant="ghost" onClick={() => setDraft({})}>
              Vazgeç
            </Button>
            <Button loading={save.isPending} onClick={submit}>
              Kaydet
            </Button>
          </div>
        )}
      </CardBody>
    </Card>
  )
}
