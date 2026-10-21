import { describe, expect, it } from 'vitest'
import { FREE_METHOD, methodOf, methods, phaseAt } from './methods'

describe('çalışma yöntemleri', () => {
  it('serbest dışındaki yöntemlerin süresi ve aşamaları tutarlı', () => {
    for (const m of methods.filter((m) => m.id !== FREE_METHOD)) {
      expect(m.minutes).toBeGreaterThan(0)
      expect(m.phases.length).toBeGreaterThan(0)
    }
  })
  it('bilinmeyen yöntem serbest olur', () => {
    expect(methodOf('yok').id).toBe(FREE_METHOD)
    expect(methodOf(null).id).toBe(FREE_METHOD)
  })
  it('kendini yokla üç eşit aşamaya bölünür', () => {
    const m = methodOf('yokla')
    const total = 30 * 60_000
    expect(phaseAt(m, 0, total)?.phase.label).toBe('Oku')
    expect(phaseAt(m, 11 * 60_000, total)?.phase.label).toBe('Kapat ve yaz')
    expect(phaseAt(m, 21 * 60_000, total)?.phase.label).toBe('Kontrol et')
    expect(phaseAt(m, total, total)?.phase.label).toBe('Kontrol et')
  })
  it('aşama kalan süresi hesaplanır, aşamasız yöntemde boş döner', () => {
    expect(phaseAt(methodOf('yokla'), 0, 30 * 60_000)?.leftMs).toBe(10 * 60_000)
    expect(phaseAt(methodOf(FREE_METHOD), 0, 60_000)).toBeNull()
  })
})
