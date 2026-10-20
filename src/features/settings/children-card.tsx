import { useQuery, useQueryClient } from '@tanstack/react-query'
import { Plus, UserPlus, Users } from 'lucide-react'
import { useState, type FormEvent } from 'react'
import { toast } from 'sonner'
import { Avatar } from '@/components/ui/avatar'
import { Badge } from '@/components/ui/badge'
import { Button } from '@/components/ui/button'
import { EmptyState } from '@/components/ui/empty-state'
import { Modal } from '@/components/ui/modal'
import { Spinner } from '@/components/ui/spinner'
import { CODE_LENGTH, CodeInput } from '@/features/auth/ui/code-input'
import { useAuth } from '@/features/auth/session'
import { gradeLabel, studentLabel, trackLabel } from '@/lib/exam'
import { errorMessage, supabase, unwrap, type RpcReturn } from '@/lib/supabase'
import { SettingsCard } from './ui'

type Preview = RpcReturn<'preview_invite'>[number]

export function ChildrenCard() {
  const { children, activeChild } = useAuth()
  const [linking, setLinking] = useState(false)
  const teacherIds = [...new Set(children.map((c) => c.teacher_id))].sort()

  const teachers = useQuery({
    queryKey: ['child-teachers', teacherIds],
    enabled: teacherIds.length > 0,
    queryFn: async () => {
      const rows = unwrap(await supabase.from('profiles').select('id, full_name').in('id', teacherIds))
      return new Map(rows.map((r) => [r.id, r.full_name]))
    },
  })

  return (
    <SettingsCard
      icon={Users}
      title="Çocuklarım"
      description="Bağlı olduğun öğrenci hesapları"
      action={
        children.length > 0 ? (
          <Button variant="soft" onClick={() => setLinking(true)} className="-mt-1 shrink-0">
            <Plus />
            Çocuk bağla
          </Button>
        ) : undefined
      }
    >
      {children.length === 0 ? (
        <EmptyState
          icon={UserPlus}
          title="Henüz bağlı çocuğun yok"
          description="Öğretmenin ya da çocuğunun oluşturduğu veli kodunu gir."
          action={<Button onClick={() => setLinking(true)}>Çocuk bağla</Button>}
        />
      ) : (
        <ul className="divide-y divide-line">
          {children.map((child) => {
            const teacher = teachers.data?.get(child.teacher_id)
            return (
              <li key={child.id} className="flex items-center gap-3 py-3 first:pt-0 last:pb-0">
                <Avatar name={child.full_name} />
                <div className="min-w-0 flex-1">
                  <p className="flex flex-wrap items-center gap-x-2 gap-y-0.5">
                    <span className="font-semibold">{child.full_name}</span>
                    {children.length > 1 && child.id === activeChild?.id && <Badge tone="primary">Görüntülenen</Badge>}
                  </p>
                  <p className="text-sm text-muted">{studentLabel(child)}</p>
                  {teacher && <p className="text-sm text-muted">Öğretmeni: {teacher}</p>}
                </div>
              </li>
            )
          })}
        </ul>
      )}
      <LinkChildModal open={linking} onOpenChange={setLinking} />
    </SettingsCard>
  )
}

function LinkChildModal({ open, onOpenChange }: { open: boolean; onOpenChange: (open: boolean) => void }) {
  return (
    <Modal open={open} onOpenChange={onOpenChange} title="Çocuk bağla" description="Öğretmenin ya da çocuğunun oluşturduğu veli kodunu gir." size="sm">
      {open && <LinkChildForm onDone={() => onOpenChange(false)} />}
    </Modal>
  )
}

function classLabel(p: Preview) {
  return [trackLabel[p.track], gradeLabel[p.grade]].filter(Boolean).join(' · ')
}

function LinkChildForm({ onDone }: { onDone: () => void }) {
  const { refresh } = useAuth()
  const queryClient = useQueryClient()
  const [code, setCode] = useState('')
  const [checking, setChecking] = useState(false)
  const [preview, setPreview] = useState<Preview | null>(null)
  const [error, setError] = useState<string | null>(null)
  const [linking, setLinking] = useState(false)

  async function check(value: string) {
    setChecking(true)
    setError(null)
    try {
      const row = unwrap(await supabase.rpc('preview_invite', { p_code: value }))[0]
      if (!row) setError('Kod geçersiz ya da süresi dolmuş. Öğretmeninden ya da çocuğundan yeni kod iste.')
      else if (row.kind !== 'parent') setError('Bu bir öğrenci davet kodu. Veli kodunu öğretmenin ya da çocuğun oluşturabilir.')
      else setPreview(row)
    } catch (err) {
      setError(errorMessage(err))
    } finally {
      setChecking(false)
    }
  }

  async function submit(event: FormEvent<HTMLFormElement>) {
    event.preventDefault()
    if (code.length !== CODE_LENGTH) return setError('Kod 8 karakter olmalı')
    if (!preview) return void check(code)
    setLinking(true)
    setError(null)
    try {
      unwrap(await supabase.rpc('link_parent', { p_code: code }))
      await refresh()
      void queryClient.invalidateQueries()
      toast.success(`${preview.student_name} hesabına bağlandın`)
      onDone()
    } catch (err) {
      setError(errorMessage(err))
      setLinking(false)
    }
  }

  return (
    <form onSubmit={submit} noValidate className="space-y-4">
      <CodeInput
        value={code}
        onChange={(next) => {
          setCode(next)
          setPreview(null)
          setError(null)
        }}
        onComplete={(value) => void check(value)}
        autoFocus
        aria-invalid={error ? true : undefined}
        aria-describedby={error ? 'link-child-error' : undefined}
      />
      <div aria-live="polite" className="min-h-6">
        {checking ? (
          <p className="flex items-center gap-2 text-sm text-muted">
            <Spinner className="size-4" />
            Kod kontrol ediliyor
          </p>
        ) : error ? (
          <p id="link-child-error" className="text-sm text-danger">
            {error}
          </p>
        ) : preview ? (
          <div className="flex items-center gap-3 rounded-xl bg-primary-soft px-3.5 py-3">
            <Avatar name={preview.student_name} className="bg-surface text-primary" />
            <div className="min-w-0">
              <p className="truncate font-semibold text-primary-soft-fg">{preview.student_name}</p>
              <p className="text-sm text-primary-soft-fg/80">
                {classLabel(preview)} · Öğretmeni {preview.teacher_name}
              </p>
            </div>
          </div>
        ) : null}
      </div>
      <div className="flex gap-2 [&>*]:flex-1">
        <Button type="button" variant="secondary" onClick={onDone}>
          Vazgeç
        </Button>
        <Button type="submit" loading={linking} disabled={code.length !== CODE_LENGTH || checking || Boolean(error)}>
          Bağla
        </Button>
      </div>
    </form>
  )
}
