import type { ExamKind } from "@/lib/exam";

export type Nets = Record<string, number>;
export type RefPart = { label: string; value: number };
export type RefTarget = { kind: ExamKind; total: number; parts: RefPart[] };

const TYT: [string, string][] = [
  ["tyt_trk", "Türkçe"],
  ["tyt_sos", "Sosyal"],
  ["tyt_mat", "Matematik"],
  ["tyt_fen", "Fen"],
];

const AYT_LABEL: Record<string, string> = {
  ayt_mat: "Matematik",
  ayt_fiz: "Fizik",
  ayt_kim: "Kimya",
  ayt_bio: "Biyoloji",
  ayt_tde: "Edebiyat",
  ayt_trh1: "Tarih 1",
  ayt_cog1: "Coğrafya 1",
  ayt_trh2: "Tarih 2",
  ayt_cog2: "Coğrafya 2",
  ayt_fel: "Felsefe",
  ayt_din: "Din",
};

// Puan türüne göre hangi AYT derslerinin hedefe sayıldığı
const AYT_BY_TYPE: Record<string, string[]> = {
  SAY: ["ayt_mat", "ayt_fiz", "ayt_kim", "ayt_bio"],
  EA: ["ayt_tde", "ayt_trh1", "ayt_cog1", "ayt_mat"],
  SÖZ: [
    "ayt_tde",
    "ayt_trh1",
    "ayt_cog1",
    "ayt_trh2",
    "ayt_cog2",
    "ayt_fel",
    "ayt_din",
  ],
};

export const round2 = (n: number) => Math.round(n * 100) / 100;

function target(
  kind: ExamKind,
  entries: [string, string][],
  nets: Nets,
): RefTarget | null {
  const parts = entries
    .filter(([key]) => typeof nets[key] === "number")
    .map(([key, label]) => ({ label, value: nets[key] }));
  if (!parts.length) return null;
  return {
    kind,
    total: round2(parts.reduce((sum, p) => sum + p.value, 0)),
    parts,
  };
}

// Son yerleşen adayın netlerinden deneme türüne göre referans net hedefleri çıkarır
export function referenceTargets(
  scoreType: string,
  nets: Nets | null | undefined,
): RefTarget[] {
  if (!nets) return [];
  const result: (RefTarget | null)[] = [target("TYT", TYT, nets)];
  const ayt = AYT_BY_TYPE[scoreType];
  if (ayt)
    result.push(
      target(
        "AYT",
        ayt.map((k): [string, string] => [k, AYT_LABEL[k]]),
        nets,
      ),
    );
  if (scoreType === "DİL")
    result.push(target("YDT", [["ydt", "Yabancı dil"]], nets));
  return result.filter((t): t is RefTarget => t !== null);
}

export function remaining(
  targetNet: number,
  lastNet: number | null | undefined,
) {
  return lastNet == null ? null : Math.max(0, round2(targetNet - lastNet));
}

export const scoreTypeOfField: Record<string, string> = {
  say: "SAY",
  ea: "EA",
  soz: "SÖZ",
  dil: "DİL",
};
