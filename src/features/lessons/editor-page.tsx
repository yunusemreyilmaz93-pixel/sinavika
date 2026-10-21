import { BookOpen, ChevronDown, Plus, Save, Trash2, Undo2 } from 'lucide-react'
import { useCallback, useDeferredValue, useEffect, useMemo, useRef, useState } from 'react'
import { useBeforeUnload, useBlocker, useNavigate, useParams } from 'react-router'
import { toast } from 'sonner'
import { PageHeader } from '@/components/app/page-header'
import { Button } from '@/components/ui/button'
import { Card } from '@/components/ui/card'
import { Confirm } from '@/components/ui/confirm'
import { EmptyState } from '@/components/ui/empty-state'
import { Field, Textarea } from '@/components/ui/field'
import { Segmented } from '@/components/ui/segmented'
import { PageSkeleton } from '@/components/ui/skeleton'
import { Switch } from '@/components/ui/switch'
import { cn } from '@/lib/cn'
import { useCurriculum } from '@/lib/data'
import { errorMessage } from '@/lib/supabase'
import { BlockList } from './editor/block-list'
import type { CatalogItem } from './editor/catalog'
import { Palette } from './editor/palette'
import { useBlockEditor } from './editor/use-block-editor'
import { estimateMinutes, formatLessonMinutes } from './markdown/parse'
import { LessonBody } from './markdown/render'
import { uploadLessonImage, useDeleteLesson, useLesson, useSaveLesson, type LessonDraft } from './queries'

const guide = [
  ['Başlık', '## 1. Başlık', 'İçindekiler listesi ## başlıklarından oluşur. Başında sayı olan başlık numaralı görünür.'],
  ['Vurgu', '**kalın**, *eğik*', 'Altı çizili sözcük için [kelime](#altcizgi), ek için [-mak](#ek).'],
  ['Görsel', '![Alt metin](adres "Açıklama | Kaynak")', 'Görsel düğmesi yükler ve satırı kendisi ekler.'],
  ['Formül', '$x^2$ satır içi\n$$\\frac{a}{b}$$ ayrı satır', 'KaTeX söz dizimi. Tablo hücresinde | kullanma.'],
  ['Tablo', '| A | B |\n| --- | --- |\n| 1 | 2 |', 'Telefonda satırlar kart olarak görünür.'],
  ['İpucu', ':::ipucu{baslik="İpucu"}\nMetin\n:::', 'Başlık isteğe bağlı.'],
  ['Bağlantı', ':::baglanti\nMetin\n:::', '"Bağlantıyı kur" kutusu.'],
  ['Hedefler', ':::hedefler\n1. Birinci\n2. İkinci\n:::', 'Numaralı hedef kartları.'],
  ['Neden sonuç', ':::neden-sonuc\n- Neden => Sonuç\n:::', 'Ok ile bağlı kartlar.'],
  ['Çizelge', ':::cizelge{baslik="Başlık"}\n- 1839 | Olay\n:::', 'Yıllara göre yerleşen çizgi.'],
  ['Hayat çizgisi', ':::zaman{baslik="Başlık" donemler="Ad:1881-1893,Ad:1893-1905"}\n- 1881 | Olay | Ayrıntı\n:::', 'Dönemlere ayrılmış zaman çizelgesi.'],
  ['Ek formülü', ':::formul\n- koş | mak | koşmak | İsim-fiil | yesil\n:::', 'Renkler: yesil, mavi, sari.'],
  ['Cümle laboratuvarı', ':::cumle-lab\n1. Kitap / okumak,[isim|Not.] / geliştirir.[yuklem|Not.]\n:::', 'Türler: isim, sifat, zarf, yuklem.'],
  ['Soru', ':::soru{cevap="C"}\n> Alıntı\n\nSoru kökü?\n\n- A) ...\n- B) ...\n\n---\n\nÇözüm\n:::', 'Alıntı ve çözüm isteğe bağlı. Sorular otomatik numaralanır.'],
  ['Kendini dene', ':::dene\n1. Soru? => Cevap\n:::', 'Cevabı gizli kartlar.'],
  ['Simülasyon', '::sim{tur="gaz"}', 'Gaz parçacıkları. Etkileşimli, öğrenci önce tahmin eder, sonra kaydırıcıyla dener.'],
  ['Video', '::video{url="https://youtu.be/..." baslik="" kanal="" etiket=""}', 'Tıklayınca yüklenir.'],
] as const

