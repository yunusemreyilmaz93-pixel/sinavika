import { useQueryClient } from '@tanstack/react-query'
import { Clock3, KeyRound, RotateCcw, Ticket, UserPlus, UsersRound } from 'lucide-react'
import { useMemo, useState, type ReactNode } from 'react'
import { useSearchParams } from 'react-router'
import { toast } from 'sonner'
import { PageHeader } from '@/components/app/page-header'
import { Button } from '@/components/ui/button'
import { Card, CardBody } from '@/components/ui/card'
import { Confirm } from '@/components/ui/confirm'
import { Modal } from '@/components/ui/modal'
import { Skeleton } from '@/components/ui/skeleton'
import { keys } from '@/lib/data'
import { errorMessage } from '@/lib/supabase'
import { CapacityMeter } from './capacity-meter'
import { InviteFormModal } from './invite-form'
import { deleteInvite, ExpiredInvites, JoinedInvites, PendingInvites } from './invite-list'
import { InviteShare } from './invite-share'
import { isLive, useCapacity, useInvites, type Invite } from './invites'
import { useTeacherOverview } from './overview'

export default function InvitesPage() {
  const queryClient = useQueryClient()
  const [params, setParams] = useSearchParams()
  const invites = useInvites()
  const overview = useTeacherOverview()
  const capacity = useCapacity()
  const [formOpen, setFormOpen] = useState(() => params.get('yeni') === '1')
  const [formKey, setFormKey] = useState(0)
  const [detail, setDetail] = useState<Invite | null>(null)
  const [detailOpen, setDetailOpen] = useState(false)
  const [cancelTarget, setCancelTarget] = useState<Invite | null>(null)
  const [cancelOpen, setCancelOpen] = useState(false)

  const openForm = () => {
    setFormKey((k) => k + 1)
    setFormOpen(true)
  }

  const changeForm = (open: boolean) => {
    setFormOpen(open)
    if (!open && params.has('yeni')) setParams({}, { replace: true })
  }

  const askCancel = (invite: Invite) => {
    setCancelTarget(invite)
    setCancelOpen(true)
  }

  const openDetail = (invite: Invite) => {
    setDetail(invite)
    setDetailOpen(true)
  }

  const { live, expired } = useMemo(() => {
    const open = invites.data?.open ?? []
    return { live: open.filter(isLive), expired: open.filter((i) => !isLive(i)) }
  }, [invites.data])

  const names = useMemo(() => new Map((overview.data ?? []).map((s) => [s.id, s.full_name])), [overview.data])
  const known = useMemo(() => new Set(names.keys()), [names])
  const full = capacity.ready && capacity.used >= capacity.capacity

  const cancel = async (invite: Invite) => {
    try {
      const removed = await deleteInvite(invite.code)
      if (removed) toast.success('Davet iptal edildi')
      else toast.error('Bu davet artık iptal edilemiyor, kullanılmış olabilir')
    } catch (error) {
      toast.error(errorMessage(error))
    }
    if (detail?.code === invite.code) setDetailOpen(false)
    await Promise.all([
      queryClient.invalidateQueries({ queryKey: keys.invites }),
      queryClient.invalidateQueries({ queryKey: keys.overview }),
    ])
  }

  return (
    <div>
      <PageHeader title="Davetler" description="Öğrencin davet koduyla ya da linkle katılır." />

      <div className="grid gap-6 lg:grid-cols-[minmax(0,1fr)_288px] lg:items-start">
        <div className="min-w-0 space-y-7">
          <Card>
            <CardBody className="flex flex-col gap-4 sm:flex-row sm:items-center sm:gap-6">
              {capacity.ready ? (
                <CapacityMeter used={capacity.used} capacity={capacity.capacity} pending={capacity.pending} className="flex-1" />
              ) : capacity.failed ? (
                <p className="flex-1 text-sm text-muted">Kontenjan bilgisi şu an alınamadı.</p>
              ) : (
                <div className="flex-1 space-y-2.5" aria-hidden>
                  <Skeleton className="h-7 w-32" />
                  <Skeleton className="h-2.5 w-full" />
                </div>
              )}
              <Button size="lg" className="w-full sm:w-auto" onClick={openForm}>
                <UserPlus />
                Öğrenci davet et
              </Button>
            </CardBody>
            {full && (
              <p className="border-t border-line px-4 py-3 text-sm text-muted sm:px-5">
                Yer açmak için bekleyen bir daveti iptal edebilir ya da bir öğrenciyi arşive alabilirsin.
              </p>
            )}
          </Card>

          <Section title="Bekleyen davetler" count={invites.isSuccess ? live.length : undefined}>
            {invites.isPending ? (
              <ListSkeleton />
            ) : invites.isError ? (
              <LoadError message={errorMessage(invites.error)} onRetry={() => void invites.refetch()} />
            ) : live.length ? (
              <PendingInvites invites={live} onOpen={openDetail} onCancel={askCancel} />
            ) : (
              <div className="grid-paper flex items-center gap-3 rounded-2xl border border-dashed border-line-strong px-4 py-5">
                <span className="grid size-10 shrink-0 place-items-center rounded-xl bg-primary-soft text-primary-soft-fg">
                  <Ticket className="size-5" />
                </span>
                <p className="text-sm text-muted">
                  Bekleyen davet yok. Kod oluşturduğunda burada durur, öğrencin katılınca listeden düşer.
                </p>
              </div>
            )}
          </Section>

          {expired.length > 0 && (
            <Section title="Süresi dolanlar" count={expired.length} hint="Kontenjana sayılmaz">
              <ExpiredInvites invites={expired} onRenewed={openDetail} />
            </Section>
          )}

          {invites.isSuccess && invites.data.used.length > 0 && (
            <Section title="Katılanlar" hint="Son 10">
              <JoinedInvites invites={invites.data.used} studentName={(id) => names.get(id)} knownStudents={known} />
            </Section>
          )}
        </div>

        <aside className="lg:sticky lg:top-24">
          <Card className="bg-surface">
            <CardBody>
              <h2 className="text-base font-bold">Davet kuralları</h2>
              <ul className="mt-3 space-y-3 text-sm">
                <Rule icon={<Clock3 />}>Kodlar 14 gün geçerli.</Rule>
                <Rule icon={<KeyRound />}>Her kod tek kullanımlık.</Rule>
                <Rule icon={<RotateCcw />}>İptal edilen ya da süresi dolan davet kontenjandan düşer.</Rule>
                <Rule icon={<UsersRound />}>Veli davetini öğrencinin sayfasından oluşturursun.</Rule>
              </ul>
            </CardBody>
          </Card>
        </aside>
      </div>

      <InviteFormModal key={formKey} open={formOpen} onOpenChange={changeForm} />

      {detail && (
        <Modal
          open={detailOpen}
          onOpenChange={setDetailOpen}
          title="Davet kodu"
          description="Kodu öğrencine göster ya da gönder."
          footer={
            <>
              <Button
                variant="secondary"
                className="text-danger"
                onClick={() => {
                  setDetailOpen(false)
                  askCancel(detail)
                }}
              >
                Daveti iptal et
              </Button>
              <Button onClick={() => setDetailOpen(false)}>Kapat</Button>
            </>
          }
        >
          <InviteShare invite={detail} />
        </Modal>
      )}

      <Confirm
        open={cancelOpen}
        onOpenChange={setCancelOpen}
        title="Davet iptal edilsin mi?"
        description={`${cancelTarget?.student_name ?? 'Öğrenci'} bu kodla katılamaz. Kontenjandaki yeri boşalır.`}
        confirmLabel="Daveti iptal et"
        onConfirm={() => (cancelTarget ? cancel(cancelTarget) : undefined)}
      />
    </div>
  )
}

