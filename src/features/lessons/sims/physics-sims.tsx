import { useState } from 'react'
import { SimFrame, Slider, Stat, decimal } from './frame'

const rad = (deg: number) => (deg * Math.PI) / 180

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

export function VectorSim() {
  const [a, setA] = useState(5)
  const [b, setB] = useState(4)
  const [theta, setTheta] = useState(90)
  const bx = b * Math.cos(rad(theta))
  const by = b * Math.sin(rad(theta))
  const rx = a + bx
  const ry = by
  const r = Math.hypot(rx, ry)
  const arrow = (x1: number, y1: number, x2: number, y2: number, cls: string, dash?: string) => (
    <line x1={x1} y1={-y1} x2={x2} y2={-y2} className={cls} strokeWidth={0.35} strokeLinecap="round" strokeDasharray={dash} />
  )

  return (
    <SimFrame title="Vektörlerin toplanması" hint="İki vektörün büyüklüğünü ve aralarındaki açıyı değiştir. Bileşke, paralelkenarın köşegenidir.">
      <div className="mx-auto mt-4 max-w-md overflow-hidden rounded-xl border border-line bg-surface">
        <svg viewBox="-11 -11.5 32 14" role="img" aria-label="A ve B vektörlerinin bileşkesi" className="block w-full">
          {arrow(0, 0, a, 0, 'stroke-primary')}
          {arrow(0, 0, bx, by, 'stroke-accent')}
          {arrow(a, 0, rx, ry, 'stroke-accent/40', '0.5 0.4')}
          {arrow(bx, by, rx, ry, 'stroke-primary/40', '0.5 0.4')}
          {arrow(0, 0, rx, ry, 'stroke-warning')}
          <circle cx={rx} cy={-ry} r={0.4} className="fill-warning" />
          <g fontSize={0.9} fontWeight={700} className="fill-fg">
            <text x={a / 2} y={1.3} textAnchor="middle">A</text>
            <text x={bx / 2 - 0.9} y={-by / 2} textAnchor="end">B</text>
            <text x={rx / 2 + 0.4} y={-ry / 2 - 0.7}>R</text>
          </g>
        </svg>
      </div>
      <div className="mt-3 grid gap-4 sm:grid-cols-3">
        <Slider label="A büyüklüğü" value={a} display={decimal.format(a)} min={1} max={10} step={1} onChange={setA} />
        <Slider label="B büyüklüğü" value={b} display={decimal.format(b)} min={1} max={10} step={1} onChange={setB} />
        <Slider label="Aradaki açı" value={theta} display={`${theta}°`} min={0} max={180} step={15} onChange={setTheta} />
      </div>
      <div className="mt-3 grid gap-2 sm:grid-cols-3">
        <Stat label="Bileşke R" value={decimal.format(r)} highlight />
        <Stat label="En büyük olabilir" value={decimal.format(a + b)} />
        <Stat label="En küçük olabilir" value={decimal.format(Math.abs(a - b))} />
      </div>
    </SimFrame>
  )
}

