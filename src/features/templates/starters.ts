import type { TemplateItem } from '@/features/plan/lib'

export const groups = ['LGS', 'TYT', 'AYT', 'YKS', 'YDT', 'Genel'] as const
export type TemplateGroup = (typeof groups)[number]

export type StarterTemplate = {
  id: string
  name: string
  description: string
  group: TemplateGroup
  track: 'lgs' | 'yks' | null
  items: TemplateItem[]
}

// [gün (0 = pazartesi), tür, ders, başlık, soru, dakika]
type Row = [
  weekday: number,
  kind: TemplateItem['kind'],
  subject: string | null,
  title: string,
  questions?: number,
  minutes?: number,
]

const Q = (d: number, s: string | null, title: string, n: number): Row => [d, 'questions', s, title, n]
const S = (d: number, s: string | null, title: string, m: number): Row => [d, 'study', s, title, undefined, m]
const R = (d: number, s: string | null, title: string, m: number): Row => [d, 'review', s, title, undefined, m]
const P = (d: number, s: string | null, title: string, m: number): Row => [d, 'reading', s, title, undefined, m]
const E = (d: number, title: string, m: number): Row => [d, 'other', null, title, undefined, m]

function program(weeks: Row[][]): TemplateItem[] {
  return weeks.flatMap((rows, week) =>
    rows.map(([weekday, kind, subject_id, title, questions, minutes]) => ({
      week,
      weekday,
      kind,
      subject_id,
      topic_id: null,
      title,
      target_questions: questions ?? null,
      target_minutes: minutes ?? null,
      note: null,
    })),
  )
}

type Day = [subject: string, label: string]

// Hafta içi her gün bir konu çalışma ve bir soru çözme görevi, cumartesi ve pazar için verilen görevler
function daily(days: Day[], saturday: Row, sunday: Row, questions = 25, minutes = 45): Row[] {
  return [
    ...days.flatMap(([subject, label], d): Row[] => [
      S(d, subject, `${label} · Konu çalışma`, minutes),
      Q(d, subject, `${label} · Soru çözümü`, questions),
    ]),
    saturday,
    sunday,
  ]
}

const lgsDeneme = E(5, 'LGS deneme sınavı', 155)
const tytDeneme = E(5, 'TYT deneme sınavı', 165)
const aytDeneme = E(5, 'AYT deneme sınavı', 180)
const analiz = (d = 6, m = 75) => R(d, null, 'Denemedeki yanlışların tekrarı', m)

const lgs = {
  mat: ['lgs-mat', 'Matematik'],
  fen: ['lgs-fen', 'Fen Bilimleri'],
  tr: ['lgs-tr', 'Türkçe'],
  ing: ['lgs-ing', 'İngilizce'],
  ink: ['lgs-ink', 'İnkılap Tarihi'],
  din: ['lgs-din', 'Din Kültürü'],
} as const
const lgsDay = (key: keyof typeof lgs, suffix = ''): Day => [lgs[key][0], `${lgs[key][1]}${suffix}`]
const lgsRevision = (...keys: (keyof typeof lgs)[]) => keys.map((k) => lgsDay(k, ' 7. sınıf tekrarı'))
const lgsMain = (...keys: (keyof typeof lgs)[]) => keys.map((k) => lgsDay(k))

const tyt = {
  mat: ['tyt-mat', 'Temel Matematik'],
  tr: ['tyt-tr', 'Türkçe'],
  fiz: ['tyt-fiz', 'Fizik'],
  kim: ['tyt-kim', 'Kimya'],
  bio: ['tyt-bio', 'Biyoloji'],
  tar: ['tyt-tar', 'Tarih'],
  cog: ['tyt-cog', 'Coğrafya'],
  fel: ['tyt-fel', 'Felsefe'],
  din: ['tyt-din', 'Din Kültürü'],
} as const
const tytDays = (...keys: (keyof typeof tyt)[]) => keys.map((k): Day => [tyt[k][0], tyt[k][1]])

