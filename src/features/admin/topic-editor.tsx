import { useQueryClient } from '@tanstack/react-query'
import { ArrowDown, ArrowLeft, ArrowUp, BookOpen, MoreVertical, Pencil, Plus, Trash2 } from 'lucide-react'
import { AnimatePresence, motion } from 'motion/react'
import { useRef, useState, type FormEvent } from 'react'
import { Link } from 'react-router'
import { toast } from 'sonner'
import { Button } from '@/components/ui/button'
import { Card } from '@/components/ui/card'
import { Confirm } from '@/components/ui/confirm'
import { Input } from '@/components/ui/field'
import { Menu, MenuContent, MenuItem, MenuTrigger } from '@/components/ui/menu'
import { lessonFor } from '@/features/lessons/registry'
import { keys, type Curriculum } from '@/lib/data'
import { examLabel, type Subject, type Topic } from '@/lib/exam'
import { errorMessage, supabase, unwrap } from '@/lib/supabase'

const NAME_MAX = 120

function topicError(err: unknown) {
  const message = errorMessage(err)
  return message === 'Bu kayıt zaten var' ? 'Bu derste aynı adlı bir konu zaten var' : message
}

function replaceTopics(c: Curriculum, subjectId: string, list: Topic[]): Curriculum {
  const byId = new Map(list.map((t) => [t.id, t]))
  const topics = c.topics.map((t) => byId.get(t.id) ?? t)
  const topicsBySubject = new Map(c.topicsBySubject)
  topicsBySubject.set(subjectId, list)
  return { ...c, topics, topicById: new Map(topics.map((t) => [t.id, t])), topicsBySubject }
}

export function TopicEditor({ subject, topics, onBack }: { subject: Subject; topics: Topic[]; onBack: () => void }) {
  const queryClient = useQueryClient()
  const [editing, setEditing] = useState<number | null>(null)
  const [deleting, setDeleting] = useState<Topic | null>(null)
  const [confirmOpen, setConfirmOpen] = useState(false)
  const [name, setName] = useState('')
  const [adding, setAdding] = useState(false)
  const [addError, setAddError] = useState<string | null>(null)
  const addRef = useRef<HTMLInputElement>(null)
  const queue = useRef<Promise<void>>(Promise.resolve())
  const inflight = useRef(0)

  const refresh = () => queryClient.invalidateQueries({ queryKey: keys.curriculum })

  function move(index: number, delta: -1 | 1) {
    const target = index + delta
    if (target < 0 || target >= topics.length) return
    const order = [...topics]
    ;[order[index], order[target]] = [order[target], order[index]]
    const next = order.map((t, i) => ({ ...t, sort: i + 1 }))
    const changed = next.filter((t, i) => t.sort !== order[i].sort)
    queryClient.setQueryData<Curriculum>(keys.curriculum, (c) => c && replaceTopics(c, subject.id, next))
    inflight.current += 1
    queue.current = queue.current
      .then(async () => {
        await Promise.all(
          changed.map(async (t) => {
            unwrap(await supabase.from('topics').update({ sort: t.sort }).eq('id', t.id))
          }),
        )
      })
      .catch((err) => {
        toast.error(errorMessage(err))
      })
      .finally(() => {
        inflight.current -= 1
        if (!inflight.current) void refresh()
      })
  }

  async function rename(topic: Topic, value: string) {
    const trimmed = value.trim()
    if (trimmed && trimmed !== topic.name) {
      unwrap(await supabase.from('topics').update({ name: trimmed }).eq('id', topic.id))
      await refresh()
    }
    setEditing(null)
  }

  async function remove(topic: Topic) {
    try {
      unwrap(await supabase.from('topics').delete().eq('id', topic.id))
      await refresh()
      toast.success('Konu silindi')
    } catch (err) {
      toast.error(errorMessage(err))
    }
  }

  async function add(event: FormEvent<HTMLFormElement>) {
    event.preventDefault()
    const trimmed = name.trim()
    if (!trimmed) {
      setAddError('Konu adını yaz')
      addRef.current?.focus()
      return
    }
    setAdding(true)
    setAddError(null)
    try {
      const sort = topics.reduce((max, t) => Math.max(max, t.sort), 0) + 1
      unwrap(await supabase.from('topics').insert({ subject_id: subject.id, name: trimmed, sort }))
      await refresh()
      setName('')
    } catch (err) {
      setAddError(topicError(err))
    } finally {
      setAdding(false)
      addRef.current?.focus()
    }
  }

  return (
    <Card className="overflow-hidden">
      <div className="flex items-center gap-1 border-b border-line py-2 pr-4 pl-1.5 lg:px-5 lg:py-4">
        <Button variant="ghost" size="icon" className="lg:hidden" onClick={onBack} aria-label="Derslere dön">
          <ArrowLeft />
        </Button>
        <div className="min-w-0 flex-1">
          <h3 className="text-base font-bold">{subject.name}</h3>
          <p className="tabular text-sm text-muted">
            {examLabel[subject.exam]} · {topics.length} konu
          </p>
        </div>
      </div>

      {topics.length === 0 ? (
        <p className="px-4 py-8 text-center text-sm text-muted sm:px-5">Bu derste henüz konu yok. İlk konuyu aşağıdan ekle.</p>
      ) : (
        <ol className="divide-y divide-line">
          <AnimatePresence initial={false}>
            {topics.map((topic, index) => (
              <motion.li
                key={topic.id}
                layout="position"
                initial={{ opacity: 0 }}
                animate={{ opacity: 1 }}
                exit={{ opacity: 0, transition: { duration: 0.15 } }}
                transition={{ duration: 0.22, ease: [0.22, 1, 0.36, 1] }}
                className="bg-surface"
              >
                {editing === topic.id ? (
                  <RenameForm topic={topic} onCancel={() => setEditing(null)} onSave={(value) => rename(topic, value)} />
                ) : (
                  <div className="flex items-center gap-0.5 py-1 pr-1 pl-4 sm:pr-2 sm:pl-5">
                    <span className="tabular w-7 shrink-0 text-sm text-subtle">{index + 1}</span>
                    <span className="min-w-0 flex-1 py-2 text-[15px] leading-snug break-words">{topic.name}</span>
                    {lessonFor(topic) && (
                      <Button variant="soft" size="sm" asChild className="mr-1">
                        <Link to={`/app/konular/${topic.id}`}>
                          <BookOpen />
                          <span className="hidden sm:inline">Konu anlatımı</span>
                          <span className="sm:hidden">Anlatım</span>
                        </Link>
                      </Button>
                    )}
                    <Button
                      variant="ghost"
                      size="icon"
                      className="text-muted"
                      aria-label={`${topic.name}, yukarı taşı`}
                      disabled={index === 0}
                      onClick={() => move(index, -1)}
                    >
                      <ArrowUp />
                    </Button>
                    <Button
                      variant="ghost"
                      size="icon"
                      className="text-muted"
                      aria-label={`${topic.name}, aşağı taşı`}
                      disabled={index === topics.length - 1}
                      onClick={() => move(index, 1)}
                    >
                      <ArrowDown />
                    </Button>
                    <Menu>
                      <MenuTrigger asChild>
                        <Button variant="ghost" size="icon" className="text-muted" aria-label={`${topic.name} için işlemler`}>
                          <MoreVertical />
                        </Button>
                      </MenuTrigger>
                      <MenuContent>
                        <MenuItem onSelect={() => setEditing(topic.id)}>
                          <Pencil />
                          Yeniden adlandır
                        </MenuItem>
                        <MenuItem
                          tone="danger"
                          onSelect={() => {
                            setDeleting(topic)
                            setConfirmOpen(true)
                          }}
                        >
                          <Trash2 />
                          Sil
                        </MenuItem>
                      </MenuContent>
                    </Menu>
                  </div>
                )}
              </motion.li>
            ))}
          </AnimatePresence>
        </ol>
      )}

      <form onSubmit={add} noValidate className="border-t border-line bg-surface-2/50 p-4 sm:px-5">
        <label htmlFor={`new-topic-${subject.id}`} className="text-sm font-semibold">
          Yeni konu
        </label>
        <div className="mt-1.5 flex gap-2">
          <Input
            ref={addRef}
            id={`new-topic-${subject.id}`}
            value={name}
            onChange={(e) => {
              setName(e.target.value)
              setAddError(null)
            }}
            maxLength={NAME_MAX}
            placeholder="Konu adı"
            enterKeyHint="done"
            aria-invalid={addError ? true : undefined}
            aria-describedby={addError ? `new-topic-${subject.id}-error` : undefined}
            className="min-w-0 flex-1"
          />
          <Button type="submit" loading={adding}>
            {!adding && <Plus />}
            Ekle
          </Button>
        </div>
        {addError && (
          <p id={`new-topic-${subject.id}-error`} className="mt-1.5 text-sm text-danger">
            {addError}
          </p>
        )}
      </form>

      <Confirm
        open={confirmOpen}
        onOpenChange={setConfirmOpen}
        title="Konu silinsin mi?"
        description={
          deleting ? (
            <>
              <b className="font-semibold text-fg">{deleting.name}</b> silinir. Bu konuya ait öğrenci ilerleme kayıtları da silinir. Görev ve
              çalışma kayıtları kalır, sadece konu bilgisi kaldırılır.
            </>
          ) : null
        }
        confirmLabel="Konuyu sil"
        onConfirm={() => deleting && remove(deleting)}
      />
    </Card>
  )
}

