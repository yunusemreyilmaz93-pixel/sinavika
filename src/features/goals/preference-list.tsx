import { ArrowDown, ArrowUp, Crosshair, Plus, Trash2 } from 'lucide-react'
import { useMemo, useState } from 'react'
import { toast } from 'sonner'
import { Button } from '@/components/ui/button'
import { Card, CardBody, CardHeader } from '@/components/ui/card'
import { Skeleton } from '@/components/ui/skeleton'
import { errorMessage } from '@/lib/supabase'
import type { Field } from '@/lib/exam'
import { ProgramPicker } from './program-picker'
import { usePreferenceActions, type Preference, usePreferences, useSetTargetProgram, useStudentTarget } from './queries'
import { scoreTypeOfField } from './reference'

const MAX = 24
const NONE: Preference[] = []
const number = new Intl.NumberFormat('tr-TR')
const score = new Intl.NumberFormat('tr-TR', { minimumFractionDigits: 2, maximumFractionDigits: 2 })

export function PreferenceList({ studentId, field, canEdit }: { studentId: string; field: Field | null; canEdit: boolean }) {
  const list = usePreferences(studentId)
  const target = useStudentTarget(studentId)
  const setTarget = useSetTargetProgram(studentId)
  const actions = usePreferenceActions(studentId)
  const [open, setOpen] = useState(false)
  const rows = list.data ?? NONE
  const listed = useMemo(() => new Set(rows.map((r) => r.program_code)), [rows])
  const busy = actions.add.isPending || actions.remove.isPending || actions.reorder.isPending
  const fail = (err: unknown) => toast.error(errorMessage(err))

  const move = (index: number, by: -1 | 1) => {
    const codes = rows.map((r) => r.program_code)
    ;[codes[index], codes[index + by]] = [codes[index + by], codes[index]]
    actions.reorder.mutate(codes, { onError: fail })
  }

  if (!canEdit && !rows.length && !list.isPending) return null

  return (
    <Card>
      <CardHeader
        title="Tercih listesi"
        description={`${rows.length}/${MAX}`}
        action={
          canEdit ? (
            <Button variant="soft" size="sm" className="h-11" disabled={rows.length >= MAX} onClick={() => setOpen(true)}>
              <Plus />
              Ekle
            </Button>
          ) : undefined
        }
      />
      <CardBody>
        {list.isPending ? (
          <Skeleton className="h-24" />
        ) : list.error ? (
          <p className="text-sm text-danger">{errorMessage(list.error)}</p>
        ) : rows.length === 0 ? (
          <p className="text-sm text-muted">Tercih eklendiğinde sıralı liste ve her bölümün son taban puanı burada görünür.</p>
        ) : (
          <ol className="divide-y divide-line rounded-xl border border-line">
            {rows.map((r, i) => {
              const isTarget = target.data?.target_program === r.program_code
              return (
                <li key={r.program_code} className="flex items-center gap-2 px-3 py-2">
                  <span className="tabular w-6 shrink-0 text-center font-display text-sm font-bold text-muted">{i + 1}</span>
                  <div className="min-w-0 flex-1">
                    <p className="truncate text-sm font-semibold">{r.program.name}</p>
                    <p className="tabular truncate text-xs text-muted">
                      {r.program.university.short_name}
                      {r.program.university.city ? `, ${r.program.university.city}` : ''} · {r.program.score_type}
                      {r.result
                        ? ` · ${r.result.year} taban ${r.result.min_score != null ? score.format(r.result.min_score) : '-'}${r.result.rank ? `, sıra ${number.format(r.result.rank)}` : ''}`
                        : ''}
                    </p>
                    {isTarget && <p className="text-xs font-semibold text-primary">Hedef bölüm</p>}
                  </div>
                  {canEdit && (
                    <div className="flex shrink-0 items-center">
                      <Button
                        variant="ghost"
                        size="icon"
                        disabled={busy || i === 0}
                        onClick={() => move(i, -1)}
                        aria-label={`${r.program.name} yukarı taşı`}
                      >
                        <ArrowUp />
                      </Button>
                      <Button
                        variant="ghost"
                        size="icon"
                        disabled={busy || i === rows.length - 1}
                        onClick={() => move(i, 1)}
                        aria-label={`${r.program.name} aşağı taşı`}
                      >
                        <ArrowDown />
                      </Button>
                      {!isTarget && (
                        <Button
                          variant="ghost"
                          size="icon"
                          disabled={setTarget.isPending}
                          onClick={() => setTarget.mutate(r.program_code, { onError: fail })}
                          aria-label={`${r.program.name} hedef bölüm olsun`}
                        >
                          <Crosshair />
                        </Button>
                      )}
                      <Button
                        variant="ghost"
                        size="icon"
                        className="text-danger"
                        disabled={busy}
                        onClick={() => actions.remove.mutate(r.program_code, { onError: fail })}
                        aria-label={`${r.program.name} listeden kaldır`}
                      >
                        <Trash2 />
                      </Button>
                    </div>
                  )}
                </li>
              )
            })}
          </ol>
        )}
      </CardBody>
      {canEdit && (
        <ProgramPicker
          key={String(open)}
          open={open}
          onOpenChange={setOpen}
          scoreType={field ? scoreTypeOfField[field] : null}
          saving={actions.add.isPending}
          exclude={listed}
          onPick={(code) =>
            actions.add.mutate(
              { code, position: rows.length },
              {
                onSuccess: () => setOpen(false),
                onError: fail,
              },
            )
          }
        />
      )}
    </Card>
  )
}
