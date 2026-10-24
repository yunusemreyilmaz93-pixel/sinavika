import { useState } from 'react'
import { SimFrame, Slider, Stat, decimal } from './frame'

function Choice<T extends string>({ value, options, onChange, label }: { value: T; options: [T, string][]; onChange: (v: T) => void; label: string }) {
  return (
    <div className="mt-3 flex flex-wrap gap-2" role="group" aria-label={label}>
      {options.map(([key, text]) => (
        <button
          key={key}
          type="button"
          onClick={() => onChange(key)}
          aria-pressed={value === key}
          className={`h-11 rounded-xl border px-4 text-sm font-semibold ${value === key ? 'border-primary bg-primary text-primary-fg' : 'border-line bg-surface'}`}
        >
          {text}
        </button>
      ))}
    </div>
  )
}

const smooth = (x: number) => x * x * (3 - 2 * x)
const spike: [number, number][] = [[0, -70], [0.5, -70], [1.2, 35], [2.2, -80], [3.6, -70], [6, -70]]

function potential(t: number, stimulus: number) {
  if (stimulus < 15) return t < 0.5 ? -70 : -70 + stimulus * Math.exp(-(t - 0.5) / 0.8)
  for (let i = 1; i < spike.length; i++) {
    const [t0, v0] = spike[i - 1]
    const [t1, v1] = spike[i]
    if (t <= t1) return v0 + (v1 - v0) * smooth((t - t0) / (t1 - t0))
  }
  return -70
}

export function ActionPotentialSim() {
  const [stimulus, setStimulus] = useState(20)
  const [myelin, setMyelin] = useState(false)
  const x = (t: number) => 30 + (t / 6) * 260
  const y = (v: number) => 130 - ((v + 90) / 140) * 110
  const path = Array.from({ length: 181 }, (_, i) => {
    const t = (i / 180) * 6
    return `${i === 0 ? 'M' : 'L'}${x(t).toFixed(1)},${y(potential(t, stimulus)).toFixed(1)}`
  }).join(' ')
  const fires = stimulus >= 15
  const speed = myelin ? 100 : 1

  return (
    <SimFrame title="Aksiyon potansiyeli" hint="Uyaran şiddetini değiştir. Eşik değerin altında yanıt oluşmaz, eşik ve üstünde yanıt hep aynı büyüklüktedir.">
      <div className="mx-auto mt-4 max-w-md overflow-hidden rounded-xl border border-line bg-surface p-3">
        <svg viewBox="0 0 300 160" role="img" aria-label="Zar potansiyelinin zamana göre değişimi" className="block w-full">
          <line x1={30} y1={y(-90)} x2={30} y2={y(50)} className="stroke-fg" strokeWidth={1.2} />
          <line x1={30} y1={y(-90)} x2={292} y2={y(-90)} className="stroke-fg" strokeWidth={1.2} />
          <line x1={30} y1={y(-55)} x2={292} y2={y(-55)} className="stroke-danger" strokeWidth={1} strokeDasharray="4 3" />
          <line x1={30} y1={y(-70)} x2={292} y2={y(-70)} className="stroke-muted" strokeWidth={1} strokeDasharray="1 3" />
          <path d={path} fill="none" className="stroke-primary" strokeWidth={2.5} strokeLinejoin="round" />
          <g fontSize={9} className="fill-muted">
            <text x={28} y={y(35) + 3} textAnchor="end">+35</text>
            <text x={28} y={y(-55) + 3} textAnchor="end">-55</text>
            <text x={28} y={y(-70) + 3} textAnchor="end">-70</text>
            <text x={160} y={152} textAnchor="middle">Zaman (ms)</text>
          </g>
          <text x={292} y={y(-55) - 3} textAnchor="end" fontSize={9} className="fill-danger">Eşik</text>
        </svg>
      </div>
      <div className="mt-3">
        <Slider label="Uyaran" value={stimulus} display={`+${stimulus} mV`} min={0} max={30} step={1} onChange={setStimulus} />
      </div>
      <Choice value={myelin ? 'var' : 'yok'} options={[['yok', 'Miyelinsiz akson'], ['var', 'Miyelinli akson']]} onChange={(v) => setMyelin(v === 'var')} label="Miyelin kılıf" />
      <div className="mt-3 grid gap-2 sm:grid-cols-3">
        <Stat label="Yanıt" value={fires ? 'Aksiyon potansiyeli' : 'Yanıt yok'} highlight />
        <Stat label="İletim hızı" value={`${speed} m/s`} />
        <Stat label="1 metre için süre" value={`${decimal.format(1000 / speed)} ms`} />
      </div>
    </SimFrame>
  )
}

