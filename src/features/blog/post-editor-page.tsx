import { FileText, Plus, Save, Trash2, Undo2 } from 'lucide-react'
import { useCallback, useDeferredValue, useEffect, useMemo, useRef, useState } from 'react'
import { useBeforeUnload, useBlocker, useNavigate, useParams } from 'react-router'
import { toast } from 'sonner'
import { PageHeader } from '@/components/app/page-header'
import { Button } from '@/components/ui/button'
import { Card } from '@/components/ui/card'
import { Confirm } from '@/components/ui/confirm'
import { EmptyState } from '@/components/ui/empty-state'
import { Field, Input, Select, Textarea } from '@/components/ui/field'
import { Segmented } from '@/components/ui/segmented'
import { PageSkeleton } from '@/components/ui/skeleton'
import { Switch } from '@/components/ui/switch'
import { BlockList } from '@/features/lessons/editor/block-list'
import type { CatalogItem } from '@/features/lessons/editor/catalog'
import { Palette } from '@/features/lessons/editor/palette'
import { useBlockEditor } from '@/features/lessons/editor/use-block-editor'
import { estimateMinutes, formatLessonMinutes, slug } from '@/features/lessons/markdown/parse'
import { LessonBody } from '@/features/lessons/markdown/render'
import { cn } from '@/lib/cn'
import { errorMessage } from '@/lib/supabase'
import { audienceLabel, uploadPostImage, useDeletePost, usePost, useSavePost, type PostDraft } from './queries'

const back = { to: '/app/yonetim?bolum=blog', label: 'Blog' }

export default function PostEditorPage() {
  const { postId } = useParams()
  const id = postId === 'yeni' ? null : Number(postId)
  const post = usePost(id)

  if (id !== null && post.isPending) return <PageSkeleton />
  if (id !== null && (post.isError || !post.data)) {
    return (
      <div>
        <PageHeader title="Blog yazısı" back={back} />
        <EmptyState icon={FileText} title="Yazı bulunamadı" description="Blog listesine dönüp tekrar deneyin." />
      </div>
    )
  }
  const p = post.data
  const initial: PostDraft = {
    title: p?.title ?? '',
    slug: p?.slug ?? '',
    summary: p?.summary ?? '',
    body: p?.body ?? '',
    audience: p?.audience ?? 'genel',
    reading_minutes: p?.reading_minutes ?? 5,
    published: p?.published ?? false,
  }
  return <Editor key={id ?? 'yeni'} id={id} initial={initial} />
}

