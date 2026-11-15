// Yayın öncesi duman testi. Gerçek tarayıcıyla verilen adresi açar:
//   node scripts/smoke.mjs https://preview-izlek.yunusemreyilmaz93.workers.dev
// 1. Herkese açık sayfalar gerçek sunucudan gelir: durum kodu, başlık, konsol hatası, yatay kaydırma, güvenlik başlıkları
// 2. Uygulama ekranları her rol için sahte bir oturumla açılır, Supabase istekleri boş cevapla karşılanır. Amaç verinin değil,
//    yayınlanan paketin her ekranı hatasız çizdiğinin denetlenmesidir (eksik rota, yüklenemeyen parça, çalışma zamanı hatası)
// Playwright bu makinede genel olarak kurulu, projeye bağımlılık eklenmez
import { createRequire } from 'node:module'

const require = createRequire(import.meta.url)
const { chromium, devices } = require('playwright')

const base = (process.argv[2] || 'https://izlek.site').replace(/\/$/, '')
const failures = []
const fail = (where, what) => failures.push(`${where}: ${what}`)

const publicPages = [
  ['/', 200],
  ['/giris', 200],
  ['/katil', 200],
  ['/durum', 200],
  ['/kvkk', 200],
  ['/hakkinda', 200],
  ['/ogretmen-basvurusu', 200],
  ['/sifre-yenile?token_hash=smoke', 200],
  ['/konu-anlatimi', 200],
  ['/kaynaklar', 200],
  ['/blog', 200],
  ['/araclar/net-hesaplama', 200],
  ['/araclar/lgs-puan-hesaplama', 200],
  ['/yks-bolumleri', 200],
  ['/bu-sayfa-yok-smoke', 404],
]

const appPages = {
  teacher: ['/app', '/app/sinif', '/app/planlayici', '/app/sablonlar', '/app/mufredat', '/app/testler', '/app/mesajlar', '/app/gorusmeler', '/app/duyurular', '/app/davetler', '/app/bildirimler', '/app/asistan', '/app/ayarlar', '/app/yonetim'],
  student: ['/app', '/app/plan', '/app/ilerleme', '/app/denemeler', '/app/deneme-ekle', '/app/konular', '/app/okuma', '/app/notlar', '/app/yanlislar', '/app/testler', '/app/sayac', '/app/gorusmeler', '/app/mesajlar', '/app/ayarlar'],
  parent: ['/app', '/app/plan', '/app/ilerleme', '/app/denemeler', '/app/mesajlar', '/app/ayarlar'],
}

const ignorable = (text) => /favicon|ERR_ABORTED|net::ERR_FAILED.*(hit|beacon)|status of 40[14]|Failed to load resource/i.test(text)

function watch(page, where) {
  page.on('pageerror', (e) => fail(where, `sayfa hatası: ${e.message.slice(0, 200)}`))
  page.on('console', (m) => {
    if (m.type() === 'error' && !ignorable(m.text())) fail(where, `konsol: ${m.text().slice(0, 200)}`)
  })
}

async function checkLayout(page, where) {
  const { width, scroll, h1, crashed } = await page.evaluate(() => ({
    width: window.innerWidth,
    scroll: document.documentElement.scrollWidth,
    h1: document.querySelector('h1')?.textContent?.trim() ?? '',
    crashed: /Bir şeyler ters gitti/.test(document.body.innerText),
  }))
  if (crashed) fail(where, 'hata ekranı açıldı')
  if (!h1) fail(where, 'sayfada başlık yok')
  if (scroll > width + 1) fail(where, `yatay kaydırma var (${scroll} > ${width})`)
}

async function publicChecks(browser) {
  const health = await fetch(`${base}/api/health`).then((r) => r.json()).catch(() => null)
  if (!health?.ok) fail('/api/health', JSON.stringify(health?.checks ?? 'ulaşılamadı'))
  console.log(`sürüm ${health?.version ?? '?'}, isteğe bağlı: ${JSON.stringify(health?.optional ?? {})}`)

  const head = await fetch(base, { redirect: 'manual' })
  const policy = head.headers.get('permissions-policy') ?? ''
  if (!policy.includes('camera=(self)') || !policy.includes('microphone=(self)')) fail('başlıklar', `kamera ve mikrofon kapalı: ${policy}`)
  if (!head.headers.get('strict-transport-security')) fail('başlıklar', 'HSTS yok')
  const csp = head.headers.get('content-security-policy') ?? head.headers.get('content-security-policy-report-only')
  if (!csp) fail('başlıklar', 'CSP yok')

  const ctx = await browser.newContext({ ...devices['Pixel 5'], viewport: { width: 360, height: 760 } })
  for (const [path, status] of publicPages) {
    const page = await ctx.newPage()
    watch(page, path)
    page.on('console', (m) => {
      if (/Content Security Policy|Content-Security-Policy/i.test(m.text())) fail(path, `CSP ihlali: ${m.text().slice(0, 200)}`)
    })
    const res = await page.goto(base + path, { waitUntil: 'networkidle' }).catch((e) => fail(path, e.message))
    if (res && res.status() !== status) fail(path, `durum ${res.status()}, beklenen ${status}`)
    if (status === 200) await checkLayout(page, path)
    await page.close()
  }
  await ctx.close()
}

