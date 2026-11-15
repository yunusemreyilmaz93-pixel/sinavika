import { escapeHtml } from '../html.mjs'
import { supabaseConfig } from './data.mjs'
import { chip, ctaBand, fmtNum, hero, hueColor, icon, layout, secHead } from './layout.mjs'
import { slug } from './slugs.mjs'

const BASE = '/yks-bolumleri'
const MIN_PROGRAMS = 3
const scoreNames = { SAY: 'Sayısal', EA: 'Eşit Ağırlık', 'SÖZ': 'Sözel', 'DİL': 'Yabancı Dil', TYT: 'TYT' }
const scoreOrder = ['SAY', 'EA', 'SÖZ', 'DİL', 'TYT']
const scoreLook = { SAY: ['Calculator', 'sea'], EA: ['Scale', 'violet'], 'SÖZ': ['BookText', 'coral'], 'DİL': ['Languages', 'teal'], TYT: ['GraduationCap', 'amber'] }

async function all(config, query) {
  const out = []
  for (let offset = 0; ; offset += 1000) {
    const res = await fetch(`${config.url}/rest/v1/${query}&limit=1000&offset=${offset}`, { headers: { apikey: config.key, authorization: `Bearer ${config.key}` } })
    if (!res.ok) throw new Error(`Supabase ${query.split('?')[0]} okunamadı: ${res.status}`)
    const rows = await res.json()
    out.push(...rows)
    if (rows.length < 1000) break
  }
  return out
}

