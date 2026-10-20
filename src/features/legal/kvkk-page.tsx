import { CONTACT_EMAIL } from '@/lib/contact'
import { ArrowLeft, ChevronDown, Eye, ShieldCheck, Trash2 } from 'lucide-react'
import { useEffect, useRef, type MouseEvent, type ReactNode } from 'react'
import { Link } from 'react-router'
import { Button } from '@/components/ui/button'
import { Logo } from '@/components/ui/logo'

const UPDATED = '20 Ekim 2026'

type Section = { id: string; title: string; body: ReactNode }

const rights = [
  'Kişisel verilerinizin işlenip işlenmediğini öğrenme',
  'Kişisel verileriniz işlenmişse buna ilişkin bilgi talep etme',
  'Kişisel verilerinizin işlenme amacını ve bunların amacına uygun kullanılıp kullanılmadığını öğrenme',
  'Yurt içinde veya yurt dışında kişisel verilerinizin aktarıldığı üçüncü kişileri bilme',
  'Kişisel verileriniz eksik veya yanlış işlenmişse bunların düzeltilmesini isteme',
  'KVKK\'nın 7. maddesinde öngörülen şartlar çerçevesinde kişisel verilerinizin silinmesini veya yok edilmesini isteme',
  'Düzeltme, silme veya yok etme işlemlerinin kişisel verilerinizin aktarıldığı üçüncü kişilere bildirilmesini isteme',
  'İşlenen verilerin münhasıran otomatik sistemler vasıtasıyla analiz edilmesi suretiyle aleyhinize bir sonucun ortaya çıkmasına itiraz etme',
  'Kişisel verilerinizin kanuna aykırı olarak işlenmesi sebebiyle zarara uğramanız hâlinde zararın giderilmesini talep etme',
]
const rightLetters = ['a', 'b', 'c', 'ç', 'd', 'e', 'f', 'g', 'ğ']

