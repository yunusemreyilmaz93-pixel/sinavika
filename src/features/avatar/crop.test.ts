import { describe, expect, it } from 'vitest'
import { checkInput, clampOffset, drawRect, OUTPUT } from './crop'

describe('kırpma hesapları', () => {
  it('kare alanı her zaman doldurur', () => {
    for (const [w, h] of [[4000, 3000], [3000, 4000], [500, 500]]) {
      const r = drawRect(w, h, 1, { x: 0, y: 0 })
      expect(r.width).toBeGreaterThanOrEqual(OUTPUT - 0.001)
      expect(r.height).toBeGreaterThanOrEqual(OUTPUT - 0.001)
      expect(r.x).toBeLessThanOrEqual(0.001)
      expect(r.y).toBeLessThanOrEqual(0.001)
    }
  })

  it('kaydırma görüntünün kenarını alanın içine çekmez', () => {
    const o = clampOffset(4000, 3000, 1, { x: 9999, y: 9999 })
    const r = drawRect(4000, 3000, 1, o)
    expect(r.x).toBeCloseTo(0)
    expect(r.x + r.width).toBeGreaterThanOrEqual(OUTPUT - 0.001)
    expect(o.y).toBe(0)
  })

  it('yakınlaştırınca kaydırma payı büyür', () => {
    expect(clampOffset(1000, 1000, 1, { x: 100, y: 100 })).toEqual({ x: 0, y: 0 })
    expect(clampOffset(1000, 1000, 2, { x: 999, y: -999 })).toEqual({ x: OUTPUT / 2, y: -OUTPUT / 2 })
  })

  it('dosya türü ve boyutunu denetler', () => {
    expect(checkInput(new File(['x'], 'a.jpg', { type: 'image/jpeg' }))).toBeNull()
    expect(checkInput(new File(['x'], 'a.pdf', { type: 'application/pdf' }))).toMatch(/JPEG/)
    const big = new File([new Uint8Array(5 * 1024 * 1024 + 1)], 'b.png', { type: 'image/png' })
    expect(checkInput(big)).toMatch(/5 MB/)
  })
})