function fakeSession(role) {
  const id = { teacher: 'a0000000-0000-4000-8000-000000000001', student: 'a0000000-0000-4000-8000-000000000002', parent: 'a0000000-0000-4000-8000-000000000003' }[role]
  const b64 = (o) => Buffer.from(JSON.stringify(o)).toString('base64url')
  const exp = Math.floor(Date.now() / 1000) + 3600
  const user = { id, aud: 'authenticated', role: 'authenticated', email: 'smoke@ornek.com', app_metadata: {}, user_metadata: {}, created_at: '2026-10-01T00:00:00Z' }
  const token = `${b64({ alg: 'HS256', typ: 'JWT' })}.${b64({ sub: id, role: 'authenticated', exp, aud: 'authenticated', aal: 'aal2' })}.smoke`
  const profile = {
    id, role, full_name: 'Duman Testi', status: 'active', is_admin: role === 'teacher', is_test: true, accent: null, avatar: null,
    email: 'smoke@ornek.com', username: role === 'teacher' ? null : 'duman', school: null, branch: null, application_note: null,
    approved_at: '2026-10-01T00:00:00Z', consent_at: '2026-10-01T00:00:00Z', created_at: '2026-10-01T00:00:00Z', last_seen_at: null,
  }
  const student = { id, teacher_id: 'a0000000-0000-4000-8000-000000000001', track: 'lgs', grade: 8, field: null, target: null, daily_minutes_goal: 120, weekly_questions_goal: 500, archived_at: null, created_at: '2026-10-01T00:00:00Z' }
  return { id, user, token, exp, profile, student }
}

async function appChecks(browser) {
  for (const [role, paths] of Object.entries(appPages)) {
    const s = fakeSession(role)
    const ctx = await browser.newContext({ ...devices['Pixel 5'], viewport: { width: 360, height: 760 } })
    await ctx.addInitScript(([session]) => {
      localStorage.setItem('sinavika-auth', session)
      localStorage.setItem('izlek-kurulum-gizle', String(Date.now()))
    }, [JSON.stringify({ access_token: s.token, refresh_token: 'smoke', expires_in: 3600, expires_at: s.exp, token_type: 'bearer', user: s.user })])
    await ctx.route(/\/auth\/v1\//, (r) => r.fulfill({ json: r.request().url().includes('/factors') ? { all: [], totp: [] } : s.user }))
    await ctx.route(/\/rest\/v1\//, (r) => {
      const url = new URL(r.request().url())
      const table = url.pathname.split('/').pop()
      const single = (r.request().headers()['accept'] || '').includes('vnd.pgrst.object')
      let rows = []
      if (table === 'profiles' && url.search.includes(s.id)) rows = [s.profile]
      if (table === 'students' && role === 'student' && url.search.includes(s.id)) rows = [s.student]
      return r.fulfill({ json: single ? (rows[0] ?? null) : rows, headers: { 'content-range': `0-${rows.length}/${rows.length}` } })
    })
    await ctx.route(/\/storage\/v1\//, (r) => r.fulfill({ status: 404, body: '' }))
    await ctx.route(/\/api\/(?!health)/, (r) => r.fulfill({ json: {} }))
    for (const path of paths) {
      const where = `${role} ${path}`
      const page = await ctx.newPage()
      watch(page, where)
      await page.goto(base + path, { waitUntil: 'networkidle' }).catch((e) => fail(where, e.message))
      await page.waitForTimeout(800)
      if (!new URL(page.url()).pathname.startsWith('/app')) fail(where, `uygulamadan çıkarıldı: ${page.url()}`)
      await checkLayout(page, where)
      await page.close()
    }
    await ctx.close()
  }
}

const browser = await chromium.launch()
try {
  await publicChecks(browser)
  await appChecks(browser)
} finally {
  await browser.close()
}

if (failures.length) {
  console.error(`\n${failures.length} sorun:\n${failures.map((f) => `  - ${f}`).join('\n')}`)
  process.exit(1)
}
console.log(`Duman testi geçti: ${publicPages.length} herkese açık sayfa, ${Object.values(appPages).flat().length} uygulama ekranı (${base})`)
