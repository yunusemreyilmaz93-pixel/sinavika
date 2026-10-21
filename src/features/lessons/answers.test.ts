import { describe, expect, it } from 'vitest'
import { questionKey } from './answers'

describe('questionKey', () => {
  it('boşluk ve büyük harf farkını yok sayar, soru değişince değişir', () => {
    expect(questionKey('Toplam kaç?', ['3', '4'])).toBe(questionKey('  TOPLAM   kaç?', ['3', '4']))
    expect(questionKey('2 + 2 kaçtır?', ['3', '4'])).not.toBe(questionKey('2 + 3 kaçtır?', ['3', '4']))
    expect(questionKey('a', ['b'])).toMatch(/^[0-9a-f]{1,8}$/)
  })
})
