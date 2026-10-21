// YÖK Atlas'ın herkese açık tercih kılavuzu verisini bir kez çekip SQL migration'a çevirir.
// Kullanım: node scripts/yokatlas/fetch.mjs --out supabase/migrations/<zaman>_yokatlas_2026_verisi.sql
// Yılda bir, sonuçlar açıklanınca yeniden çalıştırılır. Sonuç satırları (program, yıl) anahtarıyla eklenir.
import { writeFileSync } from 'node:fs'
import { universities } from './universities.mjs'

const BASE = 'https://yokatlas.yok.gov.tr/api'
const DELAY_MS = 400
const args = process.argv.slice(2)
const out = args[args.indexOf('--out') + 1]
if (!out) throw new Error('--out gerekli')

const sleep = (ms) => new Promise((r) => setTimeout(r, ms))
async function post(path, body) {
  for (let attempt = 0; attempt < 3; attempt++) {
    const res = await fetch(`${BASE}${path}`, {
      method: 'POST',
      headers: { 'content-type': 'application/json', 'user-agent': 'yolumnet-yilda-bir-veri-aktarimi (iletisim: yunusemreyilmaz93@gmail.com)' },
      body: JSON.stringify(body),
    })
    await sleep(DELAY_MS)
    if (res.ok) return res.json()
    await sleep(2000 * (attempt + 1))
  }
  throw new Error(`${path} alınamadı`)
}

async function pages(path, filters) {
  const all = []
  for (let page = 0; ; page++) {
    const data = await post(path, { filters, page, size: 200 })
    all.push(...data.content)
    if (data.last || data.empty) return all
  }
}

const num = (v) => (v === null || v === undefined || v === '' ? null : Number(v))
// 0 puan ya da sıra, programa yerleşen olmadığı anlamına gelir
const positive = (v) => (num(v) > 0 ? num(v) : null)
const turkishKind = (t) => (t === 'VAKIF' ? 'vakif' : 'devlet')

const unis = []
const programs = new Map()
const results = new Map()
const netYears = [2023, 2024, 2025]

for (const [id, short] of universities) {
  const list = await pages('/tercih-kilavuz/search', { universiteId: [id] })
  const lisans = list.filter((p) => p.birimTuruAdi === 'LISANS')
  console.log(short, lisans.length, 'lisans programı')
  if (!lisans.length) continue
  const first = lisans[0]
  unis.push({ id, name: first.universiteAdi.replace(/\s*\([^)]*\)\s*$/, ''), short, kind: turkishKind(first.universiteTuru), city: first.uniIlAdi })
  const current = first.yil

  for (const p of lisans) {
    programs.set(p.kilavuzKodu, {
      code: p.kilavuzKodu,
      university_id: id,
      name: p.birimAdi,
      group_id: p.birimGrupId,
      group_name: p.birimGrupAdi,
      faculty: p.fymkAdi,
      score_type: p.puanTuru,
      language: p.ogrenimDiliAdi,
      duration: p.ogrenimSuresi,
      scholarship: p.bursOraniAdi ?? null,
      city: p.ilAdi,
    })
    const years = [
      [current, p.kontenjan, p.gkY, p.minPuan, p.basariSirasi],
      [current - 1, null, p.gk1, p.minPuan1, p.basariSirasi1],
      [current - 2, null, p.gk2, p.minPuan2, p.basariSirasi2],
      [current - 3, null, p.gk3, p.minPuan3, p.basariSirasi3],
    ]
    for (const [year, quota, placed, score, rank] of years) {
      if (positive(score) === null && positive(rank) === null) continue
      results.set(`${p.kilavuzKodu}|${year}`, { code: p.kilavuzKodu, year, quota: num(quota), placed: num(placed), score: positive(score), rank: positive(rank), nets: null })
    }
  }

  for (const year of netYears) {
    const rows = await pages('/netler/search', { universiteId: [id], yil: year })
    for (const n of rows) {
      const row = results.get(`${n.kilavuzKodu}|${year}`)
      if (!row) continue
      const pick = (obj) => Object.fromEntries(Object.entries(obj).filter(([, v]) => v !== null && v !== undefined))
      row.nets = pick({
        obp: n.obp,
        tyt_trk: n.tytTrkNet, tyt_sos: n.tytSosNet, tyt_mat: n.tytMatNet, tyt_fen: n.tytFenNet,
        ayt_mat: n.aytMatNet, ayt_fiz: n.aytFizNet, ayt_kim: n.aytKimNet, ayt_bio: n.aytBioNet,
        ayt_tde: n.aytTdeNet, ayt_trh1: n.aytTrh1Net, ayt_cog1: n.aytCog1Net, ayt_trh2: n.aytTrh2Net, ayt_cog2: n.aytCog2Net,
        ayt_fel: n.aytFelNet, ayt_din: n.aytDinNet, ydt: n.ydtYdilNet,
      })
    }
  }
}

const q = (v) => (v === null || v === undefined ? 'null' : typeof v === 'number' ? String(v) : `'${String(v).replace(/'/g, "''")}'`)
let sql = `-- YÖK Atlas tercih kılavuzu verisi (herkese açık, yılda bir betikle aktarılır). Kaynak: https://yokatlas.yok.gov.tr\n`
sql += `-- Üretici: scripts/yokatlas/fetch.mjs\n\n`
sql += `insert into public.universities (id, name, short_name, kind, city) values\n${unis.map((u) => `(${u.id}, ${q(u.name)}, ${q(u.short)}, ${q(u.kind)}, ${q(u.city)})`).join(',\n')}\non conflict (id) do update set name = excluded.name, short_name = excluded.short_name, kind = excluded.kind, city = excluded.city;\n\n`
const chunk = (arr, n) => Array.from({ length: Math.ceil(arr.length / n) }, (_, i) => arr.slice(i * n, i * n + n))
for (const part of chunk([...programs.values()], 400)) {
  sql += `insert into public.programs (code, university_id, name, group_id, group_name, faculty, score_type, language, duration, scholarship, city) values\n`
  sql += part.map((p) => `(${p.code}, ${p.university_id}, ${q(p.name)}, ${p.group_id}, ${q(p.group_name)}, ${q(p.faculty)}, ${q(p.score_type)}, ${q(p.language)}, ${q(p.duration)}, ${q(p.scholarship)}, ${q(p.city)})`).join(',\n')
  sql += `\non conflict (code) do update set name = excluded.name, group_name = excluded.group_name, faculty = excluded.faculty, score_type = excluded.score_type, language = excluded.language, duration = excluded.duration, scholarship = excluded.scholarship, city = excluded.city;\n\n`
}
for (const part of chunk([...results.values()], 400)) {
  sql += `insert into public.program_results (program_code, year, quota, placed, min_score, rank, nets) values\n`
  sql += part.map((r) => `(${r.code}, ${r.year}, ${q(r.quota)}, ${q(r.placed)}, ${q(r.score)}, ${q(r.rank)}, ${r.nets && Object.keys(r.nets).length ? `'${JSON.stringify(r.nets)}'::jsonb` : 'null'})`).join(',\n')
  sql += `\non conflict (program_code, year) do update set quota = excluded.quota, placed = excluded.placed, min_score = excluded.min_score, rank = excluded.rank, nets = coalesce(excluded.nets, public.program_results.nets);\n\n`
}
writeFileSync(out, sql)
console.log(`${unis.length} üniversite, ${programs.size} program, ${results.size} sonuç satırı yazıldı: ${out}`)
