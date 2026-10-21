import { ArrowLeft } from 'lucide-react'
import { useEffect } from 'react'
import { Link } from 'react-router'
import { Button } from '@/components/ui/button'
import { Logo } from '@/components/ui/logo'
import { CONTACT_EMAIL, SUPPORT_URL } from '@/lib/contact'

const principles = [
  ['Ücretsiz', 'Öğrenci, veli ve öğretmen için ücret yok.'],
  ['Reklam yok', 'Sayfalarda reklam göstermiyorum.'],
  ['Veri satılmıyor', 'Öğrenci verisi üçüncü kişilere satılmaz ve reklam için kullanılmaz.'],
  ['Puan tahmini yok', 'Denemelerde net gösteriyorum. Tahmini LGS ya da YKS puanı vermiyorum, çünkü yanlış bir sayı öğrenciyi gereksiz yere rahatlatır ya da korkutur.'],
  ['Rozet, sıralama ve seri yok', 'Öğrenciye baskı yapacak bir şey eklemiyorum.'],
] as const

const link = 'font-semibold text-accent underline-offset-4 hover:underline'

export default function AboutPage() {
  useEffect(() => {
    const previous = document.title
    document.title = 'Hakkında · Yolumnet'
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

      <main className="mx-auto max-w-2xl px-4 pt-8 pb-20 sm:px-6 sm:pt-14">
        <h1 className="text-[1.85rem] leading-[1.15] font-extrabold sm:text-[2.5rem]">Yolumnet'i ben yapıyorum</h1>
        <div className="mt-6 space-y-4 text-[17px] leading-relaxed text-muted">
          <p>
            Yolumnet'i tek başıma geliştiriyorum. Arkasında bir şirket, bir ekip ya da bir yatırımcı yok.
          </p>
          <p>
            Hem kendi öğrencilerimin takibini daha rahat yapabilmek, hem de öğretmen olan eşimin LGS'ye hazırlanan öğrencileri
            için ücretli çözümlere bir alternatif bulabilmek için yola çıktım. Öğretmenlere ve öğrencilere gerçekten faydalı,
            ücretsiz bir araç olabilir mi diye düşündüm ve bunu yapmaya karar verdim.
          </p>
          <p>
            Amacım basit: LGS ve YKS'ye hazırlanan öğrencinin, onu takip eden öğretmenin ve velinin aynı yerde, sade bir şekilde
            çalışabilmesi. Plan, görev, deneme, konu takibi ve konu anlatımları bu yüzden aynı uygulamada.
          </p>
        </div>

        <h2 className="mt-12 text-2xl font-extrabold">Nasıl çalışıyor</h2>
        <ul className="mt-4 space-y-3 text-[17px] leading-relaxed text-muted">
          {principles.map(([title, text]) => (
            <li key={title}>
              <strong className="text-fg">{title}.</strong> {text}
            </li>
          ))}
        </ul>
        <p className="mt-4 text-[17px] leading-relaxed text-muted">
          Ayrıntı için{' '}
          <Link to="/kvkk" className={link}>
            KVKK aydınlatma metnine
          </Link>{' '}
          bakabilirsiniz.
        </p>

        <h2 className="mt-12 text-2xl font-extrabold">Neden bir öğretmen en fazla 10 öğrenciyle çalışır</h2>
        <p className="mt-4 text-[17px] leading-relaxed text-muted">
          Koçluk, her öğrenciyi tanımayı gerektirir. Bir öğretmen yüzlerce öğrenci ekleyebilirse takip yüzeysel kalır ve
          uygulama bir tabloya dönüşür. 10 öğrenci sınırı bilerek koyduğum bir sınır, öğretmenin her öğrenciye gerçekten
          bakabilmesi için.
        </p>

        <h2 className="mt-12 text-2xl font-extrabold">Yapay zekâ kullanımı</h2>
        <p className="mt-4 text-[17px] leading-relaxed text-muted">
          Geliştirme sürecinde yapay zekâ araçlarından yararlanıyorum. Kodu ve ürün kararlarını ben gözden geçiriyorum. Konu
          anlatımlarını ve soruları yayına almadan önce kontrol ediyorum.
        </p>

        <h2 className="mt-12 text-2xl font-extrabold">Hata gördüğünüzde</h2>
        <p className="mt-4 text-[17px] leading-relaxed text-muted">
          Yanlış bir bilgi, çalışmayan bir ekran ya da bir öneriniz varsa{' '}
          <a href={`mailto:${CONTACT_EMAIL}`} className={link}>
            {CONTACT_EMAIL}
          </a>{' '}
          adresine yazabilirsiniz. Tek kişi olduğum için yanıt vermem biraz sürebilir, ama her mesajı okuyorum.
        </p>

        <h2 className="mt-12 text-2xl font-extrabold">Destek olmak isterseniz</h2>
        <p className="mt-4 text-[17px] leading-relaxed text-muted">
          Yolumnet ücretsiz kalacak. Beğendiyseniz sunucu ve geliştirme masraflarına{' '}
          <a href={SUPPORT_URL} target="_blank" rel="noreferrer noopener" className={link}>
            buymeacoffee.com/yunusemreyn
          </a>{' '}
          üzerinden destek olabilirsiniz. Destek karşılığında ek bir özellik açılmıyor, uygulama herkes için aynı.
        </p>
      </main>
    </div>
  )
}
