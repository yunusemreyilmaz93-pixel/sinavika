import { useMutation, useQuery, useQueryClient } from '@tanstack/react-query'
import { Copy, Pencil, Trash2 } from 'lucide-react'
import { useState } from 'react'
import { Link, useNavigate, useParams, useSearchParams } from 'react-router'
import { toast } from 'sonner'
import { PageHeader } from '@/components/app/page-header'
import { Badge } from '@/components/ui/badge'
import { Button } from '@/components/ui/button'
import { Card } from '@/components/ui/card'
import { Confirm } from '@/components/ui/confirm'
import { EmptyState } from '@/components/ui/empty-state'
import { Segmented } from '@/components/ui/segmented'
import { Skeleton } from '@/components/ui/skeleton'
import { useProfile } from '@/features/auth/session'
import { LoadError } from '@/features/plan/load-error'
import { invalidateTasks } from '@/features/plan/queries'
import { firstName, StudentChips, usePlannerStudents, type PlannerStudent } from '@/features/plan/student-picker'
import { WeekNav } from '@/features/plan/week-nav'
import { weekRangeLabel } from '@/features/plan/lib'
import { shiftDays, todayISO, weekStartISO } from '@/lib/dates'
import { AppError, errorMessage, supabase, unwrap } from '@/lib/supabase'
import { LIMIT_MESSAGE, trackLabel, useDeleteTemplate, useSaveTemplate, useTemplate, useTemplateSlots, templateRows, type TemplateRecord } from './queries'
import { WeekView } from './week-view'

const MAX_ROWS = 4000

export default function TemplatePage() {
  const { key } = useParams()
  const template = useTemplate(key)

  if (template.isPending) {
    return (
      <div className="space-y-4" aria-busy="true" aria-label="Yükleniyor">
        <Skeleton className="h-10 w-64" />
        <Skeleton className="h-72" />
      </div>
    )
  }
  if (template.error) return <LoadError message={errorMessage(template.error)} onRetry={() => void template.refetch()} />
  if (!template.data) {
    return (
      <>
        <PageHeader title="Şablon bulunamadı" back={{ to: '/app/sablonlar', label: 'Şablonlar' }} />
        <EmptyState title="Bu şablon yok ya da silinmiş" icon={Copy} />
      </>
    )
  }
  return <TemplateDetail template={template.data} />
}

function TemplateDetail({ template }: { template: TemplateRecord }) {
  const navigate = useNavigate()
  const [params] = useSearchParams()
  const save = useSaveTemplate()
  const remove = useDeleteTemplate()
  const slots = useTemplateSlots()
  const [week, setWeek] = useState(0)
  const [deleting, setDeleting] = useState(false)
  const [excluded, setExcluded] = useState<Set<number>>(new Set())
  const applied = { ...template, items: template.items.filter((_, i) => !excluded.has(i)) }
  const toggleItem = (index: number) =>
    setExcluded((set) => {
      const next = new Set(set)
      if (!next.delete(index)) next.add(index)
      return next
    })
  const own = template.source === 'own'
  const listPath = own ? '/app/sablonlar?sekme=benim' : '/app/sablonlar'

  const copy = async () => {
    if (slots.full) return void toast.error(LIMIT_MESSAGE)
    try {
      const id = await save.mutateAsync({
        id: null,
        draft: {
          name: (own ? `${template.name} (kopya)` : template.name).slice(0, 60),
          description: template.description,
          track: template.track,
          items: applied.items,
        },
      })
      toast.success(own ? 'Şablon çoğaltıldı' : 'Şablonlarınıza kopyalandı')
      navigate(`/app/sablonlar/${id}/duzenle`)
    } catch (error) {
      toast.error(errorMessage(error))
    }
  }

  const del = async () => {
    try {
      await remove.mutateAsync(template.id!)
      toast.success('Şablon silindi')
      navigate(listPath, { replace: true })
    } catch (error) {
      toast.error(errorMessage(error))
    }
  }

  return (
    <>
      <PageHeader
        title={template.name}
        description={template.description}
        back={{ to: listPath, label: 'Şablonlar' }}
        actions={
          own ? (
            <>
              <Button variant="secondary" asChild>
                <Link to={`/app/sablonlar/${template.key}/duzenle`}>
                  <Pencil />
                  Düzenle
                </Link>
              </Button>
              <Button variant="secondary" onClick={() => void copy()} loading={save.isPending}>
                <Copy />
                Çoğalt
              </Button>
              <Button variant="ghost" size="icon" aria-label="Şablonu sil" onClick={() => setDeleting(true)}>
                <Trash2 className="text-muted" />
              </Button>
            </>
          ) : (
            <Button variant="secondary" onClick={() => void copy()} loading={save.isPending}>
              <Copy />
              Kopyalayıp düzenle
            </Button>
          )
        }
      />

      <div className="mb-4 flex flex-wrap gap-1.5">
        {template.group && <Badge tone="primary">{template.group}</Badge>}
        {!template.group && template.track && <Badge tone="primary">{trackLabel[template.track]}</Badge>}
        <Badge>{template.weeks} hafta</Badge>
        <Badge>{template.items.length} görev</Badge>
      </div>

      <div className="grid gap-6 lg:grid-cols-[minmax(0,1fr)_21rem] lg:items-start">
        <div className="lg:col-start-2 lg:row-start-1 lg:sticky lg:top-4">
          <ApplyPanel template={applied} initialStudentId={params.get('ogrenci')} initialWeek={params.get('hafta')} />
        </div>
        <div className="min-w-0 space-y-4 lg:col-start-1 lg:row-start-1">
          {template.weeks > 1 && (
            <Segmented
              size="sm"
              options={Array.from({ length: template.weeks }, (_, i) => ({ value: String(i), label: `Hafta ${i + 1}` }))}
              value={String(week)}
              onChange={(v) => setWeek(Number(v))}
            />
          )}
          <div className="flex flex-wrap items-center justify-between gap-2 text-sm text-muted">
            <span>Uygulamak istemediğiniz görevlerin işaretini kaldırın</span>
            {excluded.size > 0 && (
              <button type="button" className="-my-2 h-11 font-semibold text-accent" onClick={() => setExcluded(new Set())}>
                {excluded.size} görev çıkarıldı, sıfırla
              </button>
            )}
          </div>
          <WeekView items={template.items} week={week} excluded={excluded} onToggle={toggleItem} />
        </div>
      </div>

      <Confirm
        open={deleting}
        onOpenChange={setDeleting}
        title="Şablon silinsin mi?"
        description={`${template.name}. Daha önce eklenen görevler silinmez.`}
        confirmLabel="Sil"
        onConfirm={del}
      />
    </>
  )
}

