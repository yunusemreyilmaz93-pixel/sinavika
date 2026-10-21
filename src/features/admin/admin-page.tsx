import { motion } from 'motion/react'
import { useEffect, useRef } from 'react'
import { useSearchParams } from 'react-router'
import { PageHeader } from '@/components/app/page-header'
import { Segmented } from '@/components/ui/segmented'
import { AppSettingsSection } from './app-settings-section'
import { ApplicationsSection } from './applications-section'
import { BookSuggestionsSection } from './book-suggestions-section'
import { CurriculumSection } from './curriculum-section'
import { ErrorsSection } from './errors-section'
import { OverviewSection } from './overview-section'
import { ReportsSection, useOpenReportCount } from './reports-section'
import { useAdminOverview } from './queries'
import { TeachersSection } from './teachers-section'
import { TestAccountsSection } from './test-accounts-section'

const sections = [
  { value: 'genel', label: 'Genel' },
  { value: 'basvurular', label: 'Başvurular' },
  { value: 'ogretmenler', label: 'Öğretmenler' },
  { value: 'ayarlar', label: 'Ayarlar' },
  { value: 'mufredat', label: 'Müfredat' },
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
      <div ref={tabsRef} className="mb-5">
        <Segmented
          options={sections.map((s) => (s.value === 'basvurular' ? { ...s, badge: pending } : s.value === 'bildirimler' ? { ...s, badge: reports } : { ...s }))}
          value={section}
          onChange={go}
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
          {section === 'ogretmenler' && <TeachersSection />}
          {section === 'ayarlar' && <AppSettingsSection />}
          {section === 'mufredat' && <CurriculumSection />}
          {section === 'bildirimler' && <ReportsSection />}
          {section === 'kitaplar' && <BookSuggestionsSection />}
          {section === 'test' && <TestAccountsSection />}
          {section === 'hatalar' && <ErrorsSection />}
        </motion.div>
    </div>
  )
}
