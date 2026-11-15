import { useMutation, useQueryClient } from '@tanstack/react-query'
import { Archive, ArchiveRestore, Trash2 } from 'lucide-react'
import { useState } from 'react'
import { useNavigate } from 'react-router'
import { toast } from 'sonner'
import { Button } from '@/components/ui/button'
import { Card, CardBody, CardHeader } from '@/components/ui/card'
import { Confirm } from '@/components/ui/confirm'
import { Field, Input } from '@/components/ui/field'
import { useNow } from '@/features/meetings/next-meeting'
import { callApi } from '@/lib/api'
import { keys } from '@/lib/data'
import { formatDate } from '@/lib/dates'
import { AppError, errorMessage, supabase } from '@/lib/supabase'
import { isCapacityError } from '../invites'
import { refreshStudent, type StudentDetail } from './queries'

const normalize = (value: string) => value.trim().replace(/\s+/g, ' ').toLocaleLowerCase('tr')

export function ArchiveSection({ student }: { student: StudentDetail }) {
  const queryClient = useQueryClient()
  const [confirming, setConfirming] = useState(false)
  const archived = Boolean(student.archived_at)

  const toggle = useMutation({
    mutationFn: async (archive: boolean) => {
      const { data, error } = await supabase
        .from('students')
        .update({ archived_at: archive ? new Date().toISOString() : null })
        .eq('id', student.id)
        .select('id')
      if (error) {
        if (isCapacityError(error)) throw new AppError(`${error.message}. Önce başka bir öğrenciyi arşive alın ya da bekleyen bir daveti silin.`)
        throw new AppError(errorMessage(error))
      }
      if (!data.length) throw new AppError('Bu öğrenciyi değiştirme yetkiniz yok')
    },
    onSuccess: async (_, archive) => {
      await Promise.all([refreshStudent(queryClient, student.id), queryClient.invalidateQueries({ queryKey: keys.invites })])
      toast.success(archive ? 'Öğrenci arşive alındı' : 'Öğrenci arşivden çıkarıldı')
    },
    onError: (e) => toast.error(errorMessage(e), { duration: 6000 }),
  })

  return (
    <Card>
      <CardHeader
        title={archived ? 'Arşivde' : 'Arşivleme'}
        description={
          archived
            ? 'Arşivdeki öğrenci kontenjana sayılmaz. Geri alınca tekrar sayılır.'
            : 'Çalışmayı bırakan öğrenciyi arşive alın. Kayıtları silinmez, kontenjanda yer açılır.'
        }
      />
      <CardBody>
        {archived ? (
          <Button variant="secondary" loading={toggle.isPending} onClick={() => toggle.mutate(false)} className="w-full sm:w-auto">
            {!toggle.isPending && <ArchiveRestore />}
            Arşivden çıkarın
          </Button>
        ) : (
          <Button variant="secondary" onClick={() => setConfirming(true)} className="w-full sm:w-auto">
            <Archive />
            Arşive alın
          </Button>
        )}
      </CardBody>
      <Confirm
        open={confirming}
        onOpenChange={setConfirming}
        title="Arşive alınsın mı?"
        description={`${student.full_name} öğrenci listenizde arşiv sekmesine taşınır. Öğrenci ve velisine bildirim gider, kayıtlar silinmez. İstediğiniz zaman geri alabilirsiniz.`}
        confirmLabel="Arşive alın"
        tone="primary"
        onConfirm={async () => {
          await toggle.mutateAsync(true).catch(() => {})
        }}
      />
    </Card>
  )
}

const DELETE_AFTER_DAYS = 7

export function DeleteSection({ student }: { student: StudentDetail }) {
  const now = useNow(60_000)
  const opensAt = student.archived_at ? Date.parse(student.archived_at) + DELETE_AFTER_DAYS * 864e5 : null
  const allowed = !student.last_seen_at || (opensAt !== null && opensAt <= now)
  const queryClient = useQueryClient()
  const navigate = useNavigate()
  const [open, setOpen] = useState(false)
  const [typed, setTyped] = useState('')
  const matches = normalize(typed) === normalize(student.full_name)

  const remove = useMutation({
    mutationFn: () => callApi('account', { action: 'delete-student', studentId: student.id }),
    onSuccess: () => {
      navigate('/app', { replace: true })
      queryClient.removeQueries({ queryKey: keys.student(student.id) })
      void queryClient.invalidateQueries({ queryKey: keys.overview })
      void queryClient.invalidateQueries({ queryKey: keys.invites })
      void queryClient.invalidateQueries({ queryKey: keys.inbox })
      toast.success(`${student.full_name} silindi`)
    },
    onError: (e) => toast.error(errorMessage(e)),
  })

  return (
    <Card className="border-danger/30">
      <CardHeader title="Kalıcı silme" description="Öğrencinin hesabı ve tüm kayıtları silinir. Geri alınamaz." />
      <CardBody>
        {!allowed ? (
          <p className="text-sm text-muted">
            {opensAt
              ? `Öğrenci ve velisi verilerini indirebilsin diye silme ${formatDate(new Date(opensAt).toISOString(), 'd MMMM')} tarihinde açılır.`
              : `Önce öğrenciyi arşive alın. Silme, ${DELETE_AFTER_DAYS} gün arşivde kaldıktan sonra açılır.`}
          </p>
        ) : (
          <Button
            variant="danger"
            onClick={() => {
              setTyped('')
              setOpen(true)
            }}
            className="w-full sm:w-auto"
          >
            <Trash2 />
            Öğrenciyi silin
          </Button>
        )}
      </CardBody>
      <Confirm
        open={open}
        onOpenChange={setOpen}
        title="Öğrenci kalıcı olarak silinsin mi?"
        description="Çalışma, soru, deneme, görev, not ve mesaj kayıtlarının hepsi silinir. Sadece bu öğrenciye bağlı veli hesapları da silinir."
        confirmLabel="Kalıcı olarak silin"
        disabled={!matches}
        onConfirm={async () => {
          await remove.mutateAsync().catch(() => {})
        }}
      >
        <Field label={<>Onaylamak için <span className="font-bold">{student.full_name}</span> yazın</>}>
          {(p) => (
            <Input {...p} value={typed} autoComplete="off" autoCapitalize="words" spellCheck={false} onChange={(e) => setTyped(e.target.value)} />
          )}
        </Field>
      </Confirm>
    </Card>
  )
}
