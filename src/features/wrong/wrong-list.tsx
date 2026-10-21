import { CalendarClock, Check, NotebookTabs, Plus, RotateCcw, RotateCw, Trash2 } from 'lucide-react'
import { useMemo, useState } from 'react'
import { useSearchParams } from 'react-router'
import { toast } from 'sonner'
import { Badge } from '@/components/ui/badge'
import { Button } from '@/components/ui/button'
import { Card } from '@/components/ui/card'
import { Confirm } from '@/components/ui/confirm'
import { EmptyState } from '@/components/ui/empty-state'
import { Modal } from '@/components/ui/modal'
import { Segmented } from '@/components/ui/segmented'
import { Skeleton } from '@/components/ui/skeleton'
import { useCurriculum } from '@/lib/data'
import { daysBetween, formatDate, todayISO } from '@/lib/dates'
import { subjectColor } from '@/lib/exam'
import { errorMessage } from '@/lib/supabase'
import {
  filterWrong,
  useDeleteWrong,
  usePhotoUrl,
  useReviewWrong,
  useWrongQuestions,
  type WrongFilter,
  type ReviewResult,
  type WrongQuestion,
} from './lib'
import { WrongForm } from './wrong-form'

type Viewer = 'student' | 'teacher' | 'parent'

function dueLabel(item: WrongQuestion, today: string) {
  if (item.learned_at) return `${formatDate(item.learned_at.slice(0, 10), 'd MMMM')} tarihinde öğrenildi`
  const days = daysBetween(today, item.next_review_on)
  if (days <= 0) return 'Tekrar zamanı geldi'
  if (days === 1) return 'Yarın tekrar'
  return `${days} gün sonra tekrar`
}

export function WrongList({ studentId, viewer }: { studentId: string; viewer: Viewer }) {
  const list = useWrongQuestions(studentId)
  const curriculum = useCurriculum()
  const today = todayISO()
  const [filter, setFilter] = useState<WrongFilter>('tekrar')
  const [params, setParams] = useSearchParams()
  const [adding, setAddingState] = useState(() => params.get('ekle') === '1' && viewer !== 'parent')
  const setAdding = (open: boolean) => {
    setAddingState(open)
    if (!open && params.has('ekle'))
      setParams(
        (p) => {
          const n = new URLSearchParams(p)
          n.delete('ekle')
          return n
        },
        { replace: true },
      )
  }
  const canEdit = viewer !== 'parent'

  const all = useMemo(() => list.data ?? [], [list.data])
  const dueCount = useMemo(() => filterWrong(all, 'tekrar', today).length, [all, today])
  const shown = useMemo(() => filterWrong(all, filter, today), [all, filter, today])

  if (list.isPending || curriculum.isPending) {
    return (
      <div className="space-y-3" aria-busy="true">
        <Skeleton className="h-11" />
        <Skeleton className="h-40" />
        <Skeleton className="h-40" />
      </div>
    )
  }

  if (list.isError || curriculum.isError) {
    return (
      <div role="alert" className="flex flex-col items-start gap-3 rounded-2xl border border-line bg-surface p-5">
        <p className="text-sm text-danger">{errorMessage(list.error ?? curriculum.error)}</p>
        <Button variant="secondary" size="sm" onClick={() => void list.refetch()}>
          <RotateCw />
          Tekrar deneyin
        </Button>
      </div>
    )
  }

  const addButton = canEdit && (
    <Button onClick={() => setAdding(true)}>
      <Plus />
      Yanlış soru ekle
    </Button>
  )

  return (
    <div className="space-y-4">
      {all.length === 0 ? (
        <EmptyState
          icon={NotebookTabs}
          title="Defter henüz boş"
          description={
            viewer === 'student'
              ? 'Yanlış yaptığın bir sorunun fotoğrafını çek. Unutmaman için belli aralıklarla tekrar karşına çıkar.'
              : viewer === 'teacher'
                ? 'Öğrenci yanlış yaptığı soruları buraya ekledikçe hangi konularda takıldığını görürsünüz. Siz de ekleyebilirsiniz.'
                : 'Çocuğunuzun yanlış yaptığı sorular deftere eklendikçe burada görünür.'
          }
          action={addButton}
        />
      ) : (
        <>
          <div className="flex flex-wrap items-center justify-between gap-3">
            <Segmented
              options={[
                {
                  value: 'tekrar',
                  label: dueCount ? `Tekrar (${dueCount})` : 'Tekrar',
                },
                { value: 'tumu', label: 'Hepsi' },
                { value: 'ogrenildi', label: 'Öğrenildi' },
              ]}
              value={filter}
              onChange={setFilter}
              className="w-full sm:w-auto"
            />
            {addButton}
          </div>

          {shown.length === 0 ? (
            <EmptyState
              icon={filter === 'tekrar' ? Check : NotebookTabs}
              title={
                filter === 'tekrar'
                  ? 'Bugün tekrar edilecek soru yok'
                  : filter === 'ogrenildi'
                    ? 'Henüz öğrenilen soru yok'
                    : 'Bekleyen soru yok'
              }
              description={
                filter === 'tekrar'
                  ? 'Tekrar zamanı gelen sorular burada çıkar. Diğerleri Hepsi sekmesinde görünür.'
                  : filter === 'ogrenildi'
                    ? 'Bir soru tekrar edilirken Artık biliyorum denince buraya taşınır.'
                    : 'Bütün sorular öğrenildi olarak işaretli.'
              }
            />
          ) : (
            <ul className="grid gap-3 sm:grid-cols-2">
              {shown.map((item) => (
                <WrongCard
                  key={item.id}
                  item={item}
                  studentId={studentId}
                  canEdit={canEdit}
                  today={today}
                  curriculum={curriculum.data}
                />
              ))}
            </ul>
          )}
        </>
      )}

      {canEdit && <WrongForm studentId={studentId} open={adding} onOpenChange={setAdding} />}
    </div>
  )
}

