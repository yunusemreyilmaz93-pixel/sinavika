import { Plus } from 'lucide-react'
import { Accordion } from 'radix-ui'
import type { ReactNode } from 'react'
import { Link } from 'react-router'
import { StudentCapacity } from './live-settings'
import { container, Reveal, SectionHeading } from './primitives'

const faqs: { id: string; q: ReactNode; a: ReactNode }[] = [
  {
    id: 'ucret',
    q: 'Sınavika ücretli mi?',
    a: 'Hayır. Öğretmen, öğrenci ve veli için tamamen ücretsiz. Reklam da yok. Sınavika gönüllü bir proje olarak yürütülüyor.',
  },
  {
    id: 'sinir',
    q: (
      <>
        Neden en fazla <StudentCapacity /> öğrenci?
      </>
    ),
    a: (
      <>
        Sunucu kapasitemiz sınırlı ve onu öğretmenler arasında adil paylaşmak istiyoruz. Bu yüzden her öğretmen aynı anda en
        fazla <StudentCapacity /> aktif öğrenciyle çalışır. Arşivlenen öğrenciler bu sayıya girmez, henüz kullanılmamış davet
        kodları girer.
      </>
    ),
  },
  {
    id: 'eposta',
    q: 'Öğrencinin e-postası olmasa da olur mu?',
    a: 'Olur. Öğrenci ve veliler davet koduyla katılırken bir kullanıcı adı ve şifre belirler, girişi bununla yapar. E-posta sadece öğretmen hesapları için gerekir.',
  },
  {
    id: 'veri',
    q: 'Veriler kimde, kim görebilir?',
    a: (
      <>
        Bir öğrencinin kayıtlarını sadece kendisi, öğretmeni ve bağlı velisi görür. Öğretmenin özel notları öğrenciye ve veliye
        görünmez. Veriler satılmaz, reklam için kullanılmaz. Ayrıntılar{' '}
        <Link to="/kvkk" className="font-semibold text-accent underline-offset-4 hover:underline">
          KVKK aydınlatma metninde
        </Link>
        .
      </>
    ),
  },
  {
    id: 'puan',
    q: 'Neden puan tahmini yok?',
    a: "LGS ve YKS puanı, o yıl sınava girenlerin sonuçlarına göre hesaplanır. Resmi hesaplama sınavdan sonra belli olur. Tahmini bir puan yanıltabilir, bu yüzden doğru ve yanlışlarından hesaplanan neti gösteriyoruz.",
  },
  {
    id: 'sifre',
    q: 'Şifremi unutursam ne olur?',
    a: 'Öğretmenine haber vermen yeterli. Öğretmen, öğrencisinin ve bağlı velilerin şifresini kendi panelinden sıfırlar. Yeni şifrenle hemen giriş yapabilirsin.',
  },
  {
    id: 'uygulama',
    q: 'Telefona uygulama gibi eklenebilir mi?',
    a: "Evet. Sınavika'yı telefonunun tarayıcısında aç, paylaş ya da menü düğmesinden Ana Ekrana Ekle'yi seç. Uygulama mağazasından bir şey indirmen gerekmez.",
  },
]

export function FaqSection() {
  return (
    <section id="sss" className="scroll-mt-16 py-20 sm:py-28">
      <div className={`${container} grid gap-10 lg:grid-cols-[0.8fr_1.2fr] lg:gap-16`}>
        <SectionHeading
          eyebrow="SSS"
          title="Sık sorulan sorular"
          lead="Ücret, veriler ve hesaplarla ilgili kısa cevaplar."
          className="lg:sticky lg:top-24 lg:self-start"
        />
        <Reveal>
          <Accordion.Root type="single" collapsible className="divide-y divide-line rounded-2xl border border-line bg-surface shadow-card">
            {faqs.map((f) => (
              <Accordion.Item key={f.id} value={f.id}>
                <Accordion.Header>
                  <Accordion.Trigger className="group flex min-h-15 w-full items-center justify-between gap-4 px-4 py-4 text-left text-base font-bold sm:px-6 sm:text-[17px]">
                    <span>{f.q}</span>
                    <span className="grid size-8 shrink-0 place-items-center rounded-full bg-surface-2 text-muted transition-[transform,background-color,color] duration-200 group-hover:text-fg group-data-[state=open]:rotate-45 group-data-[state=open]:bg-primary-soft group-data-[state=open]:text-primary-soft-fg">
                      <Plus className="size-4" />
                    </span>
                  </Accordion.Trigger>
                </Accordion.Header>
                <Accordion.Content className="overflow-hidden data-[state=closed]:animate-[landing-accordion-up_200ms_ease-in] data-[state=open]:animate-[landing-accordion-down_260ms_cubic-bezier(0.22,1,0.36,1)]">
                  <p className="px-4 pb-5 text-[15px] leading-relaxed text-muted sm:px-6 sm:text-base">{f.a}</p>
                </Accordion.Content>
              </Accordion.Item>
            ))}
          </Accordion.Root>
        </Reveal>
      </div>
    </section>
  )
}
