import { useMutation, useQuery, useQueryClient } from '@tanstack/react-query'
import { NotebookPen, Pencil, Plus, Trash2 } from 'lucide-react'
import { useState, type FormEvent } from 'react'
import { toast } from 'sonner'
import { Badge } from '@/components/ui/badge'
import { Button } from '@/components/ui/button'
import { Card, CardBody } from '@/components/ui/card'
import { Confirm } from '@/components/ui/confirm'
import { EmptyState } from '@/components/ui/empty-state'
import { Field, Input, Select, Textarea } from '@/components/ui/field'
import { Modal } from '@/components/ui/modal'
import { Skeleton } from '@/components/ui/skeleton'
import { Switch } from '@/components/ui/switch'
import { TopicSelect } from '@/features/tracking/form-parts'
import { useStudentSubjects } from '@/features/tracking/subjects'
import { useCurriculum } from '@/lib/data'
import { formatDate } from '@/lib/dates'
import { errorMessage, supabase, unwrap } from '@/lib/supabase'

type StudentNote = { id: number; title: string; body: string; topic_id: number | null; shared: boolean; updated_at: string }

const key = (studentId: string) => ['student-notes', studentId] as const

function useStudentNotes(studentId: string) {
  return useQuery({
    queryKey: key(studentId),
    queryFn: async (): Promise<StudentNote[]> =>
      unwrap(await supabase.from('student_notes').select('id, title, body, topic_id, shared, updated_at').eq('student_id', studentId).order('updated_at', { ascending: false })),
  })
}

function NoteBody({ note, aside }: { note: StudentNote; aside?: React.ReactNode }) {
  const curriculum = useCurriculum()
  const topic = note.topic_id ? curriculum.data?.topicById.get(note.topic_id) : null
  return (
    <Card>
      <CardBody>
        <div className="flex items-start justify-between gap-3">
          <div className="min-w-0">
            <h3 className="font-display text-base font-bold break-words">{note.title}</h3>
            <p className="mt-0.5 text-sm text-muted">
              {formatDate(note.updated_at.slice(0, 10), 'd MMMM')}
              {topic && ` · ${topic.name}`}
            </p>
          </div>
          {aside}
        </div>
        <p className="mt-3 text-[15px] leading-relaxed break-words whitespace-pre-wrap">{note.body}</p>
      </CardBody>
    </Card>
  )
}

// Öğretmenin öğrenci sayfasında yalnızca öğrencinin paylaştığı notlar görünür
export function SharedStudentNotes({ studentId }: { studentId: string }) {
  const notes = useStudentNotes(studentId)
  if (notes.isPending || notes.isError || notes.data.length === 0) return null
  return (
    <section className="mt-8">
      <h3 className="mb-3 font-display text-lg font-bold">Öğrencinin paylaştığı notlar</h3>
      <ul className="space-y-3">
        {notes.data.map((n) => (
          <li key={n.id}>
            <NoteBody note={n} />
          </li>
        ))}
      </ul>
    </section>
  )
}

