import {
  Bold,
  BookOpen,
  ChevronDown,
  Columns3,
  Heading2,
  ImagePlus,
  Lightbulb,
  Link2,
  ListChecks,
  Save,
  Sigma,
  Table2,
  Trash2,
  Video,
  CircleHelp,
  Eye,
  type LucideIcon,
} from 'lucide-react'
import { useCallback, useDeferredValue, useMemo, useRef, useState, type ClipboardEvent } from 'react'
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
import { estimateMinutes, formatLessonMinutes } from './markdown/parse'
import { LessonBody } from './markdown/render'
import { uploadLessonImage, useDeleteLesson, useLesson, useSaveLesson, type LessonDraft } from './queries'

type Snippet = { label: string; icon: LucideIcon; before: string; after?: string; placeholder?: string }

const snippets: Snippet[] = [
  { label: 'Başlık', icon: Heading2, before: '\n## ', placeholder: '1. Başlık' },
  { label: 'Kalın', icon: Bold, before: '**', after: '**', placeholder: 'önemli' },
  { label: 'İpucu', icon: Lightbulb, before: '\n:::ipucu\n', after: '\n:::\n', placeholder: 'Kısa bir ipucu.' },
  { label: 'Bağlantı', icon: Link2, before: '\n:::baglanti\n', after: '\n:::\n', placeholder: 'Bu bilgi sonraki konuyla şöyle bağlanır.' },
  {
    label: 'Tablo',
    icon: Table2,
    before: '\n| Sütun 1 | Sütun 2 |\n| --- | --- |\n| ',
    after: ' | |\n',
    placeholder: 'Hücre',
  },
  { label: 'Formül', icon: Sigma, before: '\n$$\n', after: '\n$$\n', placeholder: 'a^2 + b^2 = c^2' },
  {
    label: 'Soru',
    icon: CircleHelp,
    before: '\n:::soru{cevap="A"}\n',
    after: '\n:::\n',
    placeholder: 'Soru kökü?\n\n- A) Birinci\n- B) İkinci\n- C) Üçüncü\n- D) Dördüncü\n\n---\n\nÇözüm açıklaması.',
  },
  { label: 'Video', icon: Video, before: '\n::video{url="', after: '" baslik="" kanal=""}\n', placeholder: 'https://www.youtube.com/watch?v=' },
  {
    label: 'Çizelge',
    icon: Columns3,
    before: '\n:::cizelge{baslik="Başlık"}\n',
    after: '\n:::\n',
    placeholder: '- 1839 | Olay\n- 1856 | Olay',
  },
  {
    label: 'Kendini dene',
    icon: ListChecks,
    before: '\n:::dene\n',
    after: '\n:::\n',
    placeholder: '1. Soru? => Cevap.\n2. Soru? => Cevap.',
  },
]

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
  ['Video', '::video{url="https://youtu.be/..." baslik="" kanal="" etiket=""}', 'Tıklayınca yüklenir.'],
] as const

function same(a: LessonDraft, b: LessonDraft) {
  return a.body === b.body && a.published === b.published && a.note === b.note
}

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
  return <Editor key={id} topicId={id} topicName={topic.name} exists={Boolean(lesson)} initial={initial} back={back} />
}

