import { describe, expect, it } from 'vitest'
import { lgsScore, tytScore, yksScore } from './score'

const fullTyt = { 'tyt-tr': 40, 'tyt-mat': 40, 'tyt-tar': 5, 'tyt-cog': 5, 'tyt-fel': 5, 'tyt-din': 5, 'tyt-fiz': 7, 'tyt-kim': 7, 'tyt-bio': 6 }

describe('yaklaşık puan', () => {
  it('LGS tam netle 500, sıfır netle taban puan verir', () => {
    expect(lgsScore({ 'lgs-tr': 20, 'lgs-mat': 20, 'lgs-fen': 20, 'lgs-ink': 10, 'lgs-din': 10, 'lgs-ing': 10 })).toBe(500)
    expect(lgsScore({})).toBe(194.75)
  })

  it('LGS ana dersleri dört kat ağırlıklı sayar', () => {
    const main = lgsScore({ 'lgs-mat': 10 })
    const side = lgsScore({ 'lgs-ing': 10 })
    expect(main - 194.752).toBeCloseTo((side - 194.752) * 4, 1)
  })

  it('TYT tam netle 500 verir', () => {
    expect(tytScore(fullTyt)).toBe(500)
  })

  it('yerleştirme puanları tam netle 500 civarında olur (OGM katsayıları)', () => {
    const say = { ...fullTyt, 'ayt-mat': 40, 'ayt-fiz': 14, 'ayt-kim': 13, 'ayt-bio': 13 }
    const ea = { ...fullTyt, 'ayt-mat': 40, 'ayt-edb': 24, 'ayt-tar1': 10, 'ayt-cog1': 6 }
    const soz = { ...fullTyt, 'ayt-edb': 24, 'ayt-tar1': 10, 'ayt-cog1': 6, 'ayt-tar2': 11, 'ayt-cog2': 11, 'ayt-fel': 12, 'ayt-din': 6 }
    for (const [type, nets] of [['SAY', say], ['EA', ea], ['SÖZ', soz], ['DİL', { ...fullTyt, 'ydt-dil': 80 }]] as const) {
      expect(Math.abs(yksScore(type, nets) - 500)).toBeLessThan(10)
    }
  })

  it('diploma notu OBP katkısı olarak eklenir, Türkçe ya da matematik neti yoksa TYT geçersizdir', () => {
    expect(yksScore('SAY', { 'tyt-tr': 20 }, 80) - yksScore('SAY', { 'tyt-tr': 20 })).toBeCloseTo(48)
    expect(tytScore({ 'tyt-tr': 0.25 })).toBe(0)
    expect(yksScore('SAY', { 'ayt-mat': 10 })).toBe(100)
  })
})
