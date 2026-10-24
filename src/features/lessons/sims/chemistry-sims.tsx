import { useMemo, useState } from 'react'
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

type Conc = [number, number, number]
type Change = 'yok' | 'n2' | 'nh3' | 'hacim' | 'sicaklik' | 'katalizor' | 'soygaz'

const BASE: Conc = [1, 2, 2]
const BASE_K = 0.5
const quotient = ([n, h, a]: Conc) => (a * a) / (n * h ** 3)

function settle(start: Conc, k: number): Conc {
  const [n, h, a] = start
  let lo = -a / 2 + 1e-9
  let hi = Math.min(n, h / 3) - 1e-9
  for (let i = 0; i < 80; i++) {
    const mid = (lo + hi) / 2
    const q = quotient([n - mid, h - 3 * mid, a + 2 * mid])
    if (q < k) lo = mid
    else hi = mid
  }
  const x = (lo + hi) / 2
  return [n - x, h - 3 * x, a + 2 * x]
}

const changes: [Change, string][] = [
  ['yok', 'Denge'],
  ['n2', 'N2 ekle'],
  ['nh3', 'NH3 ekle'],
  ['hacim', 'Hacmi yarıya indir'],
  ['sicaklik', 'Sıcaklığı artır'],
  ['katalizor', 'Katalizör'],
  ['soygaz', 'Sabit hacimde He ekle'],
]

export function EquilibriumSim() {
  const [change, setChange] = useState<Change>('yok')
  const { start, after, k } = useMemo(() => {
    let begin: Conc = [...BASE]
    let kNew = BASE_K
    if (change === 'n2') begin = [BASE[0] + 1, BASE[1], BASE[2]]
    if (change === 'nh3') begin = [BASE[0], BASE[1], BASE[2] + 1]
    if (change === 'hacim') begin = [BASE[0] * 2, BASE[1] * 2, BASE[2] * 2]
    if (change === 'sicaklik') kNew = BASE_K / 2
    const done = change === 'yok' || change === 'katalizor' || change === 'soygaz' ? ([...BASE] as Conc) : settle(begin, kNew)
    return { start: begin, after: done, k: kNew }
  }, [change])
  const q = quotient(start)
  const direction = Math.abs(after[2] - BASE[2]) < 0.005 && Math.abs(after[0] - BASE[0]) < 0.005 ? 'Kayma yok' : after[2] > BASE[2] ? 'Ürünler yönüne' : 'Girenler yönüne'
  const max = 5
  const names = ['N2', 'H2', 'NH3']

  return (
    <SimFrame title="Le Chatelier ilkesi" hint="N2 + 3H2 ⇌ 2NH3 tepkimesi ekzotermiktir. Dengeye bir etki uygula ve yeni dengeyi karşılaştır.">
      <Choice value={change} options={changes} onChange={setChange} label="Dengeye uygulanan etki" />
      <div className="mx-auto mt-4 max-w-md overflow-hidden rounded-xl border border-line bg-surface p-3">
        <svg viewBox="0 0 300 150" role="img" aria-label="Denge derişimleri" className="block w-full">
          <line x1={20} y1={120} x2={290} y2={120} className="stroke-line-strong" strokeWidth={1} />
          {names.map((name, i) => {
            const x = 50 + i * 85
            const h0 = (BASE[i] / max) * 100
            const h1 = (after[i] / max) * 100
            return (
              <g key={name}>
                <rect x={x} y={120 - h0} width={26} height={h0} className="fill-none stroke-muted" strokeWidth={1.5} strokeDasharray="3 3" />
                <rect x={x + 8} y={120 - h1} width={26} height={h1} className="fill-primary" opacity={0.85} />
                <text x={x + 17} y={138} textAnchor="middle" fontSize={11} fontWeight={700} className="fill-fg">{name}</text>
                <text x={x + 21} y={120 - Math.max(h0, h1) - 4} textAnchor="middle" fontSize={10} className="fill-fg tabular">{decimal.format(after[i])}</text>
              </g>
            )
          })}
        </svg>
        <p className="mt-1 text-xs text-muted">Kesik çizgi eski denge, dolu sütun yeni denge (mol/L).</p>
      </div>
      <div className="mt-3 grid gap-2 sm:grid-cols-3">
        <Stat label="Etki anında Q" value={decimal.format(q)} />
        <Stat label="Kc" value={decimal.format(k)} />
        <Stat label="Denge" value={direction} highlight />
      </div>
    </SimFrame>
  )
}

