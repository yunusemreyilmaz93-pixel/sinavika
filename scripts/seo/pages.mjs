// Tek sayfalık uygulamanın herkese açık yolları. Her biri kendi başlık ve açıklamasıyla ayrı bir HTML dosyası olur
export const appPages = [
  {
    path: '/hakkinda',
    title: 'Hakkında · İzlek',
    description: 'İzlek kimin için, nasıl çalışır ve verilerinize ne olur. LGS ve YKS öğrencileri, veliler ve öğretmenler için ücretsiz ve reklamsız koçluk uygulaması.',
    sitemap: true,
  },
  {
    path: '/kvkk',
    title: 'KVKK Aydınlatma Metni · İzlek',
    description: 'İzlek kişisel veri aydınlatma metni. Hangi verilerin neden işlendiği, nerede saklandığı ve haklarınız.',
    sitemap: true,
  },
  {
    path: '/ogretmen-basvurusu',
    title: 'Öğretmen başvurusu · İzlek',
    description: 'LGS ve YKS öğrencilerinizin haftalık planını, soru ve deneme takibini ücretsiz yönetmek için öğretmen olarak başvurun.',
    sitemap: true,
  },
  { path: '/giris', title: 'Giriş yap · İzlek', description: 'İzlek hesabınıza giriş yapın.', noindex: true },
  { path: '/katil', title: 'Davet koduyla katıl · İzlek', description: 'Öğretmeninizden aldığınız kodla İzlek\'e katılın.', noindex: true },
  { path: '/test-giris', title: 'Test girişi · İzlek', description: 'İzlek test girişi.', noindex: true },
]
