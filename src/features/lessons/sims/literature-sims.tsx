import { useState } from 'react'
import { SimFrame, Stat } from './frame'

const vowels = 'aeıioöuüâîû'
const syllables = (line: string) => [...line.toLowerCase()].filter((c) => vowels.includes(c)).length

export function SyllableSim() {
  const [text, setText] = useState('Bir ses gelir uzaklardan\nGün batarken sular kızıl')
  const lines = text.split('\n').filter((l) => l.trim())
  const counts = lines.map(syllables)
  const same = counts.length > 0 && counts.every((c) => c === counts[0])

  return (
    <SimFrame title="Hece sayacı" hint="Dizeleri alt alta yaz. Her ünlü bir hecedir. Dizelerin hece sayısı eşitse şiir hece ölçüsüyle yazılmıştır.">
      <label className="mt-3 block text-sm font-semibold">
        Dizeler
        <textarea
          value={text}
          onChange={(e) => setText(e.target.value.slice(0, 600))}
          rows={4}
          className="mt-2 block w-full rounded-xl border border-line bg-surface p-3 text-base"
        />
      </label>
      <ul className="mt-3 space-y-1">
        {lines.map((line, i) => (
          <li key={i} className="flex items-center justify-between gap-3 rounded-xl bg-surface-2 px-3 py-2 text-sm">
            <span className="min-w-0 truncate">{line}</span>
            <span className="tabular shrink-0 font-display text-base font-bold text-primary">{counts[i]}</span>
          </li>
        ))}
      </ul>
      <div className="mt-3 grid gap-2 sm:grid-cols-2">
        <Stat label="Dize sayısı" value={String(lines.length)} />
        <Stat label="Ölçü" value={lines.length === 0 ? '-' : same ? `${counts[0]}'li hece ölçüsü` : 'Dizeler eşit değil'} highlight />
      </div>
    </SimFrame>
  )
}

const periods = [
  { key: 'tan1', name: 'Tanzimat I', years: '1860-1876', rule: 'Sanat toplum içindir', people: 'Şinasi, Namık Kemal, Ziya Paşa', works: 'Şair Evlenmesi, İntibah, Vatan yahut Silistre' },
  { key: 'tan2', name: 'Tanzimat II', years: '1876-1896', rule: 'Sanat sanat içindir anlayışına yöneliş', people: 'Recaizade Mahmut Ekrem, Abdülhak Hamit, Samipaşazade Sezai, Nabizade Nazım', works: 'Araba Sevdası, Makber, Sergüzeşt, Karabibik' },
  { key: 'sf', name: 'Servet-i Fünun', years: '1896-1901', rule: 'Sanat sanat içindir', people: 'Tevfik Fikret, Cenap Şahabettin, Halit Ziya Uşaklıgil, Mehmet Rauf', works: 'Rübab-ı Şikeste, Mai ve Siyah, Aşk-ı Memnu, Eylül' },
  { key: 'fa', name: 'Fecr-i Ati', years: '1909-1912', rule: 'Sanat şahsi ve muhteremdir', people: 'Ahmet Haşim, Yakup Kadri Karaosmanoğlu, Refik Halit Karay', works: 'Göl Saatleri, Piyale, Memleket Hikâyeleri' },
  { key: 'me', name: 'Milli Edebiyat', years: '1911-1923', rule: 'Sade dil, milli konu, hece ölçüsü', people: 'Ömer Seyfettin, Ziya Gökalp, Halide Edib Adıvar, Reşat Nuri Güntekin', works: 'Kaşağı, Ateşten Gömlek, Çalıkuşu' },
  { key: 'cum', name: 'Cumhuriyet', years: '1923 sonrası', rule: 'Çok sesli: toplumcu, Garip, İkinci Yeni, modernist', people: 'Nâzım Hikmet, Orhan Veli, Yaşar Kemal, Tanpınar, Oğuz Atay', works: 'Garip, İnce Memed, Huzur, Tutunamayanlar' },
]

export function PeriodsSim() {
  const [key, setKey] = useState('tan1')
  const period = periods.find((p) => p.key === key)!

  return (
    <SimFrame title="Edebiyat dönemleri" hint="Bir dönemi seç. Yıllarını, ilkesini, temsilcilerini ve eserlerini gör.">
      <div className="mt-3 flex flex-wrap gap-2" role="group" aria-label="Dönem">
        {periods.map((p) => (
          <button
            key={p.key}
            type="button"
            onClick={() => setKey(p.key)}
            aria-pressed={key === p.key}
            className={`h-11 rounded-xl border px-3 text-sm font-semibold ${key === p.key ? 'border-primary bg-primary text-primary-fg' : 'border-line bg-surface'}`}
          >
            {p.name}
          </button>
        ))}
      </div>
      <div className="mt-3 grid gap-2">
        <Stat label="Yıllar" value={period.years} />
        <Stat label="İlke" value={period.rule} highlight />
        <Stat label="Temsilciler" value={period.people} />
        <Stat label="Eserler" value={period.works} />
      </div>
    </SimFrame>
  )
}