const R = 0.008314
const energy = (e: number, rt: number) => (2 / Math.sqrt(Math.PI)) * rt ** -1.5 * Math.sqrt(e) * Math.exp(-e / rt)

function tail(ea: number, rt: number) {
  const top = Math.max(ea, 0) + 40 * rt
  const steps = 1500
  const dx = (top - ea) / steps
  let sum = 0
  for (let i = 0; i < steps; i++) sum += energy(ea + (i + 0.5) * dx, rt) * dx
  return sum
}

export function RateSim() {
  const [temp, setTemp] = useState(400)
  const [ea, setEa] = useState(15)
  const [cat, setCat] = useState(false)
  const eaEff = cat ? ea * 0.6 : ea
  const rt = R * temp
  const rt0 = R * 300
  const maxE = 30
  const scaleY = 100 / 0.22
  const curve = (t: number) =>
    Array.from({ length: 121 }, (_, i) => {
      const e = (i / 120) * maxE
      return `${i === 0 ? 'M' : 'L'}${20 + (e / maxE) * 260},${120 - Math.min(energy(e, R * t) * scaleY, 112)}`
    }).join(' ')
  const area =
    `M${20 + (eaEff / maxE) * 260},120 ` +
    Array.from({ length: 61 }, (_, i) => {
      const e = eaEff + ((maxE - eaEff) * i) / 60
      return `L${20 + (e / maxE) * 260},${120 - Math.min(energy(e, rt) * scaleY, 112)}`
    }).join(' ') +
    ` L280,120 Z`
  const fraction = tail(eaEff, rt)
  const relative = fraction / tail(ea, rt0)

  return (
    <SimFrame title="Tepkime hızı ve etkin çarpışma" hint="Sıcaklığı ve aktifleşme enerjisini değiştir. Boyalı alan, enerjisi aktifleşme enerjisini aşan tanecik oranıdır.">
      <div className="mx-auto mt-4 max-w-md overflow-hidden rounded-xl border border-line bg-surface p-3">
        <svg viewBox="0 0 300 150" role="img" aria-label="Tanecik enerji dağılımı" className="block w-full">
          <line x1={20} y1={120} x2={285} y2={120} className="stroke-fg" strokeWidth={1.2} />
          <path d={area} className="fill-accent" opacity={0.35} />
          <path d={curve(300)} fill="none" className="stroke-muted" strokeWidth={1.5} strokeDasharray="4 3" />
          <path d={curve(temp)} fill="none" className="stroke-primary" strokeWidth={2.5} strokeLinejoin="round" />
          <line x1={20 + (eaEff / maxE) * 260} y1={20} x2={20 + (eaEff / maxE) * 260} y2={120} className="stroke-danger" strokeWidth={1.5} />
          <text x={20 + (eaEff / maxE) * 260 + 4} y={30} fontSize={10} fontWeight={700} className="fill-danger">Ea</text>
          <text x={150} y={142} textAnchor="middle" fontSize={10} className="fill-muted">Tanecik enerjisi</text>
        </svg>
        <p className="mt-1 text-xs text-muted">Kesik çizgi 300 K, düz çizgi seçtiğin sıcaklık.</p>
      </div>
      <div className="mt-3 grid gap-4 sm:grid-cols-2">
        <Slider label="Sıcaklık" value={temp} display={`${temp} K`} min={250} max={600} step={10} onChange={setTemp} />
        <Slider label="Aktifleşme enerjisi" value={ea} display={`${ea} kJ/mol`} min={8} max={28} step={1} onChange={setEa} />
      </div>
      <Choice value={cat ? 'var' : 'yok'} options={[['yok', 'Katalizör yok'], ['var', 'Katalizör var']]} onChange={(v) => setCat(v === 'var')} label="Katalizör" />
      <div className="mt-3 grid gap-2 sm:grid-cols-3">
        <Stat label="Etkin Ea" value={`${decimal.format(eaEff)} kJ/mol`} />
        <Stat label="Ea'yı aşan oran" value={`%${fraction < 0.01 ? fraction.toExponential(1).replace('e-', ' x 10^-') : decimal.format(fraction * 100)}`} />
        <Stat label="Göreli hız" value={`${decimal.format(relative)} kat`} highlight />
      </div>
    </SimFrame>
  )
}

