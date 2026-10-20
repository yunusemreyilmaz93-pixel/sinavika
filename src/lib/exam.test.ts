import { describe, expect, it } from 'vitest'
import { loginEmail, suggestUsername, USERNAME_PATTERN } from '../../shared/accounts'
import { examKindsFor, formatNet, net, subjectsFor, type Subject } from './exam'

describe('net', () => {
  it('LGS için 3 yanlış 1 doğruyu götürür', () => {
    expect(net(15, 3, 'LGS')).toBe(14)
    expect(net(10, 2, 'LGS')).toBe(9.33)
  })
  it('YKS için 4 yanlış 1 doğruyu götürür', () => {
    expect(net(30, 8, 'TYT')).toBe(28)
    expect(net(20, 3, 'AYT')).toBe(19.25)
  })
  it('Türkçe biçimde yazar', () => {
    expect(formatNet(62.25)).toBe('62,25')
    expect(formatNet(null)).toBe('-')
  })
})

describe('sınav türleri', () => {
  it('alana göre doğru sınavları döner', () => {
    expect(examKindsFor({ track: 'lgs', field: null })).toEqual(['LGS'])
    expect(examKindsFor({ track: 'yks', field: 'say' })).toEqual(['TYT', 'AYT'])
    expect(examKindsFor({ track: 'yks', field: 'dil' })).toEqual(['TYT', 'YDT'])
    expect(examKindsFor({ track: 'yks', field: null })).toEqual(['TYT', 'AYT', 'YDT'])
  })
  it('AYT derslerini alana göre süzer', () => {
    const subjects = [
      { id: 'ayt-mat', exam: 'AYT', fields: ['say', 'ea'], sort: 1 },
      { id: 'ayt-fiz', exam: 'AYT', fields: ['say'], sort: 2 },
      { id: 'ayt-edb', exam: 'AYT', fields: ['ea', 'soz'], sort: 5 },
    ] as Subject[]
    expect(subjectsFor(subjects, 'AYT', 'ea').map((s) => s.id)).toEqual(['ayt-mat', 'ayt-edb'])
    expect(subjectsFor(subjects, 'AYT', null)).toHaveLength(3)
  })
})

describe('hesaplar', () => {
  it('Türkçe adlardan geçerli kullanıcı adı önerir', () => {
    const u = suggestUsername('Çağrı Şükrü Öztürk')
    expect(u).toBe('cagri.sukru.ozturk')
    expect(USERNAME_PATTERN.test(u)).toBe(true)
    expect(suggestUsername('  İlayda   Işık ')).toBe('ilayda.isik')
  })
  it('kullanıcı adını giriş e-postasına çevirir', () => {
    expect(loginEmail(' Deniz ')).toBe('deniz@hesap.sinavika.app')
    expect(loginEmail('Ayse@Ornek.com')).toBe('ayse@ornek.com')
  })
})

describe('passwordIssues', () => {
  it('eksik kuralları sırayla döner', async () => {
    const { passwordIssues, passwordIssueMessage } = await import('../../shared/accounts')
    expect(passwordIssues('Kalem2026!')).toEqual([])
    expect(passwordIssues('kalemkalem')).toEqual(['Bir büyük harf (A, B, C gibi)', 'Bir rakam', 'Bir sembol (! ? . * gibi)'])
    expect(passwordIssueMessage('Kalemkalem')).toBe('Şifrende eksik olanlar: bir rakam, bir sembol')
    expect(passwordIssueMessage('Kalem2026!')).toBeNull()
  })
})

describe('otomatik şifreler', () => {
  it('kurallara uyar', async () => {
    const { passwordIssues } = await import('../../shared/accounts')
    const { readablePassword } = await import('@/features/teacher/student-detail/queries')
    for (let i = 0; i < 50; i++) expect(passwordIssues(readablePassword())).toEqual([])
  })
})
