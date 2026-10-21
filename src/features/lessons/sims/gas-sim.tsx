import { Pause, Play } from 'lucide-react'
import { useEffect, useRef, useState } from 'react'
import { Button } from '@/components/ui/button'
import { cn } from '@/lib/cn'

const COUNT = 36
const BASE_TEMP = 300
const BASE_SPEED = 120
const BASE_VOLUME = 100
const HEIGHT = 240
const MEAN_SQUARE = 1.03

type Particle = { x: number; y: number; vx: number; vy: number }
type Guess = 'artar' | 'azalir' | 'degismez'

function spawn(width: number): Particle[] {
  return Array.from({ length: COUNT }, () => {
    const angle = Math.random() * Math.PI * 2
    const speed = BASE_SPEED * (0.7 + Math.random() * 0.6)
    return { x: 8 + Math.random() * (width - 16), y: 8 + Math.random() * (HEIGHT - 16), vx: Math.cos(angle) * speed, vy: Math.sin(angle) * speed }
  })
}

const number = new Intl.NumberFormat('tr-TR', { minimumFractionDigits: 2, maximumFractionDigits: 2 })

export function GasSim() {
  const canvas = useRef<HTMLCanvasElement>(null)
  const box = useRef<HTMLDivElement>(null)
  const [temp, setTemp] = useState(BASE_TEMP)
  const [volume, setVolume] = useState(BASE_VOLUME)
  const [pressure, setPressure] = useState(1)
  const [running, setRunning] = useState(() => !window.matchMedia('(prefers-reduced-motion: reduce)').matches)
  const [guess, setGuess] = useState<Guess | null>(null)
  const [moved, setMoved] = useState(false)

  const state = useRef({ temp, volume, running, width: 0, particles: [] as Particle[], impulse: 0, smooth: 1, prevTemp: BASE_TEMP })
  useEffect(() => {
    state.current.temp = temp
    state.current.volume = volume
    state.current.running = running
  }, [temp, volume, running])

  useEffect(() => {
    const el = canvas.current
    const holder = box.current
    if (!el || !holder) return
    const ctx = el.getContext('2d')
    if (!ctx) return
    const s = state.current
    const css = getComputedStyle(document.documentElement)
    const color = (name: string) => css.getPropertyValue(name).trim() || 'currentColor'
    let raf = 0
    let last = performance.now()
    let visible = true
    let readout = 0

    const resize = () => {
      const width = holder.clientWidth
      const ratio = window.devicePixelRatio || 1
      el.width = width * ratio
      el.height = HEIGHT * ratio
      el.style.height = `${HEIGHT}px`
      ctx.setTransform(ratio, 0, 0, ratio, 0, 0)
      if (!s.particles.length) s.particles = spawn(width)
      s.width = width
    }
    resize()
    const observer = new ResizeObserver(resize)
    observer.observe(holder)
    const io = new IntersectionObserver(([entry]) => {
      visible = entry.isIntersecting
    })
    io.observe(el)

    const draw = () => {
      const wall = (s.width * s.volume) / 100
      ctx.clearRect(0, 0, s.width, HEIGHT)
      ctx.fillStyle = color('--surface-2')
      ctx.fillRect(0, 0, wall, HEIGHT)
      ctx.fillStyle = color('--primary')
      for (const p of s.particles) {
        ctx.beginPath()
        ctx.arc(p.x, p.y, 4, 0, Math.PI * 2)
        ctx.fill()
      }
      ctx.fillStyle = color('--fg')
      ctx.fillRect(wall, 0, 4, HEIGHT)
    }

    const frame = (now: number) => {
      raf = requestAnimationFrame(frame)
      const dt = Math.min((now - last) / 1000, 0.05)
      last = now
      if (!visible || document.hidden) return
      const wall = (s.width * s.volume) / 100
      if (s.temp !== s.prevTemp) {
        const k = Math.sqrt(s.temp / s.prevTemp)
        for (const p of s.particles) {
          p.vx *= k
          p.vy *= k
        }
        s.prevTemp = s.temp
      }
      if (s.running) {
        for (const p of s.particles) {
          const before = p.x
          p.x += p.vx * dt
          p.y += p.vy * dt
          if (p.x < 4) {
            p.x = 4
            p.vx = Math.abs(p.vx)
          }
          if (p.x > wall - 4) {
            p.x = wall - 4
            if (p.vx > 0 && before <= wall - 4) s.impulse += 2 * p.vx
            p.vx = -Math.abs(p.vx)
          }
          if (p.y < 4) {
            p.y = 4
            p.vy = Math.abs(p.vy)
          }
          if (p.y > HEIGHT - 4) {
            p.y = HEIGHT - 4
            p.vy = -Math.abs(p.vy)
          }
        }
        const force = s.impulse / Math.max(dt, 1e-3)
        s.impulse = 0
        const reference = (COUNT * BASE_SPEED * BASE_SPEED * MEAN_SQUARE * 0.5) / s.width
        s.smooth += (force / reference - s.smooth) * Math.min(dt * 0.7, 1)
        readout += dt
        if (readout > 0.2) {
          readout = 0
          setPressure(s.smooth)
        }
      }
      draw()
    }
    raf = requestAnimationFrame(frame)
    draw()
    return () => {
      cancelAnimationFrame(raf)
      observer.disconnect()
      io.disconnect()
    }
  }, [])

  const changeTemp = (value: number) => {
    setTemp(value)
    if (guess && Math.abs(value - BASE_TEMP) >= 100) setMoved(true)
  }

  const verdict = guess && moved ? (temp > BASE_TEMP ? 'artar' : temp < BASE_TEMP ? 'azalir' : 'degismez') : null
  const expected = temp / BASE_TEMP / (volume / BASE_VOLUME)

  return (
    <figure className="my-6 rounded-2xl border border-line bg-surface p-4 sm:p-5">
      <figcaption className="font-display text-base font-bold">Gaz parçacıkları</figcaption>
      <p className="mt-1 text-sm text-muted">Parçacıklar kabın duvarına çarptıkça basınç oluşur. Sıcaklığı ve hacmi değiştirip basıncın nasıl değiştiğine bak.</p>

      {guess === null ? (
        <div className="mt-4 rounded-xl bg-accent-soft p-3 text-accent-soft-fg">
          <p className="text-[15px] font-semibold">Önce tahmin et: Sıcaklığı artırırsan basınç ne olur?</p>
          <div className="mt-2 flex flex-wrap gap-2">
            {(
              [
                ['artar', 'Artar'],
                ['azalir', 'Azalır'],
                ['degismez', 'Değişmez'],
              ] as const
            ).map(([value, label]) => (
              <Button key={value} variant="secondary" size="sm" className="min-h-11" onClick={() => setGuess(value)}>
                {label}
              </Button>
            ))}
          </div>
        </div>
      ) : (
        <p className="mt-4 rounded-xl bg-surface-2 p-3 text-[15px]">
          {verdict
            ? verdict === guess
              ? 'Tahminin doğru. Sıcaklık arttıkça parçacıklar hızlanır, duvara daha sık ve daha sert çarpar.'
              : 'Tahminin tutmadı, bu normal. Sıcaklık arttıkça parçacıklar hızlanır, duvara daha sık ve daha sert çarpar. Basınç artar.'
            : `Tahminin: ${guess === 'artar' ? 'artar' : guess === 'azalir' ? 'azalır' : 'değişmez'}. Şimdi sıcaklık kaydırıcısını değiştirip kontrol et.`}
        </p>
      )}

      <div ref={box} className="mt-4 overflow-hidden rounded-xl border border-line">
        <canvas ref={canvas} role="img" aria-label={`Kapta ${COUNT} gaz parçacığı hareket ediyor. Bağıl basınç ${number.format(pressure)}`} className="block w-full" />
      </div>

      <div className="mt-4 grid gap-4 sm:grid-cols-2">
        <label className="block text-sm font-semibold">
          Sıcaklık: <span className="tabular">{temp} K</span>
          <input
            type="range"
            min={200}
            max={600}
            step={10}
            value={temp}
            onChange={(e) => changeTemp(Number(e.target.value))}
            className="mt-2 block h-11 w-full cursor-pointer accent-primary"
          />
        </label>
        <label className="block text-sm font-semibold">
          Hacim: <span className="tabular">%{volume}</span>
          <input
            type="range"
            min={30}
            max={100}
            step={5}
            value={volume}
            onChange={(e) => setVolume(Number(e.target.value))}
            className="mt-2 block h-11 w-full cursor-pointer accent-primary"
          />
        </label>
      </div>

      <div className="mt-3 flex flex-wrap items-center justify-between gap-3">
        <div>
          <p className="text-sm text-muted">Ölçülen bağıl basınç</p>
          <p className={cn('tabular font-display text-2xl font-extrabold', Math.abs(pressure - expected) < 0.35 ? 'text-primary' : 'text-fg')}>{number.format(pressure)}</p>
        </div>
        <Button variant="secondary" size="sm" className="min-h-11" onClick={() => setRunning((r) => !r)}>
          {running ? <Pause /> : <Play />}
          {running ? 'Duraklat' : 'Başlat'}
        </Button>
      </div>
      <p className="mt-3 text-[15px] text-muted">
        Beklenen ilişki: basınç sıcaklıkla doğru, hacimle ters orantılıdır. Şu an sıcaklık {number.format(temp / BASE_TEMP)} kat, hacim {number.format(volume / BASE_VOLUME)} kat.
      </p>
    </figure>
  )
}
