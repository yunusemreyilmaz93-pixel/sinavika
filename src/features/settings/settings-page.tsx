import { motion } from 'motion/react'
import { PageHeader } from '@/components/app/page-header'
import { useProfile } from '@/features/auth/session'
import { AccountCard } from './account-card'
import { AiKeyCard } from './ai-key-card'
import { AppearanceCard } from './appearance-card'
import { ChildrenCard } from './children-card'
import { GoalsCard } from './goals-card'
import { InstallCard } from './install-card'
import { ParentInviteCard } from './parent-invite-card'
import { ProfileCard } from './profile-card'
import { PushCard } from './push-card'
import { SecurityCard } from './security-card'
import { TeacherCard } from './teacher-card'
import { listVariants } from './ui'

export default function SettingsPage() {
  const profile = useProfile()
  return (
    <div className="max-w-2xl">
      <PageHeader title="Ayarlar" />
      <motion.div variants={listVariants} initial="hidden" animate="show" className="space-y-4">
        <ProfileCard />
        {profile.role === 'student' && (
          <>
            <GoalsCard />
            <ParentInviteCard />
          </>
        )}
        {profile.role === 'parent' && <ChildrenCard />}
        {profile.role === 'teacher' && <TeacherCard />}
        {profile.role === 'teacher' && profile.status === 'active' && <AiKeyCard />}
        <SecurityCard />
        <PushCard />
        <AppearanceCard />
        <InstallCard />
        <AccountCard />
      </motion.div>
    </div>
  )
}
