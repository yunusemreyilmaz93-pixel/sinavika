import { QueryClient, QueryClientProvider } from '@tanstack/react-query'
import { cleanup, render, screen, waitFor } from '@testing-library/react'
import userEvent from '@testing-library/user-event'
import { afterEach, beforeEach, describe, expect, it, vi } from 'vitest'

const rpc = vi.fn()
const toast = vi.hoisted(() => ({ success: vi.fn(), error: vi.fn() }))

vi.mock('sonner', () => ({ toast }))
vi.mock('@/features/auth/session', () => ({ useAuth: () => ({ refresh: vi.fn(async () => undefined) }) }))
vi.mock('@/lib/avatars', async (importOriginal) => ({
  ...(await importOriginal<typeof import('@/lib/avatars')>()),
  useAvatars: () => ({ data: new Map() }),
}))
vi.mock('@/lib/supabase', async (importOriginal) => ({
  ...(await importOriginal<typeof import('@/lib/supabase')>()),
  supabase: { rpc: (...args: unknown[]) => rpc(...args) },
}))

const { AvatarDialog } = await import('./avatar-dialog')

function renderDialog(current: string | null = null, pending = false) {
  window.matchMedia ??= ((q: string) => ({ matches: false, media: q, addEventListener() {}, removeEventListener() {} })) as never
  return render(
    <QueryClientProvider client={new QueryClient()}>
      <AvatarDialog open onOpenChange={() => {}} name="Ayşe Yılmaz" userId="u1" current={current} pending={pending} />
    </QueryClientProvider>,
  )
}

beforeEach(() => {
  rpc.mockReset()
  rpc.mockResolvedValue({ data: null, error: null })
  toast.success.mockReset()
})
afterEach(cleanup)

describe('avatar penceresi', () => {
  it('hazır avatar seçilince kaydeder', async () => {
    const user = userEvent.setup()
    renderDialog()
    await user.click(screen.getByRole('radio', { name: 'Avatar a07' }))
    await waitFor(() => expect(rpc).toHaveBeenCalledWith('set_avatar_preset', { p_preset: 'a07' }))
    expect(toast.success).toHaveBeenCalledWith('Avatar güncellendi')
  })

  it('seçili avatarı işaretler ve kaldırma düğmesi sunar', async () => {
    const user = userEvent.setup()
    renderDialog('preset:a03')
    expect(screen.getByRole('radio', { name: 'Avatar a03' }).getAttribute('aria-checked')).toBe('true')
    await user.click(screen.getByRole('button', { name: 'Kaldır' }))
    await waitFor(() => expect(rpc).toHaveBeenCalledWith('set_avatar_preset', { p_preset: null }))
  })

  it('bekleyen fotoğrafı belirtir, uygun olmayan dosyayı reddeder', async () => {
    const user = userEvent.setup({ applyAccept: false })
    renderDialog(null, true)
    expect(screen.getByText('Yüklediğiniz fotoğraf incelemede')).toBeTruthy()
    await user.click(screen.getByRole('tab', { name: 'Fotoğraf' }))
    await user.upload(screen.getByLabelText('Fotoğraf seç'), new File(['x'], 'a.pdf', { type: 'application/pdf' }))
    expect(await screen.findByText(/Yalnızca JPEG, PNG ya da WebP/)).toBeTruthy()
  })
})
