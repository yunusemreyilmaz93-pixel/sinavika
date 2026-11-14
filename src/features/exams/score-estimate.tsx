import { Calculator } from 'lucide-react'
import { Badge } from '@/components/ui/badge'
import { Card } from '@/components/ui/card'
import { usePlanStudent } from '@/features/plan/queries'
import { net, type ExamKind } from '@/lib/exam'
import { hasPartFor, lgsScore, scoreFormat, scoreTypesFor, tytScore, yksScore, type Nets } from '@/lib/score'
import { useExamScores, useExams, type Score } from './queries'

function netsOf(scores: Score[], kind: ExamKind): Nets {
  return Object.fromEntries(scores.map((s) => [s.subject_id, net(s.correct, s.wrong, kind)]))
}

// Denemenin yaklaşık puanı. AYT ve YDT denemesi öğrencinin en son TYT denemesiyle, TYT denemesi en son AYT ya da YDT denemesiyle birleştirilir
export function ScoreEstimate({ studentId, kind, examId, scores }: { studentId: string; kind: ExamKind; examId: number; scores: Score[] }) {
  const student = usePlanStudent(studentId)
  const exams = useExams(studentId)
  const partnerKinds: ExamKind[] = kind === 'TYT' ? ['AYT', 'YDT'] : kind === 'LGS' ? [] : ['TYT']
  const partners = partnerKinds.flatMap((k) => exams.data?.find((e) => e.kind === k && e.id !== examId) ?? [])
  const partnerScores = useExamScores(studentId, partners.map((p) => p.id))

  if (!scores.length) return null
  const own = netsOf(scores, kind)

  const items: { label: string; value: number; note?: string }[] = []
  if (kind === 'LGS') items.push({ label: 'LGS puanı', value: lgsScore(own) })
  if (kind === 'TYT' && tytScore(own) > 0) items.push({ label: 'TYT puanı', value: tytScore(own) })
  if (kind !== 'LGS' && student.data && partnerScores.data !== undefined) {
    let nets = own
    for (const p of partners) nets = { ...netsOf(partnerScores.data.filter((s) => s.mock_exam_id === p.id), p.kind), ...nets }
    const tytExam = kind === 'TYT' ? null : partners.find((p) => p.kind === 'TYT')
    for (const type of scoreTypesFor(student.data.field)) {
      if (!hasPartFor(type, nets) || !Object.keys(nets).some((id) => id.startsWith('tyt-'))) continue
      items.push({ label: `${type} puanı`, value: yksScore(type, nets), note: tytExam ? `TYT: ${tytExam.title}` : undefined })
    }
  }
  if (!items.length) return null

  return (
    <Card className="p-4 sm:p-5">
      <div className="flex items-start gap-3">
        <span className="grid size-10 shrink-0 place-items-center rounded-xl bg-accent-soft text-accent-soft-fg" aria-hidden>
          <Calculator className="size-5" />
        </span>
        <div className="min-w-0 flex-1">
          <div className="flex flex-wrap items-center gap-2">
            <h3 className="text-base font-bold">Yaklaşık puan</h3>
            <Badge>tahmini</Badge>
          </div>
          <p className="mt-0.5 text-sm text-muted">
            {kind === 'LGS' ? 'Önceki yılların katsayılarıyla' : 'MEB OGM Materyal puan hesaplama motorunun katsayılarıyla'} hesaplanır, resmi puan o yıl sınava girenlerin sonuçlarına göre değişir.
          </p>
        </div>
      </div>
      <dl className="mt-4 grid grid-cols-2 gap-3 sm:grid-cols-3">
        {items.map((item) => (
          <div key={item.label} className="rounded-xl bg-surface-2 px-3 py-2.5">
            <dt className="text-xs text-muted">{item.label}</dt>
            <dd className="tabular font-display text-2xl font-extrabold">≈ {scoreFormat.format(item.value)}</dd>
            {item.note && <dd className="mt-0.5 truncate text-xs text-muted">{item.note}</dd>}
          </div>
        ))}
      </dl>
      {kind !== 'LGS' && <p className="mt-3 text-xs text-muted">Diploma notu (OBP) katkısı dahil değildir.</p>}
    </Card>
  )
}