function Editor({ id, initial }: { id: number | null; initial: PostDraft }) {
  const navigate = useNavigate()
  const save = useSavePost(id)
  const remove = useDeletePost(id)
  const editor = useBlockEditor(initial.body)
  const [meta, setMeta] = useState({
    title: initial.title,
    slug: initial.slug,
    summary: initial.summary,
    audience: initial.audience,
    published: initial.published,
  })
  const [baseMeta, setBaseMeta] = useState(meta)
  const [slugTouched, setSlugTouched] = useState(Boolean(initial.slug))
  const [tab, setTab] = useState<'blok' | 'onizleme' | 'kaynak'>('blok')
  const [raw, setRaw] = useState('')
  const [palette, setPalette] = useState<{ afterId: string | null; replaceId?: string } | null>(null)
  const [uploading, setUploading] = useState(false)
  const [confirmDelete, setConfirmDelete] = useState(false)
  const [error, setError] = useState<string | null>(null)
  const files = useRef<HTMLInputElement>(null)
  const imageAfter = useRef<string | null>(null)
  const savedRef = useRef(false)

  const preview = useDeferredValue(editor.body)
  const dirty = editor.dirty || JSON.stringify(meta) !== JSON.stringify(baseMeta)
  const minutes = useMemo(() => estimateMinutes(editor.body), [editor.body])
  const words = useMemo(() => (editor.body.trim() ? editor.body.trim().split(/\s+/).length : 0), [editor.body])

  const blocker = useBlocker(
    ({ currentLocation, nextLocation }) => dirty && !savedRef.current && currentLocation.pathname !== nextLocation.pathname,
  )
  useBeforeUnload(
    useCallback(
      (e: BeforeUnloadEvent) => {
        if (dirty) e.preventDefault()
      },
      [dirty],
    ),
  )

  const changeTab = (next: typeof tab) => {
    if (tab === 'kaynak' && raw !== editor.body) editor.replaceAll(raw)
    if (next === 'kaynak') setRaw(editor.body)
    setTab(next)
  }

  const addImages = async (list: File[], afterId: string | null) => {
    const images = list.filter((f) => f.type.startsWith('image/'))
    if (!images.length) return
    setUploading(true)
    try {
      let after = afterId
      for (const file of images) after = editor.insertAfter(after, { kind: 'md', text: `![](${await uploadPostImage(file)})` })
    } catch (err) {
      toast.error(errorMessage(err))
    } finally {
      setUploading(false)
    }
  }

  const pick = (item: CatalogItem) => {
    const target = palette
    setPalette(null)
    if (!target) return
    if (!item.make) {
      imageAfter.current = target.afterId
      files.current?.click()
      return
    }
    editor.insertAfter(target.afterId, item.make({ optionCount: 5 }), target.replaceId)
  }

  const submit = useCallback(async () => {
    setError(null)
    const title = meta.title.trim()
    const address = slug(meta.slug || title)
    if (title.length < 3) return setError('Başlık en az 3 karakter olmalı')
    if (!address) return setError('Adres boş olamaz')
    if (meta.published && !editor.body.trim()) return setError('Boş yazı yayına alınamaz')
    const next: PostDraft = {
      ...meta,
      title,
      slug: address,
      summary: meta.summary.trim(),
      body: editor.body,
      reading_minutes: estimateMinutes(editor.body),
    }
    try {
      const row = await save.mutateAsync(next)
      editor.markSaved()
      const saved = { ...meta, title, slug: address, summary: next.summary }
      setMeta(saved)
      setBaseMeta(saved)
      toast.success(next.published ? 'Kaydedildi ve yayında. Sitede bir sonraki yayından sonra görünür' : 'Taslak olarak kaydedildi')
      if (id === null) {
        savedRef.current = true
        navigate(`/app/yonetim/blog/${row.id}`, { replace: true })
      }
    } catch (err) {
      setError(errorMessage(err))
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [editor.body, meta, save, id])

  useEffect(() => {
    const onKey = (e: KeyboardEvent) => {
      if ((e.metaKey || e.ctrlKey) && e.key.toLowerCase() === 's') {
        e.preventDefault()
        if (dirty && !save.isPending) void submit()
      }
    }
    window.addEventListener('keydown', onKey)
    return () => window.removeEventListener('keydown', onKey)
  }, [dirty, save.isPending, submit])

  return (
    <div>
      <PageHeader
        back={back}
        title={id === null ? 'Yeni blog yazısı' : meta.title || 'Blog yazısı'}
        actions={
          <>
            {id !== null && (
              <Button variant="secondary" size="sm" onClick={() => setConfirmDelete(true)}>
                <Trash2 />
                Sil
              </Button>
            )}
            <Button size="sm" onClick={submit} loading={save.isPending} disabled={!dirty}>
              <Save />
              Kaydet
            </Button>
          </>
        }
      />

      <Card className="mb-4 space-y-4 p-4 sm:p-5">
        <Field label="Başlık">
          {(p) => (
            <Input
              {...p}
              value={meta.title}
              maxLength={140}
              onChange={(e) => setMeta((m) => ({ ...m, title: e.target.value, slug: slugTouched ? m.slug : slug(e.target.value) }))}
              placeholder="TYT'ye 6 ay kala çalışma planı"
            />
          )}
        </Field>
        <div className="grid gap-4 sm:grid-cols-[minmax(0,1fr)_12rem]">
          <Field label="Adres" hint={`izlek.site/blog/${slug(meta.slug || meta.title) || '...'}`}>
            {(p) => (
              <Input
                {...p}
                value={meta.slug}
                maxLength={120}
                onChange={(e) => {
                  setSlugTouched(true)
                  setMeta((m) => ({ ...m, slug: e.target.value }))
                }}
                onBlur={() => setMeta((m) => ({ ...m, slug: slug(m.slug) }))}
              />
            )}
          </Field>
          <Field label="Kimin için">
            {(p) => (
              <Select {...p} value={meta.audience} onChange={(e) => setMeta((m) => ({ ...m, audience: e.target.value }))}>
                {Object.entries(audienceLabel).map(([value, label]) => (
                  <option key={value} value={value}>
                    {label}
                  </option>
                ))}
              </Select>
            )}
          </Field>
        </div>
        <Field label="Özet" hint="Arama sonuçlarında ve blog listesinde görünür. En fazla 300 karakter.">
          {(p) => (
            <Textarea
              {...p}
              rows={2}
              maxLength={300}
              value={meta.summary}
              onChange={(e) => setMeta((m) => ({ ...m, summary: e.target.value }))}
            />
          )}
        </Field>
        <div className="flex flex-wrap items-center gap-x-6 gap-y-3 border-t border-line pt-4">
          <label className="flex items-center gap-3 text-sm font-semibold">
            <Switch label="Yayında" checked={meta.published} onCheckedChange={(published) => setMeta((m) => ({ ...m, published }))} />
            {meta.published ? 'Yayında' : 'Taslak'}
          </label>
          <span className="tabular text-sm text-muted">
            {words} sözcük · yaklaşık {formatLessonMinutes(minutes)} dakika
          </span>
          {(dirty || id !== null) && (
            <span className={cn('ml-auto text-sm font-semibold', dirty ? 'text-warning' : 'text-muted')}>
              {dirty ? 'Kaydedilmemiş değişiklik var' : baseMeta.published ? 'Kaydedildi' : 'Kaydedildi, yayında değil'}
            </span>
          )}
        </div>
        {error && (
          <p role="alert" className="rounded-xl bg-danger-soft px-3 py-2 text-sm text-danger">
            {error}
          </p>
        )}
      </Card>

      <div className="sticky top-14 z-20 -mx-4 mb-4 flex flex-wrap items-center gap-2 border-b border-line bg-bg px-4 py-2 sm:mx-0 sm:rounded-xl sm:border sm:px-3 lg:top-16">
        <Segmented
          value={tab}
          onChange={changeTab}
          options={[
            { value: 'blok', label: 'Yaz' },
            { value: 'onizleme', label: 'Önizleme' },
            { value: 'kaynak', label: 'Kaynak' },
          ]}
        />
        {tab === 'blok' && (
          <div className="ml-auto flex items-center gap-1.5">
            <Button type="button" variant="ghost" size="icon" onClick={editor.undo} disabled={!editor.canUndo} aria-label="Geri alın">
              <Undo2 />
            </Button>
            <Button
              type="button"
              variant="secondary"
              size="icon"
              loading={uploading}
              onClick={() => setPalette({ afterId: editor.activeId })}
              aria-label="Blok ekleyin"
            >
              <Plus />
            </Button>
          </div>
        )}
      </div>
      <input
        ref={files}
        type="file"
        accept="image/jpeg,image/png,image/webp"
        multiple
        hidden
        onChange={(e) => {
          void addImages(Array.from(e.target.files ?? []), imageAfter.current)
          e.target.value = ''
        }}
      />

      {tab === 'blok' && (
        <div className="mx-auto max-w-3xl">
          <BlockList
            editor={editor}
            optionCount={5}
            emptyText="Yazı boş."
            onInsert={(afterId) => setPalette({ afterId })}
            onSlash={(blockId) => setPalette({ afterId: blockId, replaceId: blockId })}
            onFiles={(list, afterId) => void addImages(list, afterId)}
          />
        </div>
      )}
      {tab === 'onizleme' && (
        <section className="mx-auto min-w-0 max-w-3xl rounded-2xl border border-line bg-bg p-4 sm:p-6" aria-label="Önizleme">
          {preview.trim() ? (
            <LessonBody source={preview} />
          ) : (
            <p className="py-10 text-center text-sm text-muted">Henüz bir şey yazılmadı.</p>
          )}
        </section>
      )}
      {tab === 'kaynak' && (
        <Textarea
          value={raw}
          onChange={(e) => setRaw(e.target.value)}
          rows={28}
          spellCheck
          lang="tr"
          aria-label="Yazının kaynağı"
          className="mx-auto block min-h-[60vh] max-w-3xl font-mono text-[14px] leading-relaxed"
        />
      )}

      <Palette open={palette !== null} onOpenChange={(open) => !open && setPalette(null)} onPick={pick} />
      <Confirm
        open={confirmDelete}
        onOpenChange={setConfirmDelete}
        title="Yazı silinsin mi?"
        description="Yazı siteden kaldırılır. Geri alınamaz."
        confirmLabel="Sil"
        onConfirm={async () => {
          try {
            await remove.mutateAsync()
            savedRef.current = true
            toast.success('Yazı silindi')
            navigate(back.to)
          } catch (err) {
            toast.error(errorMessage(err))
            throw err
          }
        }}
      />
      <Confirm
        open={blocker.state === 'blocked'}
        onOpenChange={(open) => {
          if (!open && blocker.state === 'blocked') blocker.reset()
        }}
        title="Sayfadan çıkılsın mı?"
        description="Kaydedilmemiş değişiklikler silinir."
        confirmLabel="Çık"
        onConfirm={() => blocker.proceed?.()}
      />
    </div>
  )
}
