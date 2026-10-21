import {
  ArrowRightLeft,
  CircleHelp,
  Columns3,
  FlaskConical,
  Heading2,
  ImagePlus,
  Lightbulb,
  Link2,
  List,
  ListChecks,
  Milestone,
  Pilcrow,
  Sigma,
  Sparkles,
  Table2,
  Target,
  Video,
  type LucideIcon,
} from 'lucide-react'
import type { BlockInit, EditorBlock } from './model'

export type CatalogItem = {
  id: string
  label: string
  hint: string
  icon: LucideIcon
  make?: (ctx: { optionCount: number }) => BlockInit
}

export const catalog: CatalogItem[] = [
  { id: 'paragraf', label: 'Yazı', hint: 'Düz paragraf', icon: Pilcrow, make: () => ({ kind: 'md', text: '' }) },
  { id: 'baslik', label: 'Başlık', hint: 'İçindekilere girer, başında sayı varsa numaralı görünür', icon: Heading2, make: () => ({ kind: 'md', text: '## ' }) },
  { id: 'liste', label: 'Liste', hint: 'Madde işaretli liste', icon: List, make: () => ({ kind: 'md', text: '- ' }) },
  { id: 'tablo', label: 'Tablo', hint: 'Telefonda satırlar kart olur', icon: Table2, make: () => ({ kind: 'md', text: '| Sütun 1 | Sütun 2 |\n| --- | --- |\n|  |  |' }) },
  { id: 'formul-blok', label: 'Formül', hint: 'Ayrı satırda matematik (KaTeX)', icon: Sigma, make: () => ({ kind: 'md', text: '$$\n\n$$' }) },
  { id: 'gorsel', label: 'Görsel', hint: 'Bilgisayardan ya da telefondan yükle', icon: ImagePlus },
  { id: 'video', label: 'Video', hint: 'YouTube bağlantısı, başlık ve kanal kendiliğinden gelir', icon: Video, make: () => ({ kind: 'leaf', name: 'video', attrs: { url: '', baslik: '', kanal: '' } }) },
  { id: 'soru', label: 'Soru', hint: 'Seçenekli soru ve çözüm', icon: CircleHelp, make: ({ optionCount }) => ({ kind: 'box', name: 'soru', attrs: { cevap: 'A' }, text: Array.from({ length: optionCount }, (_, i) => `- ${'ABCDE'[i]}) `).join('\n') }) },
  { id: 'dene', label: 'Kendini dene', hint: 'Cevabı gizli soru kartları', icon: ListChecks, make: () => ({ kind: 'box', name: 'dene' }) },
  { id: 'ipucu', label: 'İpucu', hint: 'Vurgulu kısa not', icon: Lightbulb, make: () => ({ kind: 'box', name: 'ipucu' }) },
  { id: 'baglanti', label: 'Bağlantıyı kur', hint: 'Konuyu başka bilgiyle ilişkilendiren kutu', icon: Link2, make: () => ({ kind: 'box', name: 'baglanti' }) },
  { id: 'hedefler', label: 'Hedefler', hint: 'Numaralı kazanım kartları', icon: Target, make: () => ({ kind: 'box', name: 'hedefler' }) },
  { id: 'neden-sonuc', label: 'Neden, sonuç', hint: 'Ok ile bağlı kartlar', icon: ArrowRightLeft, make: () => ({ kind: 'box', name: 'neden-sonuc' }) },
  { id: 'cizelge', label: 'Çizelge', hint: 'Yıllara göre yerleşen çizgi', icon: Columns3, make: () => ({ kind: 'box', name: 'cizelge', attrs: { baslik: '' } }) },
  { id: 'zaman', label: 'Hayat çizgisi', hint: 'Dönemlere ayrılmış zaman çizelgesi', icon: Milestone, make: () => ({ kind: 'box', name: 'zaman', attrs: { baslik: '', donemler: '' } }) },
  { id: 'formul', label: 'Ek formülü', hint: 'Dil bilgisi için renkli ek örnekleri', icon: Sparkles, make: () => ({ kind: 'box', name: 'formul' }) },
  { id: 'cumle-lab', label: 'Cümle laboratuvarı', hint: 'Cümle öğelerini işaretleyen alıştırma', icon: Sparkles, make: () => ({ kind: 'box', name: 'cumle-lab' }) },
  { id: 'sim', label: 'Simülasyon', hint: 'Etkileşimli, öğrenci önce tahmin eder', icon: FlaskConical, make: () => ({ kind: 'leaf', name: 'sim', attrs: { tur: 'gaz' } }) },
]

const byName = new Map(catalog.map((c) => [c.id, c]))

export const IMAGE_LINE = /^!\[([^\]]*)\]\((\S+?)(?:\s+"(.*)")?\)$/

export function describe(block: EditorBlock): { label: string; icon: LucideIcon } {
  if (block.kind === 'md') {
    const text = block.text.trim()
    if (IMAGE_LINE.test(text)) return { label: 'Görsel', icon: ImagePlus }
    if (text.startsWith('#')) return { label: 'Başlık', icon: Heading2 }
    if (text.startsWith('|')) return { label: 'Tablo', icon: Table2 }
    if (text.startsWith('$$')) return { label: 'Formül', icon: Sigma }
    if (/^([-*+]|\d+[.)])\s/.test(text)) return { label: 'Liste', icon: List }
    return { label: 'Yazı', icon: Pilcrow }
  }
  const item = byName.get(block.name)
  return { label: item?.label ?? block.name, icon: item?.icon ?? Sparkles }
}

export function issuesOf(block: EditorBlock): string[] {
  if (block.kind === 'leaf') {
    if (block.name === 'video' && !(block.attrs.url || block.attrs.id)) return ['Video bağlantısı yok']
    return []
  }
  if (block.kind === 'md') {
    const image = IMAGE_LINE.exec(block.text.trim())
    return image && !image[1].trim() ? ['Görselin alt metni boş'] : []
  }
  if (block.name === 'soru') {
    const options = block.text.split('\n').filter((l) => /^(?:[-*]\s+)?[A-E]\)/.test(l.trim()))
    const issues: string[] = []
    if (options.length < 2) issues.push('En az iki şık gerekli')
    if (options.some((l) => !l.replace(/^(?:[-*]\s+)?[A-E]\)\s*/, '').trim())) issues.push('Boş şık var')
    const answer = 'ABCDE'.indexOf((block.attrs.cevap || 'A').toUpperCase())
    if (answer >= options.length) issues.push('Doğru cevap şıklar arasında değil')
    return issues
  }
  return []
}
