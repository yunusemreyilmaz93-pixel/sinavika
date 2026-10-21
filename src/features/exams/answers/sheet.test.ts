import { describe, expect, it } from 'vitest'
import { evaluate, normalizeAnswers, normalizeKey } from './sheet'

describe('soru bazlı karne', () => {
  it('anahtarda yalnızca şıkları tutar ve büyük harfe çevirir', () => {
    expect(normalizeKey('a c d-e b', 'TYT', 40)).toBe('ACDEB')
    expect(normalizeKey('ABCDE', 'LGS', 20)).toBe('ABCD')
    expect(normalizeKey('ABCDEABCDE', 'TYT', 4)).toBe('ABCD')
  })
  it('cevaplarda boş işaretlerini tireye çevirir, boşlukları yok sayar', () => {
    expect(normalizeAnswers('A C·D . b', 'TYT', 40)).toBe('AC-D-B')
  })
  it('doğru, yanlış ve boşu sayar, eksik cevap boş olur', () => {
    const r = evaluate('ABCDE', 'AB-A', 5, 'TYT')
    expect(r.items.map((x) => x.status)).toEqual(['correct', 'correct', 'blank', 'wrong', 'blank'])
    expect([r.correct, r.wrong, r.blank]).toEqual([2, 1, 2])
    expect(r.net).toBe(1.75)
  })
  it('cevabı olup anahtarı olmayan soruyu işaretler', () => {
    const r = evaluate('AB', 'ABC', 3, 'TYT')
    expect(r.missingKey).toBe(1)
    expect(r.items[2].status).toBe('nokey')
  })
  it('hiçbir şey girilmediyse dolu sayılmaz', () => {
    expect(evaluate('', '', 5, 'TYT').filled).toBe(false)
  })
})