function Section({ title, count, hint, children }: { title: string; count?: number; hint?: string; children: ReactNode }) {
  return (
    <section>
      <div className="mb-3 flex items-baseline gap-2">
        <h2 className="text-lg font-bold">{title}</h2>
        {count != null && <span className="tabular text-sm font-semibold text-muted">{count}</span>}
        {hint && <span className="ml-auto text-xs text-muted">{hint}</span>}
      </div>
      {children}
    </section>
  )
}

function Rule({ icon, children }: { icon: ReactNode; children: ReactNode }) {
  return (
    <li className="flex gap-3">
      <span className="mt-0.5 grid size-7 shrink-0 place-items-center rounded-lg bg-primary-soft text-primary-soft-fg [&_svg]:size-4">{icon}</span>
      <span className="pt-1 text-muted">{children}</span>
    </li>
  )
}

function ListSkeleton() {
  return (
    <div className="space-y-2" aria-busy="true" aria-label="Yükleniyor">
      <Skeleton className="h-[88px]" />
      <Skeleton className="h-[88px]" />
    </div>
  )
}

function LoadError({ message, onRetry }: { message: string; onRetry: () => void }) {
  return (
    <div role="alert" className="flex flex-col items-start gap-3 rounded-2xl border border-line bg-surface p-4 sm:flex-row sm:items-center">
      <p className="flex-1 text-sm text-danger">{message}</p>
      <Button variant="secondary" size="sm" onClick={onRetry}>
        Tekrar dene
      </Button>
    </div>
  )
}
