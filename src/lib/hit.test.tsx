import { renderHook } from '@testing-library/react'
import type { ReactNode } from 'react'
import { MemoryRouter } from 'react-router'
import { afterEach, beforeEach, describe, expect, it, vi } from 'vitest'

const auth = vi.hoisted(() => ({ value: { ready: true, session: null as unknown } }))
vi.mock('@/features/auth/session', () => ({ useAuth: () => auth.value }))

const { useSiteHit, trackEvent } = await import('./hit')
const beacon = vi.fn((_url: string, _body: Blob) => true)

function wrapper(path: string) {
  return ({ children }: { children: ReactNode }) => <MemoryRouter initialEntries={[path]}>{children}</MemoryRouter>
}
const sent = () => beacon.mock.calls.map(([, blob]) => blob)

beforeEach(() => {
  beacon.mockClear()
  auth.value = { ready: true, session: null }
  Object.defineProperty(navigator, 'sendBeacon', { value: beacon, configurable: true })
})
afterEach(() => vi.restoreAllMocks())

describe('ziyaretçi sayacı', () => {
  it('üye olmayan ziyaretçinin herkese açık sayfasını gönderir', async () => {
    renderHook(() => useSiteHit(), { wrapper: wrapper('/hakkinda') })
    expect(beacon).toHaveBeenCalledTimes(1)
    expect(await sent()[0].text()).toContain('"path":"/hakkinda"')
  })

  it('giriş yapmış kullanıcıyı, uygulama içini ve rapor sayfasını saymaz', () => {
    auth.value = { ready: true, session: {} }
    renderHook(() => useSiteHit(), { wrapper: wrapper('/hakkinda') })
    auth.value = { ready: true, session: null }
    renderHook(() => useSiteHit(), { wrapper: wrapper('/app/plan') })
    renderHook(() => useSiteHit(), { wrapper: wrapper('/rapor/abc') })
    expect(beacon).not.toHaveBeenCalled()
  })

  it('oturum durumu belli olmadan göndermez', () => {
    auth.value = { ready: false, session: null }
    renderHook(() => useSiteHit(), { wrapper: wrapper('/') })
    expect(beacon).not.toHaveBeenCalled()
  })

  it('hedef olayını gönderir', async () => {
    trackEvent('basvuru-gonderildi')
    expect(await sent()[0].text()).toBe('{"event":"basvuru-gonderildi"}')
  })
})