const ayt = {
  mat: ['ayt-mat', 'AYT Matematik'],
  fiz: ['ayt-fiz', 'AYT Fizik'],
  kim: ['ayt-kim', 'AYT Kimya'],
  bio: ['ayt-bio', 'AYT Biyoloji'],
  edb: ['ayt-edb', 'Edebiyat'],
  tar1: ['ayt-tar1', 'Tarih-1'],
  cog1: ['ayt-cog1', 'Coğrafya-1'],
  tar2: ['ayt-tar2', 'Tarih-2'],
  cog2: ['ayt-cog2', 'Coğrafya-2'],
  fel: ['ayt-fel', 'Felsefe Grubu'],
  din: ['ayt-din', 'Din Kültürü'],
} as const
const aytDays = (...keys: (keyof typeof ayt)[]) => keys.map((k): Day => [ayt[k][0], ayt[k][1]])

const topicDays = (subject: string, labels: string[]): Day[] => labels.map((l): Day => [subject, l])

export const starterTemplates: StarterTemplate[] = [
  // LGS
  {
    id: 'lgs-temel',
    name: 'LGS temel hafta',
    description: 'Her gün iki ders, hafta sonu deneme ve tekrar',
    group: 'LGS',
    track: 'lgs',
    items: program([
      [
        Q(0, 'lgs-mat', 'Matematik soru çözümü', 30),
        P(0, 'lgs-tr', 'Paragraf okuma', 30),
        Q(1, 'lgs-fen', 'Fen Bilimleri soru çözümü', 30),
        Q(1, 'lgs-ing', 'İngilizce kelime ve soru', 20),
        Q(2, 'lgs-mat', 'Matematik soru çözümü', 30),
        Q(2, 'lgs-tr', 'Türkçe soru çözümü', 30),
        Q(3, 'lgs-fen', 'Fen Bilimleri soru çözümü', 30),
        Q(3, 'lgs-ink', 'İnkılap Tarihi soru çözümü', 20),
        Q(4, 'lgs-mat', 'Matematik soru çözümü', 30),
        Q(4, 'lgs-din', 'Din Kültürü soru çözümü', 20),
        lgsDeneme,
        analiz(6, 60),
      ],
    ]),
  },
  {
    id: 'lgs-yogun',
    name: 'LGS yoğun hafta',
    description: 'Daha fazla soru, haftada iki deneme',
    group: 'LGS',
    track: 'lgs',
    items: program([
      [
        Q(0, 'lgs-mat', 'Matematik yeni nesil sorular', 40),
        Q(0, 'lgs-tr', 'Türkçe soru çözümü', 40),
        Q(1, 'lgs-fen', 'Fen Bilimleri yeni nesil sorular', 40),
        Q(1, 'lgs-ing', 'İngilizce soru çözümü', 30),
        E(2, 'LGS deneme sınavı', 155),
        R(2, null, 'Deneme yanlışlarının tekrarı', 45),
        Q(3, 'lgs-mat', 'Matematik yeni nesil sorular', 40),
        Q(3, 'lgs-ink', 'İnkılap Tarihi soru çözümü', 30),
        Q(4, 'lgs-tr', 'Türkçe soru çözümü', 40),
        Q(4, 'lgs-din', 'Din Kültürü soru çözümü', 30),
        lgsDeneme,
        R(6, null, 'Haftanın yanlışlarının tekrarı', 90),
      ],
    ]),
  },
  {
    id: 'lgs-hafif',
    name: 'LGS hafif hafta',
    description: 'Tatil ya da yorgun dönem için kısa günlük görevler',
    group: 'LGS',
    track: 'lgs',
    items: program([
      [
        Q(0, 'lgs-mat', 'Matematik soru çözümü', 15),
        P(1, 'lgs-tr', 'Paragraf okuma', 20),
        Q(1, 'lgs-fen', 'Fen Bilimleri soru çözümü', 15),
        Q(2, 'lgs-ing', 'İngilizce kelime ve soru', 15),
        Q(3, 'lgs-tr', 'Türkçe soru çözümü', 15),
        R(4, null, 'Haftanın zor konusunun tekrarı', 40),
        R(6, null, 'Haftalık kısa tekrar', 45),
      ],
    ]),
  },
  {
    id: 'lgs-sene-basi',
    name: 'LGS sene başı, geçen yıl tekrarı',
    description: '3 hafta, 7. sınıf konularının tekrarı ve haftalık tarama testi',
    group: 'LGS',
    track: 'lgs',
    items: program([
      daily(lgsRevision('mat', 'fen', 'tr', 'ing', 'mat'), E(5, 'Haftalık tarama testi', 60), R(6, null, 'Tarama testindeki yanlışların tekrarı', 45), 20, 40),
      daily(lgsRevision('fen', 'mat', 'tr', 'ing', 'fen'), E(5, 'Haftalık tarama testi', 60), R(6, null, 'Tarama testindeki yanlışların tekrarı', 45), 20, 40),
      daily(lgsRevision('mat', 'tr', 'fen', 'mat', 'ing'), E(5, 'Karma tarama testi', 90), R(6, null, 'Tarama testindeki yanlışların tekrarı', 60), 20, 40),
    ]),
  },
  {
    id: 'lgs-4-hafta',
    name: 'LGS 4 haftalık konu ve soru programı',
    description: 'Her hafta beş gün konu ve soru, cumartesi deneme, pazar analiz',
    group: 'LGS',
    track: 'lgs',
    items: program([
      daily(lgsMain('mat', 'tr', 'fen', 'ing', 'mat'), lgsDeneme, analiz()),
      daily(lgsMain('fen', 'mat', 'tr', 'ink', 'fen'), lgsDeneme, analiz()),
      daily(lgsMain('mat', 'tr', 'fen', 'din', 'ink'), lgsDeneme, analiz()),
      daily(lgsMain('mat', 'fen', 'tr', 'ing', 'mat'), lgsDeneme, analiz(6, 90), 30, 30),
    ]),
  },
  {
    id: 'lgs-3-hafta-deneme',
    name: 'LGS 3 haftalık deneme programı',
    description: 'Haftada iki deneme, aralarda yanlış analizi ve eksik kapatma',
    group: 'LGS',
    track: 'lgs',
    items: program(
      [0, 1, 2].map((): Row[] => [
        Q(0, 'lgs-mat', 'Matematik yeni nesil sorular', 30),
        Q(0, 'lgs-tr', 'Türkçe paragraf soruları', 30),
        E(1, 'LGS deneme sınavı', 155),
        R(2, null, 'Deneme yanlışlarının tekrarı', 90),
        Q(3, 'lgs-fen', 'Fen Bilimleri eksik konu soruları', 30),
        Q(3, 'lgs-ink', 'İnkılap Tarihi eksik konu soruları', 20),
        Q(4, 'lgs-mat', 'Matematik eksik konu soruları', 30),
        lgsDeneme,
        analiz(6, 90),
      ]),
    ),
  },
  {
    id: 'lgs-ders-mat',
    name: 'LGS Matematik haftası',
    description: 'Bir hafta boyunca ağırlıklı Matematik',
    group: 'LGS',
    track: 'lgs',
    items: program([
      daily(
        topicDays('lgs-mat', ['Üslü ifadeler', 'Kareköklü ifadeler', 'Cebirsel ifadeler', 'Doğrusal denklemler', 'Olasılık']),
        Q(5, 'lgs-mat', 'Matematik karma yeni nesil sorular', 40),
        R(6, 'lgs-mat', 'Haftanın yanlış sorularının tekrarı', 60),
        20,
        50,
      ),
    ]),
  },
  {
    id: 'lgs-ders-fen',
    name: 'LGS Fen Bilimleri haftası',
    description: 'Bir hafta boyunca ağırlıklı Fen Bilimleri',
    group: 'LGS',
    track: 'lgs',
    items: program([
      daily(
        topicDays('lgs-fen', ['DNA ve genetik kod', 'Mevsimler ve iklim', 'Basınç', 'Madde ve endüstri', 'Enerji dönüşümleri']),
        Q(5, 'lgs-fen', 'Fen Bilimleri karma yeni nesil sorular', 30),
        R(6, 'lgs-fen', 'Haftanın yanlış sorularının tekrarı', 60),
        20,
        45,
      ),
    ]),
  },
  {
    id: 'lgs-ders-tr',
    name: 'LGS Türkçe haftası',
    description: 'Bir hafta boyunca ağırlıklı Türkçe',
    group: 'LGS',
    track: 'lgs',
    items: program([
      daily(
        topicDays('lgs-tr', ['Fiilimsiler', 'Cümlenin ögeleri', 'Cümle türleri', 'Anlatım bozuklukları', 'Paragraf']),
        Q(5, 'lgs-tr', 'Türkçe karma soru çözümü', 40),
        R(6, 'lgs-tr', 'Haftanın yanlış sorularının tekrarı', 60),
        25,
        40,
      ),
    ]),
  },
  {
    id: 'lgs-paragraf',
    name: 'LGS paragraf ve yeni nesil soru programı',
    description: '2 hafta, her gün paragraf ve bağlam temelli soru',
    group: 'LGS',
    track: 'lgs',
    items: program(
      [0, 1].map((): Row[] => [
        P(0, 'lgs-tr', 'Paragraf okuma', 20),
        Q(0, 'lgs-tr', 'Paragraf soruları', 25),
        Q(1, 'lgs-mat', 'Yeni nesil matematik soruları', 20),
        Q(1, 'lgs-tr', 'Paragraf soruları', 25),
        Q(2, 'lgs-fen', 'Yeni nesil fen soruları', 20),
        Q(2, 'lgs-tr', 'Paragraf soruları', 25),
        Q(3, 'lgs-ink', 'Bağlam temelli sosyal soruları', 20),
        Q(3, 'lgs-tr', 'Paragraf soruları', 25),
        Q(4, 'lgs-mat', 'Yeni nesil matematik soruları', 20),
        Q(4, 'lgs-tr', 'Paragraf soruları', 25),
        E(5, 'Türkçe deneme (20 soru)', 40),
        R(6, 'lgs-tr', 'Paragraf yanlışlarının tekrarı', 45),
      ]),
    ),
  },

  // TYT
  {
    id: 'tyt-temel',
    name: 'TYT temel tekrar',
    description: 'Türkçe ve matematik ağırlıklı, fen ve sosyal dönüşümlü',
    group: 'TYT',
    track: 'yks',
    items: program([
      [
        Q(0, 'tyt-mat', 'Temel Matematik soru çözümü', 40),
        Q(0, 'tyt-tr', 'Paragraf soruları', 30),
        Q(1, 'tyt-fiz', 'Fizik soru çözümü', 25),
        Q(1, 'tyt-tar', 'Tarih soru çözümü', 20),
        Q(2, 'tyt-mat', 'Temel Matematik soru çözümü', 40),
        Q(2, 'tyt-tr', 'Dil bilgisi soruları', 30),
        Q(3, 'tyt-kim', 'Kimya soru çözümü', 25),
        Q(3, 'tyt-cog', 'Coğrafya soru çözümü', 20),
        Q(4, 'tyt-mat', 'Problem soruları', 40),
        Q(4, 'tyt-bio', 'Biyoloji soru çözümü', 25),
        tytDeneme,
        analiz(6, 90),
      ],
    ]),
  },
  {
    id: 'tyt-sene-basi',
    name: 'TYT sene başı, geçen yıl tekrarı',
    description: '4 hafta, ders ders tekrar ve haftalık TYT denemesi',
    group: 'TYT',
    track: 'yks',
    items: program([
      daily(tytDays('mat', 'tr', 'fiz', 'tar', 'mat'), tytDeneme, analiz(6, 90), 25, 40),
      daily(tytDays('tr', 'mat', 'kim', 'cog', 'mat'), tytDeneme, analiz(6, 90), 25, 40),
      daily(tytDays('mat', 'tr', 'bio', 'fel', 'tar'), tytDeneme, analiz(6, 90), 25, 40),
      daily(tytDays('mat', 'tr', 'fiz', 'kim', 'bio'), tytDeneme, analiz(6, 90), 25, 40),
    ]),
  },
  {
    id: 'tyt-3-hafta-hizli',
    name: 'TYT 3 haftalık hızlı tekrar',
    description: 'Soru ağırlıklı, her hafta bir deneme',
    group: 'TYT',
    track: 'yks',
    items: program(
      [
        tytDays('mat', 'tr', 'fiz', 'tar', 'mat'),
        tytDays('tr', 'mat', 'kim', 'cog', 'mat'),
        tytDays('mat', 'tr', 'bio', 'fel', 'din'),
      ].map((days): Row[] => [
        ...days.flatMap(([s, label], d): Row[] => [Q(d, s, `${label} · Soru çözümü`, 40), ...(d % 2 === 0 ? [R(d, s, `${label} · Eksik konu tekrarı`, 30)] : [])]),
        tytDeneme,
        analiz(6, 90),
      ]),
    ),
  },
  {
    id: 'tyt-deneme-yogun',
    name: 'TYT deneme ağırlıklı hafta',
    description: 'Haftada üç deneme, aralarda analiz',
    group: 'TYT',
    track: 'yks',
    items: program([
      [
        Q(0, 'tyt-mat', 'Temel Matematik soru çözümü', 30),
        E(1, 'TYT deneme sınavı', 165),
        R(2, null, 'Denemedeki yanlışların tekrarı', 90),
        Q(3, 'tyt-tr', 'Paragraf soruları', 30),
        E(4, 'TYT deneme sınavı', 165),
        tytDeneme,
        analiz(6, 120),
      ],
    ]),
  },
  {
    id: 'tyt-ders-mat',
    name: 'TYT Matematik haftası',
    description: 'Bir hafta boyunca ağırlıklı Temel Matematik',
    group: 'TYT',
    track: 'yks',
    items: program([
      daily(
        topicDays('tyt-mat', ['Temel kavramlar ve sayılar', 'Üslü ve köklü sayılar', 'Denklemler ve eşitsizlikler', 'Problemler', 'Geometri']),
        Q(5, 'tyt-mat', 'Temel Matematik karma soru çözümü', 40),
        R(6, 'tyt-mat', 'Haftanın yanlış sorularının tekrarı', 60),
        30,
        45,
      ),
    ]),
  },
  {
    id: 'tyt-ders-tr',
    name: 'TYT Türkçe haftası',
    description: 'Bir hafta boyunca ağırlıklı Türkçe',
    group: 'TYT',
    track: 'yks',
    items: program([
      daily(
        topicDays('tyt-tr', ['Sözcükte anlam', 'Cümlede anlam', 'Paragraf', 'Dil bilgisi', 'Yazım ve noktalama']),
        Q(5, 'tyt-tr', 'Türkçe karma soru çözümü', 40),
        R(6, 'tyt-tr', 'Haftanın yanlış sorularının tekrarı', 60),
        30,
        40,
      ),
    ]),
  },
  {
    id: 'tyt-ders-fen',
    name: 'TYT Fen haftası',
    description: 'Fizik, Kimya ve Biyoloji dönüşümlü',
    group: 'TYT',
    track: 'yks',
    items: program([
      daily(
        tytDays('fiz', 'kim', 'bio', 'fiz', 'kim'),
        Q(5, 'tyt-bio', 'Fen karma soru çözümü', 30),
        R(6, null, 'Haftanın yanlış sorularının tekrarı', 60),
        20,
        45,
      ),
    ]),
  },
  {
    id: 'tyt-ders-sosyal',
    name: 'TYT Sosyal haftası',
    description: 'Tarih, Coğrafya, Felsefe ve Din Kültürü dönüşümlü',
    group: 'TYT',
    track: 'yks',
    items: program([
      daily(
        tytDays('tar', 'cog', 'fel', 'din', 'tar'),
        Q(5, 'tyt-cog', 'Sosyal karma soru çözümü', 30),
        R(6, null, 'Haftanın yanlış sorularının tekrarı', 60),
        20,
        40,
      ),
    ]),
  },

  // AYT
  {
    id: 'ayt-sayisal',
    name: 'AYT sayısal hafta',
    description: 'AYT matematik ve fen, TYT tekrarını bırakmadan',
    group: 'AYT',
    track: 'yks',
    items: program([
      [
        Q(0, 'ayt-mat', 'AYT Matematik soru çözümü', 40),
        Q(0, 'tyt-tr', 'Paragraf soruları', 20),
        Q(1, 'ayt-fiz', 'AYT Fizik soru çözümü', 30),
        Q(1, 'tyt-mat', 'Temel Matematik tekrar', 30),
        Q(2, 'ayt-kim', 'AYT Kimya soru çözümü', 30),
        Q(2, 'ayt-mat', 'AYT Matematik soru çözümü', 40),
        Q(3, 'ayt-bio', 'AYT Biyoloji soru çözümü', 30),
        Q(3, 'tyt-tr', 'Türkçe soru çözümü', 30),
        Q(4, 'ayt-mat', 'AYT Matematik soru çözümü', 40),
        Q(4, 'ayt-fiz', 'AYT Fizik soru çözümü', 30),
        aytDeneme,
        E(6, 'TYT deneme sınavı', 165),
      ],
    ]),
  },
  {
    id: 'ayt-sayisal-4',
    name: 'AYT sayısal 4 haftalık program',
    description: 'Her hafta konu ve soru, cumartesi AYT, pazar analiz',
    group: 'AYT',
    track: 'yks',
    items: program([
      daily(aytDays('mat', 'fiz', 'kim', 'bio', 'mat'), aytDeneme, analiz(6, 90), 30, 45),
      daily(aytDays('mat', 'kim', 'fiz', 'bio', 'mat'), aytDeneme, analiz(6, 90), 30, 45),
      daily(aytDays('fiz', 'mat', 'bio', 'kim', 'mat'), aytDeneme, analiz(6, 90), 30, 45),
      daily(aytDays('mat', 'fiz', 'kim', 'bio', 'mat'), aytDeneme, analiz(6, 90), 30, 45),
    ]),
  },
  {
    id: 'ayt-ea',
    name: 'AYT eşit ağırlık hafta',
    description: 'Matematik, edebiyat, tarih ve coğrafya',
    group: 'AYT',
    track: 'yks',
    items: program([
      daily(aytDays('mat', 'edb', 'tar1', 'cog1', 'mat'), aytDeneme, analiz(6, 90), 30, 45),
    ]),
  },
  {
    id: 'ayt-sozel',
    name: 'AYT sözel hafta',
    description: 'Edebiyat, tarih, coğrafya, felsefe ve din',
    group: 'AYT',
    track: 'yks',
    items: program([
      daily(aytDays('edb', 'tar1', 'cog1', 'fel', 'din'), aytDeneme, analiz(6, 90), 30, 45),
    ]),
  },

  // YKS (TYT + AYT, alandan bağımsız)
  {
    id: 'yks-son-4',
    name: 'YKS son 4 hafta, deneme ve tekrar',
    description: 'TYT ve AYT denemeleri, eksik konu kapatma',
    group: 'YKS',
    track: 'yks',
    items: program(
      [0, 1, 2, 3].map((): Row[] => [
        Q(0, 'tyt-mat', 'Temel Matematik soru çözümü', 40),
        Q(0, 'tyt-tr', 'Türkçe soru çözümü', 30),
        Q(1, null, 'AYT alan dersleri soru çözümü', 60),
        E(2, 'TYT deneme sınavı', 165),
        R(3, null, 'TYT yanlışlarının tekrarı', 75),
        Q(4, null, 'Eksik konulardan soru çözümü', 60),
        aytDeneme,
        R(6, null, 'AYT yanlışlarının tekrarı', 90),
      ]),
    ),
  },
  {
    id: 'yks-hafif',
    name: 'YKS hafif hafta',
    description: 'Tatil ya da yorgun dönem için kısa günlük görevler',
    group: 'YKS',
    track: 'yks',
    items: program([
      [
        Q(0, 'tyt-mat', 'Temel Matematik soru çözümü', 20),
        Q(1, 'tyt-tr', 'Paragraf soruları', 20),
        Q(2, null, 'Alan dersi soru çözümü', 25),
        Q(3, 'tyt-tr', 'Türkçe soru çözümü', 20),
        R(4, null, 'Haftanın zor konusunun tekrarı', 45),
        R(6, null, 'Haftalık kısa tekrar', 45),
      ],
    ]),
  },

  // YDT
  {
    id: 'ydt-hafta',
    name: 'YDT yabancı dil haftası',
    description: 'Kelime, gramer, okuma ve hafta sonu deneme',
    group: 'YDT',
    track: 'yks',
    items: program([
      [
        S(0, 'ydt-dil', 'Kelime çalışması', 30),
        Q(0, 'ydt-dil', 'Gramer soruları', 25),
        P(1, 'ydt-dil', 'Okuma parçaları', 40),
        Q(1, 'ydt-dil', 'Cloze test soruları', 15),
        S(2, 'ydt-dil', 'Gramer konu çalışması', 40),
        Q(2, 'ydt-dil', 'Gramer soruları', 25),
        Q(3, 'ydt-dil', 'Paragraf soruları', 20),
        S(3, 'ydt-dil', 'Kelime çalışması', 30),
        Q(4, 'ydt-dil', 'Cümle tamamlama ve çeviri soruları', 25),
        E(5, 'YDT deneme sınavı', 120),
        analiz(6, 75),
      ],
    ]),
  },
  {
    id: 'ydt-4-hafta',
    name: 'YDT 4 haftalık dil programı',
    description: 'Gramer, kelime, okuma ve deneme haftaları',
    group: 'YDT',
    track: 'yks',
    items: program([
      daily(topicDays('ydt-dil', ['Zamanlar', 'Cümle yapıları', 'Bağlaçlar', 'Edat ve kalıplar', 'Gramer karma']), E(5, 'Gramer testi', 45), R(6, 'ydt-dil', 'Gramer yanlışlarının tekrarı', 45), 30, 40),
      daily(topicDays('ydt-dil', ['Kelime listesi 1', 'Kelime listesi 2', 'Eş anlamlı sözcükler', 'Cümle içinde kelime', 'Kelime karma']), E(5, 'Kelime testi', 45), R(6, 'ydt-dil', 'Kelime yanlışlarının tekrarı', 45), 30, 30),
      daily(topicDays('ydt-dil', ['Okuma parçaları 1', 'Okuma parçaları 2', 'Paragraf tamamlama', 'Çeviri soruları', 'Okuma karma']), E(5, 'Okuma testi', 60), R(6, 'ydt-dil', 'Okuma yanlışlarının tekrarı', 45), 15, 40),
      [
        Q(0, 'ydt-dil', 'Gramer ve kelime soruları', 40),
        Q(1, 'ydt-dil', 'Okuma soruları', 30),
        E(2, 'YDT deneme sınavı', 120),
        R(3, 'ydt-dil', 'Deneme yanlışlarının tekrarı', 75),
        Q(4, 'ydt-dil', 'Eksik konu soruları', 40),
        E(5, 'YDT deneme sınavı', 120),
        analiz(6, 90),
      ],
    ]),
  },

  // Genel
  {
    id: 'deneme-analizi',
    name: 'Deneme analizi haftası',
    description: 'Yanlışları listeleme, eksik konuyu kapatma ve yeni deneme',
    group: 'Genel',
    track: null,
    items: program([
      [
        R(0, null, 'Denemedeki yanlışların listelenmesi', 60),
        S(1, null, 'Eksik konuların tekrarı', 60),
        Q(2, null, 'Yanlış konulardan soru çözümü', 40),
        R(3, null, 'Zor soruların yeniden çözümü', 45),
        Q(4, null, 'Eksik konu testi', 30),
        E(5, 'Yeni deneme sınavı', 150),
        E(6, 'Deneme sonuçlarını girme ve karşılaştırma', 20),
      ],
    ]),
  },
]

export function templateWeeks(items: { week: number }[]) {
  return items.length ? Math.max(...items.map((i) => i.week)) + 1 : 1
}
