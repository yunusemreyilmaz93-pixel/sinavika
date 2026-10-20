import type { Lesson } from './types'

const lessons: Lesson[] = [
  {
    subjectId: 'lgs-ink',
    topic: 'Bir Kahraman Doğuyor',
    grade: '8. sınıf T.C. İnkılap Tarihi ve Atatürkçülük, 1. ünite',
    date: '2026-10-20',
    author: 'Yunus Emre Yılmaz',
    readingMinutes: 10,
    teacherNote: [
      {
        label: 'Program',
        text: '2026-2027’de 8. sınıfta uygulanan program, 1. ünite. Dört kazanım: İTA.8.1.1, 8.1.2, 8.1.3 ve 8.1.4. 2027-2028’de Maarif Modeli’ne geçilince bu bilgiler yeni programın “Mustafa Kemal’in Hayatı” ünitesine taşınacak.',
      },
      {
        label: 'Kaynak',
        text: 'Metin özgündür, ders kitabından kopya değildir. Tarih ve isimler genel kabul gören bilgilerdir, ama yayından önce ders kitabıyla tek tek karşılaştırılmalıdır.',
      },
      {
        label: 'Kontrol edilecekler',
        text: 'Tarihlerin doğruluğu, eksik ya da fazla bilgi, dilin 8. sınıfa uygunluğu ve örnek sorunun LGS tarzına uyup uymadığı.',
      },
    ],
    load: () => import('./content/bir-kahraman-doguyor'),
  },
]

const key = (subjectId: string, topic: string) => `${subjectId}:${topic.toLocaleLowerCase('tr').trim()}`
const byKey = new Map(lessons.map((l) => [key(l.subjectId, l.topic), l]))

export function lessonFor(topic: { subject_id: string; name: string }) {
  return byKey.get(key(topic.subject_id, topic.name))
}