const bases = 'UCAG'
const table = 'FFLLSSSSYY**CC*WLLLLPPPPHHQQRRRRIIIMTTTTNNKKSSRRVVVVAAAADDEEGGGG'
const names: Record<string, string> = {
  F: 'Phe', L: 'Leu', S: 'Ser', Y: 'Tyr', C: 'Cys', W: 'Trp', P: 'Pro', H: 'His', Q: 'Gln', R: 'Arg',
  I: 'Ile', M: 'Met', T: 'Thr', N: 'Asn', K: 'Lys', V: 'Val', A: 'Ala', D: 'Asp', E: 'Glu', G: 'Gly', '*': 'Dur',
}
const pair: Record<string, string> = { A: 'U', T: 'A', G: 'C', C: 'G' }
const flip: Record<string, string> = { U: 'A', A: 'U', G: 'C', C: 'G' }
const presets: [string, string][] = [
  ['TACGGATTCACT', 'Örnek 1'],
  ['TACCGATGGATT', 'Örnek 2'],
  ['TACTTTCGCATC', 'Örnek 3'],
]

function decode(codon: string) {
  const i = bases.indexOf(codon[0]) * 16 + bases.indexOf(codon[1]) * 4 + bases.indexOf(codon[2])
  return names[table[i]]
}