export function MyNotes({ studentId }: { studentId: string }) {
  const qc = useQueryClient()
  const notes = useStudentNotes(studentId)
  const [form, setForm] = useState<{ open: boolean; note: StudentNote | null; n: number }>({ open: false, note: null, n: 0 })
  const [deleting, setDeleting] = useState<StudentNote | null>(null)

  const remove = useMutation({
    mutationFn: async (id: number) => unwrap(await supabase.from('student_notes').delete().eq('id', id)),
    onSuccess: () => qc.invalidateQueries({ queryKey: key(studentId) }),
  })
  const open = (note: StudentNote | null) => setForm((f) => ({ open: true, note, n: f.n + 1 }))

  if (notes.isPending) return <Skeleton className="h-36" />
  if (notes.isError) return <p className="text-sm text-danger">{errorMessage(notes.error)}</p>

  return (
    <div className="space-y-4">
      <Button className="min-h-11" onClick={() => open(null)}>
        <Plus />
        Not ekle
      </Button>
      {notes.data.length === 0 ? (
        <EmptyState icon={NotebookPen} title="Henüz notun yok" description="Konulara bağlı kendi notlarını buraya yazabilirsin." />
      ) : (
        <ul className="space-y-3">
          {notes.data.map((n) => (
            <li key={n.id}>
              <NoteBody
                note={n}
                aside={
                  <div className="-mt-1 -mr-2 flex shrink-0 items-center">
                    {n.shared && <Badge tone="primary">Öğretmenle paylaşıldı</Badge>}
                    <Button variant="ghost" size="icon" aria-label="Notu düzenle" onClick={() => open(n)}>
                      <Pencil />
                    </Button>
                    <Button variant="ghost" size="icon" aria-label="Notu sil" onClick={() => setDeleting(n)} className="text-muted hover:text-danger">
                      <Trash2 />
                    </Button>
                  </div>
                }
              />
            </li>
          ))}
        </ul>
      )}
      <NoteDialog key={form.n} studentId={studentId} open={form.open} note={form.note} onOpenChange={(o) => setForm((f) => ({ ...f, open: o }))} />
      <Confirm
        open={Boolean(deleting)}
        onOpenChange={(o) => !o && setDeleting(null)}
        title="Not silinsin mi?"
        description="Not kalıcı olarak silinir."
        confirmLabel="Sil"
        onConfirm={async () => {
          if (!deleting) return
          try {
            await remove.mutateAsync(deleting.id)
            toast.success('Not silindi')
          } catch (err) {
            toast.error(errorMessage(err))
            throw err
          }
        }}
      />
    </div>
  )
}

function NoteDialog({ studentId, open, note, onOpenChange }: { studentId: string; open: boolean; note: StudentNote | null; onOpenChange: (o: boolean) => void }) {
  const qc = useQueryClient()
  const curriculum = useCurriculum()
  const { subjects } = useStudentSubjects(studentId)
  const initialSubject = note?.topic_id ? (curriculum.data?.topicById.get(note.topic_id)?.subject_id ?? null) : null
  const [title, setTitle] = useState(note?.title ?? '')
  const [body, setBody] = useState(note?.body ?? '')
  const [subjectId, setSubjectId] = useState<string | null>(initialSubject)
  const [topicId, setTopicId] = useState<number | null>(note?.topic_id ?? null)
  const [shared, setShared] = useState(note?.shared ?? false)
  const [pending, setPending] = useState(false)

  const submit = async (e: FormEvent) => {
    e.preventDefault()
    setPending(true)
    try {
      const values = { title: title.trim(), body: body.trim(), topic_id: topicId, shared }
      if (note) unwrap(await supabase.from('student_notes').update(values).eq('id', note.id))
      else unwrap(await supabase.from('student_notes').insert(values))
      await qc.invalidateQueries({ queryKey: key(studentId) })
      onOpenChange(false)
    } catch (err) {
      toast.error(errorMessage(err))
    } finally {
      setPending(false)
    }
  }

  return (
    <Modal open={open} onOpenChange={onOpenChange} title={note ? 'Notu düzenle' : 'Not ekle'} size="md">
      <form onSubmit={submit} className="space-y-4">
        <Field label="Başlık">{(props) => <Input {...props} value={title} onChange={(e) => setTitle(e.target.value)} maxLength={100} autoFocus />}</Field>
        <Field label="Not">{(props) => <Textarea {...props} rows={7} value={body} onChange={(e) => setBody(e.target.value)} maxLength={5000} />}</Field>
        <Field label="Ders">
          {(props) => (
            <Select
              {...props}
              value={subjectId ?? ''}
              onChange={(e) => {
                setSubjectId(e.target.value || null)
                setTopicId(null)
              }}
            >
              <option value="">Ders seçilmedi</option>
              {subjects.map((s) => (
                <option key={s.id} value={s.id}>
                  {s.name}
                </option>
              ))}
            </Select>
          )}
        </Field>
        <TopicSelect curriculum={curriculum.data} subjectId={subjectId} value={topicId} onChange={setTopicId} />
        <label className="flex items-center gap-3 text-sm font-semibold">
          <Switch label="Öğretmenle paylaş" checked={shared} onCheckedChange={setShared} />
          Öğretmenle paylaş
        </label>
        <Button type="submit" className="min-h-11 w-full" loading={pending} disabled={!title.trim() || !body.trim()}>
          Kaydet
        </Button>
      </form>
    </Modal>
  )
}
