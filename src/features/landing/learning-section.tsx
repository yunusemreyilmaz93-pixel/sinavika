import { BookOpenText, FlaskConical, ListChecks, Map as MapIcon, RotateCcw, TrendingDown, type LucideIcon } from 'lucide-react'
import { Card } from '@/components/ui/card'
import { cn } from '@/lib/cn'
import { container, Reveal, SectionHeading } from './primitives'

const items: { icon: LucideIcon; title: string; text: string }[] = [
  {
    icon: BookOpenText,
    title: 'Konu anlatımları',
    text: 'Konu konu yazılmış, ipucu ve çözümlü örnekler içeren anlatımlar. Anlatımlar konu konu eklenmeye devam ediyor.',
  },
  {
    icon: ListChecks,
    title: 'Anlatımın sonunda mini test',
    text: 'Anlatımdaki sorular çözülür. İlk cevap çözülen soru kaydına yazılır, yanlışlar tek dokunuşla yanlış defterine gider.',
  },
  {
    icon: FlaskConical,
    title: 'Etkileşimli simülasyonlar',
    text: 'Anlatımlarda gereken yerlerde etkileşimli animasyon ve simülasyonlar bulunur. Öğrenci önce tahmin eder, sonra kaydırıcıyla dener.',
  },
  {
    icon: MapIcon,
    title: 'Konu hakimiyet haritası',
    text: 'Her konu için durum görünür ve önce hangi konulara bakılacağı listelenir. Durum, mini test ve yanlışlardan hesaplanır.',
  },
  {
    icon: RotateCcw,
    title: 'Aralıklı tekrar',
    text: 'Yanlış defterindeki sorular 1, 3, 7, 14 ve 30 gün aralıklarla öğrencinin karşısına yeniden çıkar. Yapamadığı soru başa döner.',
  },
  {
    icon: TrendingDown,
    title: 'Denemede net kaybı',
    text: 'Kaybedilen neti yanlış ve boş olarak ayırır, en çok takılınan konular için görev önerir.',
  },
]

const levels = [
  { label: 'Hakim', color: 'bg-primary', width: 'w-[14%]' },
  { label: 'Pekişiyor', color: 'bg-primary/55', width: 'w-[30%]' },
  { label: 'Öğreniyor', color: 'bg-accent', width: 'w-[22%]' },
  { label: 'Tekrar lazım', color: 'bg-warning', width: 'w-[14%]' },
  { label: 'Başlanmadı', color: 'bg-line-strong', width: 'w-[20%]' },
]

export function LearningSection() {
  return (
    <section id="calisma" className="scroll-mt-16 py-20 sm:py-28">
      <div className={container}>
        <SectionHeading
          center
          eyebrow="Çalışma ve takip"
          title={<>Anlatım, soru ve tekrar <span className="marker">aynı yerde</span></>}
          lead="Öğrenci konuyu okur, soruları çözer. Sonuçlar konunun durumuna ve tekrar planına kendiliğinden yansır, kimsenin elle işlemesi gerekmez."
        />

        <Reveal className="mx-auto mt-10 max-w-2xl">
          <div className="grid-paper rounded-2xl border border-line bg-bg p-4 sm:p-5" aria-label="Örnek hakimiyet haritası" role="img">
            <p className="text-xs font-semibold tracking-wide text-muted uppercase">Örnek görünüm</p>
            <div className="mt-3 flex h-3 overflow-hidden rounded-full bg-surface-2">
              {levels.map((l) => (
                <span key={l.label} className={cn(l.color, l.width)} />
              ))}
            </div>
            <ul className="mt-3 flex flex-wrap gap-x-4 gap-y-1.5 text-sm">
              {levels.map((l) => (
                <li key={l.label} className="flex items-center gap-1.5">
                  <span className={cn('size-2.5 rounded-full', l.color)} aria-hidden />
                  {l.label}
                </li>
              ))}
            </ul>
          </div>
        </Reveal>

        <ul className="mt-10 grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
          {items.map((item, i) => (
            <li key={item.title}>
              <Reveal delay={(i % 3) * 0.06} className="h-full">
                <Card className="h-full p-5 sm:p-6">
                  <span className="grid size-10 place-items-center rounded-xl bg-primary-soft text-primary-soft-fg">
                    <item.icon className="size-5" />
                  </span>
                  <h3 className="mt-4 text-lg font-bold">{item.title}</h3>
                  <p className="mt-1.5 text-[15px] leading-relaxed text-muted">{item.text}</p>
                </Card>
              </Reveal>
            </li>
          ))}
        </ul>
      </div>
    </section>
  )
}
