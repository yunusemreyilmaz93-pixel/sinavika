import { describe, expect, it } from 'vitest'
import { lossOf } from './loss'

const score = (subject_id: string, correct: number, wrong: number, blank: number) => ({ mock_exam_id: 1, subject_id, correct, wrong, blank })

describe('lossOf', () => {
  it('LGS: yanlış 1,33 boş 1 net götürür, toplam mükemmel net farkına eşittir', () => {
    const r = lossOf([score('mat', 14, 3, 3), score('fen', 18, 1, 1)], 'LGS', () => 20)
    expect(r.wrongLoss).toBeCloseTo(4 * (1 + 1 / 3), 5)
    expect(r.blankLoss).toBe(4)
    const netOf = (c: number, w: number) => c - w / 3
    expect(r.total).toBeCloseTo(40 - (netOf(14, 3) + netOf(18, 1)), 5)
    expect(r.rows[0].subject_id).toBe('mat')
  })
  it('YKS: ceza dörtte bir, girilmeyen sorular boş sayılır', () => {
    const r = lossOf([score('tyt-mat', 30, 4, 0)], 'TYT', () => 40)
    expect(r.wrongLoss).toBeCloseTo(5, 5)
    expect(r.blankLoss).toBe(6)
  })
  it('soru sayısı bilinmiyorsa girilen kadarını esas alır', () => {
    expect(lossOf([score('x', 5, 0, 0)], 'LGS', () => undefined).total).toBe(0)
  })
})
