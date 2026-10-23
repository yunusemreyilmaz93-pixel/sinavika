import { describe, expect, it } from 'vitest'
import { usagePath } from './use-usage-ping'

describe('usagePath', () => {
  it('kimlikleri kalıba çevirir', () => {
    expect(usagePath('/app/konular/12')).toBe('/app/konular/:id')
    expect(usagePath('/app/ogrenciler/3f2b6c1e-8d4a-4e2b-9c1a-0a1b2c3d4e5f/deneme-ekle')).toBe('/app/ogrenciler/:id/deneme-ekle')
    expect(usagePath('/app/plan')).toBe('/app/plan')
  })
})
