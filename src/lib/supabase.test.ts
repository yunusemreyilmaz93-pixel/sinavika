import { describe, expect, it } from 'vitest'
import { AppError, errorMessage, GENERIC_ERROR } from './supabase'

describe('errorMessage', () => {
  it('Türkçe mesajları olduğu gibi bırakır', () => {
    expect(errorMessage(new Error('Bilgileri kontrol edip tekrar deneyin'))).toBe('Bilgileri kontrol edip tekrar deneyin')
    expect(errorMessage({ message: 'Öğrenci kontenjanı dolu (en fazla 10 öğrenci)' })).toBe(
      'Öğrenci kontenjanı dolu (en fazla 10 öğrenci)',
    )
    expect(errorMessage(new AppError('Bu görevi silme yetkin yok'))).toBe('Bu görevi silme yetkin yok')
  })

  it('teknik ve İngilizce hataları anlaşılır Türkçeye çevirir', () => {
    expect(errorMessage(new TypeError('Failed to fetch'))).toMatch(/Bağlantı kurulamadı/)
    expect(errorMessage({ message: 'new row violates row-level security policy for table "tasks"' })).toMatch(/yetkiniz yok/)
    expect(errorMessage({ message: 'new row for relation "tasks" violates check constraint "tasks_title_check"' })).toMatch(
      /geçerli değil/,
    )
    expect(errorMessage({ message: 'upstream request timeout' })).toMatch(/yanıt vermiyor/)
    expect(errorMessage(new TypeError("Cannot read properties of undefined (reading 'id')"))).toBe(GENERIC_ERROR)
    expect(errorMessage(null)).toBe(GENERIC_ERROR)
  })
})