function WrongCard({
  item,
  studentId,
  canEdit,
  today,
  curriculum,
}: {
  item: WrongQuestion
  studentId: string
  canEdit: boolean
  today: string
  curriculum: ReturnType<typeof useCurriculum>['data']
}) {
  const photo = usePhotoUrl(item.photo_path)
  const review = useReviewWrong(studentId)
  const remove = useDeleteWrong(studentId)
  const [zoom, setZoom] = useState(false)
  const [confirming, setConfirming] = useState(false)
  const subject = curriculum?.subjectById.get(item.subject_id)
  const topic = item.topic_id ? curriculum?.topicById.get(item.topic_id) : undefined
  const due = !item.learned_at && item.next_review_on <= today

  const act = (result: ReviewResult) =>
    review.mutate(
      { id: item.id, result },
      {
        onSuccess: (row) =>
          toast.success(
            row.learned_at
              ? 'Harika, öğrenildi olarak işaretlendi'
              : result === 'again'
                ? 'Sorun değil. Yarın tekrar gösterilecek'
                : `Güzel. ${formatDate(row.next_review_on, 'd MMMM')} günü tekrar göstereceğiz`,
          ),
        onError: (err) => toast.error(errorMessage(err)),
      },
    )

  return (
    <li>
      <Card className="flex h-full flex-col overflow-hidden">
        {item.photo_path && (
          <button type="button" onClick={() => setZoom(true)} className="block bg-surface-2" aria-label="Fotoğrafı büyüt">
            {photo.data ? (
              <img src={photo.data} alt="Soru fotoğrafı" className="h-44 w-full object-cover" loading="lazy" />
            ) : photo.isError ? (
              <span className="grid h-44 place-items-center px-4 text-sm text-muted">Fotoğraf yüklenemedi</span>
            ) : (
              <Skeleton className="h-44 rounded-none" />
            )}
          </button>
        )}
        <div className="flex flex-1 flex-col gap-2 p-4">
          <div className="flex flex-wrap items-center gap-2">
            <span className="inline-flex items-center gap-1.5 text-sm font-semibold">
              <span className="size-2.5 rounded-full" style={{ backgroundColor: subjectColor(subject) }} aria-hidden />
              {subject?.short ?? item.subject_id}
            </span>
            {topic && <span className="min-w-0 truncate text-sm text-muted">{topic.name}</span>}
          </div>
          {item.note && <p className="text-[15px] leading-relaxed whitespace-pre-line">{item.note}</p>}
          {item.source && <p className="text-xs text-muted">{item.source}</p>}
          <div className="mt-auto flex flex-wrap items-center gap-2 pt-1">
            <Badge tone={item.learned_at ? 'primary' : due ? 'warning' : 'neutral'}>
              <CalendarClock className="size-3.5" />
              {dueLabel(item, today)}
            </Badge>
            {item.review_count > 0 && <span className="text-xs text-muted">{item.review_count} kez tekrar edildi</span>}
          </div>
          {canEdit && (
            <div className="flex flex-wrap gap-2 border-t border-line pt-3">
              {item.learned_at ? (
                <Button variant="secondary" size="sm" className="h-11" loading={review.isPending} onClick={() => act('again')}>
                  <RotateCcw />
                  Tekrar listesine al
                </Button>
              ) : (
                <>
                  <Button variant="secondary" size="sm" className="h-11 flex-1" disabled={review.isPending} onClick={() => act('again')}>
                    <RotateCcw />
                    Yapamadım
                  </Button>
                  <Button size="sm" className="h-11 flex-1" loading={review.isPending} onClick={() => act('good')}>
                    <Check />
                    Yaptım
                  </Button>
                  <Button variant="ghost" size="sm" className="h-11" disabled={review.isPending} onClick={() => act('learned')}>
                    Artık biliyorum
                  </Button>
                </>
              )}
              <Button variant="ghost" size="icon" aria-label="Soruyu sil" onClick={() => setConfirming(true)}>
                <Trash2 className="text-muted" />
              </Button>
            </div>
          )}
        </div>
      </Card>

      <Modal open={zoom} onOpenChange={setZoom} title={subject?.name ?? 'Soru'} description={topic?.name} size="lg">
        {photo.data && <img src={photo.data} alt="Soru fotoğrafı" className="w-full rounded-xl" />}
      </Modal>
      <Confirm
        open={confirming}
        onOpenChange={setConfirming}
        title="Soru defterden silinsin mi?"
        description="Fotoğrafı ve notu kalıcı olarak silinir."
        confirmLabel="Sil"
        onConfirm={async () => {
          try {
            await remove.mutateAsync(item)
            toast.success('Soru silindi')
          } catch (err) {
            toast.error(errorMessage(err))
          }
        }}
      />
    </li>
  )
}
