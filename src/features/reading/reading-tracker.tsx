import { BookMarked, Check, Plus, Trash2 } from 'lucide-react'
import { useState, type FormEvent } from 'react'
import { toast } from 'sonner'
import { Badge } from '@/components/ui/badge'
import { Button } from '@/components/ui/button'
import { Card, CardBody } from '@/components/ui/card'
import { Confirm } from '@/components/ui/confirm'
import { EmptyState } from '@/components/ui/empty-state'
import { Field, Input } from '@/components/ui/field'
import { Modal } from '@/components/ui/modal'
import { ProgressBar } from '@/components/ui/progress'
import { Skeleton } from '@/components/ui/skeleton'
import { errorMessage } from '@/lib/supabase'
import { pagesRead, pagesThisWeek, useReading, useReadingActions, type Book } from './queries'

export function ReadingTracker({ studentId, canEdit }: { studentId: string; canEdit: boolean }) {
  const reading = useReading(studentId)
  const actions = useReadingActions(studentId)
  const [adding, setAdding] = useState(false)

  if (reading.isPending) return <Skeleton className="h-40" />
  if (reading.isError) return <p className="text-sm text-danger">{errorMessage(reading.error)}</p>

  const { books, logs } = reading.data
  const current = books.filter((b) => !b.finished_on)
  const finished = books.filter((b) => b.finished_on)

  return (
    <div className="space-y-4">
      <div className="flex flex-wrap items-center justify-between gap-3">
        <p className="text-[15px] text-muted">
          Son 7 günde <span className="tabular font-semibold text-fg">{pagesThisWeek(logs)}</span> sayfa okundu
        </p>
        {canEdit && (
          <Button className="min-h-11" onClick={() => setAdding(true)}>
            <Plus />
            Kitap ekle
          </Button>
        )}
      </div>

      {books.length === 0 ? (
        <EmptyState
          icon={BookMarked}
          title="Henüz kitap yok"
          description={canEdit ? 'Okuduğunuz kitabı ekleyip günlük sayfa sayınızı girin.' : 'Kitap eklendiğinde okuma ilerlemesi burada görünür.'}
          action={
            canEdit && (
              <Button onClick={() => setAdding(true)}>
                <Plus />
                Kitap ekle
              </Button>
            )
          }
        />
      ) : (
        <>
          <ul className="grid gap-3 sm:grid-cols-2">
            {current.map((b) => (
              <BookCard key={b.id} book={b} read={pagesRead(logs, b.id)} canEdit={canEdit} studentId={studentId} />
            ))}
          </ul>
          {finished.length > 0 && (
            <>
              <h3 className="pt-2 text-sm font-semibold text-muted">Bitenler</h3>
              <ul className="grid gap-3 sm:grid-cols-2">
                {finished.map((b) => (
                  <BookCard key={b.id} book={b} read={pagesRead(logs, b.id)} canEdit={canEdit} studentId={studentId} />
                ))}
              </ul>
            </>
          )}
        </>
      )}

      <AddBook open={adding} onOpenChange={setAdding} onSubmit={(v) => actions.addBook.mutateAsync(v)} />
    </div>
  )
}

