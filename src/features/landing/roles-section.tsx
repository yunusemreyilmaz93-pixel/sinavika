import {
  CalendarCheck,
  CalendarRange,
  ChartLine,
  Eye,
  ListChecks,
  Map as MapIcon,
  MessagesSquare,
  NotebookPen,
  PencilLine,
  Timer,
  TrendingUp,
  TriangleAlert,
  Users,
  UsersRound,
  type LucideIcon,
} from 'lucide-react'
import { AnimatePresence, motion } from 'motion/react'
import type { ReactNode } from 'react'
import { Segmented } from '@/components/ui/segmented'
import { StudentCapacity } from './live-settings'
import { container, ease, Reveal, SectionHeading, type Role } from './primitives'
import { ParentPreview, StudentPreview, TeacherPreview } from './role-previews'

type Feature = { icon: LucideIcon; title: ReactNode; text: string }

const roles: Record<Role, { label: string; title: string; lead: string; features: Feature[]; preview: () => ReactNode }> = {
  teacher: {
    label: 'Öğretmen',
    title: 'Öğretmen planı kurar',
    lead: 'Öğrencilerinin haftasını planla, kimin nerede zorlandığını erken gör.',
    preview: () => <TeacherPreview />,
    features: [
      {
        icon: UsersRound,
        title: (
          <>
            <StudentCapacity /> öğrenci tek ekranda
          </>
        ),
        text: 'Bu haftaki çalışma süresi, çözülen soru, görevler ve son deneme neti yan yana.',
      },
      {
        icon: TriangleAlert,
        title: 'Risk sinyalleri',
        text: 'Birkaç gündür kayıt girmeyen, görevleri geciken ya da neti düşen öğrenci öne çıkar.',
      },
      {
        icon: CalendarRange,
        title: 'Sürükle bırak haftalık program',
        text: 'Görevleri günler arasında taşı. Sık kullandığın görevleri şablona kaydet, tek seferde haftaya ekle.',
      },
      {
        icon: ChartLine,
        title: 'Deneme analizi',
        text: 'Ders ders net değişimini gör, hangi derste geri kalındığını erkenden fark et.',
      },
      {
        icon: NotebookPen,
        title: 'Notlar ve görüşme kayıtları',
        text: 'Özel notlarını sadece sen görürsün. İstediğin notu öğrenciyle ya da veliyle paylaşırsın.',
      },
    ],
  },
  student: {
    label: 'Öğrenci',
    title: 'Öğrenci çalışır ve kaydeder',
    lead: 'Ne çalışacağını düşünmekle vakit kaybetme. Planın hazır, sen kaydını gir.',
    preview: () => <StudentPreview />,
    features: [
      {
        icon: ListChecks,
        title: 'Bugün ne çalışacağını bil',
        text: 'Öğretmeninin verdiği görevler gün gün önünde. Bitirdiğini tikle.',
      },
      {
        icon: Timer,
        title: 'Odak sayacı',
        text: 'Sayacı başlat, çalıştığın süre ders ve konusuyla birlikte kaydedilsin.',
      },
      {
        icon: PencilLine,
        title: '3 dokunuşla soru kaydı',
        text: 'Dersi seç, doğru ve yanlış sayını gir. Netin anında hesaplanır.',
      },
      {
        icon: TrendingUp,
        title: 'Deneme netleri',
        text: 'Her denemeyi ders ders gir, netinin nasıl değiştiğini grafikte gör.',
      },
      {
        icon: MapIcon,
        title: 'Konu haritası',
        text: 'Hangi konuyu bitirdin, hangisi tekrar istiyor, tek bakışta gör.',
      },
    ],
  },
  parent: {
    label: 'Veli',
    title: 'Veli takip eder',
    lead: 'Çocuğunun nasıl çalıştığını sormadan gör. Gerekince öğretmenle doğrudan konuş.',
    preview: () => <ParentPreview />,
    features: [
      {
        icon: CalendarCheck,
        title: 'Haftalık çalışma özeti',
        text: 'Bu hafta kaç saat çalışıldığını ve kaç soru çözüldüğünü gün gün gör.',
      },
      {
        icon: ChartLine,
        title: 'Deneme trendi',
        text: 'Deneme netlerinin seyrini ve hangi derste ilerleme olduğunu takip et.',
      },
      {
        icon: MessagesSquare,
        title: 'Öğretmenle mesajlaşma',
        text: 'Velilere ayrılmış bir kanaldan öğretmene doğrudan yaz.',
      },
      {
        icon: Users,
        title: 'Birden fazla çocuk',
        text: 'İki çocuğun da hazırlanıyorsa ikisini aynı hesaptan takip et.',
      },
      {
        icon: Eye,
        title: 'Sadece görüntüleme',
        text: 'Veli hesabı kayıtları değiştiremez. Plan öğretmende, kayıtlar öğrencide kalır.',
      },
    ],
  },
}