function RenameForm({ topic, onCancel, onSave }: { topic: Topic; onCancel: () => void; onSave: (value: string) => Promise<void> }) {
  const [value, setValue] = useState(topic.name)
  const [saving, setSaving] = useState(false)
  const [error, setError] = useState<string | null>(null)
  const id = `topic-${topic.id}`

  async function submit(event: FormEvent<HTMLFormElement>) {
    event.preventDefault()
    if (!value.trim()) return setError('Konu adı boş olamaz')
    setSaving(true)
    setError(null)
    try {
      await onSave(value)
    } catch (err) {
      setError(topicError(err))
      setSaving(false)
    }
  }

  return (
    <form onSubmit={submit} noValidate className="px-4 py-3 sm:px-5">
      <label htmlFor={id} className="sr-only">
        Konu adı
      </label>
      <div className="flex flex-col gap-2 sm:flex-row">
        <Input
          id={id}
          autoFocus
          value={value}
          onChange={(e) => {
            setValue(e.target.value)
            setError(null)
          }}
          onFocus={(e) => e.currentTarget.select()}
          onKeyDown={(e) => {
            if (e.key === 'Escape') {
              e.preventDefault()
              onCancel()
            }
          }}
          maxLength={NAME_MAX}
          enterKeyHint="done"
          aria-invalid={error ? true : undefined}
          aria-describedby={error ? `${id}-error` : undefined}
          className="min-w-0 sm:flex-1"
        />
        <div className="flex gap-2 [&>*]:flex-1 sm:[&>*]:flex-none">
          <Button type="button" variant="secondary" onClick={onCancel}>
            Vazgeç
          </Button>
          <Button type="submit" loading={saving}>
            Kaydet
          </Button>
        </div>
      </div>
      {error && (
        <p id={`${id}-error`} className="mt-1.5 text-sm text-danger">
          {error}
        </p>
      )}
    </form>
  )
}
