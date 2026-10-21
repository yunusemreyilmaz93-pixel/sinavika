import { Megaphone, Send, Trash2 } from 'lucide-react'
import { useState, type FormEvent } from 'react'
import { toast } from 'sonner'
import { PageHeader } from '@/components/app/page-header'
import { Badge } from '@/components/ui/badge'
import { Button } from '@/components/ui/button'
import { Card, CardBody } from '@/components/ui/card'
import { Confirm } from '@/components/ui/confirm'
import { EmptyState } from '@/components/ui/empty-state'
import { Field, Input, Textarea } from '@/components/ui/field'
import { Segmented } from '@/components/ui/segmented'
import { PageSkeleton } from '@/components/ui/skeleton'
import { useAuth } from '@/features/auth/session'
import { formatDate, formatTime } from '@/lib/dates'
import { errorMessage } from '@/lib/supabase'
import { useAnnouncements, useDeleteAnnouncement, useSendAnnouncement, type Announcement, type Audience } from './queries'

const audienceLabel: Record<Audience, string> = { students: 'Öğrenciler', parents: 'Veliler', both: 'Öğrenciler ve veliler' }

export default function AnnouncementsPage() {
  const { profile } = useAuth()
  const list = useAnnouncements()
  const isTeacher = profile?.role === 'teacher'

  return (
    <div className="max-w-2xl">
      <PageHeader title="Duyurular" />
      {isTeacher && profile.status === 'active' && <Compose />}
      {list.isPending ? (
        <PageSkeleton />
      ) : list.isError ? (
        <p className="text-sm text-danger">{errorMessage(list.error)}</p>
      ) : list.data.length === 0 ? (
        <EmptyState
          icon={Megaphone}
          title="Henüz duyuru yok"
          description={isTeacher ? 'Gönderdiğiniz duyurular burada listelenir.' : 'Öğretmen duyuru gönderdiğinde burada görünür.'}
        />
      ) : (
        <ul className="space-y-3">
          {list.data.map((a) => (
            <Item key={a.id} item={a} canDelete={isTeacher && a.teacher_id === profile.id} />
          ))}
        </ul>
      )}
    </div>
  )
}

function Compose() {
  const send = useSendAnnouncement()
  const [audience, setAudience] = useState<Audience>('both')
  const [title, setTitle] = useState('')
  const [body, setBody] = useState('')

  const submit = async (e: FormEvent) => {
    e.preventDefault()
    try {
      await send.mutateAsync({ audience, title: title.trim(), body: body.trim() })
      setTitle('')
      setBody('')
      toast.success('Duyuru gönderildi')
    } catch (err) {
      toast.error(errorMessage(err))
    }
  }

  return (
    <Card className="mb-6">
      <CardBody>
        <form onSubmit={submit} className="space-y-4">
          <Segmented
            value={audience}
            onChange={setAudience}
            options={[
              { value: 'both', label: 'Herkes' },
              { value: 'students', label: 'Öğrenciler' },
              { value: 'parents', label: 'Veliler' },
            ]}
          />
          <Field label="Başlık">{(props) => <Input {...props} value={title} onChange={(e) => setTitle(e.target.value)} maxLength={80} />}</Field>
          <Field label="Duyuru">{(props) => <Textarea {...props} rows={4} value={body} onChange={(e) => setBody(e.target.value)} maxLength={1000} />}</Field>
          <Button type="submit" className="min-h-11" loading={send.isPending} disabled={!title.trim() || !body.trim()}>
            <Send />
            Gönder
          </Button>
        </form>
      </CardBody>
    </Card>
  )
}

function Item({ item, canDelete }: { item: Announcement; canDelete: boolean }) {
  const remove = useDeleteAnnouncement()
  const [confirm, setConfirm] = useState(false)
  const at = new Date(item.created_at)
  return (
    <li>
      <Card>
        <CardBody>
          <div className="flex items-start justify-between gap-3">
            <div className="min-w-0">
              <h2 className="font-display text-lg font-bold break-words">{item.title}</h2>
              <p className="mt-0.5 text-sm text-muted">
                {item.teacher?.full_name ?? 'Öğretmen'} · {formatDate(item.created_at.slice(0, 10), 'd MMMM')} {formatTime(at.toISOString())}
              </p>
            </div>
            {canDelete && (
              <Button variant="ghost" size="icon" aria-label="Duyuruyu sil" onClick={() => setConfirm(true)} className="-mt-1 -mr-2 text-muted hover:text-danger">
                <Trash2 />
              </Button>
            )}
          </div>
          <p className="mt-3 text-[15px] leading-relaxed break-words whitespace-pre-wrap">{item.body}</p>
          {canDelete && (
            <Badge className="mt-3" tone="neutral">
              {audienceLabel[item.audience]}
            </Badge>
          )}
        </CardBody>
      </Card>
      <Confirm
        open={confirm}
        onOpenChange={setConfirm}
        title="Duyuru silinsin mi?"
        description="Duyuru herkesin ekranından kalkar. Gönderilen bildirimler silinmez."
        confirmLabel="Sil"
        onConfirm={async () => {
          try {
            await remove.mutateAsync(item.id)
            toast.success('Duyuru silindi')
          } catch (err) {
            toast.error(errorMessage(err))
            throw err
          }
        }}
      />
    </li>
  )
}