const options = (Object.keys(roles) as Role[]).map((value) => ({ value, label: roles[value].label }))

export function RolesSection({ role, onRoleChange }: { role: Role; onRoleChange: (role: Role) => void }) {
  const current = roles[role]
  return (
    <section id="roller" className="relative scroll-mt-16 bg-surface py-20 sm:py-28">
      <span id="ogretmenler" aria-hidden className="absolute top-0 scroll-mt-16" />
      <span id="ogrenciler" aria-hidden className="absolute top-0 scroll-mt-16" />
      <span id="veliler" aria-hidden className="absolute top-0 scroll-mt-16" />
      <div className={container}>
        <SectionHeading
          center
          eyebrow="Roller"
          title="Herkes ihtiyacı kadarını görür"
          lead="Aynı plan, üç ayrı ekran. Bir öğrencinin kayıtlarını sadece öğretmeni ve bağlı velisi görebilir."
        />

        <Reveal className="mx-auto mt-10 max-w-md">
          <Segmented options={options} value={role} onChange={onRoleChange} className="[&_button]:h-11 [&_button]:text-[15px]" />
        </Reveal>

        <AnimatePresence mode="wait" initial={false}>
          <motion.div
            key={role}
            role="tabpanel"
            aria-label={current.label}
            initial={{ opacity: 0, y: 12 }}
            animate={{ opacity: 1, y: 0 }}
            exit={{ opacity: 0, y: -8 }}
            transition={{ duration: 0.24, ease }}
            className="mt-10 grid items-start gap-10 lg:mt-14 lg:grid-cols-[1fr_1.05fr] lg:gap-14"
          >
            <div className="lg:pt-4">
              <h3 className="text-2xl font-extrabold sm:text-[1.75rem]">{current.title}</h3>
              <p className="mt-2 text-[17px] text-muted">{current.lead}</p>
              <ul className="mt-7 space-y-5">
                {current.features.map((f, i) => (
                  <motion.li
                    key={f.text}
                    initial={{ opacity: 0, y: 8 }}
                    animate={{ opacity: 1, y: 0 }}
                    transition={{ duration: 0.25, delay: 0.05 + i * 0.05 }}
                    className="flex gap-3.5"
                  >
                    <span className="grid size-10 shrink-0 place-items-center rounded-xl bg-primary-soft text-primary-soft-fg">
                      <f.icon className="size-5" />
                    </span>
                    <div className="min-w-0 pt-0.5">
                      <p className="font-bold">{f.title}</p>
                      <p className="mt-0.5 text-[15px] leading-relaxed text-muted">{f.text}</p>
                    </div>
                  </motion.li>
                ))}
              </ul>
            </div>
            <div className="grid-paper rounded-3xl border border-line bg-bg p-3 sm:p-6" inert>
              {current.preview()}
            </div>
          </motion.div>
        </AnimatePresence>
      </div>
    </section>
  )
}
