import { cleanup, render } from '@testing-library/react'
import { BookMarked, Bug, NotebookPen } from 'lucide-react'
import { afterEach, describe, expect, it } from 'vitest'
import { EmptyState } from './empty-state'

afterEach(cleanup)

describe('EmptyState', () => {
  it('konuya uyan ikon için çizim gösterir', () => {
    const { container } = render(<EmptyState icon={NotebookPen} title="Henüz not yok" />)
    expect(container.querySelector('svg[viewBox="0 0 160 120"]')).not.toBeNull()
  })

  it('takma adlı ikonlarda da çizim gösterir', () => {
    const { container } = render(<EmptyState icon={BookMarked} title="Henüz kitap yok" />)
    expect(container.querySelector('svg[viewBox="0 0 160 120"]')).not.toBeNull()
  })

  it('eşleşmeyen ikonda ikon zeminine döner', () => {
    const { container } = render(<EmptyState icon={Bug} title="Kayıtlı hata yok" />)
    expect(container.querySelector('svg[viewBox="0 0 160 120"]')).toBeNull()
    expect(container.querySelector('.bg-primary-soft')).not.toBeNull()
  })
})
