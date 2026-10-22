import { useState } from 'react'
import { Button } from '@/components/ui/button'
import { SimFrame } from './frame'

type Row = { ad: string; values: [number, number, number] }

const TURKIYE: Row[] = [
  { ad: '1990', values: [46.8, 20.3, 32.9] },
  { ad: '2018', values: [18.4, 26.7, 54.9] },
  { ad: '2025', values: [14.6, 27.6, 57.8] },
]
const ULKELER: Row[] = [
  { ad: 'Uganda', values: [65.9, 7.1, 27] },
  { ad: 'Romanya', values: [17.9, 33.2, 48.9] },
  { ad: 'Brezilya', values: [8.2, 20.2, 71.6] },
  { ad: 'ABD', values: [1.6, 19.3, 79.1] },
  { ad: 'Belçika', values: [1.1, 19.4, 79.5] },
]
const SECTORS = [
  { ad: 'Birincil', bar: 'bg-warning', swatch: 'bg-warning' },
  { ad: 'İkincil', bar: 'bg-accent', swatch: 'bg-accent' },
  { ad: 'Üçüncül', bar: 'bg-primary', swatch: 'bg-primary' },
]
const percent = new Intl.NumberFormat('tr-TR', { maximumFractionDigits: 1 })

export function SectorsSim() {
  const [mode, setMode] = useState<'turkiye' | 'ulkeler'>('turkiye')
  const rows = mode === 'turkiye' ? TURKIYE : ULKELER

  return (
    <SimFrame
      title="Çalışan nüfusun sektörlere dağılımı"
      hint="Türkiye’de yıllara göre değişimi ve farklı gelişmişlik düzeyindeki ülkeleri karşılaştır. Gelişmişlik arttıkça birincil sektörün payı düşer."
    >
      <div className="mt-4 flex flex-wrap gap-2">
        <Button variant={mode === 'turkiye' ? 'primary' : 'secondary'} size="sm" className="min-h-11" onClick={() => setMode('turkiye')}>
          Türkiye, yıllara göre
        </Button>
        <Button variant={mode === 'ulkeler' ? 'primary' : 'secondary'} size="sm" className="min-h-11" onClick={() => setMode('ulkeler')}>
          Ülkeler, 2025
        </Button>
      </div>

      <ul className="mt-3 space-y-3">
        {rows.map((r) => (
          <li key={r.ad}>
            <p className="text-sm font-semibold">{r.ad}</p>
            <div
              className="mt-1 flex h-9 overflow-hidden rounded-lg"
              role="img"
              aria-label={`${r.ad}: birincil yüzde ${percent.format(r.values[0])}, ikincil yüzde ${percent.format(r.values[1])}, üçüncül yüzde ${percent.format(r.values[2])}`}
            >
              {r.values.map((v, i) => (
                <div
                  key={SECTORS[i].ad}
                  className={`${SECTORS[i].bar} transition-[width] duration-200 motion-reduce:transition-none`}
                  style={{ width: `${v}%` }}
                />
              ))}
            </div>
            <p className="tabular mt-1 text-xs text-muted">
              Birincil %{percent.format(r.values[0])}, ikincil %{percent.format(r.values[1])}, üçüncül %{percent.format(r.values[2])}
            </p>
          </li>
        ))}
      </ul>

      <ul className="mt-3 flex flex-wrap gap-x-4 gap-y-1 text-xs" aria-label="Renk anahtarı">
        {SECTORS.map((s) => (
          <li key={s.ad} className="flex items-center gap-1.5">
            <span className={`inline-block size-3 rounded-sm ${s.swatch}`} />
            {s.ad} sektör
          </li>
        ))}
      </ul>
      <p className="mt-1 text-xs text-muted">Kaynak: ders kitabındaki TÜİK ve ülke verileri. Dördüncül ve beşincil sektör üçüncül sektöre dâhil edilmiştir.</p>
    </SimFrame>
  )
}
