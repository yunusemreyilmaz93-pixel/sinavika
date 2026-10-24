// vite build sonrası çalışır. dist içine sayfa başına HTML, 404, robots.txt ve sitemap.xml yazar
import { mkdirSync, readFileSync, writeFileSync } from 'node:fs'
import { dirname, join } from 'node:path'
import { pageHead, siteUrl, withSite } from './html.mjs'
import { appPages } from './pages.mjs'
import { buildPublicLessons } from './public/lessons.mjs'
import { buildDepartments } from './public/departments.mjs'
import { buildPublicTools } from './public/tools.mjs'

const dist = join(process.cwd(), 'dist')
const site = siteUrl()

function write(file, content) {
  const target = join(dist, file)
  mkdirSync(dirname(target), { recursive: true })
  writeFileSync(target, content)
}

// Ana sayfadaki hızlı ilk görünüm yalnızca index.html'de kalır, diğer sayfaların kabuğuna girmez
export function buildShell() {
  const full = withSite(readFileSync(join(dist, 'index.html'), 'utf8'), site)
  write('index.html', full)
  return full.replace(/\s*<!--pre-landing-->[\s\S]*?<!--\/pre-landing-->/, '')
}

export function sitemapXml(urls) {
  const items = urls
    .map((u) => `  <url><loc>${site}${u.path}</loc>${u.lastmod ? `<lastmod>${u.lastmod}</lastmod>` : ''}</url>`)
    .join('\n')
  return `<?xml version="1.0" encoding="UTF-8"?>\n<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">\n${items}\n</urlset>\n`
}

export function robotsTxt() {
  return `User-agent: *\nAllow: /\nDisallow: /app\nDisallow: /api/\nDisallow: /rapor/\n\nSitemap: ${site}/sitemap.xml\n`
}

async function main() {
  const shell = buildShell()
  const urls = [{ path: '/' }]

  for (const page of appPages) {
    write(`${page.path.slice(1)}.html`, pageHead(shell, { ...page, site }))
    if (page.sitemap) urls.push({ path: page.path })
  }

  const cssHref = shell.match(/<link rel="stylesheet"[^>]*href="([^"]+\.css)"/)?.[1]
  const lessons = await buildPublicLessons({ write, shell, cssHref, site })
  urls.push(...lessons.urls)
  const tools = await buildPublicTools({ write, shell, cssHref, site, subjects: lessons.subjects })
  urls.push(...tools.urls)
  const departments = await buildDepartments({ write, shell, cssHref, site })
  urls.push(...departments.urls)

  write('404.html', pageHead(shell, { path: '/', title: 'Sayfa bulunamadı · Yolumnet', description: 'Aradığınız sayfa bulunamadı.', noindex: true, site }))
  write('robots.txt', robotsTxt())
  write('sitemap.xml', sitemapXml(urls))
  console.log(`SEO: ${appPages.length + 1} uygulama sayfası, ${lessons.urls.length} anlatım, ${tools.urls.length} araç ve program, ${departments.urls.length} bölüm sayfası, ${urls.length} adres sitemap'te (${site})`)
}

if (import.meta.url === `file://${process.argv[1]}`) await main()
