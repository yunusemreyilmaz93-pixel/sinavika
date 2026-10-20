import { ArrowLeft, ChevronDown, Eye, ShieldCheck, Trash2 } from 'lucide-react'
import { useEffect, useRef, type MouseEvent, type ReactNode } from 'react'
import { Link } from 'react-router'
import { Button } from '@/components/ui/button'
import { Logo } from '@/components/ui/logo'

const UPDATED = '19 Ekim 2026'

type Section = { id: string; title: string; body: ReactNode }

const rights = [
  'Kişisel verilerinin işlenip işlenmediğini öğrenme',
  'İşlenmişse buna ilişkin bilgi talep etme',
  'İşlenme amacını ve bunların amacına uygun kullanılıp kullanılmadığını öğrenme',
  'Yurt içinde veya yurt dışında aktarıldığı üçüncü kişileri bilme',
  'Eksik veya yanlış işlenmişse düzeltilmesini isteme',
  'KVKK 7. madde çerçevesinde silinmesini veya yok edilmesini isteme',
  'Düzeltme, silme veya yok etme işlemlerinin verilerin aktarıldığı üçüncü kişilere bildirilmesini isteme',
  'İşlenen verilerin yalnızca otomatik sistemlerle analiz edilmesi sonucunda aleyhine bir sonuç çıkmasına itiraz etme',
  'Kanuna aykırı işleme nedeniyle zarara uğrarsan zararın giderilmesini talep etme',
]
const rightLetters = ['a', 'b', 'c', 'ç', 'd', 'e', 'f', 'g', 'ğ']

