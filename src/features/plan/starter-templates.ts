import type { TemplateItem } from './lib'

export type StarterTemplate = {
  id: string
  name: string
  track: 'lgs' | 'yks'
  description: string
  parsed: TemplateItem[]
}

type Row = [weekday: number, kind: TemplateItem['kind'], subject: string | null, title: string, questions?: number, minutes?: number]

function items(rows: Row[]): TemplateItem[] {
  return rows.map(([weekday, kind, subject_id, title, questions, minutes]) => ({
    weekday,
    kind,
    subject_id,
    topic_id: null,
    title,
    target_questions: questions ?? null,
    target_minutes: minutes ?? null,
    note: null,
  }))
}

export const starterTemplates: StarterTemplate[] = [
  {
    id: 'lgs-temel',
    name: 'LGS temel hafta',
    track: 'lgs',
    description: 'Her gün iki ders, hafta sonu deneme ve tekrar',
    parsed: items([
      [0, 'questions', 'lgs-mat', 'Matematik soru çözümü', 30],
      [0, 'reading', 'lgs-tr', 'Paragraf okuma', undefined, 30],
      [1, 'questions', 'lgs-fen', 'Fen Bilimleri soru çözümü', 30],
      [1, 'questions', 'lgs-ing', 'İngilizce kelime ve soru', 20],
      [2, 'questions', 'lgs-mat', 'Matematik soru çözümü', 30],
      [2, 'questions', 'lgs-tr', 'Türkçe soru çözümü', 30],
      [3, 'questions', 'lgs-fen', 'Fen Bilimleri soru çözümü', 30],
      [3, 'questions', 'lgs-ink', 'İnkılap Tarihi soru çözümü', 20],
      [4, 'questions', 'lgs-mat', 'Matematik soru çözümü', 30],
      [4, 'questions', 'lgs-din', 'Din Kültürü soru çözümü', 20],
      [5, 'other', null, 'LGS deneme sınavı', undefined, 155],
      [6, 'review', null, 'Denemedeki yanlışların tekrarı', undefined, 60],
    ]),
  },
  {
    id: 'lgs-yogun',
    name: 'LGS son 8 hafta',
    track: 'lgs',
    description: 'Daha fazla soru, haftada iki deneme',
    parsed: items([
      [0, 'questions', 'lgs-mat', 'Matematik yeni nesil sorular', 40],
      [0, 'questions', 'lgs-tr', 'Türkçe soru çözümü', 40],
      [1, 'questions', 'lgs-fen', 'Fen Bilimleri yeni nesil sorular', 40],
      [1, 'questions', 'lgs-ing', 'İngilizce soru çözümü', 30],
      [2, 'other', null, 'LGS deneme sınavı', undefined, 155],
      [2, 'review', null, 'Deneme yanlışlarının tekrarı', undefined, 45],
      [3, 'questions', 'lgs-mat', 'Matematik yeni nesil sorular', 40],
      [3, 'questions', 'lgs-ink', 'İnkılap Tarihi soru çözümü', 30],
      [4, 'questions', 'lgs-tr', 'Türkçe soru çözümü', 40],
      [4, 'questions', 'lgs-din', 'Din Kültürü soru çözümü', 30],
      [5, 'other', null, 'LGS deneme sınavı', undefined, 155],
      [6, 'review', null, 'Haftanın yanlışlarının tekrarı', undefined, 90],
    ]),
  },
  {
    id: 'tyt-temel',
    name: 'TYT temel tekrar',
    track: 'yks',
    description: 'Türkçe ve matematik ağırlıklı, fen ve sosyal dönüşümlü',
    parsed: items([
      [0, 'questions', 'tyt-mat', 'Temel Matematik soru çözümü', 40],
      [0, 'questions', 'tyt-tr', 'Paragraf soruları', 30],
      [1, 'questions', 'tyt-fiz', 'Fizik soru çözümü', 25],
      [1, 'questions', 'tyt-tar', 'Tarih soru çözümü', 20],
      [2, 'questions', 'tyt-mat', 'Temel Matematik soru çözümü', 40],
      [2, 'questions', 'tyt-tr', 'Dil bilgisi soruları', 30],
      [3, 'questions', 'tyt-kim', 'Kimya soru çözümü', 25],
      [3, 'questions', 'tyt-cog', 'Coğrafya soru çözümü', 20],
      [4, 'questions', 'tyt-mat', 'Problem soruları', 40],
      [4, 'questions', 'tyt-bio', 'Biyoloji soru çözümü', 25],
      [5, 'other', null, 'TYT deneme sınavı', undefined, 165],
      [6, 'review', null, 'Denemedeki yanlışların tekrarı', undefined, 90],
    ]),
  },
  {
    id: 'ayt-sayisal',
    name: 'AYT sayısal hafta',
    track: 'yks',
    description: 'AYT matematik ve fen, TYT tekrarını bırakmadan',
    parsed: items([
      [0, 'questions', 'ayt-mat', 'AYT Matematik soru çözümü', 40],
      [0, 'questions', 'tyt-tr', 'Paragraf soruları', 20],
      [1, 'questions', 'ayt-fiz', 'AYT Fizik soru çözümü', 30],
      [1, 'questions', 'tyt-mat', 'Temel Matematik tekrar', 30],
      [2, 'questions', 'ayt-kim', 'AYT Kimya soru çözümü', 30],
      [2, 'questions', 'ayt-mat', 'AYT Matematik soru çözümü', 40],
      [3, 'questions', 'ayt-bio', 'AYT Biyoloji soru çözümü', 30],
      [3, 'questions', 'tyt-tr', 'Türkçe soru çözümü', 30],
      [4, 'questions', 'ayt-mat', 'AYT Matematik soru çözümü', 40],
      [4, 'questions', 'ayt-fiz', 'AYT Fizik soru çözümü', 30],
      [5, 'other', null, 'AYT deneme sınavı', undefined, 180],
      [6, 'other', null, 'TYT deneme sınavı', undefined, 165],
    ]),
  },
]
