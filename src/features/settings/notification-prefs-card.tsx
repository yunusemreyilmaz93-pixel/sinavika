import { useMutation, useQuery, useQueryClient } from '@tanstack/react-query'
import { BellOff } from 'lucide-react'
import { toast } from 'sonner'
import { Select } from '@/components/ui/field'
import { Skeleton } from '@/components/ui/skeleton'
import { Switch } from '@/components/ui/switch'
import { useProfile } from '@/features/auth/session'
import { errorMessage, supabase, unwrap } from '@/lib/supabase'
import { SettingsCard } from './ui'

type Kind = 'task' | 'note' | 'message' | 'join' | 'report' | 'announcement' | 'reminder' | 'meeting'
type Level = 'on' | 'app' | 'off'
type Prefs = { muted: string[]; push_muted: string[]; quiet_night: boolean }

const labels: Record<Kind, string> = {
  task: 'Yeni görev',
  note: 'Paylaşılan not',
  message: 'Mesaj',
  join: 'Öğrenci ve veli katılımı',
  report: 'Haftalık rapor ve özet',
  announcement: 'Duyuru',
  reminder: 'Günlük hatırlatma',
  meeting: 'Görüşme',
}

const byRole: Record<string, Kind[]> = {
  teacher: ['message', 'meeting', 'join', 'report', 'announcement'],
  student: ['task', 'message', 'meeting', 'note', 'reminder', 'announcement'],
  parent: ['message', 'report', 'note', 'announcement'],
}

const empty: Prefs = { muted: [], push_muted: [], quiet_night: false }
const key = ['notification-prefs'] as const

function levelOf(prefs: Prefs, kind: Kind): Level {
  if (prefs.muted.includes(kind)) return 'off'
  if (prefs.push_muted.includes(kind)) return 'app'
  return 'on'
}

function withLevel(prefs: Prefs, kind: Kind, level: Level): Prefs {
  const drop = (list: string[]) => list.filter((k) => k !== kind)
  return {
    ...prefs,
    muted: level === 'off' ? [...drop(prefs.muted), kind] : drop(prefs.muted),
    push_muted: level === 'app' ? [...drop(prefs.push_muted), kind] : drop(prefs.push_muted),
  }
}

export function NotificationPrefsCard() {
  const profile = useProfile()
  const queryClient = useQueryClient()
  const prefs = useQuery({
    queryKey: key,
    queryFn: async () =>
      unwrap(await supabase.from('notification_prefs').select('muted, push_muted, quiet_night').eq('user_id', profile.id).maybeSingle()) ??
      empty,
  })

  const save = useMutation({
    mutationFn: async (next: Prefs) =>
      unwrap(
        await supabase
          .from('notification_prefs')
          .upsert({ ...next, updated_at: new Date().toISOString() }, { onConflict: 'user_id' })
          .select('muted, push_muted, quiet_night')
          .single(),
      ),
    onMutate: async (next) => {
      await queryClient.cancelQueries({ queryKey: key })
      const previous = queryClient.getQueryData<Prefs>(key)
      queryClient.setQueryData(key, next)
      return { previous }
    },
    onError: (error, _, context) => {
      queryClient.setQueryData(key, context?.previous)
      toast.error(errorMessage(error))
    },
    onSettled: () => queryClient.invalidateQueries({ queryKey: key }),
  })

  const kinds = byRole[profile.role] ?? []
  const current = prefs.data ?? empty

  return (
    <SettingsCard
      icon={BellOff}
      title="Bildirim tercihleri"
      description="Kapatılan türde bildirim oluşmaz. Hesap ve güvenlik bildirimleri kapatılamaz."
    >
      {prefs.isPending ? (
        <Skeleton className="h-48 rounded-2xl" />
      ) : (
        <div className="divide-y divide-line">
          {kinds.map((kind) => (
            <label key={kind} className="flex min-h-14 flex-wrap items-center justify-between gap-x-4 gap-y-2 py-2">
              <span className="font-semibold">{labels[kind]}</span>
              <Select
                value={levelOf(current, kind)}
                onChange={(e) => save.mutate(withLevel(current, kind, e.target.value as Level))}
                className="w-auto min-w-48"
              >
                <option value="on">Uygulamada ve telefonda</option>
                <option value="app">Yalnızca uygulamada</option>
                <option value="off">Kapalı</option>
              </Select>
            </label>
          ))}
          <div className="flex min-h-14 items-center justify-between gap-4 pt-3">
            <span>
              <span className="block font-semibold">Gece sessizliği</span>
              <span className="block text-sm text-muted">22.00 ile 08.00 arası telefona bildirim gönderilmez</span>
            </span>
            <Switch
              label="Gece sessizliği"
              checked={current.quiet_night}
              onCheckedChange={(quiet_night) => save.mutate({ ...current, quiet_night })}
            />
          </div>
        </div>
      )}
    </SettingsCard>
  )
}
