import {
  BarChart3,
  Bell,
  BookMarked,
  BookOpenCheck,
  CalendarRange,
  ClipboardList,
  Grid3x3,
  House,
  LayoutGrid,
  LayoutTemplate,
  ListChecks,
  Library,
  Megaphone,
  MessageCircle,
  NotebookPen,
  NotebookTabs,
  Settings,
  ShieldCheck,
  Sparkles,
  Timer,
  Trophy,
  UserPlus,
  Video,
  type LucideIcon,
} from 'lucide-react'
import type { Profile } from '@/features/auth/session'

export type NavGroup = 'Günlük' | 'Öğrenme' | 'Takip' | 'Planlama' | 'İletişim' | 'Araçlar' | 'Çocuğum' | 'Hesap'
export type NavItem = { to: string; label: string; icon: LucideIcon; end?: boolean; mobile?: boolean; group: NavGroup }

// Menüde grupların sırası. Hesap grubu kenar çubuğunun en altında ayrı durur
export const groupOrder: NavGroup[] = ['Günlük', 'Çocuğum', 'Takip', 'Planlama', 'Öğrenme', 'İletişim', 'Araçlar']

export function navFor(profile: Profile): NavItem[] {
  if (profile.role === 'student') {
    return [
      { to: '/app', label: 'Bugün', icon: House, end: true, mobile: true, group: 'Günlük' },
      { to: '/app/plan', label: 'Plan', icon: CalendarRange, mobile: true, group: 'Günlük' },
      { to: '/app/sayac', label: 'Sayaç', icon: Timer, group: 'Günlük' },
      { to: '/app/denemeler', label: 'Denemeler', icon: Trophy, mobile: true, group: 'Takip' },
      { to: '/app/ilerleme', label: 'İlerleme', icon: BarChart3, group: 'Takip' },
      { to: '/app/konular', label: 'Konular', icon: BookOpenCheck, group: 'Öğrenme' },
      { to: '/app/testler', label: 'Testler', icon: ListChecks, group: 'Öğrenme' },
      { to: '/app/okuma', label: 'Okuma', icon: BookMarked, group: 'Öğrenme' },
      { to: '/app/yanlislar', label: 'Yanlışlar', icon: NotebookTabs, group: 'Öğrenme' },
      { to: '/app/notlar', label: 'Notlar', icon: NotebookPen, group: 'İletişim' },
      { to: '/app/mesajlar', label: 'Mesajlar', icon: MessageCircle, group: 'İletişim' },
      { to: '/app/gorusmeler', label: 'Görüşmeler', icon: Video, group: 'İletişim' },
      { to: '/app/duyurular', label: 'Duyurular', icon: Megaphone, group: 'İletişim' },
      { to: '/app/bildirimler', label: 'Bildirimler', icon: Bell, group: 'İletişim' },
      { to: '/app/ayarlar', label: 'Ayarlar', icon: Settings, group: 'Hesap' },
    ]
  }
  if (profile.role === 'parent') {
    return [
      { to: '/app', label: 'Özet', icon: House, end: true, mobile: true, group: 'Çocuğum' },
      { to: '/app/ilerleme', label: 'İlerleme', icon: BarChart3, mobile: true, group: 'Çocuğum' },
      { to: '/app/denemeler', label: 'Denemeler', icon: Trophy, mobile: true, group: 'Çocuğum' },
      { to: '/app/plan', label: 'Plan', icon: CalendarRange, group: 'Çocuğum' },
      { to: '/app/konular', label: 'Konular', icon: BookOpenCheck, group: 'Çocuğum' },
      { to: '/app/okuma', label: 'Okuma', icon: BookMarked, group: 'Çocuğum' },
      { to: '/app/yanlislar', label: 'Yanlışlar', icon: NotebookTabs, group: 'Çocuğum' },
      { to: '/app/notlar', label: 'Notlar', icon: NotebookPen, group: 'İletişim' },
      { to: '/app/mesajlar', label: 'Mesajlar', icon: MessageCircle, mobile: true, group: 'İletişim' },
      { to: '/app/duyurular', label: 'Duyurular', icon: Megaphone, group: 'İletişim' },
      { to: '/app/bildirimler', label: 'Bildirimler', icon: Bell, group: 'İletişim' },
      { to: '/app/ayarlar', label: 'Ayarlar', icon: Settings, group: 'Hesap' },
    ]
  }
  const items: NavItem[] = [
    { to: '/app', label: 'Öğrenciler', icon: LayoutGrid, end: true, mobile: true, group: 'Takip' },
    { to: '/app/planlayici', label: 'Planlayıcı', icon: ClipboardList, mobile: true, group: 'Planlama' },
    { to: '/app/sinif', label: 'Sınıf haritası', icon: Grid3x3, group: 'Takip' },
    { to: '/app/sablonlar', label: 'Şablonlar', icon: LayoutTemplate, group: 'Planlama' },
    { to: '/app/mufredat', label: 'Müfredat', icon: Library, group: 'Planlama' },
    { to: '/app/testler', label: 'Testler', icon: ListChecks, group: 'Planlama' },
    { to: '/app/mesajlar', label: 'Mesajlar', icon: MessageCircle, mobile: true, group: 'İletişim' },
    { to: '/app/gorusmeler', label: 'Görüşmeler', icon: Video, group: 'İletişim' },
    { to: '/app/duyurular', label: 'Duyurular', icon: Megaphone, group: 'İletişim' },
    { to: '/app/davetler', label: 'Davetler', icon: UserPlus, mobile: true, group: 'İletişim' },
    { to: '/app/bildirimler', label: 'Bildirimler', icon: Bell, group: 'İletişim' },
  ]
  if (profile.status === 'active') items.splice(9, 0, { to: '/app/asistan', label: 'Asistan', icon: Sparkles, group: 'Araçlar' })
  if (profile.is_admin) items.push({ to: '/app/yonetim', label: 'Yönetim', icon: ShieldCheck, group: 'Araçlar' })
  items.push({ to: '/app/ayarlar', label: 'Ayarlar', icon: Settings, group: 'Hesap' })
  return items
}
