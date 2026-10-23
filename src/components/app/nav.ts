import {
  BarChart3,
  Bell,
  BookMarked,
  BookOpenCheck,
  CalendarRange,
  ClipboardList,
  House,
  LayoutGrid,
  LayoutTemplate,
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
  type LucideIcon,
} from 'lucide-react'
import type { Profile } from '@/features/auth/session'

export type NavItem = { to: string; label: string; icon: LucideIcon; end?: boolean; mobile?: boolean }

export function navFor(profile: Profile): NavItem[] {
  if (profile.role === 'student') {
    return [
      { to: '/app', label: 'Bugün', icon: House, end: true, mobile: true },
      { to: '/app/plan', label: 'Plan', icon: CalendarRange, mobile: true },
      { to: '/app/sayac', label: 'Sayaç', icon: Timer },
      { to: '/app/denemeler', label: 'Denemeler', icon: Trophy, mobile: true },
      { to: '/app/ilerleme', label: 'İlerleme', icon: BarChart3 },
      { to: '/app/konular', label: 'Konular', icon: BookOpenCheck },
      { to: '/app/okuma', label: 'Okuma', icon: BookMarked },
      { to: '/app/yanlislar', label: 'Yanlışlar', icon: NotebookTabs },
      { to: '/app/notlar', label: 'Notlar', icon: NotebookPen },
      { to: '/app/mesajlar', label: 'Mesajlar', icon: MessageCircle },
      { to: '/app/duyurular', label: 'Duyurular', icon: Megaphone },
      { to: '/app/bildirimler', label: 'Bildirimler', icon: Bell },
      { to: '/app/ayarlar', label: 'Ayarlar', icon: Settings },
    ]
  }
  if (profile.role === 'parent') {
    return [
      { to: '/app', label: 'Özet', icon: House, end: true, mobile: true },
      { to: '/app/ilerleme', label: 'İlerleme', icon: BarChart3, mobile: true },
      { to: '/app/denemeler', label: 'Denemeler', icon: Trophy, mobile: true },
      { to: '/app/plan', label: 'Plan', icon: CalendarRange },
      { to: '/app/konular', label: 'Konular', icon: BookOpenCheck },
      { to: '/app/okuma', label: 'Okuma', icon: BookMarked },
      { to: '/app/yanlislar', label: 'Yanlışlar', icon: NotebookTabs },
      { to: '/app/notlar', label: 'Notlar', icon: NotebookPen },
      { to: '/app/mesajlar', label: 'Mesajlar', icon: MessageCircle, mobile: true },
      { to: '/app/duyurular', label: 'Duyurular', icon: Megaphone },
      { to: '/app/bildirimler', label: 'Bildirimler', icon: Bell },
      { to: '/app/ayarlar', label: 'Ayarlar', icon: Settings },
    ]
  }
  const items: NavItem[] = [
    { to: '/app', label: 'Öğrenciler', icon: LayoutGrid, end: true, mobile: true },
    { to: '/app/planlayici', label: 'Planlayıcı', icon: ClipboardList, mobile: true },
    { to: '/app/sablonlar', label: 'Şablonlar', icon: LayoutTemplate },
    { to: '/app/mufredat', label: 'Müfredat', icon: Library },
    { to: '/app/mesajlar', label: 'Mesajlar', icon: MessageCircle, mobile: true },
    { to: '/app/duyurular', label: 'Duyurular', icon: Megaphone },
    { to: '/app/davetler', label: 'Davetler', icon: UserPlus, mobile: true },
    { to: '/app/bildirimler', label: 'Bildirimler', icon: Bell },
  ]
  if (profile.status === 'active') items.splice(6, 0, { to: '/app/asistan', label: 'Asistan', icon: Sparkles })
  if (profile.is_admin) items.push({ to: '/app/yonetim', label: 'Yönetim', icon: ShieldCheck })
  items.push({ to: '/app/ayarlar', label: 'Ayarlar', icon: Settings })
  return items
}
