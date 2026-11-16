import { useQuery } from '@tanstack/react-query'
import { ShieldAlert } from 'lucide-react'
import { motion } from 'motion/react'
import { BlogSection } from '@/features/blog/blog-section'
import { useEffect, useRef } from 'react'
import { Link, useSearchParams } from 'react-router'
import { PageHeader } from '@/components/app/page-header'
import { mfaKey } from '@/features/auth/mfa'
import { supabase } from '@/lib/supabase'
import { Segmented } from '@/components/ui/segmented'
import { AppSettingsSection } from './app-settings-section'
import { ApplicationsSection } from './applications-section'
import { AvatarsSection, useAvatarQueueCount } from './avatars-section'
import { BookSuggestionsSection } from './book-suggestions-section'
import { CurriculumSection } from './curriculum-section'
import { ErrorsSection } from './errors-section'
import { OverviewSection } from './overview-section'
import { ReportsSection, useOpenReportCount } from './reports-section'
import { useAdminOverview } from './queries'
import { TeachersSection } from './teachers-section'
import { TestAccountsSection } from './test-accounts-section'
import { UsageSection } from './usage-section'
import { VisitorsSection } from './visitors-section'

const sections = [
  { value: 'genel', label: 'Genel' },
  { value: 'basvurular', label: 'Başvurular' },
  { value: 'ziyaretciler', label: 'Ziyaretçiler' },
  { value: 'kullanim', label: 'Kullanım' },
  { value: 'avatarlar', label: 'Avatarlar' },
  { value: 'ogretmenler', label: 'Öğretmenler' },
  { value: 'ayarlar', label: 'Ayarlar' },
  { value: 'mufredat', label: 'Müfredat' },
  { value: 'blog', label: 'Blog' },
  { value: 'bildirimler', label: 'Hata bildirimleri' },
  { value: 'kitaplar', label: 'Kitap önerileri' },
  { value: 'test', label: 'Test hesapları' },
  { value: 'hatalar', label: 'Hatalar' },
] as const

type Section = (typeof sections)[number]['value']

function isSection(value: string | null): value is Section {
  return sections.some((s) => s.value === value)
}

export default function AdminPage() {
  const [params, setParams] = useSearchParams()
  const raw = params.get('bolum')
  const section: Section = isSection(raw) ? raw : 'genel'
  const overview = useAdminOverview()
  const pending = overview.data?.teachers_pending ?? 0
  const reports = useOpenReportCount().data ?? 0
  const avatars = useAvatarQueueCount().data ?? 0
  const tabsRef = useRef<HTMLDivElement>(null)

  useEffect(() => {
    tabsRef.current?.querySelector('[aria-selected="true"]')?.scrollIntoView({ block: 'nearest', inline: 'nearest' })
  }, [section])

  function go(next: Section) {
    setParams(next === 'genel' ? {} : { bolum: next }, { replace: true, preventScrollReset: true })
  }

  return (
    <div>
      <PageHeader title="Yönetim" />
      <MfaWarning />
      <div ref={tabsRef} className="mb-5">
        <Segmented
          options={sections.map((s) =>
            s.value === 'basvurular'
              ? { ...s, badge: pending }
              : s.value === 'bildirimler'
                ? { ...s, badge: reports }
                : s.value === 'avatarlar'
                  ? { ...s, badge: avatars }
                  : { ...s },
          )}
          value={section}
          onChange={go}
          className="flex-wrap overflow-visible [&>button]:min-w-fit"
        />
      </div>
      <motion.div
        key={section}
        initial={{ opacity: 0, y: 6 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ duration: 0.16, ease: 'easeOut' }}
      >
        {section === 'genel' && <OverviewSection onNavigate={go} />}
        {section === 'basvurular' && <ApplicationsSection onNavigate={go} />}
        {section === 'ziyaretciler' && <VisitorsSection />}
        {section === 'kullanim' && <UsageSection />}
        {section === 'avatarlar' && <AvatarsSection />}
        {section === 'ogretmenler' && <TeachersSection />}
        {section === 'ayarlar' && <AppSettingsSection />}
        {section === 'mufredat' && <CurriculumSection />}
        {section === 'blog' && <BlogSection />}
        {section === 'bildirimler' && <ReportsSection />}
        {section === 'kitaplar' && <BookSuggestionsSection />}
        {section === 'test' && <TestAccountsSection />}
        {section === 'hatalar' && <ErrorsSection />}
      </motion.div>
    </div>
  )
}

function MfaWarning() {
  const factors = useQuery({
    queryKey: [...mfaKey, 'factors'],
    queryFn: async () => (await supabase.auth.mfa.listFactors()).data?.all ?? [],
  })
  if (factors.isPending || factors.data?.some((f) => f.status === 'verified')) return null
  return (
    <Link
      to="/app/ayarlar?bolum=hesap"
      className="mb-5 flex min-h-14 items-center gap-3 rounded-2xl border border-warning/40 bg-warning-soft px-4 py-3 text-sm hover:border-warning"
    >
      <ShieldAlert className="size-5 shrink-0 text-warning" />
      <span>
        <b className="block">İki adımlı doğrulama kapalı</b>
        Şifreniz ele geçirilirse yönetim paneline girilebilir. Ayarlar sayfasının Hesap bölümünden açın.
      </span>
    </Link>
  )
}
