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
    title: 'Öğretmen için',
    lead: 'Öğrencilerinin haftalık programını hazırlarsın, kimin nerede zorlandığını erkenden görürsün.',
    preview: () => <TeacherPreview />,
    features: [
      {
        icon: UsersRound,
        title: (
          <>
            <StudentCapacity /> öğrenci tek ekranda
          </>
        ),
        text: 'Her öğrencinin bu haftaki çalışma süresini, çözdüğü soruyu, görevlerini ve son deneme netini bir arada görürsün.',
      },
      {
        icon: TriangleAlert,
        title: 'Geride kalan öne çıkar',
        text: 'Birkaç gündür kayıt girmeyen, görevini aksatan ya da neti düşen öğrenciyi hemen fark edersin.',
      },
      {
        icon: CalendarRange,
        title: 'Sürükle bırak haftalık program',
        text: 'Görevleri sürükleyip başka bir güne taşırsın. Sık verdiğin görevleri şablon olarak kaydedip haftaya tek seferde eklersin.',
      },
      {
        icon: ChartLine,
        title: 'Deneme analizi',
        text: 'Netlerin ders ders nasıl değiştiğini görür, hangi derste geride kalındığını erkenden anlarsın.',
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
    title: 'Öğrenci için',
    lead: 'Ne çalışacağını düşünmekle vakit kaybetmezsin. Programın hazırdır, sen çalıştığını kaydedersin.',
    preview: () => <StudentPreview />,
    features: [
      {
        icon: ListChecks,
        title: 'Günün görevleri hazır',
        text: 'Öğretmeninin verdiği görevleri gün gün görürsün. Bitirdiğini işaretlersin.',
      },
      {
        icon: Timer,
        title: 'Odak sayacı',
        text: 'Sayacı başlatırsın, çalıştığın süre dersi ve konusuyla birlikte kaydedilir.',
      },
      {
        icon: PencilLine,
        title: 'Üç dokunuşta soru kaydı',
        text: 'Dersi seçip doğru ve yanlış sayını girersin. Netin hemen hesaplanır.',
      },
      {
        icon: TrendingUp,
        title: 'Deneme netleri',
        text: 'Her denemeyi ders ders girersin, netlerinin nasıl değiştiğini grafikte görürsün.',
      },
      {
        icon: MapIcon,
        title: 'Konu haritası',
        text: 'Hangi konuyu bitirdiğini, hangisini tekrar etmen gerektiğini bir bakışta görürsün.',
      },
    ],
  },
  parent: {
    label: 'Veli',
    title: 'Veli için',
    lead: 'Çocuğunun nasıl çalıştığını ona sormadan görürsün. Gerektiğinde öğretmenle doğrudan yazışırsın.',
    preview: () => <ParentPreview />,
    features: [
      {
        icon: CalendarCheck,
        title: 'Haftalık çalışma özeti',
        text: 'Çocuğunun bu hafta kaç saat çalıştığını ve kaç soru çözdüğünü gün gün görürsün.',
      },
      {
        icon: ChartLine,
        title: 'Deneme sonuçları',
        text: 'Deneme netlerinin nasıl gittiğini ve hangi derste ilerlediğini takip edersin.',
      },
      {
        icon: MessagesSquare,
        title: 'Öğretmenle mesajlaşma',
        text: 'Öğretmenle velilere ayrılmış bir mesaj bölümünden doğrudan yazışırsın.',
      },
      {
        icon: Users,
        title: 'Birden fazla çocuk',
        text: 'İki çocuğun birden sınava hazırlanıyorsa ikisini de aynı hesaptan takip edersin.',
      },
      {
        icon: Eye,
        title: 'Yalnızca izleme',
        text: 'Veli hesabıyla kayıtlar değiştirilemez. Programı öğretmen hazırlar, kayıtları öğrenci girer.',
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
          title="Herkes kendi ekranını kullanır"
          lead="Öğretmen, öğrenci ve veli aynı programı kendi ekranından görür. Bir öğrencinin kayıtlarını sadece kendisi, öğretmeni ve velisi görebilir."
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
