import { UserRound } from 'lucide-react'
import { useState, type FormEvent } from 'react'
import { toast } from 'sonner'
import { Avatar } from '@/components/ui/avatar'
import { Badge } from '@/components/ui/badge'
import { Button } from '@/components/ui/button'
import { Field, Input } from '@/components/ui/field'
import { useAuth, useProfile } from '@/features/auth/session'
import { studentLabel } from '@/lib/exam'
import { AppError, errorMessage, supabase, unwrap } from '@/lib/supabase'
import { SettingsCard } from './ui'

const roleLabel = { teacher: 'Öğretmen', student: 'Öğrenci', parent: 'Veli' } as const

export function ProfileCard() {
  const profile = useProfile()
  const { student, refresh } = useAuth()
  const [name, setName] = useState(profile.full_name)
  const [error, setError] = useState<string | null>(null)
  const [saving, setSaving] = useState(false)
  const trimmed = name.trim().replace(/\s+/g, ' ')
  const dirty = trimmed !== profile.full_name

  async function submit(event: FormEvent<HTMLFormElement>) {
    event.preventDefault()
    if (trimmed.length < 2) return setError('Ad soyad en az 2 karakter olmalı')
    if (trimmed.length > 80) return setError('Ad soyad en fazla 80 karakter olabilir')
    if (!dirty) return
    setSaving(true)
    setError(null)
    try {
      const rows = unwrap(await supabase.from('profiles').update({ full_name: trimmed }).eq('id', profile.id).select('id'))
      if (!rows.length) throw new AppError('Bu işlem için yetkiniz yok')
      await refresh()
      setName(trimmed)
      toast.success('Ad güncellendi')
    } catch (err) {
      setError(errorMessage(err))
    } finally {
      setSaving(false)
    }
  }

  const loginId = profile.username ?? profile.email ?? ''
  const role = profile.role === 'student' && student ? `Öğrenci · ${studentLabel(student)}` : roleLabel[profile.role]

  return (
    <SettingsCard icon={UserRound} title="Profil">
      <div className="flex items-center gap-3">
        <Avatar name={profile.full_name} className="size-12 text-base" />
        <div className="min-w-0">
          <p className="truncate font-semibold">{profile.full_name}</p>
          <p className="flex flex-wrap items-center gap-1.5 text-sm text-muted">
            {role}
            {profile.is_admin && <Badge tone="accent">Yönetici</Badge>}
          </p>
        </div>
      </div>

      <form onSubmit={submit} noValidate className="mt-5 flex flex-col gap-3 sm:flex-row sm:items-start">
        <Field label="Ad soyad" error={error} className="flex-1">
          {(props) => (
            <Input
              {...props}
              value={name}
              onChange={(e) => {
                setName(e.target.value)
                setError(null)
              }}
              autoComplete="name"
              maxLength={80}
            />
          )}
        </Field>
        {(dirty || saving) && (
          <Button type="submit" loading={saving} className="sm:mt-[27px]">
            Kaydet
          </Button>
        )}
      </form>

      <div className="mt-4 rounded-xl bg-surface-2 px-3.5 py-3">
        <p className="text-xs font-semibold text-muted">{profile.username ? 'Kullanıcı adı' : 'E-posta'}</p>
        <p className="mt-0.5 font-semibold break-all">{loginId}</p>
        <p className="mt-1 text-sm text-muted">
          Giriş yaparken {profile.username ? 'bu kullanıcı adı' : 'bu e-posta'} kullanılır. Değiştirilemez.
        </p>
      </div>
    </SettingsCard>
  )
}
