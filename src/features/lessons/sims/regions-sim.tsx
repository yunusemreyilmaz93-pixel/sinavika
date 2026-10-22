import { useState } from 'react'
import { Button } from '@/components/ui/button'
import { TURKIYE_ETIKET, TURKIYE_ILLER, TURKIYE_VIEW, type BolgeKodu } from '../maps/turkiye'
import { SimFrame } from './frame'

type Bolge = { ad: string; kisa: string; tint: string; iklim: string; yer: string; ekonomi: string }

const BOLGELER: Record<BolgeKodu, Bolge> = {
  marmara: {
    ad: 'Marmara Bölgesi',
    kisa: 'Marmara',
    tint: 'fill-primary-soft',
    iklim: 'Akdeniz, Karadeniz ve karasal iklimler arasında geçiş',
    yer: 'Yükselti az. İstanbul ve Çanakkale boğazları buradadır',
    ekonomi: 'En gelişmiş sanayi, ticaret ve ulaşım. Ayçiçeği, buğday, zeytin, şeftali, kiraz. En kalabalık bölge',
  },
  ege: {
    ad: 'Ege Bölgesi',
    kisa: 'Ege',
    tint: 'fill-accent-soft',
    iklim: 'Kıyıda Akdeniz iklimi, iç kesimde karasala geçiş',
    yer: 'Dağlar kıyıya dik uzanır, graben ovaları, kıyı girintili çıkıntılı',
    ekonomi: 'Zeytin, incir, üzüm, tütün, pamuk. Turizm, İzmir limanı',
  },
  akdeniz: {
    ad: 'Akdeniz Bölgesi',
    kisa: 'Akdeniz',
    tint: 'fill-primary-soft',
    iklim: 'Akdeniz iklimi, yazlar sıcak ve kurak, kışlar ılık ve yağışlı',
    yer: 'Toroslar kıyıya paralel, Çukurova ve Antalya ovaları',
    ekonomi: 'Narenciye, seracılık, muz, pamuk, turizm. Kışın bile sebze meyve yetişir',
  },
  karadeniz: {
    ad: 'Karadeniz Bölgesi',
    kisa: 'Karadeniz',
    tint: 'fill-accent-soft',
    iklim: 'Her mevsim yağışlı, yazlar serin, kışlar ılık. En çok yağış alan bölge',
    yer: 'Kuzey Anadolu Dağları kıyıya paralel, dağınık yerleşme, heyelan ve sel',
    ekonomi: 'Çay, fındık, mısır, tütün, hamsi, ormancılık. Zonguldak taş kömürü',
  },
  ic: {
    ad: 'İç Anadolu Bölgesi',
    kisa: 'İç Anadolu',
    tint: 'fill-surface-2',
    iklim: 'Karasal iklim, kışlar soğuk, yazlar sıcak ve kurak, yağış az',
    yer: 'Geniş platolar, Tuz Gölü, Konya Ovası, volkanik dağlar',
    ekonomi: 'Tahıl, şeker pancarı, tiftik keçisi. Ankara, Eskişehir, Konya ve Kayseri sanayisi',
  },
  dogu: {
    ad: 'Doğu Anadolu Bölgesi',
    kisa: 'Doğu Anadolu',
    tint: 'fill-warning-soft',
    iklim: 'Sert karasal iklim, kışlar çok soğuk ve uzun',
    yer: 'Yüksek dağlar (Ağrı), geniş platolar, Van Gölü, Fırat ve Dicle’nin kaynağı',
    ekonomi: 'Hayvancılık, hidroelektrik, kış turizmi. Nüfus yoğunluğu en düşük, göç veren bölge',
  },
  guneydogu: {
    ad: 'Güneydoğu Anadolu Bölgesi',
    kisa: 'G. Doğu Anadolu',
    tint: 'fill-surface-2',
    iklim: 'Yazları en sıcak ve kurak',
    yer: 'Platolar ve ovalar (Harran), Karacadağ bazaltı',
    ekonomi: 'Pamuk, buğday, mercimek, antepfıstığı. GAP ile sulu tarım, Batman ve Adıyaman petrolü',
  },
}

const KODLAR = Object.keys(BOLGELER) as BolgeKodu[]
const pick = (not?: BolgeKodu) => {
  const list = KODLAR.filter((k) => k !== not)
  return list[Math.floor(Math.random() * list.length)]
}

