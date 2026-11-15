import { join } from 'node:path'
import { escapeHtml } from '../html.mjs'
import { loadTs } from '../ts-load.mjs'
import { renderBlocks } from './blocks.mjs'
import { loadCurriculum } from './data.mjs'
import { chip, ctaBand, fmtNum, hero, hueColor, icon, layout, secHead, subjectChip, subjectColorOf } from './layout.mjs'
import { examLabels, subjectSlug, topicSlugs } from './slugs.mjs'
import { createMarkdown } from './markdown.mjs'
import { exams as examSections } from './tools.mjs'

const BASE = '/konu-anlatimi'
const examIcon = { lgs: ['School', 'pine'], tyt: ['BookOpen', 'sea'], ayt: ['Layers', 'violet'], ydt: ['Languages', 'coral'] }

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
const hours = (minutes) => (minutes < 60 ? `${minutes} dk` : minutes >= 600 ? `${Math.round(minutes / 60)} sa` : `${Math.floor(minutes / 60)} sa${minutes % 60 ? ` ${minutes % 60} dk` : ''}`)

// Anlatımın içindeki video, simülasyon ve çözümlü soru sayısı
function countsOf(blocks) {
  const c = { videos: 0, sims: 0, questions: 0 }
  for (const b of blocks) {
    if (b.type === 'leaf' && b.name === 'video') c.videos++
    else if (b.type === 'leaf' && b.name === 'sim') c.sims++
    else if (b.type === 'box' && b.name === 'soru') c.questions++
  }
  return c
}

const factsHtml = (minutes, c) =>
  `<span class="facts"><span>${icon('Clock')}${minutes} dk</span>${c.videos ? `<span>${icon('Video')}${c.videos > 1 ? `${c.videos} video` : 'video'}</span>` : ''}${c.sims ? `<span>${icon('SlidersHorizontal')}etkileşimli</span>` : ''}${c.questions ? `<span>${icon('ListChecks')}${c.questions} soru</span>` : ''}</span>`

