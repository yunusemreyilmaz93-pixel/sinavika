import { useMutation, useQuery, useQueryClient } from '@tanstack/react-query'
import { FlaskConical, Plus, Trash2 } from 'lucide-react'
import { useState } from 'react'
import { toast } from 'sonner'
import { Button } from '@/components/ui/button'
import { Card, CardBody } from '@/components/ui/card'
import { Confirm } from '@/components/ui/confirm'
import { EmptyState } from '@/components/ui/empty-state'
import { Skeleton } from '@/components/ui/skeleton'
import { callApi } from '@/lib/api'
import { errorMessage, supabase, unwrap, type RpcReturn } from '@/lib/supabase'
import { LoadError } from './ui'

type Account = RpcReturn<'admin_test_accounts'>[number]

const KEY = ['admin', 'test-accounts'] as const
const roleLabel = { teacher: 'Öğretmen', student: 'Öğrenci', parent: 'Veli' } as const
const order = { teacher: 0, student: 1, parent: 2 } as const

export function TestAccountsSection() {
  const qc = useQueryClient()
  const [removing, setRemoving] = useState<string | null>(null)
  const [opening, setOpening] = useState<string | null>(null)
  const accounts = useQuery({ queryKey: KEY, queryFn: async () => unwrap(await supabase.rpc('admin_test_accounts')) })

  const create = useMutation({
    mutationFn: () => callApi('account', { action: 'create-test' }),
    onSuccess: () => qc.invalidateQueries({ queryKey: KEY }),
    onError: (error) => toast.error(errorMessage(error)),
  })

  async function openAs(account: Account) {
    const win = window.open('about:blank', 'yolumnet-test')
    if (!win) {
      toast.error('Yeni pencere engellendi. Tarayıcıda bu site için açılır pencerelere izin verin')
      return
    }
    setOpening(account.id)
    try {
      const { tokenHash } = await callApi<{ tokenHash: string }>('account', { action: 'test-login', userId: account.id })
      win.location.href = `/test-giris?th=${encodeURIComponent(tokenHash)}`
    } catch (error) {
      win.close()
      toast.error(errorMessage(error))
    } finally {
      setOpening(null)
    }
  }

  const environments = new Map<string, Account[]>()
  for (const a of accounts.data ?? []) environments.set(a.environment, [...(environments.get(a.environment) ?? []), a])

  return (
    <div className="max-w-3xl space-y-4">
      <div className="flex flex-wrap items-center justify-between gap-3">
        <p className="max-w-xl text-[15px] text-muted">
          Test hesapları gerçek kullanıcı değildir. Yeni pencerede açılır, kendi oturumunuz etkilenmez. Rollerin ekranını denemek için kullanın.
        </p>
        <Button className="min-h-11" loading={create.isPending} onClick={() => create.mutate()}>
          <Plus />
          Test ortamı oluştur
        </Button>
      </div>

      {accounts.isPending ? (
        <Skeleton className="h-40 rounded-2xl" />
      ) : accounts.isError ? (
        <LoadError error={accounts.error} onRetry={() => void accounts.refetch()} />
      ) : environments.size === 0 ? (
        <EmptyState icon={FlaskConical} title="Test ortamı yok" description="Bir öğretmen, iki öğrenci ve bir veli hesabı birlikte oluşturulur." />
      ) : (
        <ul className="space-y-3">
          {[...environments.entries()].map(([teacherId, list], index) => (
            <li key={teacherId}>
              <Card>
                <CardBody className="space-y-3">
                  <div className="flex items-center justify-between gap-3">
                    <h2 className="font-display text-base font-bold">Test ortamı {index + 1}</h2>
                    <Button variant="ghost" size="icon" aria-label="Test ortamını sil" className="text-muted hover:text-danger" onClick={() => setRemoving(teacherId)}>
                      <Trash2 />
                    </Button>
                  </div>
                  <ul className="grid gap-2 sm:grid-cols-2">
                    {[...list]
                      .sort((a, b) => order[a.role] - order[b.role])
                      .map((a) => (
                        <li key={a.id}>
                          <Button variant="secondary" className="min-h-14 w-full justify-start" loading={opening === a.id} onClick={() => void openAs(a)}>
                            <span className="text-left">
                              <span className="block text-sm font-semibold">{roleLabel[a.role]} olarak aç</span>
                              <span className="block text-xs font-normal text-muted">{a.full_name}</span>
                            </span>
                          </Button>
                        </li>
                      ))}
                  </ul>
                </CardBody>
              </Card>
            </li>
          ))}
        </ul>
      )}

      <Confirm
        open={removing !== null}
        onOpenChange={(open) => !open && setRemoving(null)}
        title="Test ortamı silinsin mi?"
        description="Öğretmen, öğrenciler, veli ve bu hesaplara girilen tüm veriler silinir."
        confirmLabel="Sil"
        onConfirm={async () => {
          if (!removing) return
          try {
            await callApi('account', { action: 'delete-test', teacherId: removing })
            await qc.invalidateQueries({ queryKey: KEY })
          } catch (err) {
            toast.error(errorMessage(err))
            throw err
          }
        }}
      />
    </div>
  )
}