const sections: Section[] = [
  {
    id: 'veri-sorumlusu',
    title: 'Veri sorumlusu',
    body: (
      <p>
        Kişisel verilerin, veri sorumlusu sıfatıyla Sınavika tarafından işlenir. Sınavika, LGS ve YKS'ye hazırlanan öğrenciler
        için gönüllü olarak geliştirilen, ücretsiz ve reklamsız bir koçluk uygulamasıdır.
      </p>
    ),
  },
  {
    id: 'islenen-veriler',
    title: 'İşlenen kişisel veriler',
    body: (
      <ul>
        <li>
          <strong>Kimlik ve hesap:</strong> ad soyad, kullanıcı adı, hesap türü (öğretmen, öğrenci, veli). Şifren geri döndürülemez
          biçimde saklanır, kimse göremez.
        </li>
        <li>
          <strong>İletişim:</strong> öğretmenlerin e-posta adresi. Öğrenci ve veliler e-posta vermez.
        </li>
        <li>
          <strong>Öğretmen başvurusu:</strong> okul, branş ve başvuru notu.
        </li>
        <li>
          <strong>Çalışma kayıtları:</strong> çalışma süreleri, soru kayıtları, deneme sonuçları ve netler, konu durumları, görevler ve
          hedefler.
        </li>
        <li>
          <strong>Notlar ve mesajlar:</strong> öğretmenin aldığı notlar, görüşme kayıtları ve uygulama içi mesajlar.
        </li>
        <li>
          <strong>Kullanım:</strong> son giriş zamanı, bildirimler ve hizmetin güvenliği için tutulan teknik kayıtlar (IP adresi ve
          tarayıcı bilgisi gibi).
        </li>
      </ul>
    ),
  },
  {
    id: 'amac',
    title: 'İşleme amacı',
    body: (
      <>
        <p>Verilerin yalnızca koçluk hizmetini sunmak için işlenir. Bu kapsamda:</p>
        <ul>
          <li>Hesabını oluşturmak ve giriş yapmanı sağlamak</li>
          <li>Öğretmenin haftalık program hazırlaması, görev vermesi ve öğrencisinin ilerlemesini takip etmesi</li>
          <li>Öğrencinin çalışma, soru ve deneme kayıtlarını tutması</li>
          <li>Velinin çocuğunun çalışmasını görmesi ve öğretmenle yazışması</li>
          <li>Bildirim göndermek ve öğretmen başvurularını değerlendirmek</li>
          <li>Hizmetin güvenliğini sağlamak ve kötüye kullanımı önlemek</li>
        </ul>
      </>
    ),
  },
  {
    id: 'hukuki-sebep',
    title: 'Hukuki sebep ve toplama yöntemi',
    body: (
      <>
        <p>
          Kişisel verilerin KVKK'nın 5. maddesindeki şu sebeplere dayanarak işlenir: koçluk hizmetinin sunulabilmesi için
          sözleşmenin kurulması ve ifası ile doğrudan ilgili olması ve kayıt sırasında verdiğin açık rıza.
        </p>
        <p>
          Veriler öğretmen başvuru formu, davet koduyla katılım formu ve uygulamayı kullanırken girdiğin bilgiler aracılığıyla
          elektronik ortamda toplanır.
        </p>
      </>
    ),
  },
  {
    id: 'cocuklar',
    title: '18 yaşından küçük kullanıcılar',
    body: (
      <p>
        Öğrencilerin çoğu 18 yaşından küçüktür. 18 yaşını doldurmamış bir öğrenci hesap açmadan önce velisinin onayını almalıdır.
        Kayıt sırasında verilen onay, velinin bilgisi ve izniyle verilmiş sayılır. Veli, çocuğunun hesabının silinmesini
        istediğinde öğretmene başvurabilir.
      </p>
    ),
  },
  {
    id: 'aktarim',
    title: 'Kimler görebilir, kime aktarılır',
    body: (
      <>
        <p>
          Uygulama içinde bir öğrencinin verilerini sadece öğrencinin kendisi, öğretmeni ve bağlı velisi görür. Öğretmenin özel
          olarak tuttuğu notları öğrenci ve veli göremez. Veliler kayıtları sadece görüntüleyebilir.
        </p>
        <p>
          Sınavika'nın çalışması için veriler barındırma hizmeti aldığımız sağlayıcılara aktarılır: Supabase (veritabanı ve
          oturum açma) ve Vercel (web sitesi ve sunucu işlemleri). Bu sağlayıcılar verileri yurt dışındaki sunucularda
          saklayabilir. Bu nedenle kayıt sırasında, KVKK'nın 9. maddesi kapsamında yurt dışına aktarım için açık rızan alınır.
        </p>
        <p>
          Veriler bunların dışında kimseye satılmaz, kiralanmaz ve reklam amacıyla paylaşılmaz. Yetkili kamu kurumları kanuna
          dayanarak talep ederse, yalnızca bu yükümlülük kapsamında paylaşılabilir.
        </p>
      </>
    ),
  },
  {
    id: 'saklama',
    title: 'Saklama süresi',
    body: (
      <>
        <p>
          Verilerin hesabın silinene kadar saklanır. Hesap silindiğinde ona bağlı çalışma kayıtları, notlar ve mesajlar da
          silinir. Bir öğrencinin hesabı silindiğinde, başka bir çocuğa bağlı olmayan veli hesabı da silinir.
        </p>
        <p>Barındırma sağlayıcısının teknik yedeklerindeki kopyalar, yedekleme süresi dolduğunda kendiliğinden silinir.</p>
      </>
    ),
  },
  {
    id: 'haklar',
    title: 'KVKK 11. madde kapsamındaki hakların',
    body: (
      <>
        <p>KVKK'nın 11. maddesine göre kişisel verilerinle ilgili şu haklara sahipsin:</p>
        <ol>
          {rights.map((r, i) => (
            <li key={r} className="flex gap-3">
              <span className="w-4 shrink-0 font-display font-bold text-primary">{rightLetters[i]})</span>
              <span>{r}</span>
            </li>
          ))}
        </ol>
      </>
    ),
  },
  {
    id: 'basvuru',
    title: 'Başvuru',
    body: (
      <>
        <p>
          Hesabını <strong>Ayarlar</strong> sayfasından istediğin zaman kendin silebilirsin. Öğretmen hesabını silmeden önce
          öğrencilerinin hesaplarını silmen gerekir.
        </p>
        <p>
          Diğer talepler için öğretmenine başvurabilirsin. Öğretmenin talebini bize iletir. Başvurular en geç 30 gün içinde
          ücretsiz olarak sonuçlandırılır.
        </p>
      </>
    ),
  },
  {
    id: 'yerel-depolama',
    title: 'Çerezler ve yerel depolama',
    body: (
      <p>
        Sınavika reklam ya da izleme çerezi kullanmaz. Oturumunu açık tutmak, tema tercihini ve veli hesabında seçili çocuğu
        hatırlamak için tarayıcının yerel depolama alanını kullanır. Uygulamanın hızlı açılması için bazı dosyalar cihazında
        önbelleğe alınır.
      </p>
    ),
  },
  {
    id: 'degisiklikler',
    title: 'Değişiklikler',
    body: <p>Bu metni güncellediğimizde sayfanın başındaki son güncelleme tarihini değiştiririz.</p>,
  },
]

const summary = [
  { icon: ShieldCheck, text: 'Verilerin sadece koçluk hizmeti için kullanılır. Satılmaz, reklam için kullanılmaz.' },
  { icon: Eye, text: 'Bir öğrencinin kayıtlarını sadece kendisi, öğretmeni ve bağlı velisi görür.' },
  { icon: Trash2, text: 'Hesabını istediğin zaman Ayarlar sayfasından silebilirsin.' },
]

function jumpTo(e: MouseEvent<HTMLAnchorElement>, id: string) {
  if (e.button !== 0 || e.metaKey || e.ctrlKey || e.shiftKey || e.altKey) return
  e.preventDefault()
  const el = document.getElementById(id)
  if (!el) return
  const reduce = window.matchMedia('(prefers-reduced-motion: reduce)').matches
  el.scrollIntoView({ behavior: reduce ? 'auto' : 'smooth', block: 'start' })
  window.history.replaceState(window.history.state, '', `#${id}`)
}

