import { cleanup, fireEvent, render, screen } from '@testing-library/react'
import { afterEach, describe, expect, it, vi } from 'vitest'

vi.mock('@/lib/avatars', () => ({ useAvatars: () => ({ data: new Map([['u1', '/avatars/a07.svg']]) }) }))
const { Avatar } = await import('./avatar')

afterEach(cleanup)

describe('Avatar', () => {
  it('kullanıcının avatarı varsa görseli gösterir', () => {
    const { container } = render(<Avatar name="Ayşe Yılmaz" userId="u1" />)
    expect(container.querySelector('img')?.getAttribute('src')).toBe('/avatars/a07.svg')
  })

  it('avatarı olmayan kullanıcıda baş harfleri gösterir', () => {
    const { container } = render(<Avatar name="Ayşe Yılmaz" userId="u2" />)
    expect(container.querySelector('img')).toBeNull()
    expect(screen.getByText('AY')).toBeTruthy()
  })

  it('kullanıcı kimliği verilmezse sorgu gerekmeden baş harfleri gösterir', () => {
    render(<Avatar name="Mert Kaya" />)
    expect(screen.getByText('MK')).toBeTruthy()
  })

  it('görsel yüklenemezse baş harflere döner', () => {
    const { container } = render(<Avatar name="Ayşe Yılmaz" userId="u1" />)
    fireEvent.error(container.querySelector('img')!)
    expect(container.querySelector('img')).toBeNull()
    expect(screen.getByText('AY')).toBeTruthy()
  })
})
