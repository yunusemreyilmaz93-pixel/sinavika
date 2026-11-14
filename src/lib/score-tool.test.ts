import { describe, expect, it } from 'vitest'
// @ts-expect-error saf JavaScript modül
import { lgsBody, scoreScript, yksBody } from '../../scripts/seo/public/score-tool.mjs'
import { scoreFormulas } from './score'

function mount(html: string) {
  document.body.innerHTML = html
  new Function(scoreScript(scoreFormulas))()
}

function fill(correct: 'max' | number, prefix = '') {
  document.querySelectorAll<HTMLElement>(prefix ? `[data-row^="${prefix}"]` : '[data-row]').forEach((row) => {
    const input = row.querySelector<HTMLInputElement>('[data-k=d]')!
    input.value = String(correct === 'max' ? row.dataset.max : correct)
    input.dispatchEvent(new Event('input', { bubbles: true }))
  })
}

const out = (key: string) => document.querySelector(`[data-out="${key}"]`)!.textContent
const place = (key: string) => document.querySelector(`[data-place="${key}"]`)!.textContent

describe('puan hesaplama aracı', () => {
  it('LGS sayfası tam nette 500 verir', () => {
    mount(lgsBody())
    expect(out('lgs')).toBe('-')
    fill('max')
    expect(out('lgs')).toBe('500,00')
  })

  it('YKS sayfası TYT ve AYT puanlarını aynı ekranda hesaplar', () => {
    mount(yksBody())
    fill('max')
    expect(out('tyt')).toBe('500,00')
    expect(out('SAY')).toBe('500,00')
    expect(place('SAY')).toBe('Ham puan')
    const diploma = document.querySelector<HTMLInputElement>('[data-diploma]')!
    diploma.value = '100'
    diploma.dispatchEvent(new Event('input', { bubbles: true }))
    expect(place('EA')).toBe('OBP ile 566,68')
    expect(place('tyt')).toBe('OBP ile 560,00')
  })

  it('TYT girilmeden alan puanı 100 olur, TYT puanı çıkmaz', () => {
    mount(yksBody())
    fill(10, 'ayt:ayt-mat')
    expect(out('tyt')).toBe('-')
    expect(out('SAY')).toBe('100,00')
  })
  it('boşu soru sayısından doğru ve yanlışı çıkararak gösterir', () => {
    mount(lgsBody())
    const row = document.querySelector<HTMLElement>('[data-row="lgs:lgs-tr"]')!
    const blank = row.querySelector('[data-b]')!
    expect(blank.textContent).toBe('20')
    const [d, y] = row.querySelectorAll('input')
    d.value = '14'
    d.dispatchEvent(new Event('input', { bubbles: true }))
    y.value = '3'
    y.dispatchEvent(new Event('input', { bubbles: true }))
    expect(blank.textContent).toBe('3')
    y.value = '9'
    y.dispatchEvent(new Event('input', { bubbles: true }))
    expect(blank.textContent).toBe('-')
  })
})
