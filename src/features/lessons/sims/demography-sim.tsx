import { useState } from 'react'
import { Button } from '@/components/ui/button'
import { SimFrame, Stat } from './frame'

const STAGES = [
  {
    birth: 'Yüksek',
    death: 'Yüksek',
    growth: 'Çok düşük',
    text: 'Sanayi öncesi toplumlarda görülür. Sağlık hizmetleri yetersizdir, ortalama ömür kısa, bebek ölümleri çoktur. Günümüzde bu aşamada ülke yoktur.',
    pyramid: [100, 88, 76, 64, 52, 40, 28, 16, 6],
  },
  {
    birth: 'Yüksek',
    death: 'Düşmeye başlar',
    growth: 'Yüksek',
    text: 'Sanayileşmenin ilk dönemidir. Beslenme ve sağlık hizmetleri iyileşir, bebek ölümleri azalır. Nüfus hızla artar.',
    pyramid: [100, 94, 84, 72, 60, 48, 34, 20, 8],
  },
  {
    birth: 'Düşmeye başlar',
    death: 'Düşük',
    growth: 'Yavaşlar',
    text: 'Kentleşme, eğitim ve kadınların çalışma hayatına girmesiyle doğum oranları düşmeye başlar. Gelişmekte olan ülkelerde 2. ve 3. aşama özellikleri görülür.',
    pyramid: [70, 76, 80, 76, 68, 58, 46, 30, 14],
  },
  {
    birth: 'Çok düşük',
    death: 'Düşük',
    growth: 'Çok düşük',
    text: 'Doğum oranları hızla azalmıştır. Sanayi sonrası toplumlarda görülür.',
    pyramid: [50, 56, 64, 66, 64, 60, 52, 38, 20],
  },
  {
    birth: 'Çok düşük',
    death: 'Biraz daha yüksek',
    growth: 'Negatif',
    text: 'Yaşlı nüfus fazla olduğundan ölüm oranı doğumun biraz üstüne çıkar. Genç nüfus azdır ve nüfus azalır.',
    pyramid: [34, 38, 46, 56, 64, 66, 62, 52, 40],
  },
]
const AGES = ['0-9', '10-19', '20-29', '30-39', '40-49', '50-59', '60-69', '70-79', '80+']

// Doğum ve ölüm oranı eğrisi: aşama sınırlarındaki (0 ile 5) şematik değerler
const BIRTH = [40, 40, 38, 18, 11, 9]
const DEATH = [38, 36, 14, 10, 10, 12]
const gx = (i: number) => 28 + i * 60
const gy = (v: number) => 112 - v * 2.4

const line = (values: number[]) => values.map((v, i) => `${i === 0 ? 'M' : 'L'}${gx(i)} ${gy(v)}`).join('')

export function DemographySim() {
  const [stage, setStage] = useState(1)
  const s = STAGES[stage - 1]

  return (
    <SimFrame
      title="Demografik dönüşüm modeli"
      hint="Aşamayı seç. Doğum ve ölüm oranlarının, nüfus artışının ve nüfus piramidinin nasıl değiştiğini izle. Şema genel eğilimi gösterir, gerçek veri değildir."
    >
      <div className="mt-4 flex flex-wrap gap-2">
        {STAGES.map((_, i) => (
          <Button key={i} variant={stage === i + 1 ? 'primary' : 'secondary'} size="sm" className="min-h-11 min-w-11" onClick={() => setStage(i + 1)}>
            {i + 1}. aşama
          </Button>
        ))}
      </div>

      <div className="mt-3 grid gap-3 sm:grid-cols-2">
        <svg viewBox="0 0 330 140" role="img" aria-label={`Doğum oranı ${s.birth}, ölüm oranı ${s.death}, nüfus artışı ${s.growth}`} className="block w-full rounded-xl border border-line bg-surface">
          <rect x={gx(stage - 1)} y={8} width={60} height={104} className="fill-primary-soft" />
          <line x1={28} x2={328} y1={112} y2={112} className="stroke-line-strong" />
          <path d={line(BIRTH)} className="fill-none stroke-accent" strokeWidth={2.5} strokeLinejoin="round" />
          <path d={line(DEATH)} className="fill-none stroke-danger" strokeWidth={2.5} strokeLinejoin="round" />
          <g className="fill-fg text-[10px] font-semibold" textAnchor="middle">
            {STAGES.map((_, i) => (
              <text key={i} x={gx(i) + 30} y={127}>
                {i + 1}
              </text>
            ))}
          </g>
          <text x={4} y={16} className="fill-muted text-[9px]">
            ‰
          </text>
          <text x={110} y={18} className="fill-accent text-[10px] font-bold">
            Doğum
          </text>
          <text x={250} y={104} className="fill-danger text-[10px] font-bold">
            Ölüm
          </text>
        </svg>

        <div role="img" aria-label="Şematik nüfus piramidi" className="rounded-xl border border-line bg-surface p-3">
          <div className="space-y-1">
            {[...s.pyramid].reverse().map((w, i) => (
              <div key={i} className="flex items-center gap-2">
                <div className="flex flex-1 justify-end">
                  <div className="h-3 rounded-l bg-accent transition-[width] duration-200 motion-reduce:transition-none" style={{ width: `${w}%` }} />
                </div>
                <span className="tabular w-10 text-center text-[10px] text-muted">{AGES[AGES.length - 1 - i]}</span>
                <div className="flex-1">
                  <div className="h-3 rounded-r bg-primary transition-[width] duration-200 motion-reduce:transition-none" style={{ width: `${w}%` }} />
                </div>
              </div>
            ))}
          </div>
          <p className="mt-1 text-center text-[10px] text-muted">Erkek (sol), kadın (sağ). Şematik piramit.</p>
        </div>
      </div>

      <div className="mt-3 grid gap-2 sm:grid-cols-3">
        <Stat label="Doğum oranı" value={s.birth} />
        <Stat label="Ölüm oranı" value={s.death} />
        <Stat label="Nüfus artış hızı" value={s.growth} highlight />
      </div>
      <p className="mt-3 rounded-xl bg-surface-2 p-3 text-sm" aria-live="polite">
        {s.text}
      </p>
    </SimFrame>
  )
}