const title = (s) => s.toLocaleLowerCase('tr').replace(/(^|[\s(-])(\p{L})/gu, (_, a, b) => a + b.toLocaleUpperCase('tr'))
const nf = (n) => (n == null ? '-' : Number(n).toLocaleString('tr-TR'))

export async function buildDepartments({ write, shell, cssHref, site, examLinks = [] }) {
  const config = supabaseConfig()
  if (!config.url || !config.key) return { urls: [] }
  let programs, universities, results
  try {
    ;[programs, universities, results] = await Promise.all([
      all(config, 'programs?select=code,university_id,name,group_name,score_type,language,duration,scholarship,city&order=code'),
      all(config, 'universities?select=id,name,short_name,kind,city&order=id'),
      all(config, 'program_results?select=program_code,year,quota,placed,rank&year=gte.2025&order=program_code,year'),
    ])
  } catch (error) {
    if (process.env.VERCEL || process.env.WORKERS_CI) throw error
    console.warn(`SEO: YÖK Atlas verisi okunamadı, bölüm sayfaları üretilmedi (${error.cause?.code ?? error.message})`)
    return { urls: [] }
  }
  if (!programs.length || !results.length) {
    console.warn('SEO: YÖK Atlas verisi boş (anonim okuma izni uygulanmamış olabilir), bölüm sayfaları üretilmedi')
    return { urls: [] }
  }
  const uni = new Map(universities.map((u) => [u.id, u]))
  const resultOf = new Map()
  for (const r of results) resultOf.set(`${r.program_code}:${r.year}`, r)
  const years = [...new Set(results.map((r) => r.year))].sort((a, b) => b - a)
  const [latest, previous] = years

  const groups = new Map()
  for (const p of programs) {
    if (!uni.has(p.university_id)) continue
    groups.set(p.group_name, [...(groups.get(p.group_name) ?? []), p])
  }
  const used = new Set()
  const pages = []
  for (const [name, list] of [...groups].sort((a, b) => a[0].localeCompare(b[0], 'tr'))) {
    if (list.length < MIN_PROGRAMS) continue
    let s = slug(name)
    if (!s || used.has(s)) s = `${s || 'bolum'}-${list[0].score_type.toLowerCase()}`
    used.add(s)
    pages.push({ name, slug: s, list, scoreType: list[0].score_type })
  }

  const wrap = (opts) => layout({ shell, cssHref, site, examLinks, ...opts })
  const crumbLd = (items) => ({ '@context': 'https://schema.org', '@type': 'BreadcrumbList', itemListElement: items.map(([n, p], i) => ({ '@type': 'ListItem', position: i + 1, name: n, item: `${site}${p}` })) })
  const urls = []

  for (const page of pages) {
    const path = `${BASE}/${page.slug}`
    const rows = page.list
      .map((p) => {
        const u = uni.get(p.university_id)
        const a = resultOf.get(`${p.code}:${latest}`)
        const b = resultOf.get(`${p.code}:${previous}`)
        return { p, u, a, b }
      })
      .sort((x, y) => (x.a?.rank ?? x.b?.rank ?? Infinity) - (y.a?.rank ?? y.b?.rank ?? Infinity) || x.u.name.localeCompare(y.u.name, 'tr'))
    const quota = rows.reduce((n, r) => n + (r.a?.quota ?? 0), 0)
    const devlet = new Set(rows.filter((r) => r.u.kind === 'devlet').map((r) => r.u.id)).size
    const vakif = new Set(rows.filter((r) => r.u.kind === 'vakif').map((r) => r.u.id)).size
    const cities = new Set(rows.map((r) => r.u.city).filter(Boolean)).size
    const trail = [['Ana sayfa', '/'], ['Kaynaklar', '/kaynaklar'], ['YKS bölümleri', BASE], [page.name, path]]
    const scoreName = scoreNames[page.scoreType]
    const table = `<div class="tw"><table><thead><tr><th>Üniversite</th><th>Program</th><th>Şehir</th><th>${latest} kontenjan</th><th>${latest} yerleşen</th><th>${latest} başarı sırası</th><th>${previous} başarı sırası</th></tr></thead><tbody>${rows
      .map(({ p, u, a, b }) => `<tr><td>${escapeHtml(title(u.name))}${u.kind === 'vakif' ? ' (Vakıf)' : ''}</td><td>${escapeHtml(p.name)}${p.scholarship && !p.name.includes(p.scholarship) ? ` · ${escapeHtml(p.scholarship)}` : ''}</td><td>${escapeHtml(title(p.city ?? u.city ?? ''))}</td><td>${nf(a?.quota)}</td><td>${nf(a?.placed)}</td><td>${nf(a?.rank)}</td><td>${nf(b?.rank)}</td></tr>`)
      .join('')}</tbody></table></div>`
    const description = `${page.name} bölümü: ${rows.length} program, ${devlet} devlet ve ${vakif} vakıf üniversitesi. ${latest} kontenjanı, yerleşen sayısı ve başarı sıraları.`
    const [ic, hue] = scoreLook[page.scoreType] ?? ['GraduationCap', 'slate']
    const body = `<main>${hero({
      crumbs: trail,
      pill: `${icon(ic)}${scoreName} puan türü`,
      title: `${escapeHtml(page.name)} bölümü`,
      lead: `${escapeHtml(page.name)} bölümü ${cities} şehirde ${rows.length} programla öğrenci alıyor. Başarı sırası ne kadar küçükse programa girmek o kadar zordur.`,
      stats: [[rows.length, 'program'], [devlet, 'devlet üniversitesi'], [vakif, 'vakıf üniversitesi'], [nf(quota), `${latest} kontenjan`]],
      tint: hueColor(hue),
    })}
<div class="wide page"><section>${secHead('', 'Kontenjan ve başarı sıraları')}${table}
<p class="meta">Kaynak: YÖK Atlas, ${latest} ve ${previous} yerleştirme sonuçları. Sıralar her yıl değişir, tercih yaparken güncel veriye bakın.</p></section>
<aside class="cta"><div><h2>Hedef bölümünüzü İzlek'te takip edin</h2><p>Öğrenci hedef bölümünü seçer, öğretmeni netlerini bu hedefe göre izler. İzlek ücretsizdir ve reklam içermez.</p></div><div class="row"><a class="btn light" href="/katil">Davet koduyla katıl</a><a class="btn ghost" href="/ogretmen-basvurusu">Öğretmen başvurusu</a></div></aside>
</div></main>`
    write(`${path.slice(1)}.html`, wrap({
      title: `${page.name} bölümü ${latest} kontenjan ve başarı sıraları · İzlek`,
      description,
      path,
      body,
      ld: [{ '@context': 'https://schema.org', '@type': 'Article', headline: `${page.name} bölümü`, description, inLanguage: 'tr', mainEntityOfPage: `${site}${path}`, author: { '@type': 'Organization', name: 'İzlek' }, publisher: { '@type': 'Organization', name: 'İzlek' }, isAccessibleForFree: true }, crumbLd(trail)],
    }))
    urls.push({ path })
  }

  const trail = [['Ana sayfa', '/'], ['Kaynaklar', '/kaynaklar'], ['YKS bölümleri', BASE]]
  const sections = scoreOrder
    .map((t) => ({ t, list: pages.filter((p) => p.scoreType === t) }))
    .filter((s) => s.list.length)
    .map((s) => {
      const [ic, hue] = scoreLook[s.t]
      return `<section class="sec" id="${slug(scoreNames[s.t])}">${secHead('', `${chip(ic, hueColor(hue), 'sm')} ${scoreNames[s.t]}`, `<span class="tag">${s.list.length} bölüm</span>`)}<ul class="grid dlist">${s.list.map((p) => `<li><a href="${BASE}/${p.slug}"><b>${escapeHtml(p.name)}</b><span>${p.list.length} program</span></a></li>`).join('')}</ul></section>`
    })
    .join('')
  const programCount = pages.reduce((n, p) => n + p.list.length, 0)
  const body = `<main>${hero({
    crumbs: trail,
    pill: `${icon('GraduationCap')}YÖK Atlas ${latest} verisi`,
    title: 'YKS <mark>bölümleri</mark>',
    lead: `${pages.length} bölümün üniversitelere göre kontenjanı, yerleşen sayısı ve başarı sıraları.`,
    stats: [[pages.length, 'bölüm'], [fmtNum(programCount), 'program'], [universities.length, 'üniversite']],
    lead2: `<div class="chips">${scoreOrder.filter((t) => pages.some((p) => p.scoreType === t)).map((t) => `<a class="tag" href="#${slug(scoreNames[t])}">${scoreNames[t]}</a>`).join('')}</div>`,
  })}
<div class="wide page">${sections}${ctaBand}</div></main>`
  write(`${BASE.slice(1)}.html`, wrap({
    title: 'YKS bölümleri, kontenjan ve başarı sıraları · İzlek',
    description: `${pages.length} üniversite bölümünün ${latest} kontenjanı, yerleşen sayısı ve başarı sıraları. Sayısal, eşit ağırlık, sözel ve dil puan türleri.`,
    path: BASE,
    body,
    ld: [{ '@context': 'https://schema.org', '@type': 'CollectionPage', name: 'YKS bölümleri', inLanguage: 'tr' }, crumbLd(trail)],
  }))
  urls.push({ path: BASE })
  return { urls, stats: { programs: programCount } }
}
