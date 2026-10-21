import { useQuery } from '@tanstack/react-query'
import { Activity, RotateCw } from 'lucide-react'
import { Badge } from '@/components/ui/badge'
import { Button } from '@/components/ui/button'
import { Card } from '@/components/ui/card'
import { cn } from '@/lib/cn'

type Health = { ok: boolean; checks: Record<string, boolean>; optional?: Record<string, boolean>; version: string }

const labels: Record<string, string> = {
  supabase_url: 'Supabase adresi tanımlı',
  service_key: 'Sunucu anahtarı tanımlı',
  table_profiles: 'Kullanıcı tablosu',
  table_invites: 'Davet tablosu',
  table_app_settings: 'Uygulama ayarları',
  table_subjects: 'Ders listesi',
  table_topics: 'Konu listesi',
  table_push_subscriptions: 'Bildirim tablosu',
  table_wrong_questions: 'Yanlış soru defteri',
  table_video_progress: 'Video izleme kayıtları',
  curriculum: 'Müfredat yüklü',
}

const fixes: Record<string, string> = {
  supabase_url: 'Vercel ortam değişkenlerine SUPABASE_URL ekle, sonra yeniden yayınla.',
  service_key: 'Vercel ortam değişkenlerine SUPABASE_SERVICE_ROLE_KEY ekle, sonra yeniden yayınla.',
  curriculum: 'Veritabanı şeması kurulmamış olabilir. Supabase migration kayıtlarına bak.',
  table_push_subscriptions: 'Veritabanı güncellemesi uygulanmamış. Supabase panelinde GitHub entegrasyonunun son çalışmasına bak.',
  table_wrong_questions: 'Veritabanı güncellemesi uygulanmamış. Supabase panelinde GitHub entegrasyonunun son çalışmasına bak.',
  table_video_progress: 'Veritabanı güncellemesi uygulanmamış. Supabase panelinde GitHub entegrasyonunun son çalışmasına bak.',
}

async function fetchHealth(): Promise<Health> {
  const res = await fetch('/api/health', { cache: 'no-store' })
  const body = await res.json().catch(() => null)
  if (!body || typeof body.ok !== 'boolean') throw new Error(`Sunucu cevap vermedi (${res.status})`)
  return body
}

export function SystemHealthCard() {
  const health = useQuery({ queryKey: ['admin', 'health'], queryFn: fetchHealth, retry: false, staleTime: 30_000 })
  const failing = health.data ? Object.entries(health.data.checks).filter(([, ok]) => !ok) : []
  const down = health.isError || (health.data && !health.data.ok)

  return (
    <Card className="p-4">
      <div className="flex items-center gap-3">
        <div
          className={cn(
            'grid size-10 shrink-0 place-items-center rounded-xl',
            down ? 'bg-danger-soft text-danger' : 'bg-primary-soft text-primary-soft-fg',
          )}
        >
          <Activity className="size-5" />
        </div>
        <div className="min-w-0 flex-1">
          <p className="font-semibold">Sistem durumu</p>
          <p className="text-sm text-muted">
            {health.isPending
              ? 'Kontrol ediliyor'
              : health.isError
                ? 'Sunucu fonksiyonlarına ulaşılamıyor. Başvuru ve giriş çalışmıyor olabilir.'
                : down
                  ? `${failing.length} kontrol başarısız`
                  : `Her şey çalışıyor. Sürüm ${health.data?.version}`}
          </p>
        </div>
        <Badge tone={down ? 'danger' : 'primary'} className="hidden sm:inline-flex">
          {health.isPending ? 'Bekleniyor' : down ? 'Sorun var' : 'Çalışıyor'}
        </Badge>
        <Button variant="ghost" size="icon" aria-label="Yeniden kontrol et" onClick={() => health.refetch()} disabled={health.isFetching}>
          <RotateCw className={cn(health.isFetching && 'animate-spin')} />
        </Button>
      </div>
      {health.data?.optional?.ai_assistant === false && (
        <p className="mt-3 border-t border-line pt-3 text-sm text-muted">
          Yapay zekâ asistanı kapalı. Açmak için Vercel ortam değişkenlerine AI_KEY_SECRET ekle (en az 32 karakter, rastgele), sonra yeniden yayınla.
        </p>
      )}
      {failing.length > 0 && (
        <ul className="mt-3 space-y-2 border-t border-line pt-3 text-sm">
          {failing.map(([key]) => (
            <li key={key}>
              <p className="font-semibold text-danger">{labels[key] ?? key}</p>
              {fixes[key] && <p className="text-muted">{fixes[key]}</p>}
            </li>
          ))}
        </ul>
      )}
    </Card>
  )
}
