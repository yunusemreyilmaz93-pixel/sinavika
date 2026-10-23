import { describe, expect, it } from 'vitest'
// @ts-expect-error saf JavaScript modül
import { calcScript, exams } from '../../scripts/seo/public/tools.mjs'

function mount(exam: string) {
  document.body.innerHTML =
    '<section id="calc"><select data-exam><option value="lgs">LGS</option><option value="tyt">TYT</option></select><div data-body></div><strong data-total></strong><p data-note></p></section>'
  const data = Object.fromEntries((exams as { key: string; divisor: number; sections: unknown[] }[]).map((e) => [e.key, { divisor: e.divisor, sections: e.sections }]))
  new Function(calcScript(data))()
  const select = document.querySelector<HTMLSelectElement>('[data-exam]')!
  select.value = exam
  select.dispatchEvent(new Event('change'))
}

function type(key: 'd' | 'y', index: number, value: string) {
  const input = document.querySelector<HTMLInputElement>(`[data-k=${key}][data-i="${index}"]`)!
  input.value = value
  input.dispatchEvent(new Event('input', { bubbles: true }))
}

describe('net hesaplama aracı', () => {
  it('LGS netini doğru - yanlış / 3 ile hesaplar', () => {
    mount('lgs')
    type('d', 0, '17')
    type('y', 0, '3')
    expect(document.querySelector('[data-total]')!.textContent).toBe('16')
  })

  it('TYT netini doğru - yanlış / 4 ile hesaplar', () => {
    mount('tyt')
    type('d', 2, '28')
    type('y', 2, '8')
    expect(document.querySelector('[data-total]')!.textContent).toBe('26')
  })

  it('soru sayısını aşan girişi toplama katmaz ve uyarır', () => {
    mount('lgs')
    type('d', 3, '9')
    type('y', 3, '3')
    expect(document.querySelector('[data-total]')!.textContent).toBe('0')
    expect(document.querySelector('[data-note]')!.textContent).toContain('aşmamalı')
  })

  it('sınav soru sayıları toplamı doğru', () => {
    const total = (key: string) => (exams as { key: string; sections: [string, number][] }[]).find((e) => e.key === key)!.sections.reduce((n, s) => n + s[1], 0)
    expect(total('lgs')).toBe(90)
    expect(total('tyt')).toBe(120)
    expect(total('ayt')).toBe(160)
    expect(total('ydt')).toBe(80)
  })
})
