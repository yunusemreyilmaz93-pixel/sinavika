import {
  BellRing,
  BookOpenText,
  CalendarCheck,
  CalendarRange,
  ChartLine,
  Eye,
  FlaskConical,
  ListChecks,
  Map as MapIcon,
  MessagesSquare,
  NotebookPen,
  RotateCcw,
  Sparkles,
  Timer,
  TrendingDown,
  TrendingUp,
  TriangleAlert,
  Users,
  UsersRound,
  type LucideIcon,
} from 'lucide-react'
import { AnimatePresence, motion, useInView, useReducedMotion } from 'motion/react'
import { useEffect, useRef, useState, type ReactNode } from 'react'
import { Segmented } from '@/components/ui/segmented'
import { cn } from '@/lib/cn'
import { StudentCapacity } from './live-settings'
import { container, Reveal, SectionHeading, type Role } from './primitives'
import { ChatParent, Children, ExamResults, ReadOnly, WeekSummary } from './scenes/parent'
import { ExamNets, LessonQuiz, Simulation, TimerAndLog, TodayTasks, TopicMap, WrongReview } from './scenes/student'
import { Assistant, Attention, ChatTeacher, Digest, NetLoss, Notes, Planner, Roster } from './scenes/teacher'

type Feature = { icon: LucideIcon; title: ReactNode; text: string; scene: () => ReactNode }

const INTERVAL = 5200

