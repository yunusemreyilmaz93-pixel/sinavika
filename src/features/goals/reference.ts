import type { ExamKind } from '@/lib/exam'

export type Nets = Record<string, number>
// subjects: sınav dersleri, bölüm netinin hangi derslerin toplamı olduğu
export type RefPart = { label: string; value: number; subjects: string[] }
export type RefTarget = { kind: ExamKind; total: number; parts: RefPart[] }

type Entry = [key: string, label: string, subjects: string[]]

const TYT: Entry[] = [
  ['tyt_trk', 'Türkçe', ['Türkçe']],
  ['tyt_mat', 'Matematik', ['Temel Matematik']],
  ['tyt_sos', 'Sosyal', ['Tarih', 'Coğrafya', 'Felsefe', 'Din Kültürü']],
  ['tyt_fen', 'Fen', ['Fizik', 'Kimya', 'Biyoloji']],
]

const AYT_ENTRY: Record<string, Entry> = {
  ayt_mat: ['ayt_mat', 'Matematik', ['Matematik']],
  ayt_fiz: ['ayt_fiz', 'Fizik', ['Fizik']],
  ayt_kim: ['ayt_kim', 'Kimya', ['Kimya']],
  ayt_bio: ['ayt_bio', 'Biyoloji', ['Biyoloji']],
  ayt_tde: ['ayt_tde', 'Edebiyat', ['Türk Dili ve Edebiyatı']],
  ayt_trh1: ['ayt_trh1', 'Tarih 1', ['Tarih-1']],
  ayt_cog1: ['ayt_cog1', 'Coğrafya 1', ['Coğrafya-1']],
  ayt_trh2: ['ayt_trh2', 'Tarih 2', ['Tarih-2']],
  ayt_cog2: ['ayt_cog2', 'Coğrafya 2', ['Coğrafya-2']],
  ayt_fel: ['ayt_fel', 'Felsefe', ['Felsefe Grubu']],
  ayt_din: ['ayt_din', 'Din', ['Din Kültürü']],
}

// Puan türüne göre hangi AYT derslerinin hedefe sayıldığı
const AYT_BY_TYPE: Record<string, string[]> = {
  SAY: ['ayt_mat', 'ayt_fiz', 'ayt_kim', 'ayt_bio'],
  EA: ['ayt_tde', 'ayt_trh1', 'ayt_cog1', 'ayt_mat'],
  SÖZ: ['ayt_tde', 'ayt_trh1', 'ayt_cog1', 'ayt_trh2', 'ayt_cog2', 'ayt_fel', 'ayt_din'],
}

export const round2 = (n: number) => Math.round(n * 100) / 100

function target(kind: ExamKind, entries: Entry[], nets: Nets): RefTarget | null {
  const parts = entries
    .filter(([key]) => typeof nets[key] === 'number')
    .map(([key, label, subjects]) => ({ label, value: nets[key], subjects }))
  if (!parts.length) return null
  return {
    kind,
    total: round2(parts.reduce((sum, p) => sum + p.value, 0)),
    parts,
  }
}

// Son yerleşen adayın netlerinden deneme türüne göre referans net hedefleri çıkarır
export function referenceTargets(scoreType: string, nets: Nets | null | undefined): RefTarget[] {
  if (!nets) return []
  const result: (RefTarget | null)[] = [target('TYT', TYT, nets)]
  const ayt = AYT_BY_TYPE[scoreType]
  if (ayt)
    result.push(
      target(
        'AYT',
        ayt.map((k) => AYT_ENTRY[k]),
        nets,
      ),
    )
  if (scoreType === 'DİL') result.push(target('YDT', [['ydt', 'Yabancı dil', ['Yabancı Dil']]], nets))
  return result.filter((t): t is RefTarget => t !== null)
}

export function remaining(targetNet: number, lastNet: number | null | undefined) {
  return lastNet == null ? null : Math.max(0, round2(targetNet - lastNet))
}

export const scoreTypeOfField: Record<string, string> = {
  say: 'SAY',
  ea: 'EA',
  soz: 'SÖZ',
  dil: 'DİL',
}
