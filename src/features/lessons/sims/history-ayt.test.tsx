import { fireEvent, render, screen } from '@testing-library/react'
import { beforeAll, describe, expect, it } from 'vitest'
import { AncientSim, BalanceSim, ColdWarSim, EarlyTurksSim, GlobalSim, IslamHistorySim, RevolutionsSim, TurkIslamSim, WorldWar1Sim, WorldWar2Sim } from './history-ayt-sims'

const sims = { AncientSim, EarlyTurksSim, IslamHistorySim, TurkIslamSim, RevolutionsSim, BalanceSim, WorldWar1Sim, WorldWar2Sim, ColdWarSim, GlobalSim }

describe('tarih zaman şeritleri', () => {
  beforeAll(() => {
    window.matchMedia = ((query: string) => ({ matches: false, media: query, addEventListener() {}, removeEventListener() {} })) as unknown as typeof window.matchMedia
    Element.prototype.scrollTo = () => {}
  })

  for (const [name, Sim] of Object.entries(sims)) {
    it(`${name} çizilir ve olaya dokununca ayrıntı açılır`, () => {
      const { container, unmount } = render(<Sim />)
      expect(container.querySelector('figcaption')?.textContent).toBeTruthy()
      const buttons = container.querySelectorAll('ol button')
      expect(buttons.length).toBeGreaterThan(4)
      fireEvent.click(buttons[2])
      expect(buttons[2].getAttribute('aria-pressed')).toBe('true')
      expect(container.innerHTML).not.toContain('NaN')
      unmount()
      expect(screen).toBeTruthy()
    })
  }
})