export function NewtonSim() {
  const [force, setForce] = useState(20)
  const [mass, setMass] = useState(4)
  const [mu, setMu] = useState(0.2)
  const g = 10
  const maxFriction = mu * mass * g
  const moving = force > maxFriction
  const friction = moving ? maxFriction : force
  const net = force - friction
  const acc = net / mass
  const bar = (value: number, cls: string, label: string) => (
    <div className="mt-2">
      <p className="text-xs text-muted">{label}: <span className="tabular font-semibold text-fg">{decimal.format(value)} N</span></p>
      <div className="mt-1 h-3 rounded-full bg-surface-2">
        <div className={`h-3 rounded-full ${cls}`} style={{ width: `${Math.min(100, (value / 60) * 100)}%` }} />
      </div>
    </div>
  )

  return (
    <SimFrame title="Kuvvet, kütle ve ivme" hint="İtme kuvvetini, kütleyi ve sürtünme katsayısını değiştir. Cisim, kuvvet sürtünmeyi aşınca hareket eder.">
      <div className="mt-4 rounded-xl border border-line bg-surface p-4">
        {bar(force, 'bg-primary', 'Uygulanan kuvvet')}
        {bar(friction, 'bg-warning', 'Sürtünme kuvveti')}
        {bar(net, 'bg-accent', 'Net kuvvet')}
      </div>
      <div className="mt-3 grid gap-4 sm:grid-cols-3">
        <Slider label="Kuvvet" value={force} display={`${force} N`} min={0} max={60} step={1} onChange={setForce} />
        <Slider label="Kütle" value={mass} display={`${mass} kg`} min={1} max={10} step={1} onChange={setMass} />
        <Slider label="Sürtünme katsayısı" value={mu} display={decimal.format(mu)} min={0} max={0.6} step={0.05} onChange={setMu} />
      </div>
      <div className="mt-3 grid gap-2 sm:grid-cols-3">
        <Stat label="En büyük sürtünme" value={`${decimal.format(maxFriction)} N`} />
        <Stat label="İvme" value={`${decimal.format(acc)} m/s²`} highlight />
        <Stat label="Durum" value={moving ? 'Hareket ediyor' : 'Duruyor'} />
      </div>
    </SimFrame>
  )
}

export function ProjectileSim() {
  const [v0, setV0] = useState(40)
  const [angle, setAngle] = useState(45)
  const g = 10
  const vx = v0 * Math.cos(rad(angle))
  const vy = v0 * Math.sin(rad(angle))
  const time = (2 * vy) / g
  const height = (vy * vy) / (2 * g)
  const range = vx * time
  const scale = Math.min(280 / Math.max(range, 1), 150 / Math.max(height, 1))
  const path = Array.from({ length: 61 }, (_, i) => {
    const t = (i / 60) * time
    return `${i === 0 ? 'M' : 'L'}${vx * t * scale + 10},${-(vy * t - 0.5 * g * t * t) * scale}`
  }).join(' ')

  return (
    <SimFrame title="Eğik atış" hint="İlk hızı ve atış açısını değiştir. 45 derece en uzak menzili verir. 30 ve 60 derece aynı menzile ulaşır.">
      <div className="mx-auto mt-4 max-w-md overflow-hidden rounded-xl border border-line bg-surface">
        <svg viewBox="0 -170 300 190" role="img" aria-label="Eğik atış yörüngesi" className="block w-full">
          <line x1={0} y1={0} x2={300} y2={0} className="stroke-fg" strokeWidth={1.5} />
          <path d={path} fill="none" className="stroke-primary" strokeWidth={2.5} strokeLinejoin="round" />
          <circle cx={vx * (time / 2) * scale + 10} cy={-height * scale} r={4} className="fill-accent" />
          <circle cx={10} cy={0} r={4} className="fill-warning" />
          <circle cx={range * scale + 10} cy={0} r={4} className="fill-warning" />
        </svg>
      </div>
      <div className="mt-3 grid gap-4 sm:grid-cols-2">
        <Slider label="İlk hız" value={v0} display={`${v0} m/s`} min={10} max={50} step={5} onChange={setV0} />
        <Slider label="Atış açısı" value={angle} display={`${angle}°`} min={15} max={75} step={5} onChange={setAngle} />
      </div>
      <div className="mt-3 grid gap-2 sm:grid-cols-3">
        <Stat label="Uçuş süresi" value={`${decimal.format(time)} s`} />
        <Stat label="En yüksek nokta" value={`${decimal.format(height)} m`} />
        <Stat label="Menzil" value={`${decimal.format(range)} m`} highlight />
      </div>
    </SimFrame>
  )
}

type Collision = 'yapisik' | 'esnek'

