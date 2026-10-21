import { ArchiveSection, DeleteSection } from './danger-section'
import { ExamInfoForm } from './exam-info-form'
import { ParentsSection } from './parents-section'
import { PasswordSection } from './password-section'
import { ReportLinksSection } from './report-links-section'
import type { StudentDetail } from './queries'

export function SettingsTab({ student }: { student: StudentDetail }) {
  return (
    <div className="flex flex-col gap-4 sm:gap-5 lg:grid lg:grid-cols-2 lg:items-start">
      <div className="contents lg:flex lg:flex-col lg:gap-5">
        <div className="order-1 lg:order-none">
          <ExamInfoForm key={student.id} student={student} />
        </div>
        <div className="order-3 lg:order-none">
          <PasswordSection key={student.id} student={student} />
        </div>
      </div>
      <div className="contents lg:flex lg:flex-col lg:gap-5">
        <div className="order-2 lg:order-none">
          <ParentsSection student={student} />
        </div>
        <div className="order-3 lg:order-none">
          <ReportLinksSection student={student} />
        </div>
        <div className="order-4 lg:order-none">
          <ArchiveSection student={student} />
        </div>
        <div className="order-5 lg:order-none">
          <DeleteSection student={student} />
        </div>
      </div>
    </div>
  )
}
