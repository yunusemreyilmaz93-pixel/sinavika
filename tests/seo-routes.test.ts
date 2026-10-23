// @vitest-environment node
import { readFileSync } from 'node:fs'
import { describe, expect, it } from 'vitest'
// @ts-expect-error saf JavaScript modül
import { pageHead } from '../scripts/seo/html.mjs'
// @ts-expect-error saf JavaScript modül
import { appPages } from '../scripts/seo/pages.mjs'

const router = readFileSync(new URL('../src/router.tsx', import.meta.url), 'utf8')
const vercel = JSON.parse(readFileSync(new URL('../vercel.json', import.meta.url), 'utf8')) as {
  rewrites: { source: string; destination: string }[]
}

// Üst düzey rotalar: hizalama 6 boşlukla başlayan `{ path: '...'` satırları
const topLevel = [...router.matchAll(/^ {6}(?: {4})?\{ path: '([^*][^']*)'/gm)].map((m) => m[1])

describe('rota koruması', () => {
  it('router.tsx üst düzey rotaları okunabiliyor', () => {
    expect(topLevel).toEqual(expect.arrayContaining(['hakkinda', 'kvkk', 'giris', 'katil', 'rapor/:token']))
  })

  it('her uygulama rotası ya kendi HTML dosyasına ya da rewrite kuralına sahip, yoksa 404 olur', () => {
    const rewritten = vercel.rewrites.map((r) => r.source)
    const app = router.match(/path: 'app',/) ? ['app'] : []
    for (const path of [...topLevel, ...app]) {
      const root = path.split('/')[0]
      const covered = rewritten.some((s) => s.startsWith(`/${root}/`) || s === `/${root}`)
      expect(covered, `/${path} yayında 404 verir`).toBe(true)
    }
  })

  it('üretilen her uygulama sayfası kendi HTML dosyasına yönlenir', () => {
    for (const page of appPages as { path: string }[]) {
      const rule = vercel.rewrites.find((r) => r.source === page.path)
      expect(rule?.destination, page.path).toBe(`${page.path}.html`)
    }
  })

  it('giriş ve uygulama sayfaları arama motoruna kapalı', () => {
    for (const p of appPages.filter((p: { path: string }) => ['/giris', '/katil', '/test-giris'].includes(p.path))) expect(p.noindex).toBe(true)
  })
})

describe('pageHead', () => {
  const shell = readFileSync(new URL('../index.html', import.meta.url), 'utf8')

  it('başlık, açıklama ve canonical sayfaya göre değişir', () => {
    const html = pageHead(shell, { path: '/hakkinda', title: 'Hakkında "x"', description: 'Kısa <açıklama>', site: 'https://ornek.com' })
    expect(html).toContain('<title>Hakkında &quot;x&quot;</title>')
    expect(html).toContain('<link rel="canonical" href="https://ornek.com/hakkinda" />')
    expect(html).toContain('content="Kısa &lt;açıklama&gt;"')
    expect(html).not.toContain('noindex')
  })

  it('noindex sayfaya robots etiketi ekler', () => {
    const html = pageHead(shell, { path: '/giris', title: 'Giriş', description: 'x', noindex: true, site: 'https://ornek.com' })
    expect(html).toContain('<meta name="robots" content="noindex, nofollow" />')
  })
})
