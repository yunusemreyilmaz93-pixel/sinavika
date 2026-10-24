import { render, screen } from '@testing-library/react'
import { describe, expect, it } from 'vitest'
import { DerivativeSim, IntegralSim, UnitCircleSim } from './calculus-sims'
import { CollisionSim, HarmonicSim, NewtonSim, PhotoelectricSim, ProjectileSim, VectorSim } from './physics-sims'

const sims = { UnitCircleSim, DerivativeSim, IntegralSim, VectorSim, NewtonSim, ProjectileSim, CollisionSim, HarmonicSim, PhotoelectricSim }

describe('simülasyonlar', () => {
  for (const [name, Sim] of Object.entries(sims)) {
    it(`${name} hatasız çizilir ve başlığı vardır`, () => {
      const { container } = render(<Sim />)
      expect(container.querySelector('figcaption')?.textContent).toBeTruthy()
      expect(container.innerHTML).not.toContain('NaN')
      expect(screen.getAllByRole('slider').length).toBeGreaterThan(0)
    })
  }
})