const sections: Section[] = [
  {
    id: 'veri-sorumlusu',
    title: 'Veri sorumlusu',
    body: (
      <p>
        Kişisel verileriniz, veri sorumlusu sıfatıyla Yolumnet tarafından işlenmektedir. Yolumnet, LGS ve YKS'ye hazırlanan
        öğrenciler için gönüllü olarak geliştirilen, ücretsiz ve reklamsız bir koçluk uygulamasıdır. İletişim:{' '}
        <a href={`mailto:${CONTACT_EMAIL}`} className="font-semibold text-accent underline-offset-4 hover:underline">
          {CONTACT_EMAIL}
        </a>
      </p>
    ),
  },
  {
    id: 'islenen-veriler',
    title: 'İşlenen kişisel veriler',
    body: (
      <ul>
        <li>
          <strong>Kimlik ve hesap bilgileri:</strong> Ad soyad, kullanıcı adı ve hesap türü (öğretmen, öğrenci, veli). Şifreniz geri
          döndürülemez biçimde saklanır ve kimse tarafından görüntülenemez.
        </li>
        <li>
          <strong>İletişim bilgileri:</strong> Öğretmenlerin e-posta adresi. Öğrenci ve velilerden e-posta adresi istenmez.
        </li>
        <li>
          <strong>Öğretmen başvurusu:</strong> Okul, branş ve başvuru notu.
        </li>
        <li>
          <strong>Çalışma kayıtları:</strong> Çalışma süreleri, soru kayıtları, deneme sonuçları ve netler, konu durumları, görevler,
          hedefler, yanlış soru defterine eklenen fotoğraflar ve notlar, görev olarak verilen videoların izlenme bilgisi.
        </li>
        <li>
          <strong>Notlar ve mesajlar:</strong> Öğretmenin aldığı notlar, görüşme kayıtları ve uygulama içi mesajlar.
        </li>
        <li>
          <strong>Kullanım bilgileri:</strong> Son giriş zamanı, bildirimler, telefona bildirim almayı açtıysanız cihazınızın bildirim adresi ve hizmetin güvenliği için tutulan teknik kayıtlar (IP
          adresi ve tarayıcı bilgisi gibi).
        </li>
      </ul>
    ),
  },
  {
    id: 'amac',
    title: 'İşleme amacı',
    body: (
      <>
        <p>Kişisel verileriniz yalnızca koçluk hizmetinin sunulması amacıyla, aşağıdaki kapsamda işlenir:</p>
        <ul>
          <li>Hesabınızın oluşturulması ve uygulamaya giriş yapmanızın sağlanması</li>
          <li>Öğretmenin haftalık program hazırlaması, görev vermesi ve öğrencisinin ilerlemesini takip etmesi</li>
          <li>Öğrencinin çalışma, soru ve deneme kayıtlarının tutulması</li>
          <li>Velinin çocuğunun çalışmalarını görmesi ve öğretmenle yazışması</li>
          <li>Bildirimlerin gönderilmesi ve öğretmen başvurularının değerlendirilmesi</li>
          <li>Hizmetin güvenliğinin sağlanması ve kötüye kullanımın önlenmesi</li>
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
          Kişisel verileriniz, KVKK'nın 5. maddesinde yer alan iki hukuki sebebe dayanılarak işlenir. Birincisi, koçluk hizmetinin
          sunulabilmesi için bir sözleşmenin kurulması veya ifasıyla doğrudan ilgili olmasıdır. İkincisi, kayıt sırasında
          verdiğiniz açık rızadır.
        </p>
        <p>
          Verileriniz öğretmen başvuru formu, davet koduyla katılım formu ve uygulamayı kullanırken girdiğiniz bilgiler aracılığıyla
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
        Öğrencilerimizin çoğu 18 yaşından küçüktür. 18 yaşını doldurmamış öğrencilerin hesap açmadan önce velilerinin onayını
        almaları gerekir. Kayıt sırasında verilen onay, velinin bilgisi ve izniyle verilmiş kabul edilir. Veliler, çocuklarının
        hesabının silinmesi için öğretmene başvurabilir.
      </p>
    ),
  },
  {
    id: 'aktarim',
    title: 'Verileri kimler görebilir, kimlere aktarılır',
    body: (
      <>
        <p>
          Uygulama içinde bir öğrencinin verilerini yalnızca öğrencinin kendisi, öğretmeni ve bağlı velisi görebilir. Öğretmenin
          kendisi için tuttuğu özel notları öğrenci ve veli göremez. Veliler kayıtları yalnızca görüntüleyebilir, değiştiremez.
        </p>
        <p>
          Yolumnet'in çalışabilmesi için verileriniz barındırma hizmeti aldığımız iki sağlayıcıya aktarılır. Bunlar Supabase
          (veritabanı ve oturum açma) ve Vercel (web sitesi ve sunucu işlemleri) şirketleridir. Bu sağlayıcılar verileri yurt
          dışındaki sunucularda saklayabilir. Bu nedenle kayıt sırasında, KVKK'nın 9. maddesi kapsamında yurt dışına aktarım için
          açık rızanız alınır.
        </p>
        <p>
          Öğretmeninizin görev olarak eklediği YouTube videoları, YouTube'un çerez kullanmayan oynatıcısıyla (youtube-nocookie.com)
          uygulamanın içinde oynatılır. Video oynatıldığında IP adresiniz ve tarayıcı bilginiz YouTube'a (Google) iletilir. Videonun
          ne kadarının izlendiği ve nerede kalındığı, öğretmenin takip edebilmesi için Yolumnet'in kendi veritabanında
          saklanır ve YouTube ile paylaşılmaz.
        </p>
        <p>
          Verileriniz bunların dışında hiç kimseye satılmaz, kiralanmaz ve reklam amacıyla paylaşılmaz. Yetkili kamu kurum ve
          kuruluşlarının kanuna dayanan talepleri olması hâlinde, yalnızca bu yükümlülük kapsamında paylaşılabilir.
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
          Verileriniz hesabınız silinene kadar saklanır. Hesap silindiğinde ona bağlı çalışma kayıtları, notlar ve mesajlar da
          silinir. Bir öğrencinin hesabı silindiğinde, başka bir öğrenciye bağlı olmayan veli hesapları da silinir.
        </p>
        <p>Barındırma sağlayıcısının teknik yedeklerinde bulunan kopyalar, yedekleme süresi dolduğunda kendiliğinden silinir.</p>
      </>
    ),
  },
  {
    id: 'haklar',
    title: 'KVKK\'nın 11. maddesi kapsamındaki haklarınız',
    body: (
      <>
        <p>KVKK'nın 11. maddesi uyarınca kişisel verilerinizle ilgili aşağıdaki haklara sahipsiniz:</p>
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
    title: 'Başvuru yolları',
    body: (
      <>
        <p>
          Hesabınızı istediğiniz zaman <strong>Ayarlar</strong> sayfasından kendiniz silebilirsiniz. Öğretmenlerin kendi
          hesaplarını silmeden önce öğrencilerinin hesaplarını silmeleri gerekir.
        </p>
        <p>
          Diğer talepleriniz için öğretmeninize başvurabilir ya da {CONTACT_EMAIL} adresine yazabilirsiniz. Başvurularınız en geç
          30 gün içinde ücretsiz olarak sonuçlandırılır.
        </p>
      </>
    ),
  },
  {
    id: 'yerel-depolama',
    title: 'Çerezler ve yerel depolama',
    body: (
      <p>
        Yolumnet reklam veya izleme amaçlı çerez kullanmaz. Oturumunuzu açık tutmak, tema tercihinizi ve veli hesabında seçili
        çocuğu hatırlamak için tarayıcınızın yerel depolama alanından yararlanır. Uygulamanın hızlı açılması için bazı dosyalar
        cihazınızda önbelleğe alınır.
      </p>
    ),
  },
  {
    id: 'degisiklikler',
    title: 'Değişiklikler',
    body: <p>Bu metinde bir değişiklik yaptığımızda, sayfanın başındaki son güncelleme tarihini de güncelleriz.</p>,
  },
]

const summary = [
  { icon: ShieldCheck, text: 'Verileriniz yalnızca koçluk hizmeti için kullanılır. Satılmaz ve reklam amacıyla kullanılmaz.' },
  { icon: Eye, text: 'Bir öğrencinin kayıtlarını yalnızca kendisi, öğretmeni ve bağlı velisi görebilir.' },
  { icon: Trash2, text: 'Hesabınızı istediğiniz zaman Ayarlar sayfasından silebilirsiniz.' },
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
    document.title = 'KVKK Aydınlatma Metni · Yolumnet'
    return () => {
      document.title = previous
    }
  }, [])

  return (
    <div className="min-h-dvh">
      <header className="pt-safe grid-paper sticky top-0 z-30 border-b border-line bg-bg">
        <div className="mx-auto flex h-16 max-w-5xl items-center justify-between gap-3 px-4 sm:px-6">
          <Link to="/" aria-label="Yolumnet ana sayfa" className="-ml-1 rounded-lg p-1">
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
              Bu metin, 6698 sayılı Kişisel Verilerin Korunması Kanunu (KVKK) kapsamında Yolumnet'i kullanan öğretmen, öğrenci
              ve velileri, kişisel verilerinin nasıl işlendiği konusunda bilgilendirmek amacıyla hazırlanmıştır.
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
          <p>&copy; {new Date().getFullYear()} Yolumnet</p>
          <p>Yolumnet ücretsiz ve reklamsızdır.</p>
        </div>
      </footer>
    </div>
  )
}