const roles: Record<Role, { label: string; title: string; lead: string; features: Feature[] }> = {
  teacher: {
    label: 'Öğretmen',
    title: 'Öğretmen için',
    lead: 'Öğrencilerinizin haftalık programını hazırlarsınız, kimin nerede zorlandığını erkenden görürsünüz.',
    features: [
      {
        icon: UsersRound,
        title: (
          <>
            <StudentCapacity /> öğrenci tek ekranda
          </>
        ),
        text: 'Her öğrencinin bu haftaki çalışma süresini, çözdüğü soruyu, görevlerini ve son deneme netini bir arada görürsünüz.',
        scene: () => <Roster />,
      },
      {
        icon: TriangleAlert,
        title: 'Geride kalan öne çıkar',
        text: 'Birkaç gündür kayıt girmeyen, görevini aksatan ya da neti düşen öğrenciyi hemen fark edersiniz.',
        scene: () => <Attention />,
      },
      {
        icon: BellRing,
        title: 'Pazartesi özeti',
        text: 'Bakmanız gereken öğrencilerin özeti her pazartesi bildirim olarak gelir.',
        scene: () => <Digest />,
      },
      {
        icon: CalendarRange,
        title: 'Sürükle bırak haftalık program',
        text: 'Görevleri sürükleyip başka bir güne taşırsınız. Sık verdiğiniz görevleri şablon olarak kaydedip haftaya tek seferde eklersiniz.',
        scene: () => <Planner />,
      },
      {
        icon: ChartLine,
        title: 'Deneme analizi',
        text: 'Denemede kaybedilen netin yanlıştan mı boştan mı geldiğini görürsünüz. En çok takılınan konular için tek dokunuşla görev verirsiniz.',
        scene: () => <NetLoss />,
      },
      {
        icon: NotebookPen,
        title: 'Notlar ve görüşme kayıtları',
        text: 'Özel notlarınızı yalnızca siz görürsünüz. İstediğiniz notu öğrenciyle ya da veliyle paylaşırsınız.',
        scene: () => <Notes />,
      },
      {
        icon: MessagesSquare,
        title: 'Veliyle mesajlaşma',
        text: 'Velilerle ayrı bir mesaj bölümünden yazışırsınız, öğrenci bu yazışmayı görmez.',
        scene: () => <ChatTeacher />,
      },
      {
        icon: Sparkles,
        title: 'İsteğe bağlı yapay zekâ asistanı',
        text: 'Kendi yapay zekâ anahtarınızı eklerseniz öğrencileriniz hakkında soru sorar, görev taslağı istersiniz. Servise adlar yerine takma kimlik gider, siz onaylamadan hiçbir görev eklenmez.',
        scene: () => <Assistant />,
      },
    ],
  },
  student: {
    label: 'Öğrenci',
    title: 'Öğrenci için',
    lead: 'Öğrenci ne çalışacağını düşünmekle vakit kaybetmez. Programı hazırdır, o da çalıştığını kaydeder.',
    features: [
      {
        icon: ListChecks,
        title: 'Günün görevleri hazır',
        text: 'Öğretmenin verdiği görevleri gün gün görür, bitirdiğini işaretler.',
        scene: () => <TodayTasks />,
      },
      {
        icon: Timer,
        title: 'Odak sayacı ve soru kaydı',
        text: 'Sayacı başlatır, çalıştığı süre dersi ve konusuyla kaydedilir. Soruları üç dokunuşta girer, neti hemen hesaplanır.',
        scene: () => <TimerAndLog />,
      },
      {
        icon: BookOpenText,
        title: 'Konu anlatımı ve mini test',
        text: 'Konuyu okur, anlatımın sonundaki soruları çözer. Yanlış yaptığı soruyu tek dokunuşla yanlış defterine ekler.',
        scene: () => <LessonQuiz />,
      },
      {
        icon: FlaskConical,
        title: 'Etkileşimli simülasyonlar',
        text: 'Anlatımlarda gereken yerlerde önce tahmin eder, sonra kaydırıcıyla dener.',
        scene: () => <Simulation />,
      },
      {
        icon: RotateCcw,
        title: 'Yanlış defteri ve tekrar',
        text: 'Yanlış sorular 1, 3, 7, 14 ve 30 gün aralıklarla yeniden karşısına çıkar.',
        scene: () => <WrongReview />,
      },
      {
        icon: TrendingUp,
        title: 'Deneme netleri',
        text: 'Her denemeyi ders ders girer, netlerinin nasıl değiştiğini grafikte görür.',
        scene: () => <ExamNets />,
      },
      {
        icon: MapIcon,
        title: 'Konu haritası',
        text: 'Hangi konuyu bitirdiğini, hangisini tekrar etmesi gerektiğini ve önce nelere bakacağını bir bakışta görür.',
        scene: () => <TopicMap />,
      },
    ],
  },
  parent: {
    label: 'Veli',
    title: 'Veli için',
    lead: 'Çocuğunuzun nasıl çalıştığını ona sormadan görürsünüz. Gerektiğinde öğretmenle doğrudan yazışırsınız.',
    features: [
      {
        icon: CalendarCheck,
        title: 'Haftalık çalışma özeti',
        text: 'Çocuğunuzun bu hafta kaç saat çalıştığını ve kaç soru çözdüğünü gün gün görürsünüz.',
        scene: () => <WeekSummary />,
      },
      {
        icon: TrendingDown,
        title: 'Deneme sonuçları',
        text: 'Deneme netlerinin nasıl gittiğini ve hangi derste ilerlediğini takip edersiniz.',
        scene: () => <ExamResults />,
      },
      {
        icon: MessagesSquare,
        title: 'Öğretmenle mesajlaşma',
        text: 'Öğretmenle, velilere ayrılmış bir mesaj bölümünden doğrudan yazışırsınız.',
        scene: () => <ChatParent />,
      },
      {
        icon: Users,
        title: 'Birden fazla çocuk',
        text: 'İki çocuğunuz birden sınava hazırlanıyorsa ikisini de aynı hesaptan takip edersiniz.',
        scene: () => <Children />,
      },
      {
        icon: Eye,
        title: 'Yalnızca izleme',
        text: 'Veli hesabıyla kayıtlar değiştirilemez. Programı öğretmen hazırlar, kayıtları öğrenci girer.',
        scene: () => <ReadOnly />,
      },
    ],
  },
}

function useDesktop() {
  const [desktop, setDesktop] = useState(() => typeof window !== 'undefined' && window.matchMedia('(min-width: 1024px)').matches)
  useEffect(() => {
    const query = window.matchMedia('(min-width: 1024px)')
    const update = () => setDesktop(query.matches)
    query.addEventListener('change', update)
    return () => query.removeEventListener('change', update)
  }, [])
  return desktop
}

const options = (Object.keys(roles) as Role[]).map((value) => ({ value, label: roles[value].label }))

