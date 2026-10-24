import { useCallback, useEffect, useState } from 'react'
import { ExamsSection } from './exams-section'
import { FaqSection } from './faq-section'
import { Hero } from './hero'
import { HowItWorks } from './how-it-works'
import { LearningSection } from './learning-section'
import { OpenContentSection } from './open-content-section'
import { scrollToHash, sectionLinks, type Role, type SectionLink } from './primitives'
import { RolesSection } from './showcase'
import { ClosingCta, SiteFooter } from './site-footer'
import { SiteHeader } from './site-header'
import { WhyFree } from './why-free'
import './landing.css'

const TITLE = 'Yolumnet · LGS ve YKS koçluğu'

function roleFromHash(): Role {
  if (typeof window === 'undefined') return 'teacher'
  return sectionLinks.find((l) => l.href === window.location.hash)?.role ?? 'teacher'
}

export default function LandingPage() {
  const [role, setRole] = useState<Role>(roleFromHash)

  useEffect(() => {
    const previous = document.title
    document.title = TITLE
    return () => {
      document.title = previous
    }
  }, [])

  const navigate = useCallback((link: SectionLink) => {
    if (link.role) setRole(link.role)
    requestAnimationFrame(() => scrollToHash(link.href))
  }, [])

  return (
    <div className="relative min-h-dvh overflow-x-clip">
      <a
        href="#icerik"
        onClick={(e) => {
          e.preventDefault()
          document.getElementById('icerik')?.focus()
        }}
        className="sr-only z-50 rounded-lg bg-surface px-4 py-2 font-semibold shadow-pop focus:not-sr-only focus:fixed focus:top-3 focus:left-3"
      >
        İçeriğe geç
      </a>
      <div
        aria-hidden
        className="grid-paper pointer-events-none absolute inset-x-0 top-0 h-[1100px] [mask-image:linear-gradient(to_bottom,black_45%,transparent)] lg:h-[960px]"
      />
      <SiteHeader onNavigate={navigate} />
      <main id="icerik" tabIndex={-1} className="relative outline-none">
        <Hero />
        <div className="defer-section">
          <ExamsSection />
        </div>
        <div className="defer-section">
          <RolesSection role={role} onRoleChange={setRole} />
        </div>
        <div className="defer-section">
          <LearningSection />
        </div>
        <div className="defer-section">
          <OpenContentSection />
        </div>
        <div className="defer-section">
          <HowItWorks />
        </div>
        <div className="defer-section">
          <WhyFree />
        </div>
        <div className="defer-section">
          <FaqSection />
        </div>
        <ClosingCta />
      </main>
      <SiteFooter onNavigate={navigate} />
    </div>
  )
}
