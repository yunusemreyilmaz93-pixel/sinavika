import { HeartHandshake, ShieldCheck, UsersRound, type LucideIcon } from 'lucide-react'
import type { ReactNode } from 'react'
import { StudentCapacity } from './live-settings'
import { container, Eyebrow, Reveal } from './primitives'

export function WhyFree() {
  return (
    <section className="py-6 sm:py-10">
      <div className={container}>
        <Reveal>
          <div className="grid-paper grid gap-8 rounded-3xl border border-line bg-surface p-6 shadow-card sm:p-10 lg:grid-cols-[0.9fr_1.1fr] lg:gap-14 lg:p-12">
            <div>
              <Eyebrow>Açık konuşalım</Eyebrow>
              <h2 className="mt-3 text-[1.85rem] leading-[1.12] font-extrabold sm:text-[2.5rem]">
                Neden ücretsiz, neden <StudentCapacity /> öğrenci?
              </h2>
              <p className="mt-4 text-[17px] leading-relaxed text-muted">
                Kısıtların nereden geldiğini baştan söylemek istiyoruz.
              </p>
            </div>
            <ul className="space-y-6">
              <Point icon={HeartHandshake} title="Gönüllü bir proje">
                Sınavika'yı gönüllü olarak geliştiriyoruz. Ücret almıyoruz, reklam göstermiyoruz, verileri satmıyoruz.
              </Point>
              <Point
                icon={UsersRound}
                title={
                  <>
                    Her öğretmen en fazla <StudentCapacity /> öğrenciyle çalışır
                  </>
                }
              >
                Sunucu kapasitemiz sınırlı. Onu öğretmenler arasında adil paylaşmak için bir sınır koyduk. Bu sayı, her
                öğrenciyi haftalık olarak yakından takip etmeye de uygun.
              </Point>
              <Point icon={ShieldCheck} title="Öğretmen hesapları onaydan sonra açılır">
                Başvuruları tek tek inceliyoruz. Öğrencilerle çalışacak bir hesabı açmadan önce kimin açtığını bilmek istiyoruz.
              </Point>
            </ul>
          </div>
        </Reveal>
      </div>
    </section>
  )
}

function Point({ icon: Icon, title, children }: { icon: LucideIcon; title: ReactNode; children: ReactNode }) {
  return (
    <li className="flex gap-4">
      <span className="grid size-11 shrink-0 place-items-center rounded-xl border border-line bg-surface text-primary shadow-card">
        <Icon className="size-5" />
      </span>
      <div className="min-w-0">
        <p className="text-[17px] font-bold">{title}</p>
        <p className="mt-1 text-[15px] leading-relaxed text-muted">{children}</p>
      </div>
    </li>
  )
}
