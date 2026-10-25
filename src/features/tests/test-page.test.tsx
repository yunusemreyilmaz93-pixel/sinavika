import { fireEvent, render, screen, waitFor } from '@testing-library/react'
import { MemoryRouter, Route, Routes } from 'react-router'
import { beforeEach, describe, expect, it, vi } from 'vitest'
import TestPage from './test-page'

const submit = vi.fn()

vi.mock('@/features/auth/session', () => ({ useProfile: () => ({ id: 'student-1' }) }))
vi.mock('@/lib/data', () => ({ useCurriculum: () => ({ data: { topicById: new Map([[7, { id: 7, name: 'Çarpanlar ve Katlar' }]]) } }) }))
vi.mock('./queries', () => ({
  useTestSets: () => ({ isLoading: false, data: [{ id: 5, exam: 'LGS', kind: 'konu', title: 'Deneme testi', duration_min: null, question_count: 2 }] }),
  useTestQuestions: () => ({
    isLoading: false,
    data: [
      { id: 1, position: 1, subject_id: 'lgs-mat', topic_id: 7, stem: '$2 + 2$ kaçtır?', options: ['3', '4', '5', '6'], difficulty: 1 },
      { id: 2, position: 2, subject_id: 'lgs-mat', topic_id: 7, stem: '$3 \\cdot 3$ kaçtır?', options: ['6', '9', '12', '15'], difficulty: 1 },
    ],
  }),
  useSubmitTest: () => ({
    isPending: false,
    isSuccess: false,
    reset: vi.fn(),
    mutate: (vars: unknown, options: { onSuccess: (r: unknown) => void }) => options.onSuccess(submit(vars)),
  }),
}))

function renderPage() {
  return render(
    <MemoryRouter initialEntries={['/app/testler/5']}>
      <Routes>
        <Route path="/app/testler/:setId" element={<TestPage />} />
      </Routes>
    </MemoryRouter>,
  )
}

describe('test sayfası', () => {
  beforeEach(() => {
    window.scrollTo = () => {}
    submit.mockReset()
  })

  it('şıkları işaretletir, boş soruda onay ister, sonucu net ve çözümle gösterir', async () => {
    submit.mockReturnValue({
      attempt_id: 1, set_id: 5, correct: 1, wrong: 0, blank: 1, seconds: 12, created_at: '', first: true,
      review: [
        { question_id: 1, position: 1, choice: 1, correct_choice: 1, is_correct: true, explanation: 'İki ile iki dört eder.' },
        { question_id: 2, position: 2, choice: null, correct_choice: 1, is_correct: false, explanation: 'Üç kere üç dokuz eder.' },
      ],
    })
    const { container } = renderPage()
    const radios = container.querySelectorAll('[role="radio"]')
    expect(radios).toHaveLength(8)
    fireEvent.click(radios[1])
    expect(radios[1].getAttribute('aria-checked')).toBe('true')
    expect(screen.getByText('1 / 2 işaretlendi')).toBeTruthy()

    fireEvent.click(screen.getByRole('button', { name: 'Testi bitir' }))
    expect(screen.getByText(/1 soru boş/)).toBeTruthy()
    expect(submit).not.toHaveBeenCalled()
    fireEvent.click(screen.getByRole('button', { name: 'Bitir' }))

    await waitFor(() => expect(screen.getByText('Netin')).toBeTruthy())
    expect(submit).toHaveBeenCalledWith({ answers: { 1: 1 }, seconds: 0 })
    expect(screen.getByText('1 doğru')).toBeTruthy()
    expect(screen.getByText('İlk çözümün istatistiklerine işlendi.')).toBeTruthy()
    expect(screen.getByText('Üç kere üç dokuz eder.')).toBeTruthy()
    expect(screen.getByText('Boş bıraktın.')).toBeTruthy()
    expect(container.innerHTML).not.toContain('NaN')
  })
})