const metals = [
  { key: 'Mg', e: -2.37, z: 2, ion: 'Mg²⁺' },
  { key: 'Al', e: -1.66, z: 3, ion: 'Al³⁺' },
  { key: 'Zn', e: -0.76, z: 2, ion: 'Zn²⁺' },
  { key: 'Fe', e: -0.44, z: 2, ion: 'Fe²⁺' },
  { key: 'Cu', e: 0.34, z: 2, ion: 'Cu²⁺' },
  { key: 'Ag', e: 0.8, z: 1, ion: 'Ag⁺' },
]
const gcd = (a: number, b: number): number => (b === 0 ? a : gcd(b, a % b))

export function CellSim() {
  const [first, setFirst] = useState('Zn')
  const [second, setSecond] = useState('Cu')
  const [logQ, setLogQ] = useState(0)
  const a = metals.find((m) => m.key === first)!
  const b = metals.find((m) => m.key === second)!
  const same = a.key === b.key
  const anode = a.e <= b.e ? a : b
  const cathode = a.e <= b.e ? b : a
  const e0 = cathode.e - anode.e
  const n = (anode.z * cathode.z) / gcd(anode.z, cathode.z)
  const e = e0 - (0.059 / n) * logQ

  const cell = (x: number, metal: typeof a, role: string, mass: string) => (
    <g>
      <rect x={x} y={70} width={110} height={90} rx={6} className="fill-primary-soft stroke-line-strong" strokeWidth={1.5} />
      <rect x={x + 48} y={36} width={14} height={110} rx={2} className="fill-fg" opacity={0.75} />
      <text x={x + 55} y={30} textAnchor="middle" fontSize={13} fontWeight={800} className="fill-fg">{metal.key}</text>
      <text x={x + 55} y={178} textAnchor="middle" fontSize={11} className="fill-muted">{metal.ion} çözeltisi</text>
      <text x={x + 55} y={196} textAnchor="middle" fontSize={11} fontWeight={700} className="fill-primary">{role}</text>
      <text x={x + 55} y={212} textAnchor="middle" fontSize={10} className="fill-muted">{mass}</text>
    </g>
  )

  return (
    <SimFrame title="Galvanik hücre" hint="İki metal seç. Potansiyeli küçük olan anot olur. Derişim oranını değiştirerek Nernst eşitliğinin etkisini gör.">
      <Choice value={first} options={metals.map((m) => [m.key, m.key] as [string, string])} onChange={setFirst} label="Birinci metal" />
      <Choice value={second} options={metals.map((m) => [m.key, m.key] as [string, string])} onChange={setSecond} label="İkinci metal" />
      {same ? (
        <p className="mt-4 rounded-xl bg-surface-2 p-3 text-sm">Pil kurmak için iki farklı metal seç.</p>
      ) : (
        <>
          <div className="mx-auto mt-4 max-w-md overflow-hidden rounded-xl border border-line bg-surface p-2">
            <svg viewBox="0 0 300 220" role="img" aria-label="Galvanik hücre şeması" className="block w-full">
              {cell(20, anode, 'Anot (yükseltgenme)', 'Kütle azalır')}
              {cell(170, cathode, 'Katot (indirgenme)', 'Kütle artar')}
              <path d="M75,36 V14 H225 V36" fill="none" className="stroke-warning" strokeWidth={2} />
              <path d="M140,14 l8,-5 v10 z" className="fill-warning" />
              <text x={150} y={9} textAnchor="middle" fontSize={10} className="fill-muted">e⁻</text>
              <path d="M110,85 V72 H190 V85" fill="none" className="stroke-line-strong" strokeWidth={5} />
            </svg>
          </div>
          <div className="mt-3">
            <Slider label="log Q (ürün/giren derişim oranı)" value={logQ} display={decimal.format(logQ)} min={-3} max={3} step={0.5} onChange={setLogQ} />
          </div>
          <div className="mt-3 grid gap-2 sm:grid-cols-3">
            <Stat label="Standart E°" value={`${decimal.format(e0)} V`} highlight />
            <Stat label="Elektron sayısı n" value={String(n)} />
            <Stat label="Nernst E" value={`${decimal.format(e)} V`} />
          </div>
        </>
      )}
    </SimFrame>
  )
}