export default function KvkkPage() {
  const tocRef = useRef<HTMLDetailsElement>(null)

  useEffect(() => {
    const previous = document.title
    document.title = 'KVKK Aydınlatma Metni · Sınavika'
    return () => {
      document.title = previous
    }
  }, [])

  return (
    <div className="min-h-dvh">
      <header className="pt-safe grid-paper sticky top-0 z-30 border-b border-line bg-bg">
        <div className="mx-auto flex h-16 max-w-5xl items-center justify-between gap-3 px-4 sm:px-6">
          <Link to="/" aria-label="Sınavika ana sayfa" className="-ml-1 rounded-lg p-1">
            <Logo />
          </Link>
          <Button asChild variant="ghost" className="-mr-2 px-3">
            <Link to="/">
              <ArrowLeft />
              Ana sayfa
            </Link>
          </Button>
        </div>
      </header>

      <div className="mx-auto max-w-5xl px-4 pt-8 pb-20 sm:px-6 sm:pt-14 lg:grid lg:grid-cols-[13rem_1fr] lg:gap-14">
        <nav aria-label="İçindekiler" className="hidden lg:block">
          <div className="sticky top-24">
            <p className="text-sm font-bold">İçindekiler</p>
            <ol className="mt-3 space-y-0.5 border-l border-line">
              {sections.map((s) => (
                <li key={s.id}>
                  <a
                    href={`#${s.id}`}
                    onClick={(e) => jumpTo(e, s.id)}
                    className="-ml-px block border-l-2 border-transparent py-1.5 pl-3 text-sm leading-snug text-muted transition-colors hover:border-line-strong hover:text-fg"
                  >
                    {s.title}
                  </a>
                </li>
              ))}
            </ol>
          </div>
        </nav>

        <main className="min-w-0">
          <article className="max-w-2xl">
            <p className="text-sm font-bold text-primary">6698 sayılı KVKK</p>
            <h1 className="mt-2 text-[1.85rem] leading-[1.15] font-extrabold sm:text-[2.5rem]">Kişisel verilerin korunması aydınlatma metni</h1>
            <p className="mt-3 text-sm text-subtle">Son güncelleme: {UPDATED}</p>
            <p className="mt-6 text-[17px] leading-relaxed text-muted">
              Bu metin, 6698 sayılı Kişisel Verilerin Korunması Kanunu (KVKK) kapsamında Sınavika'yı kullanan öğretmen, öğrenci
              ve velilerin kişisel verilerinin nasıl işlendiğini anlatır.
            </p>

            <div className="mt-8 rounded-2xl border border-line bg-surface p-5 shadow-card sm:p-6">
              <p className="font-display text-lg font-bold">Kısaca</p>
              <ul className="mt-3 space-y-3">
                {summary.map((s) => (
                  <li key={s.text} className="flex gap-3 text-[15px] leading-relaxed">
                    <span className="grid size-8 shrink-0 place-items-center rounded-lg bg-primary-soft text-primary-soft-fg">
                      <s.icon className="size-4" />
                    </span>
                    <span className="pt-1">{s.text}</span>
                  </li>
                ))}
              </ul>
            </div>

            <details ref={tocRef} className="group mt-6 rounded-2xl border border-line bg-surface lg:hidden">
              <summary className="flex min-h-12 cursor-pointer list-none items-center justify-between px-5 font-semibold [&::-webkit-details-marker]:hidden">
                İçindekiler
                <ChevronDown className="size-5 text-muted transition-transform group-open:rotate-180" />
              </summary>
              <ol className="border-t border-line px-2 py-2">
                {sections.map((s, i) => (
                  <li key={s.id}>
                    <a
                      href={`#${s.id}`}
                      onClick={(e) => {
                        if (tocRef.current) tocRef.current.open = false
                        jumpTo(e, s.id)
                      }}
                      className="flex min-h-11 items-center gap-3 rounded-lg px-3 text-[15px] text-muted active:bg-surface-2"
                    >
                      <span className="w-5 text-right font-semibold text-subtle tabular">{i + 1}.</span>
                      {s.title}
                    </a>
                  </li>
                ))}
              </ol>
            </details>

            {sections.map((s, i) => (
              <section key={s.id} id={s.id} aria-labelledby={`${s.id}-baslik`} className="mt-10 scroll-mt-20 border-t border-line pt-8">
                <h2 id={`${s.id}-baslik`} className="flex gap-2.5 text-xl leading-snug font-extrabold sm:text-2xl">
                  <span className="text-subtle tabular">{i + 1}.</span>
                  {s.title}
                </h2>
                <div className="mt-4 space-y-4 text-base leading-relaxed text-fg [&_strong]:font-semibold [&_li]:pl-1 [&_ol]:space-y-2 [&_ul]:list-disc [&_ul]:space-y-2 [&_ul]:pl-5 [&_ul]:marker:text-subtle">
                  {s.body}
                </div>
              </section>
            ))}
          </article>
        </main>
      </div>

      <footer className="border-t border-line bg-surface">
        <div className="mx-auto flex max-w-5xl flex-col gap-1 px-4 py-6 text-sm text-subtle sm:flex-row sm:justify-between sm:px-6">
          <p>&copy; {new Date().getFullYear()} Sınavika</p>
          <p>Sınavika ücretsiz ve reklamsızdır.</p>
        </div>
      </footer>
    </div>
  )
}
