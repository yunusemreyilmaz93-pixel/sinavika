import { useQuery } from '@tanstack/react-query'
import { UserX } from 'lucide-react'
import { useNavigate, useParams, useSearchParams } from 'react-router'
import { PageHeader } from '@/components/app/page-header'
import { EmptyState } from '@/components/ui/empty-state'
import { PageSkeleton } from '@/components/ui/skeleton'
import { useViewedStudent } from '@/features/auth/session'
import { useCurriculum } from '@/lib/data'
import type { ExamKind, Field, Track } from '@/lib/exam'
import { errorMessage, supabase, unwrap } from '@/lib/supabase'
import { ExamForm } from './exam-form'
import { useExams } from './queries'

const KINDS: ExamKind[] = ['LGS', 'TYT', 'AYT', 'YDT']

function useTeacherStudent(studentId: string | undefined) {
  return useQuery({
    queryKey: ['student', studentId ?? '', 'exam-form'],
    enabled: Boolean(studentId),
    queryFn: async () => {
      const [student, profile] = await Promise.all([
        supabase.from('students').select('id, track, field').eq('id', studentId!).maybeSingle(),
        supabase.from('profiles').select('full_name').eq('id', studentId!).maybeSingle(),
      ])
      const s = unwrap(student)
      return s ? { ...s, full_name: unwrap(profile)?.full_name ?? 'Öğrenci' } : null
    },
  })
}

export default function NewExamPage() {
  const params = useParams()
  const [search] = useSearchParams()
  const navigate = useNavigate()
  const viewed = useViewedStudent()
  const teacherMode = Boolean(params.studentId)
  const teacherStudent = useTeacherStudent(params.studentId)

  const target: { id: string; name: string; track: Track; field: Field | null } | null = teacherMode
    ? teacherStudent.data
      ? { id: teacherStudent.data.id, name: teacherStudent.data.full_name, track: teacherStudent.data.track, field: teacherStudent.data.field }
      : null
    : viewed
      ? { id: viewed.studentId, name: viewed.name, track: viewed.student.track, field: viewed.student.field }
      : null

  const curriculum = useCurriculum()
  const exams = useExams(target?.id ?? '')
  const backTo = teacherMode ? `/app/ogrenciler/${params.studentId}?tab=denemeler` : '/app/denemeler'
  const kindParam = search.get('tur')
  const initialKind = KINDS.find((k) => k === kindParam) ?? null

  const header = (
    <PageHeader
      title="Deneme ekle"
      description={teacherMode && target ? `${target.name} için` : undefined}
      back={{ to: backTo, label: teacherMode ? (target?.name ?? 'Öğrenci') : 'Denemeler' }}
    />
  )

  if ((teacherMode && teacherStudent.isPending) || curriculum.isPending || (target && exams.isPending)) {
    return <PageSkeleton />
  }

  const error = teacherStudent.error ?? curriculum.error ?? (target ? exams.error : null)
  if (error) {
    return (
      <>
        {header}
        <p className="text-sm text-danger">{errorMessage(error)}</p>
      </>
    )
  }

  if (!target || !curriculum.data) {
    return (
      <>
        {header}
        <EmptyState icon={UserX} title="Öğrenci bulunamadı" description="Bu öğrenciye deneme eklemek için yetkiniz yok ya da kayıt silinmiş." />
      </>
    )
  }

  return (
    <>
      {header}
      <ExamForm
        studentId={target.id}
        student={target}
        subjects={curriculum.data.subjects}
        recent={exams.data ?? []}
        initialKind={initialKind}
        onSaved={(id) => navigate(teacherMode ? backTo : `/app/denemeler/${id}`, { replace: true })}
      />
    </>
  )
}