export function TranslationSim() {
  const [dna, setDna] = useState(presets[0][0])
  const mrna = dna.split('').map((b) => pair[b]).join('')
  const codons: string[] = []
  for (let i = 0; i + 3 <= mrna.length; i += 3) codons.push(mrna.slice(i, i + 3))
  const rows: { codon: string; anti: string; aa: string }[] = []
  for (const codon of codons) {
    const aa = decode(codon)
    rows.push({ codon, anti: codon.split('').map((b) => flip[b]).join(''), aa })
    if (aa === 'Dur') break
  }
  const stop = rows.some((r) => r.aa === 'Dur')
  const count = rows.filter((r) => r.aa !== 'Dur').length

  return (
    <SimFrame title="Transkripsiyon ve translasyon" hint="Kalıp DNA zincirini 3' ucundan yaz ya da hazır bir örnek seç. mRNA, tRNA antikodonu ve amino asit dizisi hesaplanır.">
      <label className="mt-3 block text-sm font-semibold">
        DNA kalıp zinciri (3' ucundan)
        <input
          value={dna}
          onChange={(e) => setDna(e.target.value.toUpperCase().replace(/[^ACGT]/g, '').slice(0, 30))}
          inputMode="text"
          autoCapitalize="characters"
          spellCheck={false}
          className="tabular mt-2 block h-11 w-full rounded-xl border border-line bg-surface px-3 font-mono text-base tracking-widest"
        />
      </label>
      <Choice value={presets.find(([s]) => s === dna)?.[0] ?? ''} options={presets} onChange={setDna} label="Hazır örnekler" />
      <p className="mt-3 text-xs text-muted">mRNA (5' ucundan)</p>
      <p className="tabular break-all font-mono text-base font-semibold tracking-widest text-primary">{mrna || '-'}</p>
      <div className="mt-3 overflow-x-auto">
        <table className="w-full min-w-[20rem] border-collapse text-center text-sm">
          <thead>
            <tr className="text-xs text-muted">
              <th className="py-1 text-left font-semibold">Kodon</th>
              {rows.map((r, i) => (
                <th key={i} className="tabular px-1 py-1 font-mono">{r.codon}</th>
              ))}
            </tr>
          </thead>
          <tbody>
            <tr>
              <td className="py-1 text-left text-xs text-muted">Antikodon</td>
              {rows.map((r, i) => (
                <td key={i} className="tabular px-1 py-1 font-mono">{r.aa === 'Dur' ? '-' : r.anti}</td>
              ))}
            </tr>
            <tr>
              <td className="py-1 text-left text-xs text-muted">Amino asit</td>
              {rows.map((r, i) => (
                <td key={i} className={`px-1 py-1 font-semibold ${r.aa === 'Dur' ? 'text-danger' : ''}`}>{r.aa}</td>
              ))}
            </tr>
          </tbody>
        </table>
      </div>
      <div className="mt-3 grid gap-2 sm:grid-cols-3">
        <Stat label="Kodon sayısı" value={String(codons.length)} />
        <Stat label="Amino asit sayısı" value={String(count)} highlight />
        <Stat label="Dur kodonu" value={stop ? 'Var, okuma biter' : 'Yok'} />
      </div>
    </SimFrame>
  )
}

export function PhotosynthesisSim() {
  const [light, setLight] = useState(50)
  const [co2, setCo2] = useState(30)
  const [temp, setTemp] = useState(30)
  const fl = (l: number) => Math.min(1, l / 60)
  const fc = Math.min(1, co2 / 50)
  const ft = Math.exp(-(((temp - 30) / 12) ** 2))
  const rate = (l: number) => 100 * Math.min(fl(l), fc) * ft
  const factors = [
    { key: 'Işık', value: fl(light) },
    { key: 'CO₂', value: fc },
    { key: 'Sıcaklık', value: ft },
  ]
  const limit = factors.reduce((min, f) => (f.value < min.value ? f : min))
  const path = Array.from({ length: 51 }, (_, i) => {
    const l = (i / 50) * 100
    return `${i === 0 ? 'M' : 'L'}${(30 + (l / 100) * 260).toFixed(1)},${(130 - rate(l) * 1.1).toFixed(1)}`
  }).join(' ')

  return (
    <SimFrame title="Fotosentez hızı ve sınırlayıcı faktör" hint="Üç etkeni değiştir. Hızı en az bulunan etken belirler. Sınırlayıcı olmayan etkeni artırmak hızı değiştirmez.">
      <div className="mx-auto mt-4 max-w-md overflow-hidden rounded-xl border border-line bg-surface p-3">
        <svg viewBox="0 0 300 160" role="img" aria-label="Fotosentez hızı, ışık şiddeti grafiği" className="block w-full">
          <line x1={30} y1={20} x2={30} y2={130} className="stroke-fg" strokeWidth={1.2} />
          <line x1={30} y1={130} x2={292} y2={130} className="stroke-fg" strokeWidth={1.2} />
          <path d={path} fill="none" className="stroke-primary" strokeWidth={2.5} strokeLinejoin="round" />
          <circle cx={30 + (light / 100) * 260} cy={130 - rate(light) * 1.1} r={5} className="fill-accent" />
          <text x={160} y={152} textAnchor="middle" fontSize={9} className="fill-muted">Işık şiddeti</text>
          <text x={26} y={24} textAnchor="end" fontSize={9} className="fill-muted">Hız</text>
        </svg>
      </div>
      <div className="mt-3 grid gap-4 sm:grid-cols-3">
        <Slider label="Işık şiddeti" value={light} display={`%${light}`} min={0} max={100} step={5} onChange={setLight} />
        <Slider label="CO₂ derişimi" value={co2} display={`%${co2}`} min={0} max={100} step={5} onChange={setCo2} />
        <Slider label="Sıcaklık" value={temp} display={`${temp} °C`} min={10} max={50} step={2} onChange={setTemp} />
      </div>
      <div className="mt-3 grid gap-2 sm:grid-cols-3">
        <Stat label="Fotosentez hızı" value={`%${decimal.format(rate(light))}`} highlight />
        <Stat label="Sınırlayıcı etken" value={limit.value >= 1 ? 'Yok, hız en yüksek' : limit.key} />
        <Stat label="Optimum sıcaklık" value="30 °C" />
      </div>
    </SimFrame>
  )
}

export function PopulationSim() {
  const [r, setR] = useState(0.4)
  const [cap, setCap] = useState(500)
  const [n0, setN0] = useState(20)
  const steps = 30
  const logistic = (t: number) => cap / (1 + ((cap - n0) / n0) * Math.exp(-r * t))
  const exponential = (t: number) => n0 * Math.exp(r * t)
  const top = cap * 1.3
  const px = (t: number) => 30 + (t / steps) * 260
  const py = (n: number) => 130 - (Math.min(n, top) / top) * 110
  const line = (f: (t: number) => number) =>
    Array.from({ length: steps * 2 + 1 }, (_, i) => {
      const t = i / 2
      return `${i === 0 ? 'M' : 'L'}${px(t).toFixed(1)},${py(f(t)).toFixed(1)}`
    }).join(' ')

  return (
    <SimFrame title="Popülasyon büyümesi" hint="Büyüme hızını ve taşıma kapasitesini değiştir. Kaynaklar sınırsız olsaydı popülasyon üstel artardı.">
      <div className="mx-auto mt-4 max-w-md overflow-hidden rounded-xl border border-line bg-surface p-3">
        <svg viewBox="0 0 300 160" role="img" aria-label="Üstel ve lojistik büyüme eğrileri" className="block w-full">
          <line x1={30} y1={20} x2={30} y2={130} className="stroke-fg" strokeWidth={1.2} />
          <line x1={30} y1={130} x2={292} y2={130} className="stroke-fg" strokeWidth={1.2} />
          <line x1={30} y1={py(cap)} x2={292} y2={py(cap)} className="stroke-danger" strokeWidth={1} strokeDasharray="4 3" />
          <text x={290} y={py(cap) - 3} textAnchor="end" fontSize={9} className="fill-danger">Taşıma kapasitesi (K)</text>
          <path d={line(exponential)} fill="none" className="stroke-muted" strokeWidth={2} strokeDasharray="4 3" />
          <path d={line(logistic)} fill="none" className="stroke-primary" strokeWidth={2.5} strokeLinejoin="round" />
          <text x={160} y={152} textAnchor="middle" fontSize={9} className="fill-muted">Zaman</text>
          <text x={26} y={24} textAnchor="end" fontSize={9} className="fill-muted">N</text>
        </svg>
        <p className="mt-1 text-xs text-muted">Kesik çizgi üstel büyüme (J), düz çizgi lojistik büyüme (S).</p>
      </div>
      <div className="mt-3 grid gap-4 sm:grid-cols-3">
        <Slider label="Büyüme hızı (r)" value={r} display={decimal.format(r)} min={0.1} max={1} step={0.05} onChange={setR} />
        <Slider label="Taşıma kapasitesi (K)" value={cap} display={String(cap)} min={100} max={1000} step={50} onChange={setCap} />
        <Slider label="Başlangıç (N₀)" value={n0} display={String(n0)} min={5} max={100} step={5} onChange={setN0} />
      </div>
      <div className="mt-3 grid gap-2 sm:grid-cols-3">
        <Stat label="Lojistik, son birey sayısı" value={decimal.format(Math.round(logistic(steps)))} highlight />
        <Stat label="En hızlı büyüme" value={`N = ${decimal.format(cap / 2)}`} />
        <Stat label="Denge" value="Doğum = ölüm" />
      </div>
    </SimFrame>
  )
}
