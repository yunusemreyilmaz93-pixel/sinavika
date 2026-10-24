import { useState } from 'react'
import { Button } from '@/components/ui/button'
import { SimFrame, Slider, Stat } from './frame'
import {
  FELSEFE_15_17,
  FELSEFE_18_19,
  FELSEFE_20,
  HINT_CIN,
  ISLAM_BILIM,
  MANTIK_TARIHI,
  PSIKOLOJI_TARIHI,
  SOSYOLOJI_TARIHI,
  YAHUDI_HRISTIYAN,
} from './humanities-ayt-data'
import { Timeline, type TimelineItem } from './timeline'

const hint = 'Şeridi kaydır ve bir başlığa dokun. Ayrıntısı altta açılır.'

function Strip({ title, label, items }: { title: string; label: string; items: TimelineItem[] }) {
  return (
    <SimFrame title={title} hint={hint}>
      <Timeline items={items} label={label} />
    </SimFrame>
  )
}

export const LogicHistorySim = () => <Strip title="Mantığın gelişimi" label="Mantık tarihinde önemli adımlar" items={MANTIK_TARIHI} />
export const Philosophy17Sim = () => <Strip title="15. ile 17. yüzyıl düşünürleri" label="Rönesans, rasyonalizm ve empirizm" items={FELSEFE_15_17} />
export const Philosophy19Sim = () => <Strip title="18. ve 19. yüzyıl düşünürleri" label="Aydınlanma ve 19. yüzyıl felsefesi" items={FELSEFE_18_19} />
export const Philosophy20Sim = () => <Strip title="20. yüzyıl felsefesi" label="20. yüzyıl akımları ve düşünürleri" items={FELSEFE_20} />
export const PsychologyHistorySim = () => <Strip title="Psikolojide ekoller" label="Psikoloji tarihinde ekoller" items={PSIKOLOJI_TARIHI} />
export const SociologyHistorySim = () => <Strip title="Sosyolojinin önemli isimleri" label="Sosyoloji tarihinde önemli isimler" items={SOSYOLOJI_TARIHI} />
export const IslamScienceSim = () => <Strip title="İslam dünyasında bilim insanları" label="İslam dünyasında bilim" items={ISLAM_BILIM} />
export const EasternReligionsSim = () => <Strip title="Hint ve Çin dinleri" label="Hint ve Çin dinlerinin gelişimi" items={HINT_CIN} />
export const JewishChristianSim = () => <Strip title="Yahudilik ve Hristiyanlık" label="Yahudilik ve Hristiyanlıkta önemli olaylar" items={YAHUDI_HRISTIYAN} />

const OPERATORS = [
  { id: 'degil', label: 'Değil', symbol: 'p′', apply: (p: boolean) => !p },
  { id: 've', label: 'Ve', symbol: 'p ∧ q', apply: (p: boolean, q: boolean) => p && q },
  { id: 'veya', label: 'Veya', symbol: 'p ∨ q', apply: (p: boolean, q: boolean) => p || q },
  { id: 'yada', label: 'Ya da', symbol: 'p ⊻ q', apply: (p: boolean, q: boolean) => p !== q },
  { id: 'ise', label: 'İse', symbol: 'p ⇒ q', apply: (p: boolean, q: boolean) => !p || q },
  { id: 'ancak', label: 'Ancak ve ancak', symbol: 'p ⇔ q', apply: (p: boolean, q: boolean) => p === q },
] as const

const bit = (v: boolean) => (v ? '1' : '0')

