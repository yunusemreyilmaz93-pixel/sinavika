import { Users } from 'lucide-react'
import { createContext, useContext, useMemo, type ReactNode } from 'react'
import { Avatar } from '@/components/ui/avatar'
import { Card } from '@/components/ui/card'
import { Switch } from '@/components/ui/switch'
import { useAuth } from '@/features/auth/session'
import { cn } from '@/lib/cn'
import { useCurriculum } from '@/lib/data'
import { setStudyRoomVisible, useStudyRoom, useStudyRoomVisible, type Peer } from './study-room'
import { useTimerState } from './timer-store'

const StudyRoomContext = createContext<Peer[]>([])

// Öğrenci için kendi öğretmeninin etüdü, öğretmen için kendi öğrencilerinin etüdü. Öğrenci yalnızca sayaç çalışırken görünür
export function StudyRoomProvider({ children }: { children: ReactNode }) {
  const { profile, student } = useAuth()
  const timer = useTimerState()
  const visible = useStudyRoomVisible()
  const curriculum = useCurriculum()

  const teacherId = profile?.role === 'student' ? (student?.teacher_id ?? null) : profile?.role === 'teacher' ? profile.id : null
  const focus = profile?.role === 'student' && timer.focus?.studentId === profile.id ? timer.focus : null
  const active = Boolean(focus && focus.pausedAt == null && visible)
  const subject = focus ? curriculum.data?.subjectById.get(focus.subjectId)?.name : undefined
  const me = useMemo<Peer | null>(
    () =>
      active && focus && profile
        ? { id: profile.id, name: profile.full_name.trim().split(/\s+/)[0] ?? 'Öğrenci', subject: subject ?? 'Çalışma', since: focus.startedAt }
        : null,
    [active, focus, profile, subject],
  )
  const peers = useStudyRoom(teacherId, profile?.id ?? '', me)
  return <StudyRoomContext.Provider value={peers}>{children}</StudyRoomContext.Provider>
}

export function useStudyPeers() {
  return useContext(StudyRoomContext)
}

function since(ms: number) {
  const minutes = Math.max(1, Math.round((Date.now() - ms) / 60_000))
  return minutes >= 60 ? `${Math.floor(minutes / 60)} sa ${minutes % 60} dk` : `${minutes} dk`
}

// Öğrenci ekranları "sen", öğretmen ekranı "siz" diliyle
export function StudyRoomCard({ forTeacher = false, showToggle = false, className }: { forTeacher?: boolean; showToggle?: boolean; className?: string }) {
  const peers = useStudyPeers()
  const visible = useStudyRoomVisible()
  if (forTeacher && !peers.length) return null

  return (
    <Card className={cn('p-4 sm:p-5', className)}>
      <div className="flex items-start gap-3">
        <span className="relative grid size-10 shrink-0 place-items-center rounded-xl bg-primary-soft text-primary-soft-fg" aria-hidden>
          <Users className="size-5" />
          {peers.length > 0 && <span className="absolute -top-0.5 -right-0.5 size-2.5 rounded-full bg-success ring-2 ring-surface motion-safe:animate-pulse" />}
        </span>
        <div className="min-w-0 flex-1">
          <h3 className="text-base font-bold">{forTeacher ? 'Şu an çalışanlar' : 'Sanal etüt'}</h3>
          <p className="mt-0.5 text-sm text-muted">
            {peers.length
              ? forTeacher
                ? `${peers.length} öğrenciniz sayaçla çalışıyor.`
                : `Şu an ${peers.length} arkadaşın çalışıyor.`
              : 'Şu an etütte başka kimse yok.'}
          </p>
        </div>
      </div>
      {peers.length > 0 && (
        <ul className="mt-3 flex flex-wrap gap-2" aria-label="Çalışanlar">
          {peers.map((p) => (
            <li key={p.id} className="flex items-center gap-2 rounded-full border border-line bg-surface py-1 pr-3 pl-1 text-sm">
              <Avatar name={p.name} userId={p.id} className="size-7 text-[11px]" />
              <span className="font-semibold">{p.name}</span>
              <span className="text-muted">
                {p.subject} · {since(p.since)}
              </span>
            </li>
          ))}
        </ul>
      )}
      {showToggle && (
        <label className="mt-4 flex min-h-11 items-center justify-between gap-3 border-t border-line pt-3 text-sm">
          <span>
            <span className="font-semibold">Etütte görün</span>
            <span className="block text-muted">Sayaç çalışırken adın ve dersin öğretmeninin diğer öğrencilerine görünür.</span>
          </span>
          <Switch checked={visible} onCheckedChange={setStudyRoomVisible} label="Etütte görün" />
        </label>
      )}
    </Card>
  )
}
