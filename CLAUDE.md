# Yolumnet

LGS ve YKS koçluğu için ücretsiz web uygulaması. Öğretmen, öğrenci ve veli rolleri var. Bir öğretmen en fazla 10 aktif öğrenciyle çalışır.

## Yığın

- Vite, React 19, TypeScript, React Router (data router), Tailwind CSS 4
- Supabase: Postgres, Auth, RLS. Şema `supabase/migrations` altında
- Yetkili işlemler `api/` altındaki Vercel fonksiyonlarında (service role sadece orada)
- TanStack Query, Radix, Motion, Recharts, dnd-kit, zod

## Git kuralları

- Sadece iki branch var: `preview` ve `main`. Yeni branch açma
- İş `preview` üzerinde yapılır. Onaylanınca `main` fast-forward edilir
- Az ve anlamlı commit at. Her küçük düzeltme için ayrı commit atma
- GitHub Actions yok. `.github/workflows` ekleme
- Vercel `preview` için önizleme, `main` için canlı yayın alır

## Metin kuralları (arayüz, landing, e-posta, commit mesajı)

- Uzun tire (—) ve orta tire (–) kullanma. Gerekirse nokta ya da virgül kullan
- Arayüz metninde noktalı virgül kullanma
- İki noktadan sonra büyük harfle başla
- Hitap role göre değişir. Yalnızca öğrenciye özel ekranlar (öğrenci Bugün sayfası, sayaç, deneme ekleme, anlatım sonu özeti) "sen" diliyle yazılır. Öğretmen ve veli ekranları, bildirimleri ve e-postaları "siz" diliyle yazılır, bu rollere hiçbir yerde "sen" denmez. Birden çok rolün gördüğü ortak ekranlarda, hata ve bildirim mesajlarında ikinci tekil kişi kullanılmaz: ya kişisiz (edilgen, ad biçimi) ya da kibar "siz" biçimi yazılır ("Tekrar deneyin", "Kayıt eklenemedi"). Ana sayfa (landing), KVKK ve hukuki metinler de "siz". Ana sayfadaki uygulama önizlemeleri (`role-previews`, `hero-preview`) öğrenci ekranını gösterdiği yerde "sen" kalır
- Gereksiz açıklama metni yazma. Bir alan ya da düğme kendini anlatıyorsa altına ek cümle koyma. Yalnızca kullanıcının karar vermesini ya da hata yapmamasını sağlayan bilgiyi yaz
- Kısa yaz. Bir şeyi açıklamak gerekmiyorsa açıklama
- Emoji kullanma. İkon gerekiyorsa `lucide-react`
- Abartılı pazarlama dili yok: "yolculuk", "seviyeyi atla", "sorunsuz", "kusursuz", "devrim", "benzersiz", "keşfedin", "potansiyelini açığa çıkar" gibi
- Uydurma istatistik, sahte kullanıcı yorumu, "binlerce öğretmen kullanıyor" gibi iddialar yok
- Tahmini LGS/YKS puanı gösterme. Net göster (LGS: D - Y/3, YKS: D - Y/4)
- Türkçe karakterleri doğru yaz (ı, İ, ş, ğ, ç, ö, ü)

`npm run lint` bu kuralların bir kısmını `scripts/check-copy.mjs` ile denetler. Build de aynı kontrolü çalıştırır, kural ihlali varsa yayın almaz. Bir satırın bilerek istisna olması gerekiyorsa sonuna `copy-ok` yorumu ekle.

## Tasarım kuralları

- Renkler ve fontlar `src/index.css` içindeki token'lardan gelir. Ham hex renk yazma
- Fontlar: başlıklar Bricolage Grotesque, gövde Figtree. Inter kullanma
- Mobil önce. Her ekran 360px genişlikte sorunsuz çalışmalı, dokunma alanları en az 44px
- Animasyonlar kısa (150 ile 400ms arası) ve `prefers-reduced-motion` durumunda kapanır
- Genel geçer süsler yok: rastgele gradyan bloblar, cam efekti, her yerde gölge
- Boş ekranlar ne yapılacağını söyler ve tek bir eylem sunar

## Kod kuralları

- Uygulamanın adı Yolumnet. Eski adı Sınavika'ydı. `hesap.sinavika.app` giriş alan adı, `sinavika-auth` ve diğer `sinavika-*` tarayıcı anahtarları bilerek değiştirilmedi. Değişirse mevcut hesaplar giriş yapamaz ya da herkesin oturumu kapanır

- Konu anlatımları kod dosyası değil, `lessons` tablosunda Markdown olarak durur. Yönetim > Müfredat'ta konunun yanındaki "Anlatım yaz" ile yazılır. Blok söz dizimi `src/features/lessons/markdown/parse.ts` ve editördeki "Yazım rehberi" içindedir
- Yorum yazma, kod kendini anlatmıyorsa kısa bir yorum yeter
- Gerçek bir problemi çözmeyen soyutlama, kütüphane veya katman ekleme
- Mock veri yok. Veri Supabase'den gelir
- Yetki kontrolü her zaman veritabanında (RLS, trigger). Arayüzdeki kontrol sadece kolaylık içindir
- 10 öğrenci sınırı `enforce_student_capacity` trigger'ında. Arayüzde ayrıca kontrol etme, hatayı göster
- Şema değişikliği yeni bir migration dosyasıdır. Eski migration'ı düzenleme
- `api/` içindeki göreli importlar `.js` uzantısıyla yazılır (`./_lib/server.js`). Vercel dosyaları tek tek derler, `.ts` uzantılı import canlıda fonksiyonu çökertir. `npm run check:api` bunu denetler, build de çalıştırır
- Öğretmen yapay zekâ asistanı `api/ai.ts` ve `api/_lib/ai/` altındadır. Öğretmenin anahtarı `AI_KEY_SECRET` ile şifrelenip `teacher_ai_keys` tablosuna yazılır, istemci okuyamaz. Sağlayıcıya giden metinde öğrenci ve veli adları takma kimliğe çevrilir (`privacy.ts`), öğrencinin yazdığı not ve mesajlar gönderilmez. Asistan hiçbir şey kaydetmez, görev taslağını öğretmen onaylar. Bu davranışı değiştiren her iş `tests/api-ai-*.test.ts` testlerini güncellemeli
- Yayından sonra `/api/health` her şeyin çalıştığını gösterir. Admin panelindeki Sistem durumu kartı da bunu okur
- Değişiklikten sonra `npm run lint`, `npm run typecheck`, `npm test` ve şema değiştiyse `npm run test:db` çalıştır