function Editor({
  topicId,
  topicName,
  exists,
  initial,
  back,
}: {
  topicId: number
  topicName: string
  exists: boolean
  initial: LessonDraft
  back: { to: string; label: string }
}) {
  const navigate = useNavigate()
  const save = useSaveLesson(topicId)
  const remove = useDeleteLesson(topicId)
  const [base, setBase] = useState(initial)
  const [draft, setDraft] = useState(initial)
  const [tab, setTab] = useState<'yaz' | 'onizleme'>('yaz')
  const [uploading, setUploading] = useState(false)
  const [confirmDelete, setConfirmDelete] = useState(false)
  const area = useRef<HTMLTextAreaElement>(null)
  const files = useRef<HTMLInputElement>(null)
  const savedRef = useRef(false)

  const preview = useDeferredValue(draft.body)
  const dirty = !same(draft, base)
  const minutes = useMemo(() => estimateMinutes(draft.body), [draft.body])
  const words = useMemo(() => (draft.body.trim() ? draft.body.trim().split(/\s+/).length : 0), [draft.body])

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

  const setBody = (body: string) => setDraft((d) => ({ ...d, body }))

  const insert = (before: string, after = '', placeholder = '') => {
    const el = area.current
    if (!el) return
    const { selectionStart: start, selectionEnd: end, value } = el
    const selected = value.slice(start, end) || placeholder
    const next = value.slice(0, start) + before + selected + after + value.slice(end)
    setBody(next)
    setTab('yaz')
    requestAnimationFrame(() => {
      el.focus()
      const from = start + before.length
      el.setSelectionRange(from, from + selected.length)
    })
  }

  const addImages = async (list: File[]) => {
    const images = list.filter((f) => f.type.startsWith('image/'))
    if (!images.length) return
    setUploading(true)
    try {
      for (const file of images) {
        const url = await uploadLessonImage(topicId, file)
        insert(`\n![`, `](${url} "Açıklama | Kaynak ve lisans")\n`, 'Görselin ne gösterdiğini yaz')
      }
    } catch (err) {
      toast.error(errorMessage(err))
    } finally {
      setUploading(false)
    }
  }

  const onPaste = (e: ClipboardEvent<HTMLTextAreaElement>) => {
    const images = Array.from(e.clipboardData.files)
    if (images.some((f) => f.type.startsWith('image/'))) {
      e.preventDefault()
      void addImages(images)
    }
  }

  const submit = async () => {
    const next = { ...draft, reading_minutes: minutes }
    try {
      await save.mutateAsync(next)
      setDraft(next)
      setBase(next)
      toast.success(next.published ? 'Kaydedildi ve yayında' : 'Taslak olarak kaydedildi')
    } catch (err) {
      toast.error(errorMessage(err))
    }
  }

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
          <Switch label="Yayında" checked={draft.published} onCheckedChange={(published) => setDraft((d) => ({ ...d, published }))} />
          {draft.published ? 'Yayında' : 'Taslak'}
        </label>
        <span className="tabular text-sm text-muted">
          {words} sözcük · yaklaşık {formatLessonMinutes(minutes)} dakika
        </span>
        <span className={cn('ml-auto text-sm font-semibold', dirty ? 'text-warning' : 'text-muted')}>
          {dirty ? 'Kaydedilmemiş değişiklik var' : 'Kaydedildi'}
        </span>
      </Card>

      <Segmented
        className="mb-4 xl:hidden"
        value={tab}
        onChange={setTab}
        options={[
          { value: 'yaz', label: 'Yaz' },
          { value: 'onizleme', label: 'Önizleme' },
        ]}
      />

      <div className="xl:grid xl:grid-cols-2 xl:items-start xl:gap-6">
        <section className={cn('space-y-3', tab === 'yaz' ? 'block' : 'hidden', 'xl:block')} aria-label="Yazı alanı">
          <div className="scrollbar-none -mx-4 flex gap-1.5 overflow-x-auto px-4 pb-1 sm:mx-0 sm:flex-wrap sm:px-0">
            {snippets.map((s) => (
              <Button
                key={s.label}
                type="button"
                variant="secondary"
                size="sm"
                className="min-h-11 shrink-0"
                onClick={() => insert(s.before, s.after, s.placeholder)}
              >
                <s.icon />
                {s.label}
              </Button>
            ))}
            <Button type="button" variant="secondary" size="sm" className="min-h-11 shrink-0" loading={uploading} onClick={() => files.current?.click()}>
              <ImagePlus />
              Görsel
            </Button>
            <input
              ref={files}
              type="file"
              accept="image/jpeg,image/png,image/webp"
              multiple
              hidden
              onChange={(e) => {
                void addImages(Array.from(e.target.files ?? []))
                e.target.value = ''
              }}
            />
          </div>

          <Textarea
            ref={area}
            value={draft.body}
            onChange={(e) => setBody(e.target.value)}
            onPaste={onPaste}
            rows={28}
            spellCheck
            lang="tr"
            aria-label="Konu anlatımı metni"
            placeholder="Metni buraya yaz ya da yapıştır. Başlıklar ## ile başlar."
            className="min-h-[60vh] font-mono text-[14px] leading-relaxed"
          />

          <Field label="Öğretmen notu" hint="Sadece öğretmenler görür. Öğrenci ve veli göremez.">
            {(props) => (
              <Textarea {...props} rows={4} value={draft.note} onChange={(e) => setDraft((d) => ({ ...d, note: e.target.value }))} />
            )}
          </Field>

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

        <section
          className={cn('min-w-0 rounded-2xl border border-line bg-bg p-4 sm:p-6 xl:sticky xl:top-20 xl:max-h-[calc(100dvh-6rem)] xl:overflow-y-auto', tab === 'onizleme' ? 'block' : 'hidden', 'xl:block')}
          aria-label="Önizleme"
        >
          <p className="mb-4 flex items-center gap-2 text-xs font-semibold tracking-wide text-muted uppercase">
            <Eye className="size-4" />
            Önizleme
          </p>
          {preview.trim() ? (
            <LessonBody source={preview} />
          ) : (
            <p className="py-10 text-center text-sm text-muted">Yazdıkça burada görünür.</p>
          )}
        </section>
      </div>

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
