import { afterEach, describe, expect, it } from 'vitest'
import { syncAccent } from './accent'

afterEach(() => {
  localStorage.clear()
  document.documentElement.removeAttribute('data-accent')
})

describe('syncAccent', () => {
  it('hesaptaki rengi cihaza uygular ve saklar', () => {
    syncAccent('violet')
    expect(document.documentElement.getAttribute('data-accent')).toBe('violet')
    expect(localStorage.getItem('sinavika-accent')).toBe('violet')
  })

  it('hesapta renk yoksa ya da geçersizse varsayılana döner', () => {
    syncAccent('rose')
    syncAccent(null)
    expect(document.documentElement.hasAttribute('data-accent')).toBe(false)
    expect(localStorage.getItem('sinavika-accent')).toBeNull()
    syncAccent('bilinmeyen')
    expect(document.documentElement.hasAttribute('data-accent')).toBe(false)
  })
})