export function TruthTableSim() {
  const [opId, setOpId] = useState<(typeof OPERATORS)[number]['id']>('ve')
  const [p, setP] = useState(true)
  const [q, setQ] = useState(false)
  const op = OPERATORS.find((o) => o.id === opId) ?? OPERATORS[1]
  const unary = op.id === 'degil'
  const rows = unary
    ? [{ p: true, q: true }, { p: false, q: true }]
    : [{ p: true, q: true }, { p: true, q: false }, { p: false, q: true }, { p: false, q: false }]

  return (
    <SimFrame title="Doğruluk tablosu" hint="Bir bağlaç seç, p ve q değerlerini değiştir. 1 doğru, 0 yanlış demektir.">
      <div className="mt-4 flex flex-wrap gap-2" role="group" aria-label="Bağlaç">
        {OPERATORS.map((o) => (
          <Button key={o.id} variant={o.id === opId ? 'primary' : 'secondary'} size="sm" className="min-h-11" aria-pressed={o.id === opId} onClick={() => setOpId(o.id)}>
            {o.label}
          </Button>
        ))}
      </div>
      <div className="mt-3 flex flex-wrap gap-2">
        <Button variant={p ? 'soft' : 'secondary'} size="sm" className="min-h-11" aria-pressed={p} onClick={() => setP(!p)}>
          p = {bit(p)}
        </Button>
        {!unary && (
          <Button variant={q ? 'soft' : 'secondary'} size="sm" className="min-h-11" aria-pressed={q} onClick={() => setQ(!q)}>
            q = {bit(q)}
          </Button>
        )}
      </div>
      <div className="mt-3 grid grid-cols-2 gap-2">
        <Stat label="Bileşik önerme" value={op.symbol} />
        <Stat label="Sonuç" value={bit(op.apply(p, q))} highlight />
      </div>
      <table className="mt-3 w-full text-center text-sm">
        <thead>
          <tr className="text-muted">
            <th className="py-1 font-semibold">p</th>
            {!unary && <th className="py-1 font-semibold">q</th>}
            <th className="py-1 font-semibold">{op.symbol}</th>
          </tr>
        </thead>
        <tbody>
          {rows.map((r) => {
            const current = r.p === p && (unary || r.q === q)
            return (
              <tr key={`${r.p}${r.q}`} className={current ? 'bg-primary-soft font-bold' : ''}>
                <td className="tabular py-1.5">{bit(r.p)}</td>
                {!unary && <td className="tabular py-1.5">{bit(r.q)}</td>}
                <td className="tabular py-1.5">{bit(op.apply(r.p, r.q))}</td>
              </tr>
            )
          })}
        </tbody>
      </table>
    </SimFrame>
  )
}

const strength = (repeats: number) => 3 ** repeats
const retention = (days: number, repeats: number) => 100 * Math.exp(-days / strength(repeats))

export function ForgettingSim() {
  const [days, setDays] = useState(3)
  const [repeats, setRepeats] = useState(0)
  const W = 300
  const H = 150
  const x = (d: number) => 24 + (d / 30) * (W - 36)
  const y = (r: number) => 10 + ((100 - r) / 100) * (H - 30)
  const curve = (n: number) =>
    Array.from({ length: 31 }, (_, d) => `${d === 0 ? 'M' : 'L'}${x(d).toFixed(1)} ${y(retention(d, n)).toFixed(1)}`).join(' ')
  const now = retention(days, repeats)

  return (
    <SimFrame title="Unutma eğrisi" hint="Geçen günü ve tekrar sayısını değiştir. Tekrar yapıldıkça eğri yavaş düşer. Sayılar örnektir, eğrinin biçimi önemlidir.">
      <div className="mt-4 overflow-hidden rounded-xl border border-line bg-surface">
        <svg viewBox={`0 0 ${W} ${H}`} role="img" aria-label={`${days}. günde hatırlama yaklaşık yüzde ${Math.round(now)}`} className="block w-full">
          <line x1={24} y1={H - 20} x2={W - 12} y2={H - 20} className="stroke-line-strong" strokeWidth={1.5} />
          <line x1={24} y1={10} x2={24} y2={H - 20} className="stroke-line-strong" strokeWidth={1.5} />
          <path d={curve(0)} className="fill-none stroke-muted" strokeWidth={1.5} strokeDasharray="4 4" />
          <path d={curve(repeats)} className="fill-none stroke-primary" strokeWidth={2.5} />
          <circle cx={x(days)} cy={y(now)} r={5} className="fill-accent" />
          <text x={24} y={H - 6} fontSize={10} className="fill-muted">
            0
          </text>
          <text x={W - 14} y={H - 6} fontSize={10} textAnchor="end" className="fill-muted">
            30 gün
          </text>
          <text x={28} y={20} fontSize={10} className="fill-muted">
            %100
          </text>
        </svg>
      </div>
      <div className="mt-3 grid gap-3 sm:grid-cols-2">
        <Slider label="Geçen gün" value={days} display={`${days}`} min={0} max={30} step={1} onChange={setDays} />
        <Slider label="Tekrar sayısı" value={repeats} display={`${repeats}`} min={0} max={4} step={1} onChange={setRepeats} />
      </div>
      <div className="mt-3">
        <Stat label="Hatırlama" value={`%${Math.round(now)}`} highlight />
      </div>
    </SimFrame>
  )
}
