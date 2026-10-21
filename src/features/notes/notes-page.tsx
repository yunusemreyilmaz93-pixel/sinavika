import { motion } from 'motion/react'
import { MessageCircle, NotebookPen, UserRound } from 'lucide-react'
import { useState } from 'react'
import { Link } from 'react-router'
import { PageHeader } from '@/components/app/page-header'
import { Button } from '@/components/ui/button'
import { EmptyState } from '@/components/ui/empty-state'
import { Skeleton } from '@/components/ui/skeleton'
import { useAuth, useViewedStudent } from '@/features/auth/session'
import { errorMessage } from '@/lib/supabase'
import { Segmented } from '@/components/ui/segmented'
import { useNotes } from './lib'
import { NoteCard } from './note-card'
import { MyNotes } from './student-notes'

export default function NotesPage() {
  const { profile } = useAuth()
  const viewed = useViewedStudent()
  const notes = useNotes(viewed?.studentId)
  const isParent = profile?.role === 'parent'
  const [tab, setTab] = useState<'ogretmen' | 'benim'>('ogretmen')

  if (!viewed) {
    return (
      <div>
        <PageHeader title="Notlar" />
        <EmptyState
          icon={UserRound}
          title="Bağlı öğrenci yok"
          description="Öğretmen ya da çocuğunuz tarafından oluşturulan veli koduyla çocuğunuzun hesabını bağlayabilirsiniz."
          action={
            <Button asChild variant="secondary">
              <Link to="/app/ayarlar">Ayarlara git</Link>
            </Button>
          }
        />
      </div>
    )
  }

  const list = notes.data ?? []

  return (
    <div>
      <PageHeader
        title="Notlar"
        description={isParent ? `Öğretmenin ${viewed.name} için paylaştığı notlar` : 'Öğretmeninin seninle paylaştığı notlar'}
      />
      {profile?.role === 'student' && (
        <Segmented
          className="mb-4 max-w-xs"
          value={tab}
          onChange={setTab}
          options={[
            { value: 'ogretmen', label: 'Öğretmen notları' },
            { value: 'benim', label: 'Notlarım' },
          ]}
        />
      )}
      {tab === 'benim' && profile?.role === 'student' ? (
        <MyNotes studentId={viewed.studentId} />
      ) : notes.isPending ? (
        <div className="space-y-3" aria-busy="true" aria-label="Yükleniyor">
          <Skeleton className="h-36" />
          <Skeleton className="h-28" />
        </div>
      ) : notes.isError ? (
        <div className="rounded-2xl border border-line bg-surface p-6 text-center">
          <p className="text-sm text-muted">{errorMessage(notes.error)}</p>
          <Button variant="secondary" size="sm" className="mt-4" onClick={() => void notes.refetch()}>
            Tekrar deneyin
          </Button>
        </div>
      ) : list.length === 0 ? (
        <EmptyState
          icon={NotebookPen}
          title="Henüz paylaşılan not yok"
          description={isParent ? 'Öğretmen bir not ya da görüşme özeti paylaştığında burada görürsünüz.' : 'Öğretmenin bir not ya da görüşme özeti paylaştığında burada görürsün.'}
          action={
            <Button asChild variant="secondary">
              <Link to="/app/mesajlar">
                <MessageCircle />
                Öğretmene yaz
              </Link>
            </Button>
          }
        />
      ) : (
        <ul className="space-y-3">
          {list.map((note, i) => (
            <motion.li
              key={note.id}
              initial={{ opacity: 0, y: 8 }}
              animate={{ opacity: 1, y: 0 }}
              transition={{ duration: 0.22, delay: Math.min(i, 6) * 0.04 }}
            >
              <NoteCard note={note} />
            </motion.li>
          ))}
        </ul>
      )}
    </div>
  )
}
