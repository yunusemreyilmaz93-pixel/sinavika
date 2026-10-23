import { CopyPlus, LayoutTemplate, Plus, UserRoundPlus } from 'lucide-react'
import { useMemo, useState } from 'react'
import { Link, useNavigate, useSearchParams } from 'react-router'
import { toast } from 'sonner'
import { PageHeader } from '@/components/app/page-header'
import { Badge } from '@/components/ui/badge'
import { Button } from '@/components/ui/button'
import { Card } from '@/components/ui/card'
import { EmptyState } from '@/components/ui/empty-state'
import { Segmented } from '@/components/ui/segmented'
import { Skeleton } from '@/components/ui/skeleton'
import { LoadError } from '@/features/plan/load-error'
import { errorMessage } from '@/lib/supabase'
import { FromStudentDialog } from './from-student-dialog'
import { LIMIT_MESSAGE, MAX_TEMPLATES, starterRecords, trackLabel, useOwnTemplates, type TemplateRecord } from './queries'
import { groups, type TemplateGroup } from './starters'

type Tab = 'hazir' | 'benim'
type Length = 'all' | 'one' | 'many'

function TemplateCard({ template, search }: { template: TemplateRecord; search: string }) {
  return (
    <Card className="relative flex flex-col p-4 transition-colors hover:border-line-strong">
      <Link
        to={`/app/sablonlar/${template.key}${search}`}
        className="font-display text-base font-bold after:absolute after:inset-0 after:rounded-2xl focus-visible:outline-none focus-visible:after:ring-3 focus-visible:after:ring-accent/30"
      >
        {template.name}
      </Link>
      {template.description && <p className="mt-1 text-sm text-muted">{template.description}</p>}
      <div className="mt-auto flex flex-wrap gap-1.5 pt-3">
        {(template.group ?? (template.track ? trackLabel[template.track] : null)) && (
          <Badge tone="primary">{template.group ?? (template.track ? trackLabel[template.track] : '')}</Badge>
        )}
        <Badge>{template.weeks} hafta</Badge>
        <Badge>{template.items.length} görev</Badge>
      </div>
    </Card>
  )
}

export default function TemplatesPage() {
  const [params, setParams] = useSearchParams()
  const tab: Tab = params.get('sekme') === 'benim' ? 'benim' : 'hazir'
  const [group, setGroup] = useState<'all' | TemplateGroup>('all')
  const [length, setLength] = useState<Length>('all')
  const [fromStudent, setFromStudent] = useState(false)
  const own = useOwnTemplates()
  const navigate = useNavigate()
  const full = (own.data?.length ?? 0) >= MAX_TEMPLATES
  const guard = (action: () => void) => () => (full ? toast.error(LIMIT_MESSAGE) : action())

  const carry = new URLSearchParams()
  for (const key of ['ogrenci', 'hafta']) {
    const value = params.get(key)
    if (value) carry.set(key, value)
  }
  const search = carry.size ? `?${carry}` : ''

  const starters = useMemo(
    () =>
      starterRecords.filter(
        (t) => (group === 'all' || t.group === group) && (length === 'all' || (length === 'one' ? t.weeks === 1 : t.weeks > 1)),
      ),
    [group, length],
  )

  const setTab = (next: Tab) => {
    const copy = new URLSearchParams(params)
    if (next === 'benim') copy.set('sekme', 'benim')
    else copy.delete('sekme')
    setParams(copy, { replace: true })
  }

  return (
    <>
      <PageHeader
        title="Şablonlar"
        actions={
          <>
            <Button variant="secondary" onClick={guard(() => setFromStudent(true))}>
              <UserRoundPlus />
              Öğrenci haftalarından
            </Button>
            <Button onClick={guard(() => navigate('/app/sablonlar/yeni'))}>
              <Plus />
              Yeni şablon
            </Button>
          </>
        }
      />

      <Segmented
        options={[
          { value: 'hazir' as const, label: `Hazır şablonlar (${starterRecords.length})` },
          { value: 'benim' as const, label: `Şablonlarım${own.data ? ` (${own.data.length}/${MAX_TEMPLATES})` : ''}` },
        ]}
        value={tab}
        onChange={setTab}
        className="mb-4"
      />

      {tab === 'hazir' ? (
        <>
          <div className="mb-4 space-y-2">
            <Segmented
              size="sm"
              options={[{ value: 'all' as const, label: 'Tümü' }, ...groups.map((g) => ({ value: g, label: g }))]}
              value={group}
              onChange={setGroup}
            />
            <Segmented
              size="sm"
              options={[
                { value: 'all' as const, label: 'Her süre' },
                { value: 'one' as const, label: '1 hafta' },
                { value: 'many' as const, label: '2 hafta ve üzeri' },
              ]}
              value={length}
              onChange={setLength}
            />
          </div>
          {starters.length ? (
            <div className="grid gap-3 sm:grid-cols-2 xl:grid-cols-3">
              {starters.map((t) => (
                <TemplateCard key={t.key} template={t} search={search} />
              ))}
            </div>
          ) : (
            <EmptyState icon={LayoutTemplate} title="Bu seçime uygun şablon yok" description="Filtreyi değiştirin." />
          )}
        </>
      ) : own.isPending ? (
        <div className="grid gap-3 sm:grid-cols-2 xl:grid-cols-3" aria-busy="true" aria-label="Yükleniyor">
          <Skeleton className="h-28" />
          <Skeleton className="h-28" />
        </div>
      ) : own.error ? (
        <LoadError message={errorMessage(own.error)} onRetry={() => void own.refetch()} />
      ) : own.data.length ? (
        <>
          <div className="grid gap-3 sm:grid-cols-2 xl:grid-cols-3">
            {own.data.map((t) => (
              <TemplateCard key={t.key} template={t} search={search} />
            ))}
          </div>
          {full && <p className="mt-3 text-sm text-muted">{LIMIT_MESSAGE}</p>}
        </>
      ) : (
        <EmptyState
          icon={CopyPlus}
          title="Henüz kendi şablonunuz yok"
          description="Hazır bir şablonu kopyalayın ya da sıfırdan oluşturun."
          action={<Button onClick={() => navigate('/app/sablonlar/yeni')}>Yeni şablon</Button>}
        />
      )}

      <FromStudentDialog open={fromStudent} onOpenChange={setFromStudent} initialStudentId={params.get('ogrenci')} initialWeek={params.get('hafta')} />
    </>
  )
}
