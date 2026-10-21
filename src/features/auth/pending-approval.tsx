import { Clock3, LogOut } from 'lucide-react'
import { Button } from '@/components/ui/button'
import { Card } from '@/components/ui/card'
import { useAuth, useProfile } from './session'

export function PendingApproval() {
  const profile = useProfile()
  const { signOut, refresh } = useAuth()
  const rejected = profile.status === 'rejected' || profile.status === 'disabled'
  return (
    <Card className="grid-paper mx-auto mt-6 max-w-lg p-6 text-center sm:p-10">
      <div className="mx-auto grid size-14 place-items-center rounded-2xl bg-warning-soft text-warning">
        <Clock3 className="size-7" />
      </div>
      <h1 className="mt-5 text-2xl font-extrabold">
        {rejected ? 'Hesabınız şu an aktif değil' : 'Başvurunuz inceleniyor'}
      </h1>
      <p className="mt-2 text-muted">
        {rejected
          ? 'Hesabınız yönetici tarafından durduruldu. Bir hata olduğunu düşünüyorsanız bizimle iletişime geçin.'
          : `Merhaba ${profile.full_name.split(' ')[0]}. Kapasitemizi adil kullanmak için öğretmen hesaplarını tek tek onaylıyoruz. Onaylandığında buradan öğrencilerinizi davet edebileceksiniz.`}
      </p>
      <div className="mt-6 flex flex-col justify-center gap-2 sm:flex-row">
        {!rejected && (
          <Button variant="secondary" onClick={() => void refresh()}>
            Durumu yenile
          </Button>
        )}
        <Button variant="ghost" onClick={() => void signOut()}>
          <LogOut />
          Çıkış yap
        </Button>
      </div>
    </Card>
  )
}
