import { QueryClient, QueryClientProvider } from '@tanstack/react-query'
import { cleanup, render, screen, waitFor } from '@testing-library/react'
import userEvent from '@testing-library/user-event'
import { MemoryRouter, Route, Routes } from 'react-router'
import { afterEach, beforeEach, describe, expect, it, vi } from 'vitest'
import type { PlannerStudent } from '@/features/plan/student-picker'

const insert = vi.fn()
const toast = vi.hoisted(() => ({ success: vi.fn(), error: vi.fn() }))

vi.mock('sonner', () => ({ toast }))
vi.mock('@/features/auth/session', () => ({ useProfile: () => ({ id: 't1', role: 'teacher' }) }))
vi.mock('@/features/plan/queries', () => ({ invalidateTasks: vi.fn(async () => undefined) }))
vi.mock('@/lib/supabase', async (importOriginal) => {
  const chain = () => {
    const c: Record<string, unknown> = {}
    for (const m of ['in', 'gte', 'lte']) c[m] = () => c
    c.then = (resolve: (v: unknown) => void) => resolve({ count: 0, error: null })
    return c
  }
  return {
    ...(await importOriginal<typeof import('@/lib/supabase')>()),
    supabase: { from: () => ({ select: chain, insert }) },
  }
})
vi.mock('@/lib/data', async (importOriginal) => ({
  ...(await importOriginal<typeof import('@/lib/data')>()),
  useCurriculum: () => ({ data: { subjects: [], topics: [], subjectById: new Map(), topicById: new Map(), topicsBySubject: new Map() } }),
}))
vi.mock('@/features/plan/student-picker', async (importOriginal) => {
  const students = ['Ayşe', 'Mert'].map((full_name, i) => ({ id: `s${i}`, full_name, track: i ? 'yks' : 'lgs', grade: 8, field: null }))
  return {
    ...(await importOriginal<typeof import('@/features/plan/student-picker')>()),
    usePlannerStudents: () => ({ data: students as PlannerStudent[], isPending: false }),
  }
})

const { default: TemplatePage } = await import('./template-page')

function renderAt(path: string) {
  window.matchMedia ??= ((q: string) => ({ matches: false, media: q, addEventListener() {}, removeEventListener() {} })) as never
  return render(
    <QueryClientProvider client={new QueryClient()}>
      <MemoryRouter initialEntries={[path]}>
        <Routes>
          <Route path="/app/sablonlar/:key" element={<TemplatePage />} />
        </Routes>
      </MemoryRouter>
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

describe('şablon sayfası', () => {
  it('hazır şablonu seçilen öğrencilere tek istekte uygular', async () => {
    const user = userEvent.setup()
    renderAt('/app/sablonlar/hazir-lgs-4-hafta?ogrenci=s0&hafta=2026-10-19')
    expect(await screen.findByRole('heading', { name: 'LGS 4 haftalık konu ve soru programı' })).toBeTruthy()
    expect(screen.getByRole('tab', { name: 'Hafta 4' })).toBeTruthy()
    await user.click(screen.getByRole('button', { name: /görev ekle$/ }))
    await waitFor(() => expect(insert).toHaveBeenCalledTimes(1))
    const rows = insert.mock.calls[0][0] as { student_id: string; due_on: string }[]
    expect(rows.length).toBe(rows.filter((r) => r.student_id === 's0').length)
    expect(rows.every((r) => r.due_on >= '2026-10-19' && r.due_on <= '2026-11-15')).toBe(true)
    expect(rows[0]).not.toHaveProperty('week')
    expect(toast.success).toHaveBeenCalled()
  })

  it('farklı sınav türündeki öğrenci için uyarı gösterir', async () => {
    const user = userEvent.setup()
    renderAt('/app/sablonlar/hazir-lgs-temel?ogrenci=s0')
    await screen.findByRole('heading', { name: 'LGS temel hafta' })
    await user.click(screen.getByRole('checkbox', { name: 'Mert' }))
    expect(await screen.findByText(/farklı sınav türünde/)).toBeTruthy()
  })

  it('işareti kaldırılan görev uygulanmaz', async () => {
    const user = userEvent.setup()
    renderAt('/app/sablonlar/hazir-lgs-temel?ogrenci=s0&hafta=2026-10-19')
    await screen.findByRole('heading', { name: 'LGS temel hafta' })
    await user.click(screen.getAllByRole('checkbox', { name: 'Matematik soru çözümü uygulansın' })[0])
    await user.click(screen.getByRole('button', { name: '11 görev ekle' }))
    await waitFor(() => expect(insert).toHaveBeenCalledTimes(1))
    expect(insert.mock.calls[0][0]).toHaveLength(11)
  })

  it('olmayan şablon için bulunamadı gösterir', async () => {
    renderAt('/app/sablonlar/hazir-yok')
    expect(await screen.findByText('Şablon bulunamadı')).toBeTruthy()
  })
})
