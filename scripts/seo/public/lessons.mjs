import { join } from 'node:path'
import { escapeHtml } from '../html.mjs'
import { loadTs } from '../ts-load.mjs'
import { renderBlocks } from './blocks.mjs'
import { loadCurriculum } from './data.mjs'
import { layout } from './layout.mjs'
import { examLabels, subjectSlug, topicSlugs } from './slugs.mjs'
import { createMarkdown } from './markdown.mjs'

const BASE = '/konu-anlatimi'

function cut(text, max) {
  const clean = text.replace(/\s+/g, ' ').trim()
  if (clean.length <= max) return clean
  const slice = clean.slice(0, max - 1)
  return `${slice.slice(0, slice.lastIndexOf(' ') > 60 ? slice.lastIndexOf(' ') : max - 1)}...`
}

function describe(blocks, parse, fallback) {
  for (const block of blocks) {
    if (block.type !== 'md') continue
    const paragraphs = block.text
      .split(/\n{2,}/)
      .map((p) => p.trim())
      .filter((p) => p && !/^(#|>|\||[-*+]\s|\d+[.)]\s|!\[|\$\$)/.test(p))
    if (paragraphs[0]) return cut(parse.plainText(paragraphs[0]), 155)
  }
  return fallback
}

const dateOf = (iso) => (iso ? String(iso).slice(0, 10) : undefined)

export async function buildPublicLessons({ write, shell, cssHref, site }) {
  const data = await loadCurriculum()
  if (!data) {
    console.warn('SEO: Supabase anahtarı yok, anlatım sayfaları üretilmedi')
    return { urls: [], exams: [] }
  }
  if (!data.lessons.length) {
    console.warn('SEO: yayında anlatım okunamadı (lessons_public_read uygulanmamış olabilir), anlatım sayfaları üretilmedi')
    return { urls: [], exams: [] }
  }
  const parse = await loadTs(join(process.cwd(), 'shared/lesson-parse.ts'))
  const lessonByTopic = new Map(data.lessons.map((l) => [l.topic_id, l]))
  const topicsBySubject = new Map()
  for (const t of [...data.topics].sort((a, b) => a.sort - b.sort)) {
    if (!lessonByTopic.has(t.id)) continue
    topicsBySubject.set(t.subject_id, [...(topicsBySubject.get(t.subject_id) ?? []), t])
  }

  const exams = []
  const topicPath = new Map()
  const subjectInfo = []
  for (const key of Object.keys(examLabels)) {
    const subjects = data.subjects
      .filter((s) => s.exam.toLowerCase() === key && topicsBySubject.has(s.id))
      .sort((a, b) => a.sort - b.sort)
    if (!subjects.length) continue
    exams.push(key)
    for (const subject of subjects) {
      const topics = topicsBySubject.get(subject.id)
      const slugs = topicSlugs(topics)
      const info = { key, subject, slug: subjectSlug(subject), topics: topics.map((t) => ({ ...t, slug: slugs.get(t.id) })) }
      for (const t of info.topics) topicPath.set(t.id, `${BASE}/${key}/${info.slug}/${t.slug}`)
      subjectInfo.push(info)
    }
  }
  const topicUrl = (id) => topicPath.get(id) ?? null
  const urls = []
  const examLinks = exams.map((k) => [`${BASE}/${k}`, examLabels[k].name])
  const wrap = (opts) => layout({ shell, cssHref, site, examLinks, ...opts })

  const crumbs = (items) => ({
    '@context': 'https://schema.org',
    '@type': 'BreadcrumbList',
    itemListElement: items.map(([name, path], i) => ({ '@type': 'ListItem', position: i + 1, name, item: `${site}${path}` })),
  })
  const crumbHtml = (items) =>
    `<nav class="crumbs" aria-label="Sayfa yolu">${items
      .map(([name, path], i) => (i < items.length - 1 ? `<a href="${path}">${escapeHtml(name)}</a><span>/</span>` : escapeHtml(name)))
      .join('')}</nav>`

  const cta = `<aside class="cta"><h2>Çalışmanızı Yolumnet'te takip edin</h2><p>Yolumnet, LGS ve YKS öğrencileri için ücretsiz ve reklamsız bir koçluk uygulamasıdır. Öğretmeniniz size haftalık görev verir, soru çözümünüzü ve denemelerinizi takip eder. Mini testler ve ilerleme kaydı uygulamada çalışır.</p><div class="row"><a class="btn" href="/katil">Davet koduyla katıl</a><a class="btn" href="/ogretmen-basvurusu">Öğretmen başvurusu</a></div></aside>`

  // Konu sayfaları
  for (const info of subjectInfo) {
    const exam = examLabels[info.key]
    info.topics.forEach((topic, index) => {
      const lesson = lessonByTopic.get(topic.id)
      const path = `${BASE}/${info.key}/${info.slug}/${topic.slug}`
      const blocks = parse.parseBlocks(lesson.body)
      const md = createMarkdown({ topicUrl })
      const html = renderBlocks(blocks, { md, parse })
      const outline = parse.outlineOf(lesson.body)
      const description = describe(blocks, parse, `${topic.name} konusunun anlatımı, örnekler ve çözümlü sorular. ${exam.name} ${info.subject.name}.`)
      const prev = info.topics[index - 1]
      const next = info.topics[index + 1]
      const related = info.topics.filter((t) => t.id !== topic.id).slice(Math.max(0, index - 3), Math.max(0, index - 3) + 6).slice(0, 5)
      const full = `${topic.name} konu anlatımı · ${exam.name} ${info.subject.name} · Yolumnet`
      const title = full.length <= 70 ? full : `${topic.name} konu anlatımı · ${exam.name} ${info.subject.name}`
      const trail = [['Ana sayfa', '/'], ['Konu anlatımları', BASE], [exam.name, `${BASE}/${info.key}`], [info.subject.name, `${BASE}/${info.key}/${info.slug}`], [topic.name, path]]
      const body = `<main><div class="wrap">${crumbHtml(trail)}
<p class="kicker">${exam.name} · ${escapeHtml(info.subject.name)}</p>
<h1>${escapeHtml(topic.name)}</h1>
<p class="meta">Yaklaşık ${lesson.reading_minutes} dakikalık okuma · Yolumnet editör ekibi · Son güncelleme ${dateOf(lesson.updated_at) ?? ''}</p>
${outline.length > 1 ? `<nav class="toc" aria-label="İçindekiler"><h2>İçindekiler</h2><ol>${outline.map((o) => `<li><a href="#${o.id}">${escapeHtml(o.title)}</a></li>`).join('')}</ol></nav>` : ''}
<article>${html}</article>
${cta}
<nav class="pager" aria-label="Önceki ve sonraki konu">${prev ? `<a class="prev" href="${BASE}/${info.key}/${info.slug}/${prev.slug}"><small>Önceki konu</small>${escapeHtml(prev.name)}</a>` : '<span></span>'}${next ? `<a class="next" href="${BASE}/${info.key}/${info.slug}/${next.slug}"><small>Sonraki konu</small>${escapeHtml(next.name)}</a>` : ''}</nav>
${related.length ? `<section class="section"><h2>${escapeHtml(info.subject.name)} dersinin diğer konuları</h2><ul class="list">${related.map((t) => `<li><a href="${BASE}/${info.key}/${info.slug}/${t.slug}"><b>${escapeHtml(t.name)}</b></a></li>`).join('')}</ul></section>` : ''}
</div></main>`
      write(`${path.slice(1)}.html`, wrap({
        title,
        description,
        path,
        body,
        ld: [
          {
            '@context': 'https://schema.org',
            '@type': 'Article',
            headline: `${topic.name} konu anlatımı`,
            description,
            inLanguage: 'tr',
            dateModified: dateOf(lesson.updated_at),
            mainEntityOfPage: `${site}${path}`,
            author: { '@type': 'Organization', name: 'Yolumnet editör ekibi' },
            publisher: { '@type': 'Organization', name: 'Yolumnet', logo: { '@type': 'ImageObject', url: `${site}/pwa-512.png` } },
            about: `${exam.name} ${info.subject.name}`,
            educationalLevel: exam.name,
            isAccessibleForFree: true,
          },
          crumbs(trail),
        ],
      }))
      urls.push({ path, lastmod: dateOf(lesson.updated_at) })
    })
  }

  // Ders sayfaları
  for (const info of subjectInfo) {
    const exam = examLabels[info.key]
    const path = `${BASE}/${info.key}/${info.slug}`
    const trail = [['Ana sayfa', '/'], ['Konu anlatımları', BASE], [exam.name, `${BASE}/${info.key}`], [info.subject.name, path]]
    const body = `<main><div class="wrap">${crumbHtml(trail)}
<p class="kicker">${exam.name}</p>
<h1>${exam.name} ${escapeHtml(info.subject.name)} konu anlatımları</h1>
<p class="lead">${info.topics.length} konu, her birinde anlatım, örnekler ve çözümlü sorular. Konuları sırayla okuyabilir ya da ihtiyacınız olan konuya doğrudan geçebilirsiniz.</p>
<ol class="list">${info.topics.map((t) => `<li><a href="${path}/${t.slug}"><b>${escapeHtml(t.name)}</b><span>${lessonByTopic.get(t.id).reading_minutes} dakikalık okuma</span></a></li>`).join('')}</ol>
${cta}</div></main>`
    write(`${path.slice(1)}.html`, wrap({
      title: `${exam.name} ${info.subject.name} konu anlatımları · Yolumnet`,
      description: cut(`${exam.name} ${info.subject.name} dersinin ${info.topics.length} konusu: ${info.topics.slice(0, 5).map((t) => t.name).join(', ')} ve daha fazlası. Anlatım, örnek ve çözümlü sorular.`, 158),
      path,
      body,
      ld: [
        { '@context': 'https://schema.org', '@type': 'CollectionPage', name: `${exam.name} ${info.subject.name} konu anlatımları`, inLanguage: 'tr', hasPart: info.topics.map((t) => ({ '@type': 'Article', name: t.name, url: `${site}${path}/${t.slug}` })) },
        crumbs(trail),
      ],
    }))
    urls.push({ path, lastmod: dateOf(info.topics.map((t) => lessonByTopic.get(t.id).updated_at).sort().at(-1)) })
  }

  // Sınav sayfaları
  for (const key of exams) {
    const exam = examLabels[key]
    const path = `${BASE}/${key}`
    const subjects = subjectInfo.filter((i) => i.key === key)
    const count = subjects.reduce((n, s) => n + s.topics.length, 0)
    const trail = [['Ana sayfa', '/'], ['Konu anlatımları', BASE], [exam.name, path]]
    const body = `<main><div class="wrap">${crumbHtml(trail)}
<p class="kicker">${exam.long}</p>
<h1>${exam.name} konu anlatımları</h1>
<p class="lead">${exam.name}, ${exam.intro}. ${subjects.length} dersin ${count} konusu için ücretsiz anlatım, örnek ve çözümlü soru.</p>
<div class="cards">${subjects.map((s) => `<a class="card" href="${path}/${s.slug}"><h2>${escapeHtml(s.subject.name)}</h2><p>${s.topics.length} konu</p></a>`).join('')}</div>
${cta}</div></main>`
    write(`${path.slice(1)}.html`, wrap({
      title: `${exam.name} konu anlatımları, ders ders · Yolumnet`,
      description: cut(`${exam.long} (${exam.name}) için ${subjects.map((s) => s.subject.name).join(', ')} derslerinin konu anlatımları. Ücretsiz, reklamsız, çözümlü sorularla.`, 158),
      path,
      body,
      ld: [
        { '@context': 'https://schema.org', '@type': 'CollectionPage', name: `${exam.name} konu anlatımları`, inLanguage: 'tr', hasPart: subjects.map((s) => ({ '@type': 'CollectionPage', name: `${exam.name} ${s.subject.name}`, url: `${site}${path}/${s.slug}` })) },
        crumbs(trail),
      ],
    }))
    urls.push({ path })
  }

  // Ana sayfa
  const total = subjectInfo.reduce((n, s) => n + s.topics.length, 0)
  const trail = [['Ana sayfa', '/'], ['Konu anlatımları', BASE]]
  const body = `<main><div class="wrap">${crumbHtml(trail)}
<h1>Konu anlatımları</h1>
<p class="lead">LGS, TYT ve YDT için ${total} konu anlatımı. Hepsi ücretsiz, reklamsız ve üyelik gerektirmeden okunur.</p>
<div class="cards">${exams.map((k) => `<a class="card" href="${BASE}/${k}"><h2>${examLabels[k].name}</h2><p>${examLabels[k].long}</p></a>`).join('')}</div>
${cta}</div></main>`
  write(`${BASE.slice(1)}.html`, wrap({
    title: 'LGS, TYT ve YDT konu anlatımları · Yolumnet',
    description: `LGS, TYT ve YDT için ${total} konu anlatımı. Ücretsiz, reklamsız, örnekli ve çözümlü sorularla.`,
    path: BASE,
    body,
    ld: [{ '@context': 'https://schema.org', '@type': 'CollectionPage', name: 'Konu anlatımları', inLanguage: 'tr' }, crumbs(trail)],
  }))
  urls.push({ path: BASE })

  return { urls, exams }
}
