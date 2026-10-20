import { useQueryClient } from '@tanstack/react-query'
import { Ban, Check, Copy, Dices, KeyRound, MoreVertical, RotateCcw, Trash2 } from 'lucide-react'
import { useState, type FormEvent } from 'react'
import { toast } from 'sonner'
import { PASSWORD_MIN } from '../../../shared/accounts'
import { Button } from '@/components/ui/button'
import { Confirm } from '@/components/ui/confirm'
import { Field, Input } from '@/components/ui/field'
import { Menu, MenuContent, MenuItem, MenuLabel, MenuSeparator, MenuTrigger } from '@/components/ui/menu'
import { Modal } from '@/components/ui/modal'
import { callApi } from '@/lib/api'
import { keys } from '@/lib/data'
import { errorMessage } from '@/lib/supabase'
import { useTeacherStatus, type AdminTeacher } from './queries'

const PASSWORD_MAX = 72
const alphabet = 'abcdefghjkmnpqrstuvwxyz23456789'

function randomPassword() {
  const bytes = crypto.getRandomValues(new Uint8Array(10))
  const chars = Array.from(bytes, (b) => alphabet[b % alphabet.length])
  if (!chars.some((c) => /\d/.test(c))) chars[bytes[0] % chars.length] = String(2 + (bytes[1] % 8))
  return `${chars.slice(0, 5).join('')}-${chars.slice(5).join('')}`
}

async function copy(text: string, label: string) {
  try {
    await navigator.clipboard.writeText(text)
    toast.success(`${label} kopyalandı`)
  } catch {
    toast.error('Kopyalanamadı, elle seçip kopyala')
  }
}

export function TeacherActions({ teacher }: { teacher: AdminTeacher }) {
  const queryClient = useQueryClient()
  const status = useTeacherStatus()
  const [dialog, setDialog] = useState<'stop' | 'password' | 'delete' | null>(null)
  const close = (open: boolean) => !open && setDialog(null)

  async function setStatus(next: 'active' | 'disabled') {
    try {
      await status.mutateAsync({ id: teacher.id, status: next })
      toast.success(next === 'active' ? `${teacher.full_name} hesabı açıldı` : `${teacher.full_name} hesabı durduruldu`)
    } catch (err) {
      toast.error(errorMessage(err))
    }
  }

  async function remove() {
    try {
      await callApi('account', { action: 'delete-teacher', teacherId: teacher.id })
      toast.success(`${teacher.full_name} hesabı silindi`)
    } catch (err) {
      toast.error(errorMessage(err))
    } finally {
      void queryClient.invalidateQueries({ queryKey: keys.admin })
    }
  }

  return (
    <>
      <Menu>
        <MenuTrigger asChild>
          <Button variant="ghost" size="icon" className="-mr-2 shrink-0 text-muted" aria-label={`${teacher.full_name} için işlemler`} loading={status.isPending}>
            {!status.isPending && <MoreVertical />}
          </Button>
        </MenuTrigger>
        <MenuContent>
          <MenuLabel>{teacher.full_name}</MenuLabel>
          {teacher.status === 'active' ? (
            <MenuItem onSelect={() => setDialog('stop')}>
              <Ban />
              Hesabı durdur
            </MenuItem>
          ) : (
            <MenuItem onSelect={() => void setStatus('active')}>
              {teacher.status === 'rejected' ? <Check /> : <RotateCcw />}
              {teacher.status === 'rejected' ? 'Onayla' : 'Yeniden aç'}
            </MenuItem>
          )}
          <MenuItem onSelect={() => setDialog('password')}>
            <KeyRound />
            Şifre sıfırla
          </MenuItem>
          {teacher.student_count === 0 && (
            <>
              <MenuSeparator />
              <MenuItem tone="danger" onSelect={() => setDialog('delete')}>
                <Trash2 />
                Hesabı sil
              </MenuItem>
            </>
          )}
        </MenuContent>
      </Menu>

      <Confirm
        open={dialog === 'stop'}
        onOpenChange={close}
        title="Hesap durdurulsun mu?"
        description={`${teacher.full_name} giriş yapabilir ama öğrencilerine ulaşamaz. Öğrencileri kendi kayıtlarını girmeye devam eder. İstediğin zaman yeniden açabilirsin.`}
        confirmLabel="Durdur"
        onConfirm={() => setStatus('disabled')}
      />
      <Confirm
        open={dialog === 'delete'}
        onOpenChange={close}
        title="Hesap silinsin mi?"
        description={`${teacher.full_name} hesabı kalıcı olarak silinir. Bu işlem geri alınamaz.`}
        confirmLabel="Hesabı sil"
        onConfirm={remove}
      />
      <ResetPassword teacher={teacher} open={dialog === 'password'} onOpenChange={close} />
    </>
  )
}

