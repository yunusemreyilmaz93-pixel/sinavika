import { describe, expect, it } from 'vitest'
import { fold } from './text'

describe('fold', () => {
  it('Türkçe karakterleri ve büyük harfleri sadeleştirir', () => {
    expect(fold('  Çarpanlar   ve KATLAR ')).toBe('carpanlar ve katlar')
    expect(fold('IŞIK İNKILAP')).toBe('isik inkilap')
  })
  it('sadeleştirilmiş arama eşleşir', () => {
    expect(fold('Fiilimsiler').includes(fold('fiilimsi'))).toBe(true)
    expect(fold('Güler Arda').includes(fold('guler'))).toBe(true)
  })
})
