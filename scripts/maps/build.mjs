// Natural Earth (kamu malı) verisinden harita yollarını üretir: node scripts/maps/build.mjs
// Çıktı: src/features/lessons/maps/turkiye.ts ve world.ts. Çıktıyı elle düzenlemeyin.
import { mkdirSync, writeFileSync } from 'node:fs'
import { dirname, join } from 'node:path'
import { fileURLToPath } from 'node:url'

const root = join(dirname(fileURLToPath(import.meta.url)), '..', '..')
const out = join(root, 'src/features/lessons/maps')
const base = 'https://raw.githubusercontent.com/nvkelso/natural-earth-vector/master/geojson/'
const get = async (name) => (await fetch(base + name)).json()

const rad = (d) => (d * Math.PI) / 180

// Douglas-Peucker: nokta sayısını azaltır
function simplify(points, tol) {
  if (points.length < 3) return points
  const keep = new Array(points.length).fill(false)
  keep[0] = keep[points.length - 1] = true
  const stack = [[0, points.length - 1]]
  while (stack.length) {
    const [a, b] = stack.pop()
    let max = 0
    let idx = -1
    const [ax, ay] = points[a]
    const [bx, by] = points[b]
    const len = Math.hypot(bx - ax, by - ay) || 1
    for (let i = a + 1; i < b; i++) {
      const [px, py] = points[i]
      const dist = Math.abs((by - ay) * px - (bx - ax) * py + bx * ay - by * ax) / len
      if (dist > max) {
        max = dist
        idx = i
      }
    }
    if (max > tol && idx > 0) {
      keep[idx] = true
      stack.push([a, idx], [idx, b])
    }
  }
  return points.filter((_, i) => keep[i])
}

const fmt = (n) => String(Math.round(n * 10) / 10)

// Kapalı halkada uçlar aynı olduğundan halkayı en uzak noktadan ikiye bölüp ayrı sadeleştirir
function simplifyRing(points, tol) {
  let far = 0
  let best = -1
  for (let i = 1; i < points.length - 1; i++) {
    const d = Math.hypot(points[i][0] - points[0][0], points[i][1] - points[0][1])
    if (d > best) {
      best = d
      far = i
    }
  }
  if (far === 0) return points
  return [...simplify(points.slice(0, far + 1), tol).slice(0, -1), ...simplify(points.slice(far), tol)]
}

function ringPath(ring, project, tol, minArea) {
  const pts = simplifyRing(ring.map(([lon, lat]) => project(lon, lat)), tol)
  if (pts.length < 4) return ''
  let area = 0
  for (let i = 0; i < pts.length - 1; i++) area += pts[i][0] * pts[i + 1][1] - pts[i + 1][0] * pts[i][1]
  if (Math.abs(area) / 2 < minArea) return ''
  return 'M' + pts.slice(0, -1).map(([x, y]) => `${fmt(x)} ${fmt(y)}`).join('L') + 'Z'
}

function geometryPath(geometry, project, tol, minArea = 0) {
  const polygons = geometry.type === 'Polygon' ? [geometry.coordinates] : geometry.coordinates
  return polygons.map((rings) => rings.map((r) => ringPath(r, project, tol, minArea)).join('')).join('')
}

function centroid(geometry, project) {
  const polygons = geometry.type === 'Polygon' ? [geometry.coordinates] : geometry.coordinates
  let best = null
  for (const rings of polygons) {
    const pts = rings[0].map(([lon, lat]) => project(lon, lat))
    let a = 0
    let cx = 0
    let cy = 0
    for (let i = 0; i < pts.length - 1; i++) {
      const f = pts[i][0] * pts[i + 1][1] - pts[i + 1][0] * pts[i][1]
      a += f
      cx += (pts[i][0] + pts[i + 1][0]) * f
      cy += (pts[i][1] + pts[i + 1][1]) * f
    }
    a /= 2
    if (!best || Math.abs(a) > Math.abs(best.a)) best = { a, x: cx / (6 * a), y: cy / (6 * a) }
  }
  return [best.x, best.y, Math.abs(best.a)]
}

// Türkiye: Lambert eşaçılı konik izdüşüm (standart paralel 36 ve 42, merkez 35 D 39 K)
function lambert(lon0, lat0, p1, p2) {
  const n = Math.log(Math.cos(rad(p1)) / Math.cos(rad(p2))) / Math.log(Math.tan(Math.PI / 4 + rad(p2) / 2) / Math.tan(Math.PI / 4 + rad(p1) / 2))
  const F = (Math.cos(rad(p1)) * Math.tan(Math.PI / 4 + rad(p1) / 2) ** n) / n
  const rho = (lat) => F / Math.tan(Math.PI / 4 + rad(lat) / 2) ** n
  const rho0 = rho(lat0)
  const project = (lon, lat) => {
    const r = rho(lat)
    const t = n * rad(lon - lon0)
    return [r * Math.sin(t), rho0 - r * Math.cos(t)]
  }
  return { project, n, F, rho0 }
}

