import { describe, expect, it } from 'vitest'
import { rankByAttention, riskSignals, type OverviewRow } from './overview'

const tuesday = '2026-10-20'
const thursday = '2026-10-22'

function row(patch: Partial<OverviewRow> = {}): OverviewRow {
  return {
    id: 'a',
    full_name: 'Ali Kaya',
    username: 'ali',
    track: 'yks',
    grade: 12,
    field: 'say',
    target: null,
    archived_at: null,
    last_seen_at: null,
    last_activity_on: tuesday,
    minutes_7d: 300,
    questions_7d: 200,
    tasks_week: 10,
    tasks_week_done: 6,
    tasks_overdue: 0,
    last_exam_kind: 'TYT',
    last_net: 80,
    prev_net: 78,
    parent_count: 1,
    ...patch,
  }
}

describe('riskSignals', () => {
  it('düzenli çalışan öğrenci için sinyal vermez', () => {
    expect(riskSignals(row(), tuesday)).toEqual({ level: 'ok', reasons: [] })
  })

  it('3 gün kayıt yoksa izlemeye alır, 5 günde risk der', () => {
    expect(riskSignals(row({ last_activity_on: '2026-10-16' }), tuesday)).toEqual({
      level: 'watch',
      reasons: ['4 gündür kayıt yok'],
    })
    expect(riskSignals(row({ last_activity_on: '2026-10-15' }), tuesday).level).toBe('risk')
    expect(riskSignals(row({ last_activity_on: null }), tuesday).reasons).toEqual(['Henüz kayıt yok'])
  })

  it('3 ve üzeri gecikmiş görevi bildirir', () => {
    expect(riskSignals(row({ tasks_overdue: 2 }), tuesday).reasons).toEqual([])
    expect(riskSignals(row({ tasks_overdue: 3 }), tuesday).reasons).toEqual(['3 gecikmiş görev'])
  })

  it('haftalık tamamlama oranını haftanın 3. gününden sonra değerlendirir', () => {
    const low = row({ tasks_week: 10, tasks_week_done: 2 })
    expect(riskSignals(low, tuesday).reasons).toEqual([])
    expect(riskSignals(low, thursday).reasons).toEqual(['Bu hafta 2/10 görev tamam'])
    expect(riskSignals(row({ tasks_week: 0, tasks_week_done: 0 }), thursday).reasons).toEqual([])
  })

  it('aynı türdeki önceki denemeye göre 3 net düşüşü yakalar', () => {
    expect(riskSignals(row({ last_net: 75.25, prev_net: 80.5 }), tuesday).reasons).toEqual(['Net 5,25 düştü'])
    expect(riskSignals(row({ last_net: 78, prev_net: 80.5 }), tuesday).reasons).toEqual([])
    expect(riskSignals(row({ last_net: 70, prev_net: null }), tuesday).reasons).toEqual([])
  })

  it('birden fazla sinyalde risk der', () => {
    expect(riskSignals(row({ tasks_overdue: 4, last_net: 70, prev_net: 75 }), tuesday)).toEqual({
      level: 'risk',
      reasons: ['4 gecikmiş görev', 'Net 5 düştü'],
    })
  })

  it('arşivdeki öğrenciyi değerlendirmez', () => {
    expect(riskSignals(row({ archived_at: '2026-10-01T10:00:00Z', last_activity_on: null }), tuesday).level).toBe('ok')
  })
})

describe('rankByAttention', () => {
  it('dikkat isteyenleri üste alır', () => {
    const ranked = rankByAttention(
      [
        row({ id: '1', full_name: 'Can' }),
        row({ id: '2', full_name: 'Deniz', tasks_overdue: 5 }),
        row({ id: '3', full_name: 'Ece', last_activity_on: '2026-10-10' }),
      ],
      tuesday,
    )
    expect(ranked.map((r) => r.id)).toEqual(['3', '2', '1'])
  })
})
