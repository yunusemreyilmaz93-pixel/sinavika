import { describe, expect, it } from "vitest";
import { referenceTargets, remaining } from "./reference";

const say = {
  tyt_trk: 32.25,
  tyt_sos: 19,
  tyt_mat: 32.25,
  tyt_fen: 20,
  ayt_mat: 40,
  ayt_fiz: 12.75,
  ayt_kim: 13,
  ayt_bio: 13,
  ayt_tde: 5,
};

describe("referans net hedefleri", () => {
  it("SAY için TYT ve yalnızca sayısal AYT derslerini toplar", () => {
    const targets = referenceTargets("SAY", say);
    expect(targets.map((t) => t.kind)).toEqual(["TYT", "AYT"]);
    expect(targets[0].total).toBe(103.5);
    expect(targets[1].total).toBe(78.75);
    expect(targets[1].parts.map((p) => p.label)).toEqual([
      "Matematik",
      "Fizik",
      "Kimya",
      "Biyoloji",
    ]);
  });
  it("EA için edebiyat, tarih, coğrafya ve matematiği sayar", () => {
    const t = referenceTargets("EA", { ...say, ayt_trh1: 7, ayt_cog1: 4 }).find(
      (x) => x.kind === "AYT",
    );
    expect(t?.total).toBe(56);
  });
  it("DİL için yabancı dil neti YDT hedefi olur", () => {
    const t = referenceTargets("DİL", { tyt_trk: 30, ydt: 70.5 });
    expect(t.map((x) => x.kind)).toEqual(["TYT", "YDT"]);
    expect(t[1].total).toBe(70.5);
  });
  it("net verisi yoksa boş döner", () => {
    expect(referenceTargets("SAY", null)).toEqual([]);
    expect(referenceTargets("SAY", {})).toEqual([]);
  });
  it("kalan fark hedefin üstündeyse sıfır, deneme yoksa null", () => {
    expect(remaining(90, 72.5)).toBe(17.5);
    expect(remaining(90, 95)).toBe(0);
    expect(remaining(90, null)).toBeNull();
  });
});
