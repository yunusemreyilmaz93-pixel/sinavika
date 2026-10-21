import type { Lesson } from './types'

const lessons: Lesson[] = [
  {
    subjectId: 'lgs-ink',
    topic: 'Bir Kahraman Doğuyor',
    grade: '8. sınıf T.C. İnkılap Tarihi ve Atatürkçülük, 1. ünite',
    date: '2026-10-20',
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
  {
    subjectId: 'lgs-tr',
    topic: 'Fiilimsiler',
    grade: '8. sınıf Türkçe, Fiilimsiler',
    date: '2026-10-21',
    readingMinutes: 10,
    teacherNote: [
      {
        label: 'Program',
        text: 'Kazanım T.8.3.9: “Fiilimsilerin cümledeki işlevlerini kavrar.” Programdaki açıklamaya göre fiilimsi türleri fark ettirilir, ekler ezberletilmez. Bu yüzden metin ekleri örnek olarak verir ve cümledeki göreve odaklanır. Kazanım kodunu ve açıklamayı MEB programından doğrulayın.',
      },
      {
        label: 'Kaynak',
        text: 'Metin özgündür, ders kitabından kopya değildir. Örnek cümleler bu metin için yazıldı. Yayından önce ders kitabıyla karşılaştırılmalıdır.',
      },
      {
        label: 'Kontrol edilecekler',
        text: 'Zarf-fiil örneklerinin 8. sınıf kapsamına uygunluğu (özellikle “gelir gelmez”), zarf-fiillerin “Nasıl?” ve “Ne zaman?” diye gruplanması, dilin 8. sınıfa uygunluğu ve örnek soruların LGS tarzına uyup uymadığı.',
      },
    ],
    load: () => import('./content/fiilimsiler'),
  },
]

const key = (subjectId: string, topic: string) => `${subjectId}:${topic.toLocaleLowerCase('tr').trim()}`
const byKey = new Map(lessons.map((l) => [key(l.subjectId, l.topic), l]))

export function lessonFor(topic: { subject_id: string; name: string }) {
  return byKey.get(key(topic.subject_id, topic.name))
}