function ResetPassword({ teacher, open, onOpenChange }: { teacher: AdminTeacher; open: boolean; onOpenChange: (open: boolean) => void }) {
  return (
    <Modal open={open} onOpenChange={onOpenChange} title="Şifre sıfırla" description={`${teacher.full_name} için yeni bir şifre belirle.`} size="sm">
      {open && <ResetPasswordForm teacher={teacher} onDone={() => onOpenChange(false)} />}
    </Modal>
  )
}

function ResetPasswordForm({ teacher, onDone }: { teacher: AdminTeacher; onDone: () => void }) {
  const [password, setPassword] = useState('')
  const [error, setError] = useState<string | null>(null)
  const [saving, setSaving] = useState(false)
  const [saved, setSaved] = useState<string | null>(null)

  async function submit(event: FormEvent<HTMLFormElement>) {
    event.preventDefault()
    const value = password.trim()
    if (value.length < PASSWORD_MIN) return setError(`Şifre en az ${PASSWORD_MIN} karakter olmalı`)
    if (value.length > PASSWORD_MAX) return setError(`Şifre en fazla ${PASSWORD_MAX} karakter olabilir`)
    setSaving(true)
    setError(null)
    try {
      await callApi('account', { action: 'reset-password', userId: teacher.id, password: value })
      setSaved(value)
    } catch (err) {
      setError(errorMessage(err))
    } finally {
      setSaving(false)
    }
  }

  if (saved) {
    return (
      <div className="space-y-4">
        <p className="text-sm text-muted">Yeni şifre kaydedildi. Öğretmene güvendiğin bir yoldan ilet. Giriş yaptıktan sonra Ayarlar sayfasından değiştirebilir.</p>
        <div className="grid-paper flex items-center gap-2 rounded-2xl border border-line-strong p-3 pl-4">
          <span className="tabular min-w-0 flex-1 font-display text-xl font-bold tracking-wide break-all select-all">{saved}</span>
          <Button variant="secondary" size="icon" aria-label="Şifreyi kopyala" onClick={() => void copy(saved, 'Şifre')}>
            <Copy />
          </Button>
        </div>
        <Button className="w-full" onClick={onDone}>
          Tamam
        </Button>
      </div>
    )
  }

  return (
    <form onSubmit={submit} className="space-y-4" noValidate>
      <input type="text" autoComplete="username" value={teacher.email ?? ''} readOnly hidden />
      <Field label="Yeni şifre" hint={`En az ${PASSWORD_MIN} karakter`} error={error}>
        {(props) => (
          <div className="flex gap-2">
            <Input
              {...props}
              type="text"
              value={password}
              onChange={(e) => {
                setPassword(e.target.value)
                setError(null)
              }}
              autoComplete="new-password"
              autoCapitalize="none"
              autoCorrect="off"
              spellCheck={false}
              maxLength={PASSWORD_MAX}
              className="tabular min-w-0 flex-1"
            />
            <Button
              type="button"
              variant="secondary"
              size="icon"
              aria-label="Rastgele şifre üret"
              title="Rastgele şifre üret"
              onClick={() => {
                setPassword(randomPassword())
                setError(null)
              }}
            >
              <Dices />
            </Button>
          </div>
        )}
      </Field>
      <div className="flex gap-2 [&>*]:flex-1">
        <Button type="button" variant="secondary" onClick={onDone}>
          Vazgeç
        </Button>
        <Button type="submit" loading={saving}>
          Şifreyi kaydet
        </Button>
      </div>
    </form>
  )
}
