// Yaklaşık LGS ve YKS puanı. Resmi puan o yıl sınava girenlerin ortalama ve standart sapmasıyla hesaplanır,
// bu yüzden buradaki değer bir tahmindir. Arayüzde her zaman "yaklaşık" yazılır. Tam netle 500 puana ulaşılır.

export type ScoreType = 'LGS' | 'TYT' | 'SAY' | 'EA' | 'SÖZ' | 'DİL'

// Ders kimliği başına net
export type Nets = Record<string, number>

const LGS_BASE = 194.752
// Türkçe, matematik ve fen 4, diğerleri 1 ağırlıklıdır. Tam net 270 ağırlıklı nettir
const LGS_WEIGHT: Record<string, number> = { 'lgs-tr': 4, 'lgs-mat': 4, 'lgs-fen': 4, 'lgs-ink': 1, 'lgs-din': 1, 'lgs-ing': 1 }
const LGS_FACTOR = (500 - LGS_BASE) / 270
const clampNet = (n: number) => Math.max(0, n)

const TYT_GROUP: Record<string, 'tr' | 'mat' | 'sos' | 'fen'> = {
  'tyt-tr': 'tr',
  'tyt-mat': 'mat',
  'tyt-tar': 'sos',
  'tyt-cog': 'sos',
  'tyt-fel': 'sos',
  'tyt-din': 'sos',
  'tyt-fiz': 'fen',
  'tyt-kim': 'fen',
  'tyt-bio': 'fen',
}

type YksType = Exclude<ScoreType, 'LGS' | 'TYT'>
type Formula = { base: number; tyt: Record<'tr' | 'mat' | 'sos' | 'fen', number>; ayt: Record<string, number> }

// YKS katsayıları MEB OGM Materyal "YKS Puan Hesaplama Motoru"ndan alınmıştır (ogmmateryal.eba.gov.tr)
const TYT: Formula = { base: 144.79811555479816, tyt: { tr: 2.93041546699554, sos: 3.0192159356054, mat: 2.93041546699554, fen: 3.0192159356054 }, ayt: {} }
const YKS: Record<YksType, Formula> = {
  SAY: {
    base: 133.2435483081,
    tyt: { tr: 1.21029629058, sos: 1.24697193574, mat: 1.21029629058, fen: 1.24697193574 },
    ayt: { 'ayt-mat': 2.7506733877, 'ayt-fiz': 2.6196889407, 'ayt-kim': 2.8212034746, 'ayt-bio': 2.8212034746 },
  },
  EA: {
    base: 130.2552640866,
    tyt: { tr: 1.2422067992, sos: 1.27984942948, mat: 1.2422067992, fen: 1.27984942948 },
    ayt: { 'ayt-edb': 2.8231972709, 'ayt-tar1': 2.6349841195, 'ayt-cog1': 3.1368858565, 'ayt-mat': 2.8231972709 },
  },
  SÖZ: {
    base: 127.3534642495,
    tyt: { tr: 1.25195578313, sos: 1.28989383716, mat: 1.25195578313, fen: 1.28989383716 },
    ayt: {
      'ayt-edb': 2.8453540526,
      'ayt-tar1': 2.6556637825,
      'ayt-cog1': 3.1615045029,
      'ayt-tar2': 2.7591312025,
      'ayt-cog2': 2.7591312025,
      'ayt-fel': 2.8453540526,
      'ayt-din': 3.1615045029,
    },
  },
  DİL: { base: 102.3921277461, tyt: { tr: 1.3252053952, sos: 1.36536313446, mat: 1.3252053952, fen: 1.36536313446 }, ayt: { 'ydt-dil': 3.0118304436 } },
}

function tytGroups(nets: Nets) {
  const g = { tr: 0, mat: 0, sos: 0, fen: 0 }
  for (const [id, group] of Object.entries(TYT_GROUP)) g[group] += nets[id] ?? 0
  return g
}

// TYT puanı için Türkçe ya da matematikten en az 0,5 net gerekir
const tytValid = (g: ReturnType<typeof tytGroups>) => g.tr >= 0.5 || g.mat >= 0.5

export function lgsScore(nets: Nets) {
  const weighted = Object.entries(LGS_WEIGHT).reduce((sum, [id, w]) => sum + clampNet(nets[id] ?? 0) * w, 0)
  return round(LGS_BASE + weighted * LGS_FACTOR)
}

export function tytScore(nets: Nets) {
  const g = tytGroups(nets)
  if (!tytValid(g)) return 0
  return round(TYT.base + g.tr * TYT.tyt.tr + g.sos * TYT.tyt.sos + g.mat * TYT.tyt.mat + g.fen * TYT.tyt.fen)
}

// Yerleştirme puanı. Diploma notu verilirse OBP katkısı (diploma x 0,6) eklenir. TYT geçersizse ham puan 100 sayılır
export function yksScore(type: YksType, nets: Nets, diploma?: number | null) {
  const f = YKS[type]
  const g = tytGroups(nets)
  const ayt = Object.entries(f.ayt).reduce((sum, [id, w]) => sum + (nets[id] ?? 0) * w, 0)
  const raw = tytValid(g) ? f.base + g.tr * f.tyt.tr + g.sos * f.tyt.sos + g.mat * f.tyt.mat + g.fen * f.tyt.fen + ayt : 100
  const obp = diploma && diploma >= 50 && diploma <= 100 ? diploma * 0.6 : 0
  return round(raw + obp)
}

// Öğrencinin alanına göre hangi yerleştirme puanlarının hesaplanacağı
export function scoreTypesFor(field: string | null): YksType[] {
  if (field === 'say') return ['SAY']
  if (field === 'ea') return ['EA']
  if (field === 'soz') return ['SÖZ']
  if (field === 'dil') return ['DİL']
  return ['SAY', 'EA', 'SÖZ']
}

// Bir puan türü için gereken AYT ya da YDT netinin girilmiş olup olmadığı
export function hasPartFor(type: YksType, nets: Nets) {
  return Object.keys(YKS[type].ayt).some((id) => (nets[id] ?? 0) >= 0.5)
}

function round(n: number) {
  return Math.round(n * 100) / 100
}

export const scoreFormat = new Intl.NumberFormat('tr-TR', { minimumFractionDigits: 0, maximumFractionDigits: 0 })
