const turkish = { ç: 'c', ğ: 'g', ı: 'i', ö: 'o', ş: 's', ü: 'u' }

export function slug(text) {
  return text
    .toLocaleLowerCase('tr')
    .replace(/[çğıöşü]/g, (c) => turkish[c])
    .replace(/[^a-z0-9]+/g, '-')
    .replace(/^-+|-+$/g, '')
}

export const examLabels = {
  lgs: { name: 'LGS', long: 'Liseye Geçiş Sınavı', intro: '8. sınıf öğrencileri için 90 soruluk merkezî sınav' },
  tyt: { name: 'TYT', long: 'Temel Yeterlilik Testi', intro: 'YKS\'nin ilk oturumu, 120 soru ve 135 dakika' },
  ayt: { name: 'AYT', long: 'Alan Yeterlilik Testi', intro: 'YKS\'nin alan oturumu, 160 soru ve 180 dakika' },
  ydt: { name: 'YDT', long: 'Yabancı Dil Testi', intro: 'YKS\'nin dil oturumu, 80 soru ve 120 dakika' },
}

const subjectSlugs = {
  'lgs-tr': 'turkce',
  'lgs-mat': 'matematik',
  'lgs-fen': 'fen-bilimleri',
  'lgs-ink': 'inkilap-tarihi',
  'lgs-din': 'din-kulturu',
  'lgs-ing': 'ingilizce',
  'tyt-tr': 'turkce',
  'tyt-mat': 'matematik',
  'tyt-din': 'din-kulturu',
  'ayt-edb': 'edebiyat',
  'ayt-fel': 'felsefe-grubu',
  'ayt-din': 'din-kulturu',
  'ydt-dil': 'yabanci-dil',
}

export function subjectSlug(subject) {
  return subjectSlugs[subject.id] ?? slug(subject.name)
}

// Konu adı bir dersin içinde tekrar ederse sonuna kimlik eklenir
export function topicSlugs(topics) {
  const count = new Map()
  for (const t of topics) count.set(slug(t.name), (count.get(slug(t.name)) ?? 0) + 1)
  return new Map(topics.map((t) => [t.id, (count.get(slug(t.name)) ?? 0) > 1 ? `${slug(t.name)}-${t.id}` : slug(t.name)]))
}