export default function LessonEditorPage() {
  const { topicId } = useParams()
  const id = Number(topicId)
  const curriculum = useCurriculum()
  const data = useLesson(id, true)
  const topic = curriculum.data?.topicById.get(id)
  const back = { to: '/app/yonetim?bolum=mufredat', label: 'Müfredat' }

  if (curriculum.isPending || data.isPending) return <PageSkeleton />
  if (!topic || data.isError) {
    return (
      <div>
        <PageHeader title="Konu anlatımı" back={back} />
        <EmptyState icon={BookOpen} title={data.isError ? 'Anlatım açılamadı' : 'Konu bulunamadı'} description="Müfredat ekranına dönüp tekrar dene." />
      </div>
    )
  }

  const { lesson, note } = data.data
  const initial: LessonDraft = {
    body: lesson?.body ?? '',
    reading_minutes: lesson?.reading_minutes ?? 10,
    published: lesson?.published ?? false,
    note,
  }
  return <Editor key={id} topicId={id} topicName={topic.name} subjectId={topic.subject_id} exists={Boolean(lesson)} initial={initial} back={back} />
}

function Editor({
  topicId,
  topicName,
  subjectId,
  exists,
  initial,
  back,
}: {
  topicId: number
  topicName: string
  subjectId: string
  exists: boolean
  initial: LessonDraft
  back: { to: string; label: string }
}) {
  const navigate = useNavigate()
  const save = useSaveLesson(topicId)
  const remove = useDeleteLesson(topicId)
  const editor = useBlockEditor(initial.body)
  const [meta, setMeta] = useState({ published: initial.published, note: initial.note })
  const [baseMeta, setBaseMeta] = useState(meta)
  const [tab, setTab] = useState<'blok' | 'onizleme' | 'kaynak'>('blok')
  const [raw, setRaw] = useState('')
  const [palette, setPalette] = useState<{ afterId: string | null; replaceId?: string } | null>(null)
  const [uploading, setUploading] = useState(false)
  const [confirmDelete, setConfirmDelete] = useState(false)
  const files = useRef<HTMLInputElement>(null)
  const imageAfter = useRef<string | null>(null)
  const savedRef = useRef(false)

  const optionCount = subjectId.startsWith('lgs') ? 4 : 5
  const preview = useDeferredValue(editor.body)
  const dirty = editor.dirty || meta.published !== baseMeta.published || meta.note !== baseMeta.note
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
      for (const file of images) {
        const url = await uploadLessonImage(topicId, file)
        after = editor.insertAfter(after, { kind: 'md', text: `![](${url})` })
      }
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
    editor.insertAfter(target.afterId, item.make({ optionCount }), target.replaceId)
  }

  const submit = useCallback(async () => {
    const next: LessonDraft = { body: editor.body, reading_minutes: estimateMinutes(editor.body), published: meta.published, note: meta.note }
    try {
      await save.mutateAsync(next)
      editor.markSaved()
      setBaseMeta(meta)
      toast.success(next.published ? 'Kaydedildi ve yayında' : 'Taslak olarak kaydedildi')
    } catch (err) {
      toast.error(errorMessage(err))
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [editor.body, meta, save])

  useEffect(() => {
    const onKey = (e: KeyboardEvent) => {
      if ((e.metaKey || e.ctrlKey) && e.key.toLowerCase() === 's') {
        e.preventDefault()
        if (dirty && !save.isPending) void submit()
      }
      const field = document.activeElement
      const typing = field instanceof HTMLInputElement || field instanceof HTMLTextAreaElement
      if ((e.metaKey || e.ctrlKey) && e.key.toLowerCase() === 'z' && !e.shiftKey && !typing && tab === 'blok') {
        e.preventDefault()
        editor.undo()
      }
    }
    window.addEventListener('keydown', onKey)
    return () => window.removeEventListener('keydown', onKey)
  }, [dirty, save.isPending, submit, editor, tab])

  return (
    <div>
      <PageHeader
        back={back}
        title={topicName}
        description={exists ? 'Konu anlatımını düzenle' : 'Bu konu için anlatım yaz'}
        actions={
          <>
            {exists && (
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

      <Card className="mb-4 flex flex-wrap items-center gap-x-6 gap-y-3 p-4">
        <label className="flex items-center gap-3 text-sm font-semibold">
          <Switch label="Yayında" checked={meta.published} onCheckedChange={(published) => setMeta((m) => ({ ...m, published }))} />
          {meta.published ? 'Yayında' : 'Taslak'}
        </label>
        <span className="tabular text-sm text-muted">
          {words} sözcük · yaklaşık {formatLessonMinutes(minutes)} dakika
        </span>
        <span className={cn('ml-auto text-sm font-semibold', dirty ? 'text-warning' : 'text-muted')}>
          {dirty ? 'Kaydedilmemiş değişiklik var' : 'Kaydedildi'}
        </span>
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
            <Button type="button" variant="ghost" size="icon" onClick={editor.undo} disabled={!editor.canUndo} aria-label="Geri al">
              <Undo2 />
            </Button>
            <Button type="button" variant="secondary" size="icon" loading={uploading} onClick={() => setPalette({ afterId: editor.activeId })} aria-label="Blok ekle">
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
            optionCount={optionCount}
            onInsert={(afterId) => setPalette({ afterId })}
            onSlash={(blockId) => setPalette({ afterId: blockId, replaceId: blockId })}
            onFiles={(list, afterId) => void addImages(list, afterId)}
          />
        </div>
      )}

      {tab === 'onizleme' && (
        <section className="mx-auto min-w-0 max-w-3xl rounded-2xl border border-line bg-bg p-4 sm:p-6" aria-label="Önizleme">
          {preview.trim() ? <LessonBody source={preview} /> : <p className="py-10 text-center text-sm text-muted">Henüz bir şey yazılmadı.</p>}
        </section>
      )}

      {tab === 'kaynak' && (
        <section className="mx-auto max-w-3xl space-y-3" aria-label="Kaynak metin">
          <p className="text-sm text-muted">Markdown olarak düzenle. Yaz sekmesine dönünce bloklara ayrılır.</p>
          <Textarea
            value={raw}
            onChange={(e) => setRaw(e.target.value)}
            rows={28}
            spellCheck
            lang="tr"
            aria-label="Konu anlatımı kaynağı"
            className="min-h-[60vh] font-mono text-[14px] leading-relaxed"
          />
          <details className="group rounded-2xl border border-line bg-surface">
            <summary className="flex min-h-12 cursor-pointer list-none items-center justify-between px-4 font-semibold">
              Yazım rehberi
              <ChevronDown className="size-4 text-muted transition-transform group-open:rotate-180" />
            </summary>
            <dl className="divide-y divide-line border-t border-line">
              {guide.map(([name, code, note]) => (
                <div key={name} className="space-y-1.5 px-4 py-3">
                  <dt className="text-sm font-semibold">{name}</dt>
                  <dd className="space-y-1.5">
                    <pre className="overflow-x-auto rounded-lg bg-surface-2 p-2.5 font-mono text-[13px] leading-relaxed">{code}</pre>
                    <span className="block text-sm text-muted">{note}</span>
                  </dd>
                </div>
              ))}
            </dl>
          </details>
        </section>
      )}

      <div className="mx-auto mt-6 max-w-3xl">
        <Field label="Öğretmen notu" hint="Sadece öğretmenler görür. Öğrenci ve veli göremez.">
          {(props) => <Textarea {...props} rows={4} value={meta.note} onChange={(e) => setMeta((m) => ({ ...m, note: e.target.value }))} />}
        </Field>
      </div>

      <Palette open={palette !== null} onOpenChange={(open) => !open && setPalette(null)} onPick={pick} />
      <Confirm
        open={confirmDelete}
        onOpenChange={setConfirmDelete}
        title="Anlatım silinsin mi?"
        description="Metin ve öğretmen notu silinir. Geri alınamaz."
        confirmLabel="Sil"
        onConfirm={async () => {
          try {
            await remove.mutateAsync()
            savedRef.current = true
            toast.success('Anlatım silindi')
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
