// @vitest-environment node
import { describe, expect, it } from 'vitest'
// @ts-expect-error saf JavaScript modül
import { slug, subjectSlug, topicSlugs } from '../scripts/seo/public/slugs.mjs'

describe('anlatım adresleri', () => {
  it('Türkçe karakterleri ASCII yapar', () => {
    expect(slug('Açıortay ve Kenarortay')).toBe('aciortay-ve-kenarortay')
    expect(slug('İşlem, Öğrenme & Şekil')).toBe('islem-ogrenme-sekil')
  })

  it('bilinen dersler sabit adres alır', () => {
    expect(subjectSlug({ id: 'tyt-mat', name: 'Temel Matematik' })).toBe('matematik')
    expect(subjectSlug({ id: 'x-yeni', name: 'Yeni Ders' })).toBe('yeni-ders')
  })

  it('aynı adlı konular birbirinden ayrılır', () => {
    const map = topicSlugs([
      { id: 1, name: 'Problemler' },
      { id: 2, name: 'Problemler' },
      { id: 3, name: 'Üslü Sayılar' },
    ])
    expect(new Set(map.values()).size).toBe(3)
    expect(map.get(3)).toBe('uslu-sayilar')
  })
})
