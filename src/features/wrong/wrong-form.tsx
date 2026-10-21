import { Camera, ImagePlus, X } from 'lucide-react'
import { useEffect, useMemo, useRef, useState, type FormEvent } from 'react'
import { toast } from 'sonner'
import { Button } from '@/components/ui/button'
import { Field, Input, Textarea } from '@/components/ui/field'
import { Modal } from '@/components/ui/modal'
import { FormSkeleton, SubjectPicker, TopicSelect } from '@/features/tracking/form-parts'
import { useStudentSubjects } from '@/features/tracking/subjects'
import { errorMessage } from '@/lib/supabase'
import { useAddWrong } from './lib'

export function WrongForm({
  studentId,
  open,
  onOpenChange,
}: {
  studentId: string
  open: boolean
  onOpenChange: (open: boolean) => void
}) {
  return (
    <Modal
      open={open}
      onOpenChange={onOpenChange}
      title="Yanlış soru ekle"
    >
      {open && <WrongFormBody studentId={studentId} onDone={() => onOpenChange(false)} />}
    </Modal>
  )
}

function WrongFormBody({ studentId, onDone }: { studentId: string; onDone: () => void }) {
  const { subjects, multiExam, recent, curriculum, isPending, error } = useStudentSubjects(studentId)
  const add = useAddWrong(studentId)
  const [picked, setPicked] = useState<string | null>(null)
  const [topicId, setTopicId] = useState<number | null>(null)
  const [photo, setPhoto] = useState<File | null>(null)
  const [note, setNote] = useState('')
  const [source, setSource] = useState('')
  const [formError, setFormError] = useState<string | null>(null)
  const camera = useRef<HTMLInputElement>(null)
  const gallery = useRef<HTMLInputElement>(null)

  const subjectId = picked ?? recent

  const preview = useMemo(() => (photo ? URL.createObjectURL(photo) : null), [photo])
  useEffect(
    () => () => {
      if (preview) URL.revokeObjectURL(preview)
    },
    [preview],
  )

  if (isPending) return <FormSkeleton />
  if (error) return <p className="py-6 text-center text-sm text-danger">{errorMessage(error)}</p>

  const pick = (file: File | undefined) => {
    if (!file) return
    if (!file.type.startsWith('image/')) return setFormError('Sadece fotoğraf eklenebilir')
    if (file.size > 15 * 1024 * 1024) return setFormError('Fotoğraf çok büyük, daha küçük bir fotoğraf seçin')
    setFormError(null)
    setPhoto(file)
  }

  const submit = (e: FormEvent) => {
    e.preventDefault()
    if (!subjectId) return setFormError('Önce dersi seçin')
    if (!photo && !note.trim()) return setFormError('Bir fotoğraf ekleyin ya da soruyu kısaca yazın')
    add.mutate(
      { subject_id: subjectId, topic_id: topicId, note, source, photo },
      {
        onSuccess: () => {
          toast.success('Yanlış soru deftere eklendi. Yarın tekrar gösterilecek')
          onDone()
        },
        onError: (err) => setFormError(errorMessage(err)),
      },
    )
  }

  return (
    <form onSubmit={submit} className="flex flex-col gap-5">
      <div>
        <input
          ref={camera}
          type="file"
          accept="image/*"
          capture="environment"
          className="hidden"
          onChange={(e) => pick(e.target.files?.[0])}
        />
        <input ref={gallery} type="file" accept="image/*" className="hidden" onChange={(e) => pick(e.target.files?.[0])} />
        {preview ? (
          <div className="relative overflow-hidden rounded-2xl border border-line bg-surface-2">
            <img src={preview} alt="Seçilen soru fotoğrafı" className="max-h-72 w-full object-contain" />
            <Button
              type="button"
              variant="secondary"
              size="icon"
              aria-label="Fotoğrafı kaldır"
              className="absolute top-2 right-2"
              onClick={() => setPhoto(null)}
            >
              <X />
            </Button>
          </div>
        ) : (
          <div className="grid grid-cols-2 gap-2">
            <Button type="button" variant="secondary" size="lg" onClick={() => camera.current?.click()}>
              <Camera />
              Fotoğraf çek
            </Button>
            <Button type="button" variant="secondary" size="lg" onClick={() => gallery.current?.click()}>
              <ImagePlus />
              Galeriden seç
            </Button>
          </div>
        )}
      </div>

      <SubjectPicker
        subjects={subjects}
        value={subjectId}
        multiExam={multiExam}
        onChange={(id) => {
          setPicked(id)
          if (id !== subjectId) setTopicId(null)
        }}
      />
      <TopicSelect curriculum={curriculum} subjectId={subjectId} value={topicId} onChange={setTopicId} />

      <Field label="Not" hint="İsteğe bağlı">
        {(props) => (
          <Textarea
            {...props}
            value={note}
            maxLength={1000}
            onChange={(e) => setNote(e.target.value)}
            placeholder="Örnek: Negatif sayının karesini yanlış aldım"
          />
        )}
      </Field>
      <Field label="Kaynak" hint="İsteğe bağlı">
        {(props) => (
          <Input
            {...props}
            value={source}
            maxLength={120}
            onChange={(e) => setSource(e.target.value)}
            placeholder="Örnek: 3D TYT 4, soru 17"
          />
        )}
      </Field>

      {formError && (
        <p role="alert" className="text-sm text-danger">
          {formError}
        </p>
      )}

      <Button type="submit" size="lg" loading={add.isPending}>
        Deftere ekle
      </Button>
    </form>
  )
}
