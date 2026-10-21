import { ChevronRight, FileText, LogOut, ShieldCheck, Trash2 } from 'lucide-react'
import { useState, type ReactNode } from 'react'
import { Link, useNavigate } from 'react-router'
import { toast } from 'sonner'
import { Confirm } from '@/components/ui/confirm'
import { Field, Input } from '@/components/ui/field'
import { useAuth, useProfile } from '@/features/auth/session'
import { callApi } from '@/lib/api'
import { cn } from '@/lib/cn'
import { errorMessage } from '@/lib/supabase'
import { SettingsCard } from './ui'

const rowClass = 'flex min-h-12 w-full items-center gap-3 rounded-xl px-3 text-left text-[15px] font-semibold transition-colors hover:bg-surface-2'

function RowContent({ icon, children }: { icon: ReactNode; children: ReactNode }) {
  return (
    <>
      <span className="grid size-5 shrink-0 place-items-center [&_svg]:size-[18px]">{icon}</span>
      <span className="min-w-0 flex-1">{children}</span>
    </>
  )
}

const deleteNote = {
  student: 'Hesabın ve tüm kayıtların (çalışmalar, denemeler, görevler, mesajlar) kalıcı olarak silinir. Sadece sana bağlı olan veli hesapları da silinir.',
  parent: 'Hesabınız kalıcı olarak silinir. Çocuğunuzun hesabı ve kayıtları etkilenmez.',
  teacher: 'Hesabınız kalıcı olarak silinir. Öğrencileriniz varsa önce onları silmeniz gerekir.',
} as const

export function AccountCard() {
  const profile = useProfile()
  const { signOut } = useAuth()
  const navigate = useNavigate()
  const [open, setOpen] = useState(false)
  const [typed, setTyped] = useState('')
  const [leaving, setLeaving] = useState(false)
  const confirmed = typed.trim().toLocaleUpperCase('tr').replace('İ', 'I') === 'SIL'

  async function remove() {
    try {
      await callApi('account', { action: 'delete-self' })
    } catch (err) {
      toast.error(errorMessage(err))
      return
    }
    toast.success('Hesap silindi')
    navigate('/', { replace: true })
    await signOut()
  }

  return (
    <SettingsCard icon={ShieldCheck} title="Hesap">
      <div className="-mx-3 -my-1 flex flex-col">
        <Link to="/kvkk" className={rowClass}>
          <RowContent icon={<FileText className="text-muted" />}>KVKK aydınlatma metni</RowContent>
          <ChevronRight className="size-4 text-subtle" />
        </Link>
        <button
          type="button"
          className={cn(rowClass, leaving && 'opacity-60')}
          disabled={leaving}
          onClick={async () => {
            setLeaving(true)
            await signOut()
          }}
        >
          <RowContent icon={<LogOut className="text-muted" />}>Çıkış</RowContent>
        </button>
        <button
          type="button"
          className={cn(rowClass, 'text-danger hover:bg-danger-soft')}
          onClick={() => {
            setTyped('')
            setOpen(true)
          }}
        >
          <RowContent icon={<Trash2 />}>Hesabımı sil</RowContent>
        </button>
      </div>

      <Confirm
        open={open}
        onOpenChange={setOpen}
        title="Hesap silinsin mi?"
        description={`${deleteNote[profile.role]} Bu işlem geri alınamaz.`}
        confirmLabel="Hesabımı sil"
        disabled={!confirmed}
        onConfirm={remove}
      >
        <Field label={<>Onaylamak için <b>SİL</b> yazın</>}>
          {(props) => (
            <Input
              {...props}
              autoFocus
              value={typed}
              onChange={(e) => setTyped(e.target.value)}
              autoComplete="off"
              autoCapitalize="characters"
              autoCorrect="off"
              spellCheck={false}
              enterKeyHint="done"
            />
          )}
        </Field>
      </Confirm>
    </SettingsCard>
  )
}
