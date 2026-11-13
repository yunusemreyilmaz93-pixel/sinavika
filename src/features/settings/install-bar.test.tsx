import { cleanup, render, screen } from '@testing-library/react'
import userEvent from '@testing-library/user-event'
import { afterEach, beforeEach, describe, expect, it, vi } from 'vitest'
import { InstallBar } from './install-bar'

const iphone = 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.0 Mobile/15E148 Safari/604.1'

function setUA(ua: string) {
  vi.spyOn(navigator, 'userAgent', 'get').mockReturnValue(ua)
}

beforeEach(() => {
  localStorage.clear()
  window.matchMedia = vi.fn().mockReturnValue({ matches: false, addEventListener: vi.fn(), removeEventListener: vi.fn() })
})
afterEach(() => {
  cleanup()
  vi.restoreAllMocks()
})

describe('InstallBar', () => {
  it('masaüstünde görünmez', () => {
    setUA('Mozilla/5.0 (Windows NT 10.0; Win64; x64) Chrome/130.0 Safari/537.36')
    const { container } = render(<InstallBar />)
    expect(container.innerHTML).toBe('')
  })

  it('iPhone tarayıcısında adımları açar', async () => {
    setUA(iphone)
    render(<InstallBar />)
    await userEvent.click(screen.getByRole('button', { name: 'Nasıl?' }))
    expect(await screen.findByText(/Ana Ekrana Ekle/)).not.toBeNull()
  })

  it('kapatılınca iki hafta görünmez', async () => {
    setUA(iphone)
    const { container, unmount } = render(<InstallBar />)
    await userEvent.click(screen.getByRole('button', { name: 'Kapat' }))
    expect(container.innerHTML).toBe('')
    unmount()
    expect(render(<InstallBar />).container.innerHTML).toBe('')
  })
})
