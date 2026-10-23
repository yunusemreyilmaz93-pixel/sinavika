// Tek sayfalık uygulamanın herkese açık yolları. Her biri kendi başlık ve açıklamasıyla ayrı bir HTML dosyası olur
export const appPages = [
  {
    path: '/hakkinda',
    title: 'Hakkında · Yolumnet',
    description: 'Yolumnet kimin için, nasıl çalışır ve verilerinize ne olur. LGS ve YKS öğrencileri, veliler ve öğretmenler için ücretsiz ve reklamsız koçluk uygulaması.',
    sitemap: true,
  },
  {
    path: '/kvkk',
    title: 'KVKK Aydınlatma Metni · Yolumnet',
    description: 'Yolumnet kişisel veri aydınlatma metni. Hangi verilerin neden işlendiği, nerede saklandığı ve haklarınız.',
    sitemap: true,
  },
  {
    path: '/ogretmen-basvurusu',
    title: 'Öğretmen başvurusu · Yolumnet',
    description: 'LGS ve YKS öğrencilerinizin haftalık planını, soru ve deneme takibini ücretsiz yönetmek için öğretmen olarak başvurun.',
    sitemap: true,
  },
  { path: '/giris', title: 'Giriş yap · Yolumnet', description: 'Yolumnet hesabınıza giriş yapın.', noindex: true },
  { path: '/katil', title: 'Davet koduyla katıl · Yolumnet', description: 'Öğretmeninizden aldığınız kodla Yolumnet\'e katılın.', noindex: true },
  { path: '/test-giris', title: 'Test girişi · Yolumnet', description: 'Yolumnet test girişi.', noindex: true },
]
