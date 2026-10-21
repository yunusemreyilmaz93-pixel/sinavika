import { useMutation, useQueryClient } from '@tanstack/react-query'
import { AnimatePresence, motion } from 'motion/react'
import { MoreHorizontal, NotebookPen, Pencil, Plus, Trash2 } from 'lucide-react'
import { useState } from 'react'
import { toast } from 'sonner'
import { Button } from '@/components/ui/button'
import { Confirm } from '@/components/ui/confirm'
import { EmptyState } from '@/components/ui/empty-state'
import { Menu, MenuContent, MenuItem, MenuTrigger } from '@/components/ui/menu'
import { Skeleton } from '@/components/ui/skeleton'
import { keys } from '@/lib/data'
import { errorMessage, supabase, unwrap } from '@/lib/supabase'
import { useNotes, useParentCount, type Note } from './lib'
import { NoteCard } from './note-card'
import { NoteForm } from './note-form'

export function TeacherNotes({ studentId }: { studentId: string }) {
  const queryClient = useQueryClient()
  const notes = useNotes(studentId)
  const parents = useParentCount(studentId)
  const [form, setForm] = useState<{ open: boolean; note: Note | null; key: number }>({ open: false, note: null, key: 0 })
  const [deleting, setDeleting] = useState<Note | null>(null)

  const openForm = (note: Note | null) => setForm((f) => ({ open: true, note, key: f.key + 1 }))

  const remove = useMutation({
    mutationFn: async (note: Note) => unwrap(await supabase.from('notes').delete().eq('id', note.id)),
    onSuccess: () => {
      void queryClient.invalidateQueries({ queryKey: keys.notes(studentId) })
      toast.success('Not silindi')
    },
    onError: (e) => toast.error(errorMessage(e)),
  })

  const list = notes.data ?? []
  const meetings = list.filter((n) => n.kind === 'meeting').length

  return (
    <div>
      {notes.isPending ? (
        <div className="space-y-3" aria-busy="true" aria-label="Yükleniyor">
          <Skeleton className="h-11 w-full" />
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
          title="Görüşme notlarını burada tutun"
          description="Kendinize not alın ya da görüşme özetini öğrenci ve veliyle paylaşın."
          action={
            <Button onClick={() => openForm(null)}>
              <Plus />
              Not ekle
            </Button>
          }
        />
      ) : (
        <>
          <div className="mb-3 flex items-center justify-between gap-3">
            <p className="text-sm text-muted">
              <span className="tabular font-semibold text-fg">{list.length}</span> not
              {meetings > 0 && (
                <>
                  {', '}
                  <span className="tabular font-semibold text-fg">{meetings}</span> görüşme
                </>
              )}
            </p>
            <Button size="sm" onClick={() => openForm(null)}>
              <Plus />
              Not ekle
            </Button>
          </div>
          <ul className="space-y-3">
            <AnimatePresence initial={false}>
              {list.map((note, i) => (
                <motion.li
                  key={note.id}
                  layout="position"
                  initial={{ opacity: 0, y: 8 }}
                  animate={{ opacity: 1, y: 0, transition: { duration: 0.22, delay: Math.min(i, 6) * 0.03 } }}
                  exit={{ opacity: 0, scale: 0.98, transition: { duration: 0.15 } }}
                >
                  <NoteCard
                    note={note}
                    showVisibility
                    actions={
                      <Menu>
                        <MenuTrigger asChild>
                          <Button variant="ghost" size="icon" className="-mt-2 -mr-2 text-muted" aria-label="Not seçenekleri">
                            <MoreHorizontal />
                          </Button>
                        </MenuTrigger>
                        <MenuContent>
                          <MenuItem onSelect={() => openForm(note)}>
                            <Pencil />
                            Düzenle
                          </MenuItem>
                          <MenuItem tone="danger" onSelect={() => setDeleting(note)}>
                            <Trash2 />
                            Sil
                          </MenuItem>
                        </MenuContent>
                      </Menu>
                    }
                  />
                </motion.li>
              ))}
            </AnimatePresence>
          </ul>
        </>
      )}

      <NoteForm
        key={form.key}
        open={form.open}
        onOpenChange={(open) => setForm((f) => ({ ...f, open }))}
        studentId={studentId}
        note={form.note}
        parentCount={parents.data ?? 0}
      />
      <Confirm
        open={Boolean(deleting)}
        onOpenChange={(open) => !open && setDeleting(null)}
        title="Not silinsin mi?"
        description={
          deleting && deleting.visibility !== 'private'
            ? 'Not kalıcı olarak silinir ve paylaştığınız kişiler de artık göremez.'
            : 'Not kalıcı olarak silinir.'
        }
        confirmLabel="Sil"
        onConfirm={() => (deleting ? remove.mutateAsync(deleting).catch(() => undefined) : undefined)}
      />
    </div>
  )
}
