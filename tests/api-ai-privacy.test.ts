// @vitest-environment node
import { beforeAll, describe, expect, it, vi } from 'vitest'
import { decryptKey, encryptKey, pseudonym } from '../api/_lib/ai/crypto.js'
import { fold, makePrivacy, scrubPii } from '../api/_lib/ai/privacy.js'

const teacher = '11111111-1111-1111-1111-111111111111'
const people = [
  { id: 'a0000000-0000-0000-0000-000000000001', name: 'Elif Yılmaz', kind: 'student' as const },
  { id: 'a0000000-0000-0000-0000-000000000002', name: 'Deniz Kaya', kind: 'student' as const },
  { id: 'b0000000-0000-0000-0000-000000000001', name: 'Mehmet Yılmaz', kind: 'parent' as const },
]

beforeAll(() => {
  vi.stubEnv('AI_KEY_SECRET', 'test-secret-test-secret-test-secret')
})

describe('anahtar şifreleme', () => {
  it('şifreler, çözer ve düz metni içermez', () => {
    const blob = encryptKey('sk-test-1234567890abcdef', teacher)
    expect(blob).not.toContain('sk-test')
    expect(decryptKey(blob, teacher)).toBe('sk-test-1234567890abcdef')
  })
  it('başka öğretmenin kimliğiyle çözülemez, kurcalanırsa çözülemez', () => {
    const blob = encryptKey('sk-test-1234567890abcdef', teacher)
    expect(() => decryptKey(blob, '22222222-2222-2222-2222-222222222222')).toThrow()
    const parts = blob.split('.')
    parts[2] = Buffer.from('bozuk').toString('base64url')
    expect(() => decryptKey(parts.join('.'), teacher)).toThrow()
  })
  it('her şifrelemede farklı çıktı verir', () => {
    expect(encryptKey('aynı', teacher)).not.toBe(encryptKey('aynı', teacher))
  })
  it('takma kimlik kararlı ve öğretmene özel', () => {
    expect(pseudonym('OGR', teacher, people[0].id)).toBe(pseudonym('OGR', teacher, people[0].id))
    expect(pseudonym('OGR', teacher, people[0].id)).not.toBe(pseudonym('OGR', 'başka-öğretmen', people[0].id))
    expect(pseudonym('OGR', teacher, people[0].id)).toMatch(/^OGR-\d{6}$/)
  })
})

describe('gizlilik: ad gizleme', () => {
  const privacy = () => makePrivacy(teacher, people)
  const elif = () => privacy().tokenOf(people[0].id)!

  it('tam ad, ilk ad ve Türkçe ekleri takma kimliğe çevirir', () => {
    const p = privacy()
    const t = elif()
    expect(p.scrub('Elif için bu hafta')).toBe(`${t} için bu hafta`)
    expect(p.scrub("Elif'e 3 görev ver")).toBe(`${t}'e 3 görev ver`)
    expect(p.scrub('Elife 3 görev ver')).toBe(`${t} 3 görev ver`)
    expect(p.scrub('Elifin netleri')).toBe(`${t} netleri`)
    expect(p.scrub('ELİF nasıl?')).toBe(`${t} nasıl?`)
    expect(p.scrub("Elif Yılmaz'ın durumu")).toBe(`${t}'ın durumu`)
    expect(p.scrub('elif ile Deniz karşılaştır')).toBe(`${t} ile ${p.tokenOf(people[1].id)} karşılaştır`)
  })
  it('başka sözcüklerin içindeki ad parçasını bozmaz', () => {
    const p = privacy()
    expect(p.scrub('Elifli bir paragraf')).toBe('Elifli bir paragraf')
    expect(p.scrub('denizci ve derin')).toBe('denizci ve derin')
  })
  it('tek başına soyadı gizler', () => {
    const p = privacy()
    expect(p.scrub('Yılmaz hanım aradı')).toBe('[soyad] hanım aradı')
  })
  it('veli adını da takma kimliğe çevirir', () => {
    const p = privacy()
    expect(p.scrub('Mehmet Bey ile görüştüm')).toBe(`${p.tokenOf(people[2].id)} Bey ile görüştüm`)
    expect(p.tokenOf(people[2].id)).toMatch(/^VELI-\d{6}$/)
  })
  it('yanıttaki takma kimliği ada geri çevirir', () => {
    const p = privacy()
    expect(p.restore(`${elif()}'e matematik verelim`)).toBe("Elif'e matematik verelim")
    expect(p.restore('OGR-999999 bilinmiyor')).toBe('OGR-999999 bilinmiyor')
  })
  it('aynı ilk ada sahip iki kişide tam adı yazar', () => {
    const p = makePrivacy(teacher, [...people, { id: 'a0000000-0000-0000-0000-000000000003', name: 'Elif Demir', kind: 'student' }])
    expect(p.restore(p.tokenOf(people[0].id)!)).toBe('Elif Yılmaz')
  })
})

describe('gizlilik: kişisel veri deseni', () => {
  it('telefon, e-posta, TC kimlik ve IBAN gizlenir', () => {
    expect(scrubPii('0532 123 45 67 ve +90 532 123 45 67')).toBe('[telefon] ve [telefon]')
    expect(scrubPii('veli@ornek.com yazdı')).toBe('[e-posta] yazdı')
    expect(scrubPii('TC 12345678901 numaralı')).toBe('TC [kimlik no] numaralı')
    expect(scrubPii('TR12 3456 7890 1234 5678 9012 34')).toBe('[iban]')
  })
  it('sıradan sayılara dokunmaz', () => {
    expect(scrubPii('3 görev, 120 soru, 18.5 net, 2026-10-21')).toBe('3 görev, 120 soru, 18.5 net, 2026-10-21')
  })
  it('fold uzunluğu korur', () => {
    const text = 'İşğüöçı ŞĞÜÖÇI'
    expect(fold(text)).toHaveLength([...text].length)
  })
})
