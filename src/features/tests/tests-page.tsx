import { Clock, ListChecks, Trophy } from "lucide-react";
import { useMemo, useState, type ReactNode } from "react";
import { Link } from "react-router";
import { PageHeader } from "@/components/app/page-header";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { Card } from "@/components/ui/card";
import { EmptyState } from "@/components/ui/empty-state";
import { Segmented } from "@/components/ui/segmented";
import { Skeleton } from "@/components/ui/skeleton";
import { IconChip } from "@/components/ui/stat";
import { SubjectIcon } from "@/components/ui/subject-icon";
import { useProfile } from "@/features/auth/session";
import { useCurriculum } from "@/lib/data";
import { cn } from "@/lib/cn";
import {
  examLabel,
  formatNet,
  net,
  type ExamKind,
  type Subject,
} from "@/lib/exam";
import {
  useTestAttempts,
  useTestSets,
  type Attempt,
  type TestSet,
} from "./queries";

const kindTitle = {
  deneme: "Genel denemeler",
  tip: "Soru tipleri",
  brans: "Branş denemeleri",
  konu: "Konu testleri",
} as const;
const kindLabel = {
  deneme: "Genel deneme",
  tip: "Soru tipi",
  brans: "Branş denemesi",
  konu: "Konu testi",
} as const;

export default function TestsPage() {
  const profile = useProfile();
  const isStudent = profile.role === "student";
  const sets = useTestSets();
  const attempts = useTestAttempts(profile.id, isStudent);
  const curriculum = useCurriculum();
  const [picked, setPicked] = useState<ExamKind | null>(null);
  const [pickedSubject, setPickedSubject] = useState<string | null>(null);
  const [unsolved, setUnsolved] = useState(false);

  const exams = useMemo(
    () => [...new Set((sets.data ?? []).map((s) => s.exam))],
    [sets.data],
  );
  const exam = picked && exams.includes(picked) ? picked : exams[0];
  const last = useMemo(() => {
    const map = new Map<number, Attempt>();
    for (const a of attempts.data ?? [])
      if (!map.has(a.set_id)) map.set(a.set_id, a);
    return map;
  }, [attempts.data]);

  if (sets.isLoading || curriculum.isLoading) return <Loading />;
  if (sets.isError) {
    return (
      <>
        <PageHeader title="Testler" />
        <EmptyState
          icon={ListChecks}
          title="Testler yüklenemedi"
          description="Sayfayı yenileyip tekrar deneyin."
        />
      </>
    );
  }
  if (!exam || !curriculum.data) {
    return (
      <>
        <PageHeader title="Testler" />
        <EmptyState
          icon={ListChecks}
          title="Henüz test yok"
          description="Yeni testler eklendikçe burada görünür."
        />
      </>
    );
  }
  const { subjectById, topicById } = curriculum.data;
  const inExam = (sets.data ?? []).filter((s) => s.exam === exam);
  const subjectIds = [
    ...new Set(
      inExam.map((s) => s.subject_id).filter((id): id is string => Boolean(id)),
    ),
  ];
  const subject =
    pickedSubject && subjectIds.includes(pickedSubject) ? pickedSubject : null;
  const solved = inExam.filter((s) => last.has(s.id)).length;
  const shown = inExam.filter(
    (s) =>
      (!subject || s.subject_id === subject) && (!unsolved || !last.has(s.id)),
  );

  return (
    <>
      <PageHeader
        title="Testler"
        description={
          isStudent
            ? `${inExam.length} test, ${solved} tanesini çözdün`
            : "Soruları doğru cevap ve çözümleriyle inceleyebilirsiniz."
        }
      />
      {exams.length > 1 && (
        <Segmented
          className="mb-4 sm:w-fit"
          value={exam}
          onChange={setPicked}
          options={exams.map((e) => ({ value: e, label: examLabel[e] }))}
        />
      )}
      <div
        className="-mx-4 mb-5 flex gap-2 overflow-x-auto px-4 pb-1 sm:mx-0 sm:flex-wrap sm:px-0"
        aria-label="Süzgeç"
      >
        <Chip
          active={!subject && !unsolved}
          onClick={() => (setPickedSubject(null), setUnsolved(false))}
        >
          Tümü
        </Chip>
        {subjectIds.map((id) => (
          <Chip
            key={id}
            active={subject === id}
            onClick={() => setPickedSubject(subject === id ? null : id)}
          >
            <SubjectIcon subject={subjectById.get(id)} size="sm" />
            {subjectById.get(id)?.short ?? subjectById.get(id)?.name}
          </Chip>
        ))}
        {isStudent && (
          <Chip active={unsolved} onClick={() => setUnsolved(!unsolved)}>
            Çözülmemiş
          </Chip>
        )}
      </div>
      {shown.length === 0 ? (
        <EmptyState
          icon={ListChecks}
          title="Bu süzgece uyan test yok"
          description="Başka bir ders seçin ya da süzgeci kaldırın."
        />
      ) : (
        <div className="space-y-7">
          {(["deneme", "tip", "brans", "konu"] as const).map((kind) => {
            const list = shown.filter((s) => s.kind === kind);
            if (!list.length) return null;
            return (
              <section key={kind} aria-label={kindTitle[kind]}>
                <h2 className="mb-3 flex items-baseline gap-2 font-display text-lg font-bold">
                  {kindTitle[kind]}
                  <span className="tabular text-sm font-semibold text-muted">
                    {list.length}
                  </span>
                </h2>
                <ul className="grid gap-3 sm:grid-cols-2 xl:grid-cols-3">
                  {list.map((s) => (
                    <li key={s.id}>
                      <SetCard
                        set={s}
                        exam={exam}
                        kindLabel={kindLabel[kind]}
                        attempt={isStudent ? last.get(s.id) : undefined}
                        staff={!isStudent}
                        subject={
                          s.subject_id
                            ? subjectById.get(s.subject_id)
                            : undefined
                        }
                        title={
                          kind === "konu" && s.topic_id
                            ? (topicById.get(s.topic_id)?.name ?? s.title)
                            : s.title
                        }
                      />
                    </li>
                  ))}
                </ul>
              </section>
            );
          })}
        </div>
      )}
    </>
  );
}