export async function buildPublicLessons({ write, shell, cssHref, site }) {
  const data = await loadCurriculum()
  if (!data) {
    console.warn('SEO: Supabase anahtarı yok, anlatım sayfaları üretilmedi')
    return { urls: [], exams: [], subjects: [], topicUrl: () => null }
  }
  if (!data.lessons.length) {
    console.warn('SEO: yayında anlatım okunamadı (lessons_public_read uygulanmamış olabilir), anlatım sayfaları üretilmedi')
    return { urls: [], exams: [], subjects: data.subjects, topicUrl: () => null }
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

  // Her anlatım bir kez çözümlenir, sayılar ders ve sınav sayfalarında da kullanılır
  const parsed = new Map()
  for (const lesson of data.lessons) {
    const blocks = parse.parseBlocks(lesson.body)
    parsed.set(lesson.topic_id, { blocks, counts: countsOf(blocks), outline: parse.outlineOf(lesson.body) })
  }
  const sum = (topics, key) => topics.reduce((n, t) => n + (key === 'minutes' ? lessonByTopic.get(t.id).reading_minutes : parsed.get(t.id).counts[key]), 0)
  const topicHref = (info, t) => `${BASE}/${info.key}/${info.slug}/${t.slug}`
  const rowsHtml = (info, topics, numbered = true) =>
    `<${numbered ? 'ol' : 'ul'} class="rows">${topics
      .map((t, i) => {
        const color = subjectColorOf(info.subject)
        return `<li><a href="${topicHref(info, t)}">${numbered ? `<span class="n" style="color:${color};background:${color}1f">${i + 1}</span>` : subjectChip(info.subject, 'sm')}<span class="tx"><b>${escapeHtml(t.name)}</b>${factsHtml(lessonByTopic.get(t.id).reading_minutes, parsed.get(t.id).counts)}</span>${icon('ArrowRight', 'go')}</a></li>`
      })
      .join('')}</${numbered ? 'ol' : 'ul'}>`

  const readScript = `(function(){var d=document.querySelector('.otl');if(d&&matchMedia('(min-width:64rem)').matches)d.open=true;var b=document.querySelector('.readbar'),a=document.querySelector('article');if(!b||!a)return;var links=[].slice.call(document.querySelectorAll('.otl a'));function f(){var r=a.getBoundingClientRect(),h=window.innerHeight,p=Math.min(1,Math.max(0,(h*0.35-r.top)/Math.max(1,r.height-h*0.5)));b.style.transform='scaleX('+p+')';var cur=null;links.forEach(function(l){var t=document.getElementById(decodeURIComponent(l.hash.slice(1)));if(t&&t.getBoundingClientRect().top<h*0.3)cur=l});links.forEach(function(l){l.classList.toggle('on',l===cur)})}addEventListener('scroll',f,{passive:true});f()})()`

  // Konu sayfaları
  for (const info of subjectInfo) {
    const exam = examLabels[info.key]
    const color = subjectColorOf(info.subject)
    info.topics.forEach((topic, index) => {
      const lesson = lessonByTopic.get(topic.id)
      const path = topicHref(info, topic)
      const { blocks, counts, outline } = parsed.get(topic.id)
      const md = createMarkdown({ topicUrl })
      const html = renderBlocks(blocks, { md, parse })
      const description = describe(blocks, parse, `${topic.name} konusunun anlatımı, örnekler ve çözümlü sorular. ${exam.name} ${info.subject.name}.`)
      const prev = info.topics[index - 1]
      const next = info.topics[index + 1]
      const related = info.topics.filter((t) => t.id !== topic.id).slice(Math.max(0, index - 3), Math.max(0, index - 3) + 6).slice(0, 5)
      const full = `${topic.name} konu anlatımı · ${exam.name} ${info.subject.name} · İzlek`
      const title = full.length <= 70 ? full : `${topic.name} konu anlatımı · ${exam.name} ${info.subject.name}`
      const trail = [['Ana sayfa', '/'], ['Konu anlatımları', BASE], [exam.name, `${BASE}/${info.key}`], [info.subject.name, `${BASE}/${info.key}/${info.slug}`], [topic.name, path]]
      const tags = [
        `<span class="tag">${icon('Clock')}${lesson.reading_minutes} dk okuma</span>`,
        counts.videos ? `<span class="tag">${icon('Video')}${counts.videos} video</span>` : '',
        counts.sims ? `<span class="tag">${icon('SlidersHorizontal')}${counts.sims} etkileşimli şekil</span>` : '',
        counts.questions ? `<span class="tag">${icon('ListChecks')}${counts.questions} çözümlü soru</span>` : '',
      ].join('')
      const side = `<aside class="lesson-side">${outline.length > 1 ? `<details class="otl"><summary>Bu sayfada${icon('ChevronDown')}</summary><nav aria-label="İçindekiler"><ol>${outline.map((o) => `<li><a href="#${o.id}">${escapeHtml(o.title)}</a></li>`).join('')}</ol></nav></details>` : ''}<div class="side-cta"><b>İlerlemenizi kaydedin</b><p>Hesapla okunan bölümler ve mini test sonuçları saklanır.</p><a class="btn primary" href="/giris">Giriş yap</a></div></aside>`
      const body = `<div class="readbar" aria-hidden="true"></div><main>${hero({
        crumbs: trail,
        title: escapeHtml(topic.name),
        iconHtml: subjectChip(info.subject, 'lg'),
        lead2: `<p class="kicker">${exam.name} · ${escapeHtml(info.subject.name)}</p><div class="chips">${tags}</div>`,
        tint: color,
      })}
<div class="wide lesson">${side}<div>
<article>${html}</article>
<p class="meta">Son güncelleme ${dateOf(lesson.updated_at) ?? ''}</p>
<nav class="pager" aria-label="Önceki ve sonraki konu">${prev ? `<a class="prev" href="${topicHref(info, prev)}"><small>${icon('ArrowLeft')}Önceki konu</small>${escapeHtml(prev.name)}</a>` : '<span></span>'}${next ? `<a class="next" href="${topicHref(info, next)}"><small>Sonraki konu${icon('ArrowRight')}</small>${escapeHtml(next.name)}</a>` : ''}</nav>
${ctaBand}
${related.length ? `<section class="sec">${secHead('', `${escapeHtml(info.subject.name)} dersinin diğer konuları`)}${rowsHtml(info, related, false)}</section>` : ''}
</div></div></main><script>${readScript}</script>`
      write(`${path.slice(1)}.html`, wrap({
        title,
        description,
        path,
        body,
        ld: [
          {
            '@context': 'https://schema.org',
            '@type': ['Article', 'LearningResource'],
            headline: `${topic.name} konu anlatımı`,
            image: `${site}/og.png`,
            wordCount: parse.plainText(lesson.body).split(/\s+/).filter(Boolean).length,
            timeRequired: `PT${lesson.reading_minutes}M`,
            articleSection: `${exam.name} ${info.subject.name}`,
            keywords: [topic.name, `${exam.name} ${info.subject.name}`, `${exam.name} konu anlatımı`].join(', '),
            learningResourceType: 'Konu anlatımı',
            teaches: topic.name,
            description,
            inLanguage: 'tr',
            dateModified: dateOf(lesson.updated_at),
            mainEntityOfPage: `${site}${path}`,
            author: { '@type': 'Organization', name: 'İzlek', url: `${site}/hakkinda` },
            publisher: { '@type': 'Organization', name: 'İzlek', logo: { '@type': 'ImageObject', url: `${site}/pwa-512.png` } },
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

  const tools = (key) =>
    [
      ['/araclar/net-hesaplama', 'Net hesaplama', 'Calculator'],
      key === 'lgs' ? ['/araclar/lgs-puan-hesaplama', 'LGS puan hesaplama', 'Gauge'] : ['/araclar/yks-puan-hesaplama', 'YKS puan hesaplama', 'Gauge'],
      ['/calisma-programlari', 'Çalışma programları', 'CalendarDays'],
      ...(key === 'lgs' ? [] : [['/yks-bolumleri', 'YKS bölümleri', 'GraduationCap']]),
    ]
  const toolsCard = (key) => `<div class="rc"><h2>Araçlar</h2><ul class="links">${tools(key).map(([href, label, ic]) => `<li><a href="${href}">${icon(ic)}${label}${icon('ArrowRight', 'go')}</a></li>`).join('')}</ul></div>`
  const coachCard = `<div class="rc solid">${icon('MessageCircle')}<h3>Koçunuzla çalışın</h3><p>Öğretmeniniz bu konulardan haftalık görev verir, ilerlemenizi takip eder.</p><a class="btn" href="/katil">Davet koduyla katılın</a></div>`

  // Ders sayfaları
  for (const info of subjectInfo) {
    const exam = examLabels[info.key]
    const path = `${BASE}/${info.key}/${info.slug}`
    const trail = [['Ana sayfa', '/'], ['Konu anlatımları', BASE], [exam.name, `${BASE}/${info.key}`], [info.subject.name, path]]
    const minutes = sum(info.topics, 'minutes')
    const questions = sum(info.topics, 'questions')
    const stats = [[info.topics.length, 'konu'], ...(info.subject.question_count ? [[info.subject.question_count, 'sınavda soru']] : []), [hours(minutes), 'toplam okuma'], ...(questions ? [[fmtNum(questions), 'çözümlü soru']] : [])]
    const body = `<main>${hero({
      crumbs: trail,
      title: `${exam.name} ${escapeHtml(info.subject.name)}`,
      iconHtml: subjectChip(info.subject, 'lg'),
      lead: `${info.subject.question_count ? `Sınavda ${info.subject.question_count} soru. ` : ''}${info.topics.length} konunun her biri anlatım, örnek ve çözümlü sorularla. Sırayla okuyabilir ya da ihtiyacınız olan konuya geçebilirsiniz.`,
      stats,
      tint: subjectColorOf(info.subject),
    })}
<div class="wide page"><div class="with-rail"><section aria-label="Konular">${secHead('', `${exam.name} ${escapeHtml(info.subject.name)} konu anlatımları`, `<span class="tag">${info.topics.length} konu</span>`)}${rowsHtml(info, info.topics)}</section>
<aside class="rail">${toolsCard(info.key)}${coachCard}</aside></div></div></main>`
    write(`${path.slice(1)}.html`, wrap({
      title: `${exam.name} ${info.subject.name} konu anlatımları · İzlek`,
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

  const steps = `<section class="sec rc" style="padding:1.5rem">${secHead('Nasıl çalışır', 'Her konu üç adımda')}<div class="steps">
<div>${chip('BookOpenText', hueColor('sea'))}<h3>Oku</h3><p>Kısa, örnekli anlatım. Gereken yerde video ve şekil.</p></div>
<div>${chip('PenLine', hueColor('amber'))}<h3>Kendini dene</h3><p>Anlatımın içindeki sorularla hemen kontrol edin, çözümü açın.</p></div>
<div>${chip('Target', hueColor('pine'))}<h3>Mini test</h3><p>Konunun sonunda sınav tarzı sorular. Uygulamada yanlışlar deftere eklenir.</p></div>
</div></section>`

  // Sınav sayfaları
  for (const key of exams) {
    const exam = examLabels[key]
    const path = `${BASE}/${key}`
    const subjects = subjectInfo.filter((i) => i.key === key)
    const allTopics = subjects.flatMap((s) => s.topics.map((t) => ({ info: s, topic: t })))
    const count = allTopics.length
    const questions = subjects.reduce((n, s) => n + sum(s.topics, 'questions'), 0)
    const minutes = subjects.reduce((n, s) => n + sum(s.topics, 'minutes'), 0)
    const trail = [['Ana sayfa', '/'], ['Konu anlatımları', BASE], [exam.name, path]]
    const first = allTopics[0]
    const firstOutline = parsed.get(first.topic.id).outline.slice(0, 4)
    const preview = `<a class="rc" href="${topicHref(first.info, first.topic)}" style="padding:1.25rem"><div class="top">${subjectChip(first.info.subject)}<span class="tag">${icon('Clock')}${lessonByTopic.get(first.topic.id).reading_minutes} dk</span></div><p style="margin-top:.9rem">${escapeHtml(first.info.subject.name)} · ilk konu</p><h3 style="margin-top:.2rem">${escapeHtml(first.topic.name)}</h3>${firstOutline.length ? `<ol class="tlist">${firstOutline.map((o, i) => `<li><span class="n" style="color:${subjectColorOf(first.info.subject)};background:${subjectColorOf(first.info.subject)}1f">${i + 1}</span>${escapeHtml(o.title.replace(/^\d+[.)]\s*/, ''))}</li>`).join('')}</ol>` : ''}<span class="more">Okumaya başlayın${icon('ArrowRight')}</span></a>`
    const newest = (list) => [...list].sort((a, b) => String(lessonByTopic.get(b.topic.id).updated_at).localeCompare(String(lessonByTopic.get(a.topic.id).updated_at)))
    // Her dersten en son güncellenen konu, ders çeşitliliği için
    const recent = newest(subjects.map((s) => newest(s.topics.map((t) => ({ info: s, topic: t })))[0])).slice(0, 8)
    const sections = examSections.find((e) => e.key === key)?.sections ?? []
    const maxQ = Math.max(1, ...sections.map((x) => x[1]))
    const faq = [
      [`${exam.name} kaç soru, kaç dakika?`, `${exam.name}, ${exam.intro}.`],
      [`${exam.name} neti nasıl hesaplanır?`, `Her dersin neti doğru sayısından yanlış sayısının ${key === 'lgs' ? 'üçte biri' : 'dörtte biri'} çıkarılarak bulunur. Net hesaplama aracıyla ders ders hesaplayabilirsiniz.`],
      ['Anlatımlar ücretli mi?', 'Hayır. Anlatımlar ücretsizdir, reklam içermez ve üye olmadan okunur.'],
    ]
    const body = `<main>${hero({
      crumbs: trail,
      pill: `${icon(examIcon[key][0])}${exam.long}`,
      title: `${exam.name} konu <mark>anlatımları</mark>`,
      lead: `${subjects.length} dersin ${count} konusu için anlatım, çözümlü örnek ve mini test. Üye olmadan okunur.`,
      stats: [[subjects.length, 'ders'], [count, 'konu'], ...(questions ? [[fmtNum(questions), 'çözümlü soru']] : []), [hours(minutes), 'toplam okuma']],
      actions: `<a class="btn primary" href="${topicHref(first.info, first.topic)}">${icon('BookOpen')}İlk konudan başlayın</a><a class="btn" href="#yapi">Sınavın yapısı</a>`,
      aside: preview,
    })}
<div class="wide page">
<section class="sec">${secHead('Dersler', 'Hangi dersten başlamak istersiniz?')}<div class="grid">${subjects
      .map((s) => {
        const color = subjectColorOf(s.subject)
        return `<div class="rc"><div class="top">${subjectChip(s.subject)}${s.subject.question_count ? `<span class="tag">${s.subject.question_count} soru</span>` : ''}</div><h3><a href="${path}/${s.slug}" style="color:inherit;text-decoration:none">${escapeHtml(s.subject.name)}</a></h3><p>${s.topics.length} konu</p><ol class="tlist">${s.topics
          .slice(0, 3)
          .map((t, i) => `<li><span class="n" style="color:${color};background:${color}1f">${i + 1}</span><a href="${topicHref(s, t)}">${escapeHtml(t.name)}</a></li>`)
          .join('')}</ol><a class="more" href="${path}/${s.slug}">Tüm konular${icon('ArrowRight')}</a></div>`
      })
      .join('')}</div></section>
${steps}
<section class="sec">${secHead('Güncel', 'Son anlatımlar')}<div class="strip">${recent
      .map(({ info, topic }) => {
        const color = subjectColorOf(info.subject)
        return `<a class="rc" href="${topicHref(info, topic)}"><span class="thumb" style="background:${color}14">${subjectChip(info.subject)}</span><small>${escapeHtml(info.subject.name)}</small><b>${escapeHtml(topic.name)}</b>${factsHtml(lessonByTopic.get(topic.id).reading_minutes, { videos: 0, sims: 0, questions: parsed.get(topic.id).counts.questions })}</a>`
      })
      .join('')}</div></section>
<div class="sec grid two">
${sections.length ? `<section class="rc" id="yapi" style="scroll-margin-top:5rem"><h2 style="margin:0">Sınavın yapısı</h2><p>${escapeHtml(exam.intro.charAt(0).toLocaleUpperCase('tr') + exam.intro.slice(1))}. Yanlışlar ${key === 'lgs' ? '3' : '4'}'te 1 doğruyu götürür.</p><div class="bars">${sections
      .map(([name, n], i) => `<div><span>${escapeHtml(name)}</span><b>${n} soru</b><i><b style="width:${Math.round((n / maxQ) * 100)}%;background:${hueColor(['coral', 'sea', 'amber', 'pine', 'violet', 'teal'][i % 6])}"></b></i></div>`)
      .join('')}</div></section>` : ''}
<section class="rc faq"><h2 style="margin:0 0 .5rem">Sık sorulanlar</h2>${faq.map(([q, a]) => `<details><summary>${escapeHtml(q)}${icon('ChevronDown')}</summary><p>${escapeHtml(a)}</p></details>`).join('')}</section>
</div>
${ctaBand}</div></main>`
    write(`${path.slice(1)}.html`, wrap({
      title: `${exam.name} konu anlatımları, ders ders · İzlek`,
      description: cut(`${exam.long} (${exam.name}) için ${subjects.map((s) => s.subject.name).join(', ')} derslerinin konu anlatımları. Ücretsiz, reklamsız, çözümlü sorularla.`, 158),
      path,
      body,
      ld: [
        { '@context': 'https://schema.org', '@type': 'CollectionPage', name: `${exam.name} konu anlatımları`, inLanguage: 'tr', hasPart: subjects.map((s) => ({ '@type': 'CollectionPage', name: `${exam.name} ${s.subject.name}`, url: `${site}${path}/${s.slug}` })) },
        { '@context': 'https://schema.org', '@type': 'FAQPage', mainEntity: faq.map(([q, a]) => ({ '@type': 'Question', name: q, acceptedAnswer: { '@type': 'Answer', text: a } })) },
        crumbs(trail),
      ],
    }))
    urls.push({ path })
  }

  // Ana sayfa
  const total = subjectInfo.reduce((n, s) => n + s.topics.length, 0)
  const totalQuestions = subjectInfo.reduce((n, s) => n + sum(s.topics, 'questions'), 0)
  const trail = [['Ana sayfa', '/'], ['Konu anlatımları', BASE]]
  const index = subjectInfo.flatMap((info) => info.topics.map((t) => [t.name, `${examLabels[info.key].name} ${info.subject.name}`, topicHref(info, t)]))
  const searchScript = `(function(){var i=document.getElementById('konu-ara'),l=document.getElementById('konu-sonuc');if(!i||!l)return;var items=[].slice.call(l.children);function f(s){return s.toLocaleLowerCase('tr').normalize('NFD').replace(/[\\u0300-\\u036f]/g,'').replace(/ı/g,'i')}var keys=items.map(function(li){return f(li.textContent)});i.addEventListener('input',function(){var q=f(i.value.trim()),n=0;items.forEach(function(li,k){var show=q.length>1&&keys[k].indexOf(q)>-1&&n<12;if(show)n++;li.hidden=!show});l.hidden=!n})})()`
  const body = `<main>${hero({
    crumbs: trail,
    title: 'Konu <mark>anlatımları</mark>',
    lead: `${exams.map((k) => examLabels[k].name).join(', ').replace(/, ([^,]*)$/, ' ve $1')} için ${total} konu anlatımı. Hepsi ücretsiz, reklamsız ve üyelik gerektirmeden okunur.`,
    stats: [[total, 'konu anlatımı'], [fmtNum(totalQuestions), 'çözümlü soru'], [subjectInfo.length, 'ders'], [exams.length, 'sınav']],
    lead2: `<label class="search">${icon('Search')}<input id="konu-ara" type="search" placeholder="Konu arayın, örneğin Üslü sayılar" aria-label="Konu ara" autocomplete="off"></label><ul class="sres" id="konu-sonuc" hidden>${index.map(([name, sub, href]) => `<li hidden><a href="${href}">${escapeHtml(name)}<small>${escapeHtml(sub)}</small></a></li>`).join('')}</ul>`,
  })}
<div class="wide page"><div class="grid two">${exams
    .map((k) => {
      const subs = subjectInfo.filter((s) => s.key === k)
      const n = subs.reduce((a, s) => a + s.topics.length, 0)
      return `<a class="rc" href="${BASE}/${k}" style="padding:1.4rem"><div class="top">${chip(examIcon[k][0], hueColor(examIcon[k][1]), 'lg')}<span class="tag">${n} konu</span></div><h2>${examLabels[k].name}</h2><p>${examLabels[k].long}. ${subs.length} ders.</p><div class="chips" style="gap:.35rem">${subs.map((s) => subjectChip(s.subject, 'sm')).join('')}</div><span class="more">Dersleri görün${icon('ArrowRight')}</span></a>`
    })
    .join('')}</div>
${steps}
${ctaBand}</div></main><script>${searchScript}</script>`
  write(`${BASE.slice(1)}.html`, wrap({
    title: 'LGS, TYT, AYT ve YDT konu anlatımları · İzlek',
    description: `LGS, TYT, AYT ve YDT için ${total} konu anlatımı. Ücretsiz, reklamsız, örnekli ve çözümlü sorularla.`,
    path: BASE,
    body,
    ld: [{ '@context': 'https://schema.org', '@type': 'CollectionPage', name: 'Konu anlatımları', inLanguage: 'tr' }, crumbs(trail)],
  }))
  urls.push({ path: BASE })

  return { urls, exams, subjects: data.subjects, topicUrl, stats: { lessons: total, questions: totalQuestions } }
}