export function RegionsSim() {
  const [quiz, setQuiz] = useState(false)
  const [selected, setSelected] = useState<BolgeKodu | null>(null)
  const [target, setTarget] = useState<BolgeKodu>(() => pick())
  const [answer, setAnswer] = useState<BolgeKodu | null>(null)
  const [score, setScore] = useState({ right: 0, total: 0 })

  const choose = (code: BolgeKodu) => {
    if (!quiz) return setSelected(code)
    if (answer) return
    setAnswer(code)
    setScore((s) => ({ right: s.right + (code === target ? 1 : 0), total: s.total + 1 }))
  }
  const next = () => {
    setAnswer(null)
    setTarget((t) => pick(t))
  }
  const toggle = (value: boolean) => {
    setQuiz(value)
    setAnswer(null)
    setSelected(null)
  }

  const fillOf = (code: BolgeKodu) => {
    if (quiz && answer) {
      if (code === target) return 'fill-success'
      if (code === answer) return 'fill-danger'
    }
    if (!quiz && selected === code) return 'fill-primary'
    return BOLGELER[code].tint
  }
  const info = selected ? BOLGELER[selected] : null

  return (
    <SimFrame
      title="Türkiye’nin yedi coğrafi bölgesi"
      hint="Haritadan ya da düğmelerden bir bölge seçip özelliklerine bak. Sına modunda sorulan bölgeyi haritada bul."
    >
      <div className="mt-4 flex flex-wrap gap-2">
        <Button variant={!quiz ? 'primary' : 'secondary'} size="sm" className="min-h-11" onClick={() => toggle(false)}>
          Keşfet
        </Button>
        <Button variant={quiz ? 'primary' : 'secondary'} size="sm" className="min-h-11" onClick={() => toggle(true)}>
          Sına
        </Button>
      </div>

      <div className="mt-3 overflow-hidden rounded-xl border border-line bg-surface">
        <svg viewBox={`0 0 ${TURKIYE_VIEW.width} ${TURKIYE_VIEW.height}`} role="group" aria-label="Türkiye bölgeleri haritası" className="block w-full">
          {KODLAR.map((code) => (
            <g
              key={code}
              role="button"
              tabIndex={0}
              aria-label={BOLGELER[code].ad}
              aria-pressed={!quiz && selected === code}
              className="cursor-pointer outline-none focus-visible:[&_path]:stroke-fg"
              onClick={() => choose(code)}
              onKeyDown={(e) => {
                if (e.key === 'Enter' || e.key === ' ') {
                  e.preventDefault()
                  choose(code)
                }
              }}
            >
              {TURKIYE_ILLER.filter((il) => il.bolge === code).map((il) => (
                <path
                  key={il.ad}
                  d={il.d}
                  className={`${fillOf(code)} stroke-surface transition-colors duration-150 motion-reduce:transition-none`}
                  strokeWidth={1}
                  strokeLinejoin="round"
                />
              ))}
            </g>
          ))}
          {!quiz &&
            KODLAR.map((code) => (
              <text
                key={code}
                x={TURKIYE_ETIKET[code][0]}
                y={TURKIYE_ETIKET[code][1]}
                textAnchor="middle"
                className={`pointer-events-none select-none text-[21px] font-bold ${selected === code ? 'fill-primary-fg' : 'fill-fg'}`}
              >
                {BOLGELER[code].kisa}
              </text>
            ))}
        </svg>
      </div>

      {quiz ? (
        <div className="mt-3 rounded-xl bg-surface-2 p-3" aria-live="polite">
          <p className="font-display text-base font-bold">{BOLGELER[target].ad} haritada hangisi?</p>
          {answer ? (
            <>
              <p className="mt-1 text-sm">
                {answer === target ? 'Doğru.' : `Yanlış. Seçtiğin yer ${BOLGELER[answer].ad}. Doğru bölge yeşil gösterildi.`}
              </p>
              <Button size="sm" className="mt-2 min-h-11" onClick={next}>
                Sonraki
              </Button>
            </>
          ) : (
            <p className="mt-1 text-sm text-muted">Haritada ya da düğmelerden seç.</p>
          )}
          <p className="tabular mt-2 text-xs text-muted">
            Doğru: {score.right} / {score.total}
          </p>
        </div>
      ) : info ? (
        <dl className="mt-3 space-y-2 rounded-xl bg-surface-2 p-3 text-sm" aria-live="polite">
          <dt className="font-display text-base font-bold">{info.ad}</dt>
          <dd>
            <span className="font-semibold">İklim:</span> {info.iklim}
          </dd>
          <dd>
            <span className="font-semibold">Yer şekilleri:</span> {info.yer}
          </dd>
          <dd>
            <span className="font-semibold">Ekonomi:</span> {info.ekonomi}
          </dd>
        </dl>
      ) : (
        <p className="mt-3 rounded-xl bg-surface-2 p-3 text-sm text-muted">Bir bölge seç.</p>
      )}

      <div className="mt-3 grid grid-cols-2 gap-2 sm:grid-cols-4">
        {KODLAR.map((code) => (
          <Button
            key={code}
            variant={!quiz && selected === code ? 'primary' : 'secondary'}
            size="sm"
            className="min-h-11"
            onClick={() => choose(code)}
          >
            {BOLGELER[code].kisa}
          </Button>
        ))}
      </div>
    </SimFrame>
  )
}