function Chip({
  active,
  onClick,
  children,
}: {
  active: boolean;
  onClick: () => void;
  children: ReactNode;
}) {
  return (
    <button
      type="button"
      aria-pressed={active}
      onClick={onClick}
      className={cn(
        "flex min-h-11 shrink-0 items-center gap-2 rounded-xl border px-3.5 text-sm font-semibold whitespace-nowrap transition-colors",
        active
          ? "border-primary bg-primary-soft text-primary-soft-fg"
          : "border-line bg-surface hover:border-line-strong",
      )}
    >
      {children}
    </button>
  );
}

function SetCard({
  set,
  exam,
  kindLabel,
  attempt,
  staff,
  subject,
  title,
}: {
  set: TestSet;
  exam: ExamKind;
  kindLabel: string;
  attempt?: Attempt;
  staff?: boolean;
  subject?: Subject;
  title: string;
}) {
  const rate =
    attempt && set.question_count
      ? Math.round((attempt.correct / set.question_count) * 100)
      : null;
  return (
    <Card className="flex h-full flex-col p-4">
      <div className="flex items-start justify-between gap-2">
        {subject ? (
          <SubjectIcon subject={subject} />
        ) : (
          <IconChip hue="violet">
            <Trophy />
          </IconChip>
        )}
        {staff ? (
          !set.published && <Badge tone="warning">Taslak</Badge>
        ) : rate != null ? (
          <Badge
            tone={rate >= 70 ? "primary" : rate >= 50 ? "warning" : "danger"}
          >
            %{rate} başarı ·{" "}
            {formatNet(net(attempt!.correct, attempt!.wrong, exam))} net
          </Badge>
        ) : (
          <Badge>Çözülmedi</Badge>
        )}
      </div>
      <p className="mt-3 text-xs font-semibold text-muted">{kindLabel}</p>
      <h3 className="mt-0.5 line-clamp-2 font-bold">{title}</h3>
      <p className="mt-1.5 flex flex-wrap gap-x-3 gap-y-1 text-sm text-muted">
        <span className="inline-flex items-center gap-1">
          <ListChecks className="size-4" />
          {set.question_count} soru
        </span>
        {set.duration_min ? (
          <span className="inline-flex items-center gap-1">
            <Clock className="size-4" />
            {set.duration_min} dk
          </span>
        ) : null}
      </p>
      <Button
        asChild
        variant={staff || attempt ? "secondary" : "primary"}
        className="mt-4 w-full"
      >
        <Link to={`/app/testler/${set.id}`}>
          {staff ? "Soruları görün" : attempt ? "Tekrar çöz" : "Başla"}
        </Link>
      </Button>
    </Card>
  );
}

function Loading() {
  return (
    <>
      <PageHeader title="Testler" />
      <div className="space-y-3">
        <Skeleton className="h-24" />
        <Skeleton className="h-24" />
      </div>
    </>
  );
}
