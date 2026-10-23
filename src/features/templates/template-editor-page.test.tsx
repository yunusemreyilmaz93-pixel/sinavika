import { QueryClient, QueryClientProvider } from '@tanstack/react-query'
import { cleanup, render, screen, waitFor, within } from '@testing-library/react'
import userEvent from '@testing-library/user-event'
import { createMemoryRouter, RouterProvider } from 'react-router'
import { afterEach, beforeEach, describe, expect, it, vi } from 'vitest'

const insert = vi.fn()
const toast = vi.hoisted(() => ({ success: vi.fn(), error: vi.fn() }))

vi.mock('sonner', () => ({ toast }))
vi.mock('@/lib/supabase', async (importOriginal) => ({
  ...(await importOriginal<typeof import('@/lib/supabase')>()),
  supabase: { from: () => ({ insert: (row: unknown) => ({ select: () => ({ single: () => insert(row) }) }) }) },
}))
vi.mock('@/lib/data', async (importOriginal) => {
  const subjects = [{ id: 'tyt-mat', name: 'Temel Matematik', exam: 'TYT', sort: 1, color: 'sea' }]
  return {
    ...(await importOriginal<typeof import('@/lib/data')>()),
    useCurriculum: () => ({
      data: {
        subjects,
        topics: [],
        subjectById: new Map(subjects.map((s) => [s.id, s])),
        topicById: new Map(),
        topicsBySubject: new Map(),
      },
    }),
  }
})

const { default: Editor } = await import('./template-editor-page')

function renderEditor() {
  window.matchMedia ??= ((q: string) => ({ matches: false, media: q, addEventListener() {}, removeEventListener() {} })) as never
  const router = createMemoryRouter(
    [
      { path: '/app/sablonlar/yeni', element: <Editor /> },
      { path: '/app/sablonlar/:key', element: <p>kaydedildi</p> },
    ],
    { initialEntries: ['/app/sablonlar/yeni'] },
  )
  return render(
    <QueryClientProvider client={new QueryClient()}>
      <RouterProvider router={router} />
    </QueryClientProvider>,
  )
}

beforeEach(() => {
  insert.mockReset()
  insert.mockResolvedValue({ data: { id: 7 }, error: null })
  toast.error.mockReset()
})
afterEach(cleanup)

describe('şablon düzenleyici', () => {
  it('görev ve ikinci hafta ekleyip kaydeder', async () => {
    const user = userEvent.setup()
    renderEditor()
    await user.type(screen.getByLabelText('Ad'), 'Yaz programı')

    await user.click(screen.getAllByRole('button', { name: 'Görev ekle' })[1])
    const dialog = await screen.findByRole('dialog')
    await user.type(within(dialog).getByLabelText('Başlık'), 'Paragraf 30 soru')
    await user.click(within(dialog).getByRole('button', { name: 'Ekle' }))
    await waitFor(() => expect(screen.queryByRole('dialog')).toBeNull())
    expect(insert).not.toHaveBeenCalled()
    expect(screen.getByText('Paragraf 30 soru')).toBeTruthy()

    await user.click(screen.getByRole('button', { name: 'Bu haftayı çoğalt' }))
    expect(screen.getByRole('tab', { name: 'Hafta 2' })).toBeTruthy()
    expect(screen.getByText('Paragraf 30 soru')).toBeTruthy()

    await user.click(screen.getByRole('button', { name: 'Kaydet' }))
    await waitFor(() => expect(insert).toHaveBeenCalledTimes(1))
    const row = insert.mock.calls[0][0] as { name: string; items: { week: number; weekday: number; title: string }[] }
    expect(row.name).toBe('Yaz programı')
    expect(row.items.map((i) => [i.week, i.weekday, i.title])).toEqual([
      [0, 1, 'Paragraf 30 soru'],
      [1, 1, 'Paragraf 30 soru'],
    ])
    expect(await screen.findByText('kaydedildi')).toBeTruthy()
  })

  it('adsız ya da görevsiz şablonu kaydetmez', async () => {
    const user = userEvent.setup()
    renderEditor()
    await user.click(screen.getByRole('button', { name: 'Kaydet' }))
    expect(await screen.findByText('Şablona bir ad verin')).toBeTruthy()
    await user.type(screen.getByLabelText('Ad'), 'Boş')
    await user.click(screen.getByRole('button', { name: 'Kaydet' }))
    await waitFor(() => expect(toast.error).toHaveBeenCalledWith('Şablonda en az bir görev olmalı'))
    expect(insert).not.toHaveBeenCalled()
  })
})