function ApplyPanel({
  template,
  initialStudentId,
  initialWeek,
}: {
  template: TemplateRecord
  initialStudentId: string | null
  initialWeek: string | null
}) {
  const profile = useProfile()
  const qc = useQueryClient()
  const students = usePlannerStudents(profile.id)
  const list = students.data ?? []
  const [picked, setPicked] = useState<string[] | null>(null)
  const [start, setStart] = useState(initialWeek ? weekStartISO(initialWeek) : weekStartISO())
  const studentIds = picked ?? (initialStudentId && list.some((s) => s.id === initialStudentId) ? [initialStudentId] : [])
  const total = template.items.length * studentIds.length
  const end = shiftDays(start, template.weeks * 7 - 1)

  const existing = useQuery({
    queryKey: ['templates', 'existing', studentIds, start, end],
    enabled: studentIds.length > 0,
    queryFn: async () => {
      const result = await supabase
        .from('tasks')
        .select('id', { count: 'exact', head: true })
        .in('student_id', studentIds)
        .gte('due_on', start)
        .lte('due_on', end)
      if (result.error) throw result.error
      return result.count ?? 0
    },
  })

  const mismatched: PlannerStudent[] = template.track ? list.filter((s) => studentIds.includes(s.id) && s.track !== template.track) : []

  const apply = useMutation({
    mutationFn: async () => {
      if (!studentIds.length) throw new AppError('En az bir öğrenci seçin')
      if (total > MAX_ROWS) throw new AppError('Bu kadar görev tek seferde eklenemez. Daha az öğrenci seçin')
      const rows = templateRows(template.items, studentIds, start)
      unwrap(await supabase.from('tasks').insert(rows))
      return rows.length
    },
    onSuccess: async (count) => {
      await invalidateTasks(qc, studentIds)
      await existing.refetch()
      toast.success(`${studentIds.length} öğrenciye ${count} görev eklendi`)
    },
    onError: (error) => toast.error(errorMessage(error)),
  })

  const toggle = (id: string) => setPicked(studentIds.includes(id) ? studentIds.filter((v) => v !== id) : [...studentIds, id])

  return (
    <Card className="space-y-5 p-4 sm:p-5">
      <h2 className="font-display text-lg font-bold">Öğrencilere uygula</h2>

      {students.isPending ? (
        <Skeleton className="h-24" />
      ) : !list.length ? (
        <p className="text-sm text-muted">Henüz öğrenciniz yok. Davet oluşturduktan sonra şablonu uygulayabilirsiniz.</p>
      ) : (
        <>
          <section>
            <div className="mb-2 flex items-center justify-between gap-3">
              <h3 className="text-sm font-semibold">Öğrenciler</h3>
              <button
                type="button"
                className="-my-2 h-11 px-1 text-sm font-semibold text-accent"
                onClick={() => setPicked(studentIds.length === list.length ? [] : list.map((s) => s.id))}
              >
                {studentIds.length === list.length ? 'Hiçbiri' : 'Tümü'}
              </button>
            </div>
            <StudentChips multiple label="Öğrenciler" students={list} selected={studentIds} onToggle={toggle} />
            {mismatched.length > 0 && (
              <p className="mt-2 text-sm text-warning">
                {mismatched.map((s) => firstName(s.full_name)).join(', ')} farklı sınav türünde. Şablon {template.track ? trackLabel[template.track] : ''} için hazırlandı
              </p>
            )}
          </section>

          <section>
            <h3 className="mb-2 text-sm font-semibold">{template.weeks > 1 ? 'Başlangıç haftası' : 'Hafta'}</h3>
            <WeekNav week={start} onChange={setStart} size="sm" />
            {template.weeks > 1 && (
              <p className="mt-2 text-sm text-muted">
                {weekRangeLabel(start)} ile {weekRangeLabel(shiftDays(start, (template.weeks - 1) * 7))} arası
              </p>
            )}
            {end < todayISO() && <p className="mt-2 text-sm text-warning">Geçmiş tarihler seçildi.</p>}
          </section>

          {studentIds.length > 0 && (existing.data ?? 0) > 0 && (
            <p className="rounded-xl bg-warning-soft px-3 py-2 text-sm text-warning">
              Bu tarihlerde seçili öğrencilerin {existing.data} görevi var. Şablondaki görevler üzerine eklenir
            </p>
          )}

          <Button className="w-full" loading={apply.isPending} disabled={!studentIds.length} onClick={() => apply.mutate()}>
            {total ? `${total} görev ekle` : 'Öğrenci seçin'}
          </Button>
        </>
      )}
    </Card>
  )
}