export function CollisionSim() {
  const [m1, setM1] = useState(4)
  const [v1, setV1] = useState(6)
  const [m2, setM2] = useState(2)
  const [v2, setV2] = useState(0)
  const [kind, setKind] = useState<Collision>('yapisik')
  const total = m1 * v1 + m2 * v2
  const common = total / (m1 + m2)
  const f1 = kind === 'yapisik' ? common : ((m1 - m2) * v1 + 2 * m2 * v2) / (m1 + m2)
  const f2 = kind === 'yapisik' ? common : ((m2 - m1) * v2 + 2 * m1 * v1) / (m1 + m2)
  const ke = (a: number, u: number, b: number, w: number) => 0.5 * a * u * u + 0.5 * b * w * w
  const before = ke(m1, v1, m2, v2)
  const after = ke(m1, f1, m2, f2)

  return (
    <SimFrame title="Çarpışma" hint="Kütleleri ve hızları değiştir. Her iki türde de momentum korunur. Kinetik enerji yalnızca esnek çarpışmada korunur.">
      <Choice
        label="Çarpışma türü"
        value={kind}
        onChange={setKind}
        options={[
          ['yapisik', 'Yapışarak'],
          ['esnek', 'Esnek'],
        ]}
      />
      <div className="mt-3 grid gap-4 sm:grid-cols-2">
        <Slider label="1. cismin kütlesi" value={m1} display={`${m1} kg`} min={1} max={10} step={1} onChange={setM1} />
        <Slider label="1. cismin hızı" value={v1} display={`${v1} m/s`} min={-10} max={10} step={1} onChange={setV1} />
        <Slider label="2. cismin kütlesi" value={m2} display={`${m2} kg`} min={1} max={10} step={1} onChange={setM2} />
        <Slider label="2. cismin hızı" value={v2} display={`${v2} m/s`} min={-10} max={10} step={1} onChange={setV2} />
      </div>
      <div className="mt-3 grid gap-2 sm:grid-cols-2">
        <Stat label="Çarpışma sonrası 1. cismin hızı" value={`${decimal.format(f1)} m/s`} />
        <Stat label="Çarpışma sonrası 2. cismin hızı" value={`${decimal.format(f2)} m/s`} />
        <Stat label="Toplam momentum (önce ve sonra)" value={`${decimal.format(total)} kg·m/s`} highlight />
        <Stat label="Kaybolan kinetik enerji" value={`${decimal.format(Math.max(0, before - after))} J`} />
      </div>
    </SimFrame>
  )
}

export function HarmonicSim() {
  const [amp, setAmp] = useState(0.1)
  const [mass, setMass] = useState(1)
  const [k, setK] = useState(100)
  const [phase, setPhase] = useState(0)
  const omega = Math.sqrt(k / mass)
  const period = (2 * Math.PI) / omega
  const t = (phase / 100) * period
  const x = amp * Math.cos(omega * t)
  const v = -amp * omega * Math.sin(omega * t)
  const a = -omega * omega * x
  const total = 0.5 * k * amp * amp
  const potential = 0.5 * k * x * x
  const kinetic = total - potential
  const px = (x / amp) * 100

  return (
    <SimFrame title="Yay üzerinde basit harmonik hareket" hint="Zaman çubuğunu kaydır. Denge noktasında hız en büyük, uç noktalarda ivme en büyüktür. Toplam enerji değişmez.">
      <div className="mt-4 rounded-xl border border-line bg-surface p-4">
        <svg viewBox="-130 -30 260 60" role="img" aria-label="Yaya bağlı cismin konumu" className="block w-full">
          <line x1={-120} y1={20} x2={120} y2={20} className="stroke-line-strong" strokeWidth={1.5} />
          <line x1={0} y1={-20} x2={0} y2={24} className="stroke-muted" strokeWidth={1} strokeDasharray="3 3" />
          <path d={`M-120,0 L${px - 14},0`} fill="none" className="stroke-primary" strokeWidth={2} strokeDasharray="4 3" />
          <rect x={px - 14} y={-14} width={28} height={28} rx={4} className="fill-accent" />
        </svg>
        <div className="mt-2 space-y-1.5 text-xs text-muted">
          {[
            ['Kinetik', kinetic, 'bg-accent'],
            ['Potansiyel', potential, 'bg-primary'],
          ].map(([label, value, cls]) => (
            <div key={String(label)}>
              <p>
                {label} enerji: <span className="tabular font-semibold text-fg">{decimal.format(Number(value))} J</span>
              </p>
              <div className="mt-1 h-2.5 rounded-full bg-surface-2">
                <div className={`h-2.5 rounded-full ${cls}`} style={{ width: `${total ? (Number(value) / total) * 100 : 0}%` }} />
              </div>
            </div>
          ))}
        </div>
      </div>
      <div className="mt-3">
        <Slider label="Zaman" value={phase} display={`${decimal.format(phase / 100)} periyot`} min={0} max={200} step={2} onChange={setPhase} />
      </div>
      <div className="mt-3 grid gap-4 sm:grid-cols-3">
        <Slider label="Genlik" value={amp} display={`${decimal.format(amp)} m`} min={0.05} max={0.2} step={0.05} onChange={setAmp} />
        <Slider label="Kütle" value={mass} display={`${mass} kg`} min={1} max={9} step={1} onChange={setMass} />
        <Slider label="Yay sabiti" value={k} display={`${k} N/m`} min={25} max={400} step={25} onChange={setK} />
      </div>
      <div className="mt-3 grid gap-2 sm:grid-cols-4">
        <Stat label="Periyot" value={`${decimal.format(period)} s`} highlight />
        <Stat label="Konum" value={`${decimal.format(x)} m`} />
        <Stat label="Hız" value={`${decimal.format(v)} m/s`} />
        <Stat label="İvme" value={`${decimal.format(a)} m/s²`} />
      </div>
    </SimFrame>
  )
}

