# Yolumnet

LGS ve YKS'ye hazırlanan öğrenciler için ücretsiz koçluk uygulaması. Öğretmen planlar, öğrenci çalışır, veli takip eder.

## Yığın

- Vite, React 19, TypeScript, React Router, Tailwind CSS 4, Motion
- Supabase (Postgres, Auth, RLS, Realtime)
- Vercel (statik site + `api/` fonksiyonları + günlük cron)

## Yerel geliştirme

Gereken: Node 22, Docker.

```bash
npm install
npm run db:start      # yerel Supabase, migration'ları uygular
npm run dev:api       # api/ fonksiyonları, :3001
npm run dev           # uygulama, :5173
```

`.env.local` dosyasına `npx supabase status` çıktısındaki değerleri yaz:

```
SUPABASE_URL=http://127.0.0.1:54321
SUPABASE_ANON_KEY=...
SUPABASE_SERVICE_ROLE_KEY=...
ADMIN_EMAIL=...
```

`ADMIN_EMAIL` ile öğretmen başvurusu yapan hesap onaysız açılır ve yönetici olur.

## Kontroller

```bash
npm run lint        # eslint + metin kuralları
npm run typecheck
npm test
npm run test:db     # migration + RLS testleri (boş bir Postgres gerekir, TEST_DATABASE_URL)
```

## Yayın

- `preview` branch'i Vercel önizlemesine, `main` canlıya gider
- Supabase GitHub entegrasyonu `supabase/migrations` klasörünü `main`'e her push'ta uygular
- Vercel ortam değişkenleri: `SUPABASE_URL`, `SUPABASE_ANON_KEY`, `SUPABASE_SERVICE_ROLE_KEY` (Supabase entegrasyonu ekler), `ADMIN_EMAIL`, isteğe bağlı `CRON_SECRET`, asistan için `AI_KEY_SECRET`

## Hesap modeli

- Öğretmen e-postayla başvurur, yönetici onaylar
- Öğrenci ve veli öğretmenin verdiği davet koduyla, kullanıcı adı ve şifreyle katılır. E-posta gerekmez
- Şifreyi öğretmen (öğrenci ve veli için) ya da yönetici (öğretmen için) sıfırlar
- Bir öğretmen en fazla 10 aktif öğrenciyle çalışır. Sınır veritabanında uygulanır
