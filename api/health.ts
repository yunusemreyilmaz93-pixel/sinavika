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
  return json(
    {
      ok,
      checks,
      version: process.env.VERCEL_GIT_COMMIT_SHA?.slice(0, 7) ?? 'local',
    },
    ok ? 200 : 503,
  )
})