const metals = {
  sezyum: { label: 'Sezyum', work: 2.1 },
  sodyum: { label: 'Sodyum', work: 2.3 },
  cinko: { label: 'Çinko', work: 4.3 },
} as const

type Metal = keyof typeof metals

export function PhotoelectricSim() {
  const [metal, setMetal] = useState<Metal>('sodyum')
  const [wavelength, setWavelength] = useState(400)
  const [intensity, setIntensity] = useState(50)
  const work = metals[metal].work
  const energy = 1240 / wavelength
  const kmax = Math.max(0, energy - work)
  const emits = energy > work
  const threshold = 1240 / work

  return (
    <SimFrame title="Fotoelektrik olay" hint="Dalga boyunu değiştir. Foton enerjisi iş fonksiyonunu aşınca elektron sökülür. Şiddet yalnızca elektron sayısını değiştirir.">
      <Choice
        label="Metal"
        value={metal}
        onChange={setMetal}
        options={(Object.keys(metals) as Metal[]).map((m) => [m, `${metals[m].label} (${decimal.format(metals[m].work)} eV)`])}
      />
      <div className="mt-3 grid gap-4 sm:grid-cols-2">
        <Slider label="Dalga boyu" value={wavelength} display={`${wavelength} nm`} min={200} max={800} step={10} onChange={setWavelength} />
        <Slider label="Işık şiddeti" value={intensity} display={`%${intensity}`} min={10} max={100} step={10} onChange={setIntensity} />
      </div>
      <div className="mt-3 grid gap-2 sm:grid-cols-4">
        <Stat label="Foton enerjisi" value={`${decimal.format(energy)} eV`} />
        <Stat label="En büyük kinetik enerji" value={`${decimal.format(kmax)} eV`} highlight />
        <Stat label="Durdurma potansiyeli" value={`${decimal.format(kmax)} V`} />
        <Stat label="Elektron sayısı (akım)" value={emits ? `%${intensity}` : 'Yok'} />
      </div>
      <p className="mt-3 text-sm text-muted">
        {emits
          ? 'Foton enerjisi iş fonksiyonundan büyük. Elektronlar sökülür.'
          : `Foton enerjisi iş fonksiyonundan küçük. Elektron sökülmez. Eşik dalga boyu ${decimal.format(threshold)} nm.`}
      </p>
    </SimFrame>
  )
}