const salts = [
  { key: 'agcl', name: 'AgCl', ksp: 1e-10, exp: 1, cation: 'Ag⁺', anion: 'Cl⁻', sat: 1e-5 },
  { key: 'caf2', name: 'CaF2', ksp: 4e-12, exp: 2, cation: 'Ca²⁺', anion: 'F⁻', sat: 1e-4 },
]

export function SolubilitySim() {
  const [key, setKey] = useState('agcl')
  const [pc, setPc] = useState(5)
  const [pa, setPa] = useState(5)
  const salt = salts.find((s) => s.key === key)!
  const q = 10 ** (-pc) * 10 ** (-pa * salt.exp)
  const status = q > salt.ksp * 1.0001 ? 'Çökelme olur' : q < salt.ksp * 0.9999 ? 'Doymamış' : 'Doygun'
  const fmt = (v: number) => v.toExponential(1).replace('e', ' x 10^')

  return (
    <SimFrame title="Çökelme koşulu" hint="Karışımdaki iyon derişimlerini değiştir. Q, Kçç değerini aşınca katı tuz çöker.">
      <Choice value={key} options={salts.map((s) => [s.key, s.name] as [string, string])} onChange={setKey} label="Tuz" />
      <div className="mx-auto mt-4 max-w-xs overflow-hidden rounded-xl border border-line bg-surface p-3">
        <svg viewBox="0 0 160 130" role="img" aria-label="Çökelme kabı" className="block w-full">
          <path d="M40,15 V105 Q40,115 50,115 H110 Q120,115 120,105 V15" fill="none" className="stroke-line-strong" strokeWidth={2} />
          <path d="M41,38 H119 V105 Q119,114 110,114 H50 Q41,114 41,105 Z" className="fill-primary-soft" />
          {q > salt.ksp * 1.0001 && <path d="M43,108 Q80,98 117,108 V105 Q117,112 110,112 H50 Q43,112 43,105 Z" className="fill-fg" opacity={0.75} />}
        </svg>
      </div>
      <div className="mt-3 grid gap-4 sm:grid-cols-2">
        <Slider label={`[${salt.cation}]`} value={pc} display={`10^-${decimal.format(pc)} M`} min={1} max={9} step={0.5} onChange={setPc} />
        <Slider label={`[${salt.anion}]`} value={pa} display={`10^-${decimal.format(pa)} M`} min={1} max={9} step={0.5} onChange={setPa} />
      </div>
      <div className="mt-3 grid gap-2 sm:grid-cols-3">
        <Stat label="Q" value={fmt(q)} />
        <Stat label="Kçç" value={fmt(salt.ksp)} />
        <Stat label="Durum" value={status} highlight />
      </div>
    </SimFrame>
  )
}
