import { Palette } from 'lucide-react'
import { Check } from 'lucide-react'
import { Segmented } from '@/components/ui/segmented'
import { toast } from 'sonner'
import { useAuth, useProfile } from '@/features/auth/session'
import { accents, useAccent, type AccentChoice } from '@/lib/accent'
import { cn } from '@/lib/cn'
import { errorMessage, supabase, unwrap } from '@/lib/supabase'
import { useTheme, type ThemeChoice } from '@/lib/theme'
import { SettingsCard } from './ui'

const options: { value: ThemeChoice; label: string }[] = [
  { value: 'system', label: 'Sistem' },
  { value: 'light', label: 'Açık' },
  { value: 'dark', label: 'Koyu' },
]

export function AppearanceCard() {
  const [theme, setTheme] = useTheme()
  const [accent, setAccent] = useAccent()
  const profile = useProfile()
  const { refresh } = useAuth()
  const chooseAccent = async (next: AccentChoice) => {
    setAccent(next)
    try {
      unwrap(await supabase.from('profiles').update({ accent: next === 'green' ? null : next }).eq('id', profile.id))
      await refresh()
    } catch (error) {
      toast.error(errorMessage(error))
    }
  }
  return (
    <SettingsCard
      icon={Palette}
      title="Görünüm"
      description={theme === 'system' ? 'Cihazın açık ya da koyu ayarına uyar.' : 'Bu cihazda seçilen tema kullanılır.'}
    >
      <Segmented options={options} value={theme} onChange={setTheme} className="[&>button]:h-10" />
      <div role="radiogroup" aria-label="Vurgu rengi" className="mt-4 flex flex-wrap gap-2">
        {accents.map((a) => (
          <button
            key={a.value}
            type="button"
            role="radio"
            aria-checked={accent === a.value}
            aria-label={a.label}
            title={a.label}
            onClick={() => void chooseAccent(a.value)}
            className={cn(
              'grid size-11 place-items-center rounded-full border-2 transition-transform active:scale-95',
              accent === a.value ? 'border-fg' : 'border-transparent hover:border-line-strong',
            )}
          >
            <span data-accent={a.value === 'green' ? undefined : a.value} className="grid size-7 place-items-center rounded-full bg-primary text-primary-fg">
              {accent === a.value && <Check className="size-4" aria-hidden />}
            </span>
          </button>
        ))}
      </div>
    </SettingsCard>
  )
}
