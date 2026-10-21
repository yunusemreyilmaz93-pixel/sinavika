import { FileUp } from "lucide-react";
import { useRef, useState } from "react";
import { Button } from "@/components/ui/button";
import { Modal } from "@/components/ui/modal";
import { Spinner } from "@/components/ui/spinner";
import { Textarea } from "@/components/ui/field";
import { formatNet, net, type ExamKind, type Subject } from "@/lib/exam";
import { parseKarne, type ParsedRow } from "./parse";

type Props = {
  open: boolean;
  onOpenChange: (open: boolean) => void;
  kind: ExamKind;
  subjects: Subject[];
  onApply: (rows: ParsedRow[]) => void;
};

export function KarneImport({
  open,
  onOpenChange,
  kind,
  subjects,
  onApply,
}: Props) {
  const [text, setText] = useState("");
  const [rows, setRows] = useState<ParsedRow[] | null>(null);
  const [reading, setReading] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const fileRef = useRef<HTMLInputElement>(null);

  const read = (value: string) => {
    setText(value);
    setError(null);
    setRows(value.trim() ? parseKarne(value, subjects) : null);
  };

  const pickFile = async (file: File | undefined) => {
    if (!file) return;
    setReading(true);
    setError(null);
    try {
      const { pdfToText } = await import("./pdf");
      read(await pdfToText(file));
    } catch {
      setRows(null);
      setError(
        "PDF okunamadı. Metni kopyalayıp yapıştırın ya da sonuçları elle girin.",
      );
    } finally {
      setReading(false);
      if (fileRef.current) fileRef.current.value = "";
    }
  };

  const missing = rows ? subjects.length - rows.length : 0;

  return (
    <Modal
      open={open}
      onOpenChange={onOpenChange}
      title="Karneden aktar"
      description="Dosya cihazdan çıkmaz. Forma aktarılır, kayıt sizin onayınızla yapılır."
      size="md"
      footer={
        <Button
          type="button"
          disabled={!rows?.length}
          onClick={() => {
            if (rows) onApply(rows);
            onOpenChange(false);
          }}
        >
          Forma aktar
        </Button>
      }
    >
      <div className="space-y-3">
        <input
          ref={fileRef}
          type="file"
          accept="application/pdf"
          className="sr-only"
          tabIndex={-1}
          onChange={(e) => void pickFile(e.target.files?.[0])}
        />
        <Button
          type="button"
          variant="soft"
          className="h-11 w-full"
          disabled={reading}
          onClick={() => fileRef.current?.click()}
        >
          {reading ? <Spinner className="size-4" /> : <FileUp />}
          PDF karne seç
        </Button>
        <Textarea
          aria-label="Karne metni"
          rows={5}
          placeholder="Ya da karne satırlarını buraya yapıştırın"
          value={text}
          onChange={(e) => read(e.target.value)}
        />
        {error && <p className="text-sm text-danger">{error}</p>}
        {rows && (
          <div>
            {rows.length === 0 ? (
              <p className="text-sm text-muted">
                Ders satırı bulunamadı. Sonuçları elle girin.
              </p>
            ) : (
              <>
                <ul className="divide-y divide-line rounded-xl border border-line">
                  {rows.map((r) => (
                    <li
                      key={r.subject.id}
                      className="flex items-center justify-between gap-3 px-3 py-2 text-sm"
                    >
                      <span className="min-w-0 truncate font-semibold">
                        {r.subject.name}
                      </span>
                      <span className="tabular shrink-0 text-muted">
                        D {r.c} · Y {r.w} · B{" "}
                        {r.b ??
                          Math.max(
                            0,
                            r.subject.question_count - r.c - r.w,
                          )}{" "}
                        ·{" "}
                        <span className="font-semibold text-fg">
                          {formatNet(net(r.c, r.w, kind))}
                        </span>
                      </span>
                    </li>
                  ))}
                </ul>
                {missing > 0 && (
                  <p className="mt-2 text-sm text-muted">
                    {missing} ders okunamadı, elle girilebilir.
                  </p>
                )}
              </>
            )}
          </div>
        )}
      </div>
    </Modal>
  );
}
