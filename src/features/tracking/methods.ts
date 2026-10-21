export type MethodPhase = { label: string; hint: string; share: number }

export type StudyMethod = {
  id: string
  name: string
  summary: string
  // Serbest yöntemde süreyi öğrenci seçer
  minutes: number | null
  breakMinutes: number
  phases: MethodPhase[]
}

export const FREE_METHOD = 'serbest'

export const methods: StudyMethod[] = [
  { id: FREE_METHOD, name: 'Serbest', summary: 'Süreyi sen belirlersin.', minutes: null, breakMinutes: 5, phases: [] },
  {
    id: 'pomodoro',
    name: 'Pomodoro',
    summary: '25 dakika çalışma, 5 dakika mola.',
    minutes: 25,
    breakMinutes: 5,
    phases: [{ label: 'Odaklan', hint: 'Tek bir işe ver. Telefon görüş alanının dışında olsun.', share: 1 }],
  },
  {
    id: 'elli-on',
    name: '50/10',
    summary: '50 dakika çalışma, 10 dakika mola.',
    minutes: 50,
    breakMinutes: 10,
    phases: [{ label: 'Odaklan', hint: 'Uzun ve kesintisiz çalış. Mola vakti gelene kadar konuya bağlı kal.', share: 1 }],
  },
  {
    id: 'derin',
    name: 'Derin odak',
    summary: '90 dakika çalışma, 20 dakika mola.',
    minutes: 90,
    breakMinutes: 20,
    phases: [
      { label: 'Plan', hint: 'Bu oturumda neyi bitireceğini bir cümleyle yaz.', share: 5 },
      { label: 'Çalış', hint: 'Yalnızca yazdığın işe odaklan.', share: 75 },
      { label: 'Özet', hint: 'Ne öğrendiğini üç cümleyle yaz.', share: 10 },
    ],
  },
  {
    id: 'yokla',
    name: 'Kendini yokla',
    summary: 'Oku, kapat, hatırladığını yaz, kontrol et. 30 dakika.',
    minutes: 30,
    breakMinutes: 5,
    phases: [
      { label: 'Oku', hint: 'Konuyu dikkatle oku, önemli yerleri işaretle.', share: 1 },
      { label: 'Kapat ve yaz', hint: 'Kitabı kapat, hatırladığın her şeyi kâğıda yaz.', share: 1 },
      { label: 'Kontrol et', hint: 'Notlarınla karşılaştır, eksik kalanları tamamla.', share: 1 },
    ],
  },
  {
    id: 'anlat',
    name: 'Anlat',
    summary: 'Konuyu kendi cümlelerinle anlat. 30 dakika.',
    minutes: 30,
    breakMinutes: 5,
    phases: [
      { label: 'Oku', hint: 'Konuyu bir kez baştan sona oku.', share: 8 },
      { label: 'Anlat', hint: 'Sanki birine öğretiyormuş gibi yüksek sesle anlat ya da yaz.', share: 14 },
      { label: 'Boşlukları bul', hint: 'Anlatırken takıldığın yerleri işaretle ve tekrar oku.', share: 8 },
    ],
  },
  {
    id: 'soru-turu',
    name: 'Soru turu',
    summary: 'Süreli soru çözümü, ardından yanlış inceleme. 40 dakika.',
    minutes: 40,
    breakMinutes: 10,
    phases: [
      { label: 'Soruları çöz', hint: 'Süreye karşı çöz, takıldığın soruyu işaretleyip geç.', share: 30 },
      { label: 'Yanlışları incele', hint: 'Her yanlışın nedenini bir cümleyle yaz.', share: 10 },
    ],
  },
]

export const methodById = Object.fromEntries(methods.map((m) => [m.id, m])) as Record<string, StudyMethod>

export function methodOf(id: string | null | undefined) {
  return (id && methodById[id]) || methodById[FREE_METHOD]
}

export function phaseAt(method: StudyMethod, workedMs: number, totalMs: number) {
  if (!method.phases.length || totalMs <= 0) return null
  const total = method.phases.reduce((sum, p) => sum + p.share, 0)
  let start = 0
  for (let index = 0; index < method.phases.length; index++) {
    const phase = method.phases[index]
    const end = start + (phase.share / total) * totalMs
    if (workedMs < end || index === method.phases.length - 1) {
      return { index, count: method.phases.length, phase, leftMs: Math.max(0, end - workedMs) }
    }
    start = end
  }
  return null
}