function BookCard({ book, read, canEdit, studentId }: { book: Book; read: number; canEdit: boolean; studentId: string }) {
  const actions = useReadingActions(studentId)
  const [pages, setPages] = useState('')
  const [confirm, setConfirm] = useState(false)
  const done = Boolean(book.finished_on)
  const total = book.total_pages

  const add = async (e: FormEvent) => {
    e.preventDefault()
    const n = Number(pages)
    if (!Number.isInteger(n) || n < 1 || n > 1000) return
    try {
      await actions.addPages.mutateAsync({ book_id: book.id, pages: n })
      setPages('')
      if (total && read + n >= total && !done) toast.success('Kitap bitti gibi görünüyor. Bitirdim düğmesiyle işaretleyebilirsiniz')
    } catch (err) {
      toast.error(errorMessage(err))
    }
  }

  return (
    <li>
      <Card className="h-full">
        <CardBody className="flex h-full flex-col gap-3">
          <div className="flex items-start justify-between gap-2">
            <div className="min-w-0">
              <h3 className="font-display text-base font-bold break-words">{book.title}</h3>
              {book.author && <p className="text-sm text-muted">{book.author}</p>}
            </div>
            {done && (
              <Badge tone="primary">
                <Check />
                Bitti
              </Badge>
            )}
          </div>
          <div>
            {total ? <ProgressBar value={Math.min(1, read / total)} /> : null}
            <p className="tabular mt-1.5 text-sm text-muted">
              {read}
              {total ? ` / ${total}` : ''} sayfa
            </p>
          </div>
          {canEdit && (
            <div className="mt-auto space-y-2">
              {!done && (
                <form onSubmit={add} className="flex gap-2">
                  <Input
                    inputMode="numeric"
                    value={pages}
                    onChange={(e) => setPages(e.target.value.replace(/\D/g, '').slice(0, 4))}
                    placeholder="Okunan sayfa"
                    aria-label={`${book.title} için okunan sayfa`}
                  />
                  <Button type="submit" className="min-h-11" loading={actions.addPages.isPending} disabled={!pages}>
                    Ekle
                  </Button>
                </form>
              )}
              <div className="flex gap-2">
                <Button
                  variant="secondary"
                  size="sm"
                  className="min-h-11"
                  onClick={() => actions.finish.mutate({ id: book.id, finished: !done }, { onError: (err) => toast.error(errorMessage(err)) })}
                >
                  {done ? 'Yeniden aç' : 'Bitirdim'}
                </Button>
                <Button variant="ghost" size="icon" aria-label={`${book.title} kitabını sil`} onClick={() => setConfirm(true)} className="text-muted hover:text-danger">
                  <Trash2 />
                </Button>
              </div>
            </div>
          )}
        </CardBody>
      </Card>
      <Confirm
        open={confirm}
        onOpenChange={setConfirm}
        title="Kitap silinsin mi?"
        description="Kitap ve bu kitaba girilen sayfa kayıtları silinir."
        confirmLabel="Sil"
        onConfirm={async () => {
          try {
            await actions.removeBook.mutateAsync(book.id)
          } catch (err) {
            toast.error(errorMessage(err))
            throw err
          }
        }}
      />
    </li>
  )
}

function AddBook({ open, onOpenChange, onSubmit }: { open: boolean; onOpenChange: (o: boolean) => void; onSubmit: (v: { title: string; author: string | null; total_pages: number | null }) => Promise<unknown> }) {
  const [title, setTitle] = useState('')
  const [author, setAuthor] = useState('')
  const [total, setTotal] = useState('')
  const [pending, setPending] = useState(false)

  const submit = async (e: FormEvent) => {
    e.preventDefault()
    if (!title.trim()) return
    setPending(true)
    try {
      await onSubmit({ title: title.trim(), author: author.trim() || null, total_pages: total ? Number(total) : null })
      setTitle('')
      setAuthor('')
      setTotal('')
      onOpenChange(false)
    } catch (err) {
      toast.error(errorMessage(err))
    } finally {
      setPending(false)
    }
  }

  return (
    <Modal open={open} onOpenChange={onOpenChange} title="Kitap ekle" size="sm">
      <form onSubmit={submit} className="space-y-4">
        <Field label="Kitap adı">{(props) => <Input {...props} value={title} onChange={(e) => setTitle(e.target.value)} maxLength={120} autoFocus />}</Field>
        <Field label="Yazar">{(props) => <Input {...props} value={author} onChange={(e) => setAuthor(e.target.value)} maxLength={80} />}</Field>
        <Field label="Sayfa sayısı">
          {(props) => <Input {...props} inputMode="numeric" value={total} onChange={(e) => setTotal(e.target.value.replace(/\D/g, '').slice(0, 4))} />}
        </Field>
        <Button type="submit" className="min-h-11 w-full" loading={pending} disabled={!title.trim()}>
          Ekle
        </Button>
      </form>
    </Modal>
  )
}
