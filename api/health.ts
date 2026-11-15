import { realtimeConfig } from './_lib/meeting.js'
import { isConfigured } from './_lib/ai/crypto.js'
import { admin, handle, json } from './_lib/server.js'

const tables = ['profiles', 'invites', 'app_settings', 'subjects', 'topics', 'push_subscriptions', 'wrong_questions', 'video_progress'] as const

export const GET = handle(async () => {
  const checks: Record<string, boolean> = {
    supabase_url: Boolean(process.env.SUPABASE_URL || process.env.NEXT_PUBLIC_SUPABASE_URL),
    service_key: Boolean(process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.SUPABASE_SECRET_KEY),
  }

  if (checks.supabase_url && checks.service_key) {
    const results = await Promise.all(tables.map((t) => admin().from(t).select('*', { count: 'exact', head: true })))
    tables.forEach((t, i) => {
      checks[`table_${t}`] = !results[i].error
    })
    const { data } = await admin().from('subjects').select('id').limit(1)
    checks.curriculum = Boolean(data?.length)
  }

  const ok = Object.values(checks).every(Boolean)
  const lastBackup = checks.service_key ? await admin().from('app_settings').select('value').eq('key', 'last_backup').maybeSingle() : null
  const backupAt = (lastBackup?.data?.value as { at?: string } | undefined)?.at ?? null
  return json(
    {
      ok,
      checks,
      optional: {
        ai_assistant: isConfigured(),
        meetings: realtimeConfig() !== null,
        backup: backupAt !== null && Date.now() - Date.parse(backupAt) < 36 * 60 * 60 * 1000,
      },
      last_backup: backupAt,
      version: (process.env.COMMIT_SHA || process.env.VERCEL_GIT_COMMIT_SHA)?.slice(0, 7) ?? 'local',
    },
    ok ? 200 : 503,
  )
})
