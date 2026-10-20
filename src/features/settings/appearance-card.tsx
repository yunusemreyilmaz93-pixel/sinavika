import { Palette } from 'lucide-react'
import { Segmented } from '@/components/ui/segmented'
import { useTheme, type ThemeChoice } from '@/lib/theme'
import { SettingsCard } from './ui'

const options: { value: ThemeChoice; label: string }[] = [
  { value: 'system', label: 'Sistem' },
  { value: 'light', label: 'Açık' },
  { value: 'dark', label: 'Koyu' },
]

export function AppearanceCard() {
  const [theme, setTheme] = useTheme()
  return (
    <SettingsCard
      icon={Palette}
      title="Görünüm"
      description={theme === 'system' ? 'Cihazının açık ya da koyu ayarına uyar.' : 'Bu cihazda seçtiğin tema kullanılır.'}
    >
      <Segmented options={options} value={theme} onChange={setTheme} className="[&>button]:h-10" />
    </SettingsCard>
  )
}
