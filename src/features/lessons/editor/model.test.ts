import { describe, expect, it } from 'vitest'
import { parseBlocks } from '../markdown/parse'
import { composeQuestion, fromSource, pairRows, questionFields, splitProse, toSource } from './model'

const lesson = `## 1. Başlık

Bir paragraf $x^2$ ile.

- madde bir
- madde iki

$$
a^2 + b^2

= c^2
$$

| A | B |
| --- | --- |
| 1 | 2 |

:::ipucu{baslik="Dikkat"}
Kısa bir ipucu.
:::

::video{id="cWKScHUofow" baslik="Başlık" kanal="Kanal" etiket="Konu anlatımı videosu"}

::sim{tur="gaz"}

:::soru{cevap="B"}
> Bir alıntı.

Soru kökü?

Buna göre hangisi doğrudur?

- A) Bir
- B) İki
- C) Üç
- D) Dört
- E) Beş

---

1. Çözüm adımı.
2. Sonuç.
:::

:::dene
1. Soru? => Cevap.
2. Başka? => Yanıt.
:::

:::zaman{baslik="Hayat" donemler="Ad:1881-1893"}
- 1881 | Olay | Ayrıntı
:::`

// Anlam eşitliği: ham metin birebir aynı olmak zorunda değil, ayrıştırılan bloklar aynı olmalı
const joinProse = (source: string) => {
  const out: ReturnType<typeof parseBlocks> = []
  for (const b of parseBlocks(source)) {
    const last = out[out.length - 1]
    if (b.type === 'md' && last?.type === 'md') last.text += `\n\n${b.text}`
    else out.push({ ...b })
  }
  return out
}

describe('blok modeli', () => {
  it('kaynak metin bloklara bölünüp geri birleşince aynı bloklar çıkar', () => {
    const again = toSource(fromSource(lesson))
    expect(joinProse(again)).toEqual(joinProse(lesson))
  })

  it('ikinci gidiş-dönüş metni değiştirmez', () => {
    const once = toSource(fromSource(lesson))
    expect(toSource(fromSource(once))).toBe(once)
  })

  it('paragraflar ayrı blok olur, $$ çiti ve tablo bölünmez', () => {
    const parts = splitProse('Bir.\n\nİki.\n\n$$\na\n\nb\n$$\n\n| A |\n| - |\n| 1 |')
    expect(parts).toEqual(['Bir.', 'İki.', '$$\na\n\nb\n$$', '| A |\n| - |\n| 1 |'])
  })

  it('şıkları boş soru yazılmaz', () => {
    expect(toSource(fromSource(':::soru{cevap="A"}\n- A) \n- B) \n:::'))).toBe('')
  })

  it('boş bloklar yazılmaz, simülasyon yazılır', () => {
    const blocks = fromSource('::sim{tur="gaz"}\n\n:::ipucu\n:::')
    expect(toSource(blocks)).toBe('::sim{tur="gaz"}')
  })
})

describe('soru formu', () => {
  const text = '> Alıntı.\n\nSoru kökü?\n\n- A) Bir\n- B) İki\n- C) Üç\n- D) Dört\n\n---\n\nÇözüm.'
  it('5 şıklı ve 4 şıklı soruyu alanlara ayırır ve geri yazar', () => {
    const f = questionFields(text)
    expect(f).toEqual({ passage: 'Alıntı.', stem: 'Soru kökü?', options: ['Bir', 'İki', 'Üç', 'Dört'], solution: 'Çözüm.' })
    expect(composeQuestion(f!)).toBe(text)
    expect(questionFields('Kök\n\nA) 1\nB) 2\nC) 3\nD) 4\nE) 5')?.options).toHaveLength(5)
  })
  it('standart olmayan düzende null döner', () => {
    expect(questionFields('Kök\n\n- A) 1\nAra metin\n- B) 2')).toBeNull()
    expect(questionFields('Kök\n\n- B) 1\n- A) 2')).toBeNull()
  })
})

describe('satır formları', () => {
  it('=> ayracı olmayan satır varsa null döner', () => {
    expect(pairRows('1. a => b\n2. c', '=>')).toBeNull()
    expect(pairRows('1. a => b\n2. c => d', '=>')).toEqual([['a', 'b'], ['c', 'd']])
  })
})
