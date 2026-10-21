import type { Subject } from "@/lib/exam";

export type ParsedRow = {
  subject: Subject;
  c: number;
  w: number;
  b: number | null;
};

// Harfleri ASCII'ye indirir, ondalık ayracını virgülde birleştirir, kalan işaretleri boşluğa çevirir
const fold = (s: string) =>
  s
    .toLocaleLowerCase("tr-TR")
    .replace(/ç/g, "c")
    .replace(/ğ/g, "g")
    .replace(/ı/g, "i")
    .replace(/ö/g, "o")
    .replace(/ş/g, "s")
    .replace(/ü/g, "u")
    .replace(/(\d)\.(\d)/g, "$1,$2")
    .replace(/[^a-z0-9,]+/g, " ")
    .trim();

const EXTRA: Record<string, string[]> = {
  "Türk Dili ve Edebiyatı": ["edebiyat", "tde"],
  "Temel Matematik": ["matematik"],
  "Fen Bilimleri": ["fen"],
  "T.C. İnkılap Tarihi ve Atatürkçülük": ["inkilap"],
  "Din Kültürü ve Ahlak Bilgisi": ["din kulturu", "din"],
  "Din Kültürü": ["din"],
  "Felsefe Grubu": ["felsefe"],
  "Yabancı Dil": ["ingilizce", "almanca", "fransizca", "arapca", "rusca"],
};

// Sözcük sınırı gözeterek ders adını arar, en uzun ad kazanır. Adın sonrasındaki metni döndürür
function findSubject(line: string, subjects: Subject[]) {
  const text = ` ${fold(line)} `;
  let best: { subject: Subject; rest: string; len: number } | null = null;
  for (const subject of subjects) {
    for (const alias of [subject.name, ...(EXTRA[subject.name] ?? [])].map(
      fold,
    )) {
      const at = alias ? text.indexOf(` ${alias} `) : -1;
      if (at === -1 || (best && alias.length <= best.len)) continue;
      best = {
        subject,
        rest: text.slice(at + alias.length + 1),
        len: alias.length,
      };
    }
  }
  return best;
}

function rowFrom(subject: Subject, rest: string): ParsedRow | null {
  // Ondalıklı sayılar net sütunudur, yalnızca tam sayılar doğru, yanlış, boş olabilir
  const ints = (rest.match(/\d+(?:,\d+)?/g) ?? [])
    .filter((n) => !n.includes(","))
    .map(Number);
  const qc = subject.question_count;
  const nums = ints.length >= 3 && ints[0] === qc ? ints.slice(1) : ints;
  if (nums.length < 2) return null;
  const [c, w, b] = nums;
  if (c + w > qc) return null;
  return { subject, c, w, b: b !== undefined && c + w + b === qc ? b : null };
}

export function parseKarne(text: string, subjects: Subject[]): ParsedRow[] {
  const found = new Map<string, ParsedRow>();
  for (const line of text.split(/\r?\n/)) {
    const hit = findSubject(line, subjects);
    if (!hit || found.has(hit.subject.id)) continue;
    const row = rowFrom(hit.subject, hit.rest);
    if (row) found.set(hit.subject.id, row);
  }
  return subjects.filter((s) => found.has(s.id)).map((s) => found.get(s.id)!);
}
