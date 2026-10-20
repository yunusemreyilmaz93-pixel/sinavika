import type { LucideIcon } from 'lucide-react'
import { motion } from 'motion/react'
import type { ReactNode } from 'react'
import { toast } from 'sonner'
import { Card, CardBody, CardHeader } from '@/components/ui/card'

export const listVariants = { show: { transition: { staggerChildren: 0.04 } } }
const itemVariants = { hidden: { opacity: 0, y: 8 }, show: { opacity: 1, y: 0, transition: { duration: 0.25 } } }

export function SettingsCard({
  icon: Icon,
  title,
  description,
  action,
  children,
}: {
  icon: LucideIcon
  title: string
  description?: ReactNode
  action?: ReactNode
  children: ReactNode
}) {
  return (
    <motion.section variants={itemVariants}>
      <Card>
        <CardHeader
          title={
            <span className="flex items-center gap-2">
              <Icon className="size-[18px] shrink-0 text-primary" />
              {title}
            </span>
          }
          description={description}
          action={action}
        />
        <CardBody>{children}</CardBody>
      </Card>
    </motion.section>
  )
}

export async function copyText(text: string, success: string) {
  try {
    await navigator.clipboard.writeText(text)
    toast.success(success)
  } catch {
    toast.error('Kopyalanamadı, elle seçip kopyala')
  }
}
