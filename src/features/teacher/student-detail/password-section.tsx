import { useMutation } from '@tanstack/react-query'
import { Copy, KeyRound, RefreshCw } from 'lucide-react'
import { useState, type FormEvent } from 'react'
import { toast } from 'sonner'
import { Button } from '@/components/ui/button'
import { Card, CardBody, CardHeader } from '@/components/ui/card'
import { Confirm } from '@/components/ui/confirm'
import { Field, Input, Select } from '@/components/ui/field'
import { callApi } from '@/lib/api'
import { errorMessage } from '@/lib/supabase'
import { passwordIssueMessage } from '../../../../shared/accounts'
import { PasswordChecklist } from '@/features/auth/ui/password-checklist'
import { copyText } from '../invites'
import { readablePassword, useLinkedParents, type StudentDetail } from './queries'

type Person = { id: string; name: string; username: string | null; role: 'Öğrenci' | 'Veli' }

export function PasswordSection({ student }: { student: StudentDetail }) {
  const parents = useLinkedParents(student.id)
  const people: Person[] = [
    { id: student.id, name: student.full_name, username: student.username, role: 'Öğrenci' },
    ...(parents.data ?? []).map((p): Person => ({ id: p.id, name: p.full_name, username: p.username, role: 'Veli' })),
  ]
  const [targetId, setTargetId] = useState(student.id)
  const [password, setPassword] = useState('')
  const [touched, setTouched] = useState(false)
  const [confirming, setConfirming] = useState(false)
  const [done, setDone] = useState<{ person: Person; password: string } | null>(null)

  const target = people.find((p) => p.id === targetId) ?? people[0]
  const trimmed = password.trim()
  const error = passwordIssueMessage(trimmed)

  const reset = useMutation({
    mutationFn: async () => callApi('account', { action: 'reset-password', userId: target.id, password: trimmed }),
    onSuccess: () => {
      setDone({ person: target, password: trimmed })
      setPassword('')
      setTouched(false)
      toast.success('Şifre değiştirildi')
    },
    onError: (e) => toast.error(errorMessage(e)),
  })

  const submit = (e: FormEvent) => {
    e.preventDefault()
    setTouched(true)
    if (!error) setConfirming(true)
  }

  return (
    <Card>
      <CardHeader title="Şifre sıfırlama" description="Şifresini unutan öğrenciye ya da veliye yeni şifre verin." />
      <CardBody>
        <form onSubmit={submit} className="space-y-4" noValidate>
          {people.length > 1 && (
            <Field label="Kimin şifresi">
              {(p) => (
                <Select
                  {...p}
                  value={target.id}
                  onChange={(e) => {
                    setTargetId(e.target.value)
                    setDone(null)
                  }}
                >
                  {people.map((person) => (
                    <option key={person.id} value={person.id}>
                      {person.name} ({person.role.toLocaleLowerCase('tr')})
                    </option>
                  ))}
                </Select>
              )}
            </Field>
          )}

          <Field label="Yeni şifre" error={touched ? error : null}>
            {(p) => (
              <div className="flex gap-2">
                <Input
                  {...p}
                  value={password}
                  autoComplete="off"
                  autoCapitalize="none"
                  spellCheck={false}
                  className="font-mono tracking-wide"
                  onChange={(e) => setPassword(e.target.value)}
                />
                <Button type="button" variant="secondary" size="icon" aria-label="Rastgele şifre oluşturun" onClick={() => setPassword(readablePassword())}>
                  <RefreshCw />
                </Button>
              </div>
            )}
          </Field>
          {password && <PasswordChecklist password={trimmed} />}

          <Button type="submit" loading={reset.isPending} className="w-full sm:w-auto">
            {!reset.isPending && <KeyRound />}
            Şifreyi değiştirin
          </Button>
        </form>

        {done && (
          <div className="mt-5 rounded-2xl border border-line bg-surface-2/60 p-4" role="status">
            <p className="text-sm">
              <span className="font-semibold">{done.person.name}</span> için yeni şifre hazır. Kendisine iletin.
            </p>
            <div className="mt-3 flex items-center gap-2">
              <code className="min-w-0 flex-1 truncate rounded-xl bg-surface px-3 py-2.5 font-mono text-lg font-bold tracking-wide select-all">
                {done.password}
              </code>
              <Button variant="secondary" size="icon" aria-label="Şifreyi kopyalayın" onClick={() => void copyText(done.password, 'Şifre kopyalandı')}>
                <Copy />
              </Button>
            </div>
            {done.person.username && (
              <p className="mt-2 text-sm text-muted">
                Giriş için kullanıcı adı: <span className="font-semibold break-all text-fg">{done.person.username}</span>
              </p>
            )}
          </div>
        )}
      </CardBody>

      <Confirm
        open={confirming}
        onOpenChange={setConfirming}
        title="Şifre değişsin mi?"
        description={`${target.name} eski şifresiyle giriş yapamaz. Yeni şifreyi kendisine iletmeniz gerekir.`}
        confirmLabel="Şifreyi değiştirin"
        tone="primary"
        onConfirm={async () => {
          await reset.mutateAsync().catch(() => {})
        }}
      />
    </Card>
  )
}