const REGIONS = {
  marmara: ['Edirne', 'Kırklareli', 'Tekirdağ', 'İstanbul', 'Kocaeli', 'Sakarya', 'Yalova', 'Bursa', 'Bilecik', 'Balıkesir', 'Çanakkale'],
  ege: ['İzmir', 'Manisa', 'Aydın', 'Denizli', 'Muğla', 'Uşak', 'Afyonkarahisar', 'Kütahya'],
  akdeniz: ['Antalya', 'Isparta', 'Burdur', 'Mersin', 'Adana', 'Osmaniye', 'Hatay', 'Kahramanmaraş'],
  karadeniz: ['Zonguldak', 'Karabük', 'Bartın', 'Kastamonu', 'Sinop', 'Samsun', 'Çorum', 'Amasya', 'Tokat', 'Ordu', 'Giresun', 'Trabzon', 'Gümüşhane', 'Bayburt', 'Rize', 'Artvin', 'Bolu', 'Düzce'],
  ic: ['Ankara', 'Eskişehir', 'Çankırı', 'Kırıkkale', 'Kırşehir', 'Kayseri', 'Konya', 'Karaman', 'Aksaray', 'Niğde', 'Nevşehir', 'Yozgat', 'Sivas'],
  dogu: ['Erzurum', 'Erzincan', 'Kars', 'Ardahan', 'Iğdır', 'Ağrı', 'Van', 'Hakkâri', 'Bitlis', 'Muş', 'Bingöl', 'Tunceli', 'Elâzığ', 'Malatya'],
  guneydogu: ['Gaziantep', 'Kilis', 'Şanlıurfa', 'Adıyaman', 'Diyarbakır', 'Mardin', 'Batman', 'Siirt', 'Şırnak'],
}
const regionOf = Object.fromEntries(Object.entries(REGIONS).flatMap(([r, list]) => list.map((il) => [il, r])))

async function turkiye() {
  const data = await get('ne_10m_admin_1_states_provinces.geojson')
  const features = data.features.filter((f) => f.properties.adm0_a3 === 'TUR')
  const cone = lambert(35, 39, 36, 42)
  const project = cone.project
  // ölçek: genişlik 800
  const all = features.flatMap((f) => (f.geometry.type === 'Polygon' ? [f.geometry.coordinates] : f.geometry.coordinates)).flatMap((p) => p[0]).map(([lon, lat]) => project(lon, lat))
  const minX = Math.min(...all.map((p) => p[0]))
  const maxX = Math.max(...all.map((p) => p[0]))
  const minY = Math.min(...all.map((p) => p[1]))
  const maxY = Math.max(...all.map((p) => p[1]))
  const scale = 800 / (maxX - minX)
  const proj = (lon, lat) => {
    const [x, y] = project(lon, lat)
    return [(x - minX) * scale, (maxY - y) * scale]
  }
  const height = Math.ceil((maxY - minY) * scale)
  const iller = features.map((f) => {
    const ad = f.properties.name_tr
    if (!regionOf[ad]) throw new Error('bölge yok: ' + ad)
    return { ad, bolge: regionOf[ad], d: geometryPath(f.geometry, proj, 0.6, 2), c: centroid(f.geometry, proj) }
  })
  const labels = Object.fromEntries(
    Object.keys(REGIONS).map((r) => {
      const m = iller.filter((i) => i.bolge === r)
      const w = m.reduce((s, i) => s + i.c[2], 0)
      return [r, [Math.round(m.reduce((s, i) => s + i.c[0] * i.c[2], 0) / w), Math.round(m.reduce((s, i) => s + i.c[1] * i.c[2], 0) / w)]]
    }),
  )
  const body = `// Natural Earth (kamu malı) 1:10m il sınırları, Lambert konik izdüşüm. scripts/maps/build.mjs üretir, elle düzenlemeyin.
export const TURKIYE_VIEW = { width: 800, height: ${height} }

// Boylam ve enlemi bu haritadaki noktaya çevirir (kent işaretleri için)
export function turkiyeNokta(lon: number, lat: number): [number, number] {
  const n = ${cone.n}
  const F = ${cone.F}
  const rho0 = ${cone.rho0}
  const rad = Math.PI / 180
  const r = F / Math.tan(Math.PI / 4 + (lat * rad) / 2) ** n
  const t = n * (lon - 35) * rad
  return [(r * Math.sin(t) - ${minX}) * ${scale}, (${maxY} - (rho0 - r * Math.cos(t))) * ${scale}]
}

export type BolgeKodu = ${Object.keys(REGIONS).map((r) => `'${r}'`).join(' | ')}

export const TURKIYE_ILLER: { ad: string; bolge: BolgeKodu; d: string }[] = [
${iller.map((i) => `  { ad: ${JSON.stringify(i.ad)}, bolge: '${i.bolge}', d: '${i.d}' },`).join('\n')}
]

export const TURKIYE_ETIKET: Record<BolgeKodu, [number, number]> = ${JSON.stringify(labels)}
`
  writeFileSync(join(out, 'turkiye.ts'), body)
  console.log('turkiye.ts', Math.round(body.length / 1024) + ' KB', 'yükseklik', height)
}

async function world() {
  const data = await get('ne_110m_admin_0_countries.geojson')
  // eşdikdörtgen: 1 derece = 2 birim, 720 x 360
  const proj = (lon, lat) => [(lon + 180) * 2, (90 - lat) * 2]
  const countries = data.features
    .filter((f) => f.properties.ADM0_A3 !== 'ATA')
    .map((f) => ({ ad: f.properties.NAME_TR || f.properties.NAME, d: geometryPath(f.geometry, proj, 0.35, 1.5) }))
    .filter((c) => c.d)
  const body = `// Natural Earth (kamu malı) 1:110m ülkeler, eşdikdörtgen izdüşüm (1 derece = 2 birim). scripts/maps/build.mjs üretir, elle düzenlemeyin.
export const DUNYA_VIEW = { width: 720, height: 360 }

export const DUNYA_ULKELER: { ad: string; d: string }[] = [
${countries.map((c) => `  { ad: ${JSON.stringify(c.ad)}, d: '${c.d}' },`).join('\n')}
]
`
  writeFileSync(join(out, 'world.ts'), body)
  console.log('world.ts', Math.round(body.length / 1024) + ' KB', countries.length + ' ülke')
}

mkdirSync(out, { recursive: true })
await turkiye()
await world()
