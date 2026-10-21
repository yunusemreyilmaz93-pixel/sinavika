import { describe, expect, it } from 'vitest'
import { estimateMinutes, formatLessonMinutes, listItems, outlineOf, parseAttrs, parseBlocks, parseEras, parseLabSentence, parseQuestion, slug } from './parse'

describe('parseAttrs', () => {
  it('değerli ve değersiz öznitelikleri okur', () => {
    expect(parseAttrs('{cevap="C" baslik="Zaman çizelgesi" yan}')).toEqual({ cevap: 'C', baslik: 'Zaman çizelgesi', yan: '' })
    expect(parseAttrs(undefined)).toEqual({})
  })
})

describe('parseBlocks', () => {
  it('düz metni, kutuyu ve yaprak bloğu ayırır', () => {
    const blocks = parseBlocks('## Başlık\n\nMetin\n\n:::ipucu\nİçerik\n:::\n\n::video{id="abcdefghijk"}\n\nSon')
    expect(blocks.map((b) => (b.type === 'md' ? 'md' : `${b.type}:${b.name}`))).toEqual(['md', 'box:ipucu', 'leaf:video', 'md'])
    expect(blocks[1]).toMatchObject({ text: 'İçerik' })
    expect(blocks[2]).toMatchObject({ attrs: { id: 'abcdefghijk' } })
  })
  it('kapanmamış kutuyu sonuna kadar alır', () => {
    const blocks = parseBlocks(':::ipucu\nSon satır')
    expect(blocks).toEqual([{ type: 'box', name: 'ipucu', attrs: {}, text: 'Son satır' }])
  })
  it('Windows satır sonlarını tanır', () => {
    expect(parseBlocks(':::ipucu\r\nA\r\n:::\r\n')).toHaveLength(1)
  })
})

describe('outlineOf', () => {
  it('başlıklardan kimlik üretir, tekrarları ayırır', () => {
    const out = outlineOf('## 1. Avrupa değişiyor\n\n:::ipucu\n## kutu içi\n:::\n\n## LGS’de nasıl sorulur\n\n## LGS’de nasıl sorulur')
    expect(out.map((o) => o.id)).toEqual(['1-avrupa-degisiyor', 'lgs-de-nasil-sorulur', 'lgs-de-nasil-sorulur-2'])
  })
  it('Türkçe karakterleri sadeleştirir', () => {
    expect(slug('Şam’da çıkan ığdır')).toBe('sam-da-cikan-igdir')
  })
})

describe('parseQuestion', () => {
  it('metni, kökü, seçenekleri ve çözümü ayırır', () => {
    const q = parseQuestion('> Alıntı\n\nSoru kökü?\n\n- A) Bir\n- B) İki\nC) Üç\n\n---\n1. Çözüm')
    expect(q).toEqual({ passage: 'Alıntı', stem: 'Soru kökü?', options: ['Bir', 'İki', 'Üç'], solution: '1. Çözüm' })
  })
  it('alıntısız soruyu okur', () => {
    expect(parseQuestion('Hangisi?\nA) x\nB) y').passage).toBe('')
  })
})

describe('diğer ayrıştırıcılar', () => {
  it('liste işaretlerini temizler', () => {
    expect(listItems('- bir\n2. iki\n\n* üç')).toEqual(['bir', 'iki', 'üç'])
  })
  it('cümle laboratuvarı sözcüklerini ayırır', () => {
    expect(parseLabSentence('Kitap / okumak,[isim|Özne.] / geliştirir.[yuklem|Yüklem.]')).toEqual([
      { text: 'Kitap' },
      { text: 'okumak,', kind: 'isim', note: 'Özne.' },
      { text: 'geliştirir.', kind: 'yuklem', note: 'Yüklem.' },
    ])
  })
  it('dönemleri okur', () => {
    expect(parseEras('Çocukluk:1881-1893, Okul yılları:1893-1905')).toEqual([
      { label: 'Çocukluk', from: 1881, to: 1893 },
      { label: 'Okul yılları', from: 1893, to: 1905 },
    ])
  })
})

describe('estimateMinutes', () => {
  it('kelime sayısından okuma süresi çıkarır', () => {
    expect(estimateMinutes('kelime '.repeat(280))).toBe(2)
    expect(estimateMinutes('')).toBe(1)
  })
  it('soru ve kendini dene maddelerini ayrıca sayar, videoyu saymaz', () => {
    const q = ':::soru{cevap="A"}\nSoru?\n- A) a\n- B) b\n---\nÇözüm\n:::'
    const d = ':::dene\n1. a => b\n2. c => d\n:::'
    expect(estimateMinutes(`${q}\n\n${d}\n\n::video{id="abcdefghijk"}`)).toBe(3)
  })
  it('uzun süreleri 5 dakikaya yuvarlar ve 120 ile sınırlar', () => {
    expect(formatLessonMinutes(18)).toBe(18)
    expect(formatLessonMinutes(47)).toBe(45)
    expect(estimateMinutes('kelime '.repeat(100000))).toBe(120)
  })
})
