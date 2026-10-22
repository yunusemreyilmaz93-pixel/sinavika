import { useEffect, useState } from 'react'
import { Pause, Play } from 'lucide-react'
import { Button } from '@/components/ui/button'
import { SimFrame, Slider, Stat, decimal } from './frame'

const LENGTH = 16
const W = 300
const H = 120
const SCALE = 20

export function WaveSim() {
  const [amplitude, setAmplitude] = useState(2)
  const [wavelength, setWavelength] = useState(4)
  const [frequency, setFrequency] = useState(0.5)
  const [time, setTime] = useState(0)
  const [running, setRunning] = useState(() => !window.matchMedia('(prefers-reduced-motion: reduce)').matches)

  useEffect(() => {
    if (!running) return
    let raf = 0
    let last = performance.now()
    const frame = (now: number) => {
      raf = requestAnimationFrame(frame)
      if (document.hidden) {
        last = now
        return
      }
      setTime((t) => t + Math.min((now - last) / 1000, 0.05))
      last = now
    }
    raf = requestAnimationFrame(frame)
    return () => cancelAnimationFrame(raf)
  }, [running])

  const speed = wavelength * frequency
  const period = 1 / frequency
  const mid = H / 2
  const gx = (x: number) => (x / LENGTH) * W
  const points = Array.from({ length: 161 }, (_, i) => {
    const x = (i / 160) * LENGTH
    const y = amplitude * Math.sin(2 * Math.PI * (x / wavelength - frequency * time))
    return `${i === 0 ? 'M' : 'L'}${gx(x)},${mid - y * (SCALE / 2)}`
  }).join(' ')

  return (
    <SimFrame
      title="Dalganın özellikleri"
      hint="Genliği, dalga boyunu ve frekansı değiştir. Dalganın hızı dalga boyu ile frekansın çarpımıdır ve genliğe bağlı değildir."
    >
      <div className="mt-4 overflow-hidden rounded-xl border border-line bg-surface">
        <svg viewBox={`0 0 ${W} ${H}`} role="img" aria-label="Yayılan dalga" className="block w-full">
          <line x1={0} y1={mid} x2={W} y2={mid} className="stroke-line-strong" strokeWidth={0.8} strokeDasharray="3 3" />
          <path d={points} fill="none" className="stroke-primary" strokeWidth={2.4} strokeLinejoin="round" />
          <line x1={gx(0.5)} y1={mid} x2={gx(0.5)} y2={mid - amplitude * (SCALE / 2)} className="stroke-warning" strokeWidth={1.4} />
          <line x1={gx(1)} y1={mid + amplitude * (SCALE / 2) + 14} x2={gx(1 + wavelength)} y2={mid + amplitude * (SCALE / 2) + 14} className="stroke-accent" strokeWidth={1.4} />
          <text x={gx(1 + wavelength / 2)} y={mid + amplitude * (SCALE / 2) + 24} textAnchor="middle" fontSize={8} className="fill-accent">
            λ
          </text>
        </svg>
      </div>

      <div className="mt-3 grid gap-4 sm:grid-cols-3">
        <Slider label="Genlik (m)" value={amplitude} display={decimal.format(amplitude)} min={0.5} max={3} step={0.5} onChange={setAmplitude} />
        <Slider label="Dalga boyu (m)" value={wavelength} display={decimal.format(wavelength)} min={2} max={8} step={1} onChange={setWavelength} />
        <Slider label="Frekans (Hz)" value={frequency} display={decimal.format(frequency)} min={0.25} max={2} step={0.25} onChange={setFrequency} />
      </div>

      <div className="mt-3 flex flex-wrap items-center gap-2">
        <Button variant="secondary" size="sm" className="min-h-11" onClick={() => setRunning((r) => !r)}>
          {running ? <Pause /> : <Play />}
          {running ? 'Duraklat' : 'Başlat'}
        </Button>
      </div>

      <div className="mt-3 grid gap-2 sm:grid-cols-3">
        <Stat label="Periyot (T = 1 / f)" value={`${decimal.format(period)} s`} />
        <Stat label="Hız (v = λ · f)" value={`${decimal.format(speed)} m/s`} highlight />
        <Stat label="Genlik" value={`${decimal.format(amplitude)} m`} />
      </div>
    </SimFrame>
  )
}
