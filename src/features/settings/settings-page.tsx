import { motion } from 'motion/react'
import { useSearchParams } from 'react-router'
import { PageHeader } from '@/components/app/page-header'
import { Segmented } from '@/components/ui/segmented'
import { useProfile } from '@/features/auth/session'
import { AccountCard } from './account-card'
import { AiKeyCard } from './ai-key-card'
import { AppearanceCard } from './appearance-card'
import { ChildrenCard } from './children-card'
import { GoalsCard } from './goals-card'
import { InstallCard } from './install-card'
import { MfaCard } from './mfa-card'
import { NotificationPrefsCard } from './notification-prefs-card'
import { ParentInviteCard } from './parent-invite-card'
import { ProfileCard } from './profile-card'
import { PushCard } from './push-card'
import { SecurityCard } from './security-card'
import { TeacherCard } from './teacher-card'
import { listVariants } from './ui'

const sections = [
  { value: 'profil', label: 'Profil' },
  { value: 'hesap', label: 'Hesap' },
  { value: 'bildirim', label: 'Bildirimler' },
  { value: 'uygulama', label: 'Uygulama' },
] as const

type Section = (typeof sections)[number]['value']

const isSection = (value: string | null): value is Section => sections.some((s) => s.value === value)

export default function SettingsPage() {
  const profile = useProfile()
  const [params, setParams] = useSearchParams()
  const raw = params.get('bolum')
  const section: Section = isSection(raw) ? raw : 'profil'

  return (
    <div className="max-w-2xl">
      <PageHeader title="Ayarlar" />
      <Segmented
        options={[...sections]}
        value={section}
        onChange={(next) => setParams(next === 'profil' ? {} : { bolum: next }, { replace: true, preventScrollReset: true })}
        className="mb-4"
      />
      <motion.div key={section} variants={listVariants} initial="hidden" animate="show" className="space-y-4">
        {section === 'profil' && (
          <>
            <ProfileCard />
            {profile.role === 'student' && (
              <>
                <GoalsCard />
                <ParentInviteCard />
              </>
            )}
            {profile.role === 'parent' && <ChildrenCard />}
            {profile.role === 'teacher' && <TeacherCard />}
          </>
        )}
        {section === 'hesap' && (
          <>
            <SecurityCard />
            {profile.role === 'teacher' && <MfaCard />}
            <AccountCard />
          </>
        )}
        {section === 'bildirim' && (
          <>
            <PushCard />
            <NotificationPrefsCard />
          </>
        )}
        {section === 'uygulama' && (
          <>
            <AppearanceCard />
            {profile.role === 'teacher' && profile.status === 'active' && <AiKeyCard />}
            <InstallCard />
          </>
        )}
      </motion.div>
    </div>
  )
}
