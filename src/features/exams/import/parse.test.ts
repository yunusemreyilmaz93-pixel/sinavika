import { describe, expect, it } from "vitest";
import type { Subject } from "@/lib/exam";
import { parseKarne } from "./parse";

const s = (id: string, name: string, question_count: number, exam = "TYT") =>
  ({
    id,
    name,
    question_count,
    exam,
    short: name,
    sort: 0,
    fields: null,
  }) as unknown as Subject;

const tyt = [
  s("1", "Türkçe", 40),
  s("2", "Temel Matematik", 40),
  s("3", "Fizik", 7),
  s("4", "Tarih", 5),
  s("5", "Din Kültürü", 5),
];
const ayt = [
  s("6", "Türk Dili ve Edebiyatı", 24, "AYT"),
  s("7", "Tarih-1", 10, "AYT"),
  s("8", "Tarih-2", 11, "AYT"),
  s("9", "Matematik", 40, "AYT"),
];
const by = (rows: ReturnType<typeof parseKarne>) =>
  Object.fromEntries(rows.map((r) => [r.subject.name, [r.c, r.w, r.b]]));

describe("karne metni ayrıştırma", () => {
  it("soru sayısı, doğru, yanlış, boş ve net sütunlarını ayırır", () => {
    const text =
      "TÜRKÇE 40 32 6 2 29,50\nTemel Matematik 40 20 8 12 18,00\nFİZİK 7 3 2 2 2,50";
    expect(by(parseKarne(text, tyt))).toEqual({
      Türkçe: [32, 6, 2],
      "Temel Matematik": [20, 8, 12],
      Fizik: [3, 2, 2],
    });
  });
  it("yalnızca doğru ve yanlış varsa boşu null bırakır", () => {
    expect(by(parseKarne("Türkçe: D 30 Y 5", tyt))).toEqual({
      Türkçe: [30, 5, null],
    });
  });
  it("doğru ile yanlışın toplamı soru sayısını aşan satırı atlar", () => {
    expect(parseKarne("Fizik 30 20", tyt)).toEqual([]);
  });
  it("Tarih-1 ve Tarih-2 adındaki rakamı sayı saymaz", () => {
    const text =
      "Tarih-1 10 7 2 1 6,50\nTarih-2 11 5 4 2 4,00\nTürk Dili ve Edebiyatı 24 15 5 4 13,75";
    expect(by(parseKarne(text, ayt))).toEqual({
      "Türk Dili ve Edebiyatı": [15, 5, 4],
      "Tarih-1": [7, 2, 1],
      "Tarih-2": [5, 4, 2],
    });
  });
  it("Tarih ile Din Kültürü karışmaz, tanınmayan satırlar yok sayılır", () => {
    const text =
      "Öğrenci Ali Veli\nTOPLAM 120 80 20 20\nDin Kültürü 5 4 1 0\nTarih 5 3 1 1";
    expect(by(parseKarne(text, tyt))).toEqual({
      Tarih: [3, 1, 1],
      "Din Kültürü": [4, 1, 0],
    });
  });
  it("ondalıklı net ve noktalı ondalık doğru sütun sanılmaz", () => {
    expect(by(parseKarne("Matematik 40 25 10 5 22.5", ayt))).toEqual({
      Matematik: [25, 10, 5],
    });
  });
});
