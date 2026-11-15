import { join } from 'node:path'
import { escapeHtml } from '../html.mjs'
import { loadTs } from '../ts-load.mjs'
import { renderBlocks } from './blocks.mjs'
import { loadPosts } from './data.mjs'
import { ctaBand, hero, icon, layout } from './layout.mjs'
import { createMarkdown } from './markdown.mjs'

const BASE = '/blog'
const audience = { genel: 'Herkes için', ogrenci: 'Öğrenciler için', veli: 'Veliler için', ogretmen: 'Öğretmenler için' }
const date = (iso) => (iso ? new Date(iso).toLocaleDateString('tr-TR', { day: 'numeric', month: 'long', year: 'numeric', timeZone: 'Europe/Istanbul' }) : '')
const day = (iso) => (iso ? String(iso).slice(0, 10) : undefined)

const css = `<style>
.pub .posts{list-style:none;margin:0;padding:0;display:grid;gap:.9rem;grid-template-columns:repeat(auto-fill,minmax(min(100%,20rem),1fr))}
.pub .posts a{display:flex;flex-direction:column;height:100%;padding:1.2rem;border:1px solid var(--line);border-radius:1.5rem;background:var(--surface);color:var(--fg);text-decoration:none}
.pub .posts a:hover{border-color:var(--line-strong)}
.pub .posts .tag{align-self:flex-start}
.pub .posts h2{font-size:1.15rem;margin-top:.6rem}
.pub .posts p{margin:.4rem 0 0;color:var(--fg-muted);font-size:.95rem}
.pub .posts .facts{margin-top:auto;padding-top:.8rem}
.pub .post{max-width:46rem;padding-top:1.5rem}
</style>`

// Blog: yayındaki yazılar /blog ve /blog/:slug olarak üretilir. Gövde konu anlatımlarıyla aynı Markdown blok dilindedir
export async function buildBlog({ write, shell, cssHref, site, examLinks = [], topicUrl = () => null, posts = null }) {
  posts ??= await loadPosts()
  const parse = await loadTs(join(process.cwd(), 'shared/lesson-parse.ts'))
  const wrap = (opts) => layout({ shell, cssHref, site, examLinks, ...opts }).replace('</head>', `${css}\n</head>`)
  const crumbsLd = (items) => ({
    '@context': 'https://schema.org',
    '@type': 'BreadcrumbList',
    itemListElement: items.map(([name, path], i) => ({ '@type': 'ListItem', position: i + 1, name, item: `${site}${path}` })),
  })
  const urls = []

  for (const post of posts) {
    const path = `${BASE}/${post.slug}`
    const trail = [['Ana sayfa', '/'], ['Blog', BASE], [post.title, path]]
    const html = renderBlocks(parse.parseBlocks(post.body), { md: createMarkdown({ topicUrl }), parse })
    const description = post.summary || parse.plainText(post.body).slice(0, 155)
    const body = `<main>${hero({
      crumbs: trail,
      pill: `${icon('Newspaper')}${audience[post.audience] ?? 'Herkes için'}`,
      title: escapeHtml(post.title),
      lead: escapeHtml(post.summary),
      lead2: `<div class="chips"><span class="tag">${icon('Clock')}${post.reading_minutes} dk okuma</span><span class="tag">${icon('CalendarDays')}${date(post.published_at)}</span></div>`,
    })}
<div class="wide"><div class="post"><article>${html}</article>
<p class="meta">Son güncelleme ${date(post.updated_at)}</p>
${ctaBand}</div></div></main>`
    write(`${path.slice(1)}.html`, wrap({
      title: `${post.title} · İzlek`,
      description,
      path,
      body,
      ld: [
        {
          '@context': 'https://schema.org',
          '@type': 'BlogPosting',
          headline: post.title,
          description,
          image: `${site}/og.png`,
          datePublished: day(post.published_at),
          dateModified: day(post.updated_at),
          inLanguage: 'tr',
          mainEntityOfPage: `${site}${path}`,
          author: { '@type': 'Organization', name: 'İzlek', url: `${site}/hakkinda` },
          publisher: { '@type': 'Organization', name: 'İzlek', logo: { '@type': 'ImageObject', url: `${site}/pwa-512.png` } },
        },
        crumbsLd(trail),
      ],
    }))
    urls.push({ path, lastmod: day(post.updated_at) })
  }

  const trail = [['Ana sayfa', '/'], ['Blog', BASE]]
  const body = `<main>${hero({ crumbs: trail, title: 'İzlek <mark>blog</mark>', lead: 'LGS ve YKS hazırlığı, çalışma düzeni ve koçluk üzerine yazılar.' })}
<div class="wide page">${posts.length ? `<ul class="posts">${posts
    .map(
      (p) =>
        `<li><a href="${BASE}/${p.slug}"><span class="tag">${audience[p.audience] ?? 'Herkes için'}</span><h2>${escapeHtml(p.title)}</h2>${p.summary ? `<p>${escapeHtml(p.summary)}</p>` : ''}<span class="facts"><span>${icon('Clock')}${p.reading_minutes} dk</span><span>${icon('CalendarDays')}${date(p.published_at)}</span></span></a></li>`,
    )
    .join('')}</ul>` : `<p>Henüz yazı yok. Bu arada <a href="/konu-anlatimi">konu anlatımlarına</a> göz atabilirsiniz.</p>`}
${ctaBand}</div></main>`
  write(`${BASE.slice(1)}.html`, wrap({
    title: 'Blog · İzlek',
    description: 'LGS ve YKS hazırlığı, çalışma düzeni ve koçluk üzerine yazılar.',
    path: BASE,
    noindex: !posts.length,
    body,
    ld: [{ '@context': 'https://schema.org', '@type': 'Blog', name: 'İzlek blog', url: `${site}${BASE}`, inLanguage: 'tr' }, crumbsLd(trail)],
  }))
  if (posts.length) urls.push({ path: BASE, lastmod: day(posts[0].updated_at) })
  return { urls, count: posts.length }
}
