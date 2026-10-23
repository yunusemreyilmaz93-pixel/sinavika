import { QueryClient, QueryClientProvider } from '@tanstack/react-query'
import { cleanup, render, screen, waitFor } from '@testing-library/react'
import userEvent from '@testing-library/user-event'
import { afterEach, beforeEach, describe, expect, it, vi } from 'vitest'
import type { PlannerStudent } from './student-picker'

const insert = vi.fn()
const toast = vi.hoisted(() => ({ success: vi.fn(), error: vi.fn() }))

vi.mock('sonner', () => ({ toast }))
vi.mock('@/lib/supabase', async (importOriginal) => ({
  ...(await importOriginal<typeof import('@/lib/supabase')>()),
  supabase: { from: () => ({ insert }) },
}))
vi.mock('@/lib/data', async () => {
  const subjects = [{ id: 'lgs-mat', name: 'Matematik', exam: 'LGS', sort: 1, color: 'blue' }]
  return {
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
vi.mock('./queries', () => ({ invalidateTasks: vi.fn(async () => undefined) }))

const { BulkTaskModal } = await import('./bulk-task')

const students = ['Ayşe', 'Mert', 'Zeynep'].map(
  (full_name, i) => ({ id: `s${i}`, full_name, track: 'lgs', grade: 8, field: null }) as PlannerStudent,
)

function renderModal(week = '2026-10-19') {
  window.matchMedia ??= ((q: string) => ({ matches: false, media: q, addEventListener() {}, removeEventListener() {} })) as never
  return render(
    <QueryClientProvider client={new QueryClient()}>
      <BulkTaskModal open onOpenChange={() => {}} students={students} initialWeek={week} />
    </QueryClientProvider>,
  )
}

beforeEach(() => {
  insert.mockReset()
  insert.mockResolvedValue({ data: null, error: null })
  toast.success.mockReset()
  toast.error.mockReset()
})
afterEach(cleanup)

describe('toplu görev', () => {
  it('seçilen öğrenci ve günler için tek istekte satır ekler', async () => {
    const user = userEvent.setup()
    renderModal()
    await user.click(screen.getByRole('button', { name: 'Tümü' }))
    await user.click(screen.getByRole('button', { name: 'Hafta içi' }))
    await user.type(screen.getByLabelText('Başlık'), 'Paragraf 20 soru')
    await user.click(screen.getByRole('button', { name: '15 görev ekle' }))
    await waitFor(() => expect(insert).toHaveBeenCalledTimes(1))
    expect(insert.mock.calls[0][0]).toHaveLength(15)
    expect(toast.success).toHaveBeenCalledWith('15 görev eklendi')
  })

  it('başlık boşsa ve ders seçilmemişse hata gösterir, istek atmaz', async () => {
    const user = userEvent.setup()
    renderModal()
    await user.click(screen.getByRole('button', { name: 'Tümü' }))
    await user.click(screen.getByRole('button', { name: 'Hafta içi' }))
    await user.click(screen.getByRole('button', { name: '15 görev ekle' }))
    expect((await screen.findAllByText('Başlık yazın ya da bir ders seçin')).length).toBeGreaterThan(0)
    expect(insert).not.toHaveBeenCalled()
  })

  it('gün ya da öğrenci seçilmeden gönderilirse nedenini söyler', async () => {
    const user = userEvent.setup()
    renderModal('2025-01-06')
    await user.type(screen.getByLabelText('Başlık'), 'Paragraf 20 soru')
    await user.click(screen.getByRole('button', { name: 'Görev ekle' }))
    expect(await screen.findByText('En az bir öğrenci seçin')).toBeTruthy()
    await user.click(screen.getByRole('button', { name: 'Tümü' }))
    await user.click(screen.getByRole('button', { name: 'Görev ekle' }))
    expect(await screen.findByText('En az bir gün seçin')).toBeTruthy()
    expect(insert).not.toHaveBeenCalled()
  })
})
