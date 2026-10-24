import { fireEvent, render, screen } from '@testing-library/react'
import { beforeAll, describe, expect, it } from 'vitest'
import {
  EasternReligionsSim,
  ForgettingSim,
  IslamScienceSim,
  JewishChristianSim,
  LogicHistorySim,
  Philosophy17Sim,
  Philosophy19Sim,
  Philosophy20Sim,
  PsychologyHistorySim,
  SociologyHistorySim,
  TruthTableSim,
} from './humanities-ayt-sims'

const strips = { LogicHistorySim, Philosophy17Sim, Philosophy19Sim, Philosophy20Sim, PsychologyHistorySim, SociologyHistorySim, IslamScienceSim, EasternReligionsSim, JewishChristianSim }

describe('felsefe, sosyal bilimler ve din simülasyonları', () => {
  beforeAll(() => {
    window.matchMedia = ((query: string) => ({ matches: false, media: query, addEventListener() {}, removeEventListener() {} })) as unknown as typeof window.matchMedia
    Element.prototype.scrollTo = () => {}
  })

  for (const [name, Sim] of Object.entries(strips)) {
    it(`${name} çizilir ve dokununca ayrıntı açılır`, () => {
      const { container, unmount } = render(<Sim />)
      const buttons = container.querySelectorAll('ol button')
      expect(buttons.length).toBeGreaterThan(4)
      fireEvent.click(buttons[2])
      expect(buttons[2].getAttribute('aria-pressed')).toBe('true')
      expect(container.innerHTML).not.toContain('NaN')
      unmount()
    })
  }

  it('doğruluk tablosu seçilen bağlaca göre sonuç verir', () => {
    const { container } = render(<TruthTableSim />)
    expect(container.textContent).toContain('p ∧ q')
    fireEvent.click(screen.getByRole('button', { name: 'q = 0' }))
    fireEvent.click(screen.getByRole('button', { name: 'Veya' }))
    expect(container.textContent).toContain('p ∨ q')
    fireEvent.click(screen.getByRole('button', { name: 'İse' }))
    expect(container.querySelectorAll('tbody tr').length).toBe(4)
    fireEvent.click(screen.getByRole('button', { name: 'Değil' }))
    expect(container.querySelectorAll('tbody tr').length).toBe(2)
  })

  it('unutma eğrisi tekrar sayısıyla yükselir', () => {
    const { container } = render(<ForgettingSim />)
    const [days, repeats] = Array.from(container.querySelectorAll('input[type="range"]')) as HTMLInputElement[]
    const value = () => Number(/%(\d+)/.exec(screen.getByText('Hatırlama').nextElementSibling?.textContent ?? '')?.[1])
    fireEvent.change(days, { target: { value: '7' } })
    const before = value()
    fireEvent.change(repeats, { target: { value: '3' } })
    expect(value()).toBeGreaterThan(before)
    expect(container.innerHTML).not.toContain('NaN')
  })
})