export function RolesSection({ role, onRoleChange }: { role: Role; onRoleChange: (role: Role) => void }) {
  const current = roles[role]
  const reduce = useReducedMotion()
  const section = useRef<HTMLDivElement>(null)
  const inView = useInView(section, { amount: 0.35 })
  const [active, setActive] = useState(0)
  const [manual, setManual] = useState(false)
  const [hover, setHover] = useState(false)
  const desktop = useDesktop()

  const changeRole = (next: Role) => {
    setActive(0)
    setManual(false)
    onRoleChange(next)
  }

  const autoplay = inView && !reduce && !manual && !hover
  useEffect(() => {
    if (!autoplay) return
    const id = window.setTimeout(() => setActive((i) => (i + 1) % current.features.length), INTERVAL)
    return () => window.clearTimeout(id)
  }, [autoplay, active, current.features.length])

  const feature = current.features[active] ?? current.features[0]

  return (
    <section id="roller" className="relative scroll-mt-16 bg-surface py-20 sm:py-28">
      <span id="ogretmenler" aria-hidden className="absolute top-0 scroll-mt-16" />
      <span id="ogrenciler" aria-hidden className="absolute top-0 scroll-mt-16" />
      <span id="veliler" aria-hidden className="absolute top-0 scroll-mt-16" />
      <div className={container}>
        <SectionHeading
          center
          eyebrow="Roller"
          title={<>Herkes <span className="marker">kendi ekranını</span> kullanır</>}
          lead="Öğretmen, öğrenci ve veli aynı programı kendi ekranından görür. Bir öğrencinin kayıtlarını sadece kendisi, öğretmeni ve velisi görebilir."
        />

        <Reveal className="mx-auto mt-10 max-w-md">
          <Segmented options={options} value={role} onChange={changeRole} className="[&_button]:h-11 [&_button]:text-[15px]" />
        </Reveal>

        <div ref={section} role="tabpanel" aria-label={current.label} className="mt-10 grid items-start gap-8 lg:mt-14 lg:grid-cols-[1fr_1.05fr] lg:gap-14">
          <div className="lg:pt-4">
            <h3 className="text-2xl font-extrabold sm:text-[1.75rem]">{current.title}</h3>
            <p className="mt-2 text-[17px] text-muted">{current.lead}</p>
            <ul className="mt-6 space-y-1.5" onMouseEnter={() => setHover(true)} onMouseLeave={() => setHover(false)}>
              {current.features.map((f, i) => {
                const selected = i === active
                return (
                  <li key={`${role}-${i}`}>
                    <button
                      type="button"
                      aria-pressed={selected}
                      onClick={() => {
                        setActive(i)
                        setManual(true)
                      }}
                      className={cn(
                        'relative flex w-full gap-3.5 overflow-hidden rounded-2xl p-3 text-left transition-colors',
                        selected ? 'bg-bg ring-1 ring-line' : 'hover:bg-surface-2',
                      )}
                    >
                      <span className={cn('grid size-10 shrink-0 place-items-center rounded-xl transition-colors', selected ? 'bg-primary text-primary-fg' : 'bg-primary-soft text-primary-soft-fg')}>
                        <f.icon className="size-5" />
                      </span>
                      <span className="min-w-0 pt-0.5">
                        <span className="block font-bold">{f.title}</span>
                        {selected && <span className="mt-0.5 block text-[15px] leading-relaxed text-muted">{f.text}</span>}
                      </span>
                      {selected && autoplay && (
                        <motion.span
                          key={`${role}-${active}`}
                          aria-hidden
                          className="absolute inset-x-0 bottom-0 h-0.5 origin-left bg-primary"
                          initial={{ scaleX: 0 }}
                          animate={{ scaleX: 1 }}
                          transition={{ duration: INTERVAL / 1000, ease: 'linear' }}
                        />
                      )}
                    </button>
                    {selected && !desktop && (
                      <div className="grid-paper mt-1.5 rounded-2xl border border-line bg-bg p-3" aria-hidden inert>
                        <motion.div key={`${role}-${active}`} initial={reduce ? false : { opacity: 0, y: 8 }} animate={{ opacity: 1, y: 0 }} transition={{ duration: 0.22 }}>
                          {feature.scene()}
                        </motion.div>
                      </div>
                    )}
                  </li>
                )
              })}
            </ul>
          </div>

          <div className={cn('grid-paper min-h-[21rem] rounded-3xl border border-line bg-bg p-6 lg:sticky lg:top-24', !desktop && 'hidden')} aria-hidden inert>
            <AnimatePresence mode="wait" initial={false}>
              <motion.div
                key={`${role}-${active}`}
                initial={reduce ? false : { opacity: 0, y: 10 }}
                animate={{ opacity: 1, y: 0 }}
                exit={reduce ? undefined : { opacity: 0 }}
                transition={{ duration: 0.22 }}
              >
                {feature.scene()}
              </motion.div>
            </AnimatePresence>
          </div>
        </div>
      </div>
    </section>
  )
}
