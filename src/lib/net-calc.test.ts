import { describe, expect, it } from 'vitest'
// @ts-expect-error saf JavaScript modül
import { calcScript, exams, netToolHtml } from '../../scripts/seo/public/tools.mjs'

type Exam = { key: string; name: string; divisor: number; sections: [string, number, string][]; score?: unknown }

function mount(exam: string) {
  document.body.innerHTML = netToolHtml()
  const data = Object.fromEntries((exams as Exam[]).map((e) => [e.key, { name: e.name, divisor: e.divisor, score: e.score }]))
  new Function(calcScript(data))()
  document.querySelector<HTMLButtonElement>(`[data-tab="${exam}"]`)!.click()
}

const row = (index: number) => document.querySelectorAll<HTMLElement>('[data-panel]:not([hidden]) [data-row]')[index]

function type(key: 'd' | 'y', index: number, value: string) {
  const input = row(index).querySelector<HTMLInputElement>(`[data-k=${key}]`)!
  input.value = value
  input.dispatchEvent(new Event('input', { bubbles: true }))
}

const text = (sel: string) => document.querySelector(sel)!.textContent

describe('net hesaplama aracı', () => {
  it('LGS netini doğru - yanlış / 3 ile hesaplar', () => {
    mount('lgs')
    type('d', 0, '17')
    type('y', 0, '3')
    expect(text('[data-total]')).toBe('16')
    expect(row(0).querySelector('[data-b]')!.textContent).toBe('0')
    expect(text('[data-sum]')).toBe('90 soruda 17 doğru, 3 yanlış, 70 boş')
  })

  it('TYT netini doğru - yanlış / 4 ile hesaplar', () => {
    mount('tyt')
    type('d', 2, '28')
    type('y', 2, '8')
    expect(text('[data-total]')).toBe('26')
    expect(text('[data-total-label]')).toBe('Toplam TYT neti')
  })

  it('soru sayısını aşan girişi toplama katmaz ve uyarır', () => {
    mount('lgs')
    type('d', 3, '9')
    type('y', 3, '3')
    expect(text('[data-total]')).toBe('0')
    expect(text('[data-note]')).toContain('aşmamalı')
  })

  it('LGS ve TYT için tam netle 500 puan gösterir', () => {
    mount('lgs')
    ;[20, 20, 20, 10, 10, 10].forEach((n, i) => type('d', i, String(n)))
    expect(text('[data-score]')).toBe('500')
    mount('tyt')
    ;[40, 20, 40, 20].forEach((n, i) => type('d', i, String(n)))
    expect(text('[data-score]')).toBe('500')
  })

  it('TYT puanı için Türkçe ya da matematikten net gerekir', () => {
    mount('tyt')
    type('d', 1, '15')
    expect(text('[data-score]')).toBe('-')
  })

  it('AYT ve YDT için puan satırı gizlenir, YKS puan aracına yönlendirir', () => {
    mount('ayt')
    expect(document.querySelector<HTMLElement>('[data-score-row]')!.hidden).toBe(true)
    expect(document.querySelector('[data-score-link]')!.getAttribute('href')).toBe('/araclar/yks-puan-hesaplama')
  })

  it('sıfırla yalnızca açık sınavın girişlerini temizler', () => {
    mount('lgs')
    type('d', 0, '10')
    document.querySelector<HTMLButtonElement>('[data-reset]')!.click()
    expect(text('[data-total]')).toBe('0')
  })

  it('sınav soru sayıları toplamı doğru', () => {
    const total = (key: string) => (exams as Exam[]).find((e) => e.key === key)!.sections.reduce((n, s) => n + s[1], 0)
    expect(total('lgs')).toBe(90)
    expect(total('tyt')).toBe(120)
    expect(total('ayt')).toBe(160)
    expect(total('ydt')).toBe(80)
  })
})
