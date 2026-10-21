-- Konu anlatımı ilerlemesi: okuma süresi, görülen bölümler, izlenen video bölümleri.
-- Veriyi istemci bildirir. Sunucu artışı geçen gerçek süreyle sınırlar, ölçüt hesabı ve "Tamam" kapısı burada.
create table public.lesson_progress (
  student_id uuid not null references public.students (id) on delete cascade,
  topic_id integer not null references public.topics (id) on delete cascade,
  active_seconds integer not null default 0 check (active_seconds between 0 and 86400),
  sections_seen smallint not null default 0 check (sections_seen between 0 and 200),
  videos jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now(),
  primary key (student_id, topic_id)
);

alter table public.lesson_progress enable row level security;
create policy "lesson progress read" on public.lesson_progress for select to authenticated
  using (private.can_read_student(student_id));
grant select on public.lesson_progress to authenticated;
grant all on public.lesson_progress to service_role;

-- p_videos: {"<youtube id>": {"duration": saniye, "buckets": [5 saniyelik dilim numaraları]}}. Yalnızca yeni dilimler gönderilir.
create or replace function public.record_lesson_progress(p_topic integer, p_seconds integer, p_sections integer, p_videos jsonb)
returns void
language plpgsql security definer set search_path = ''
as $$
declare
  lesson_body text;
  old public.lesson_progress;
  elapsed numeric;
  gained integer;
  seen integer;
  merged jsonb;
  budget integer;
  vid text;
  entry jsonb;
  dur integer;
  have integer[];
  fresh integer[];
begin
  if not exists (select 1 from public.students s where s.id = auth.uid()) then
    raise exception 'Sadece öğrenciler ilerleme kaydedebilir';
  end if;
  select l.body into lesson_body from public.lessons l where l.topic_id = p_topic and l.published;
  if lesson_body is null then
    raise exception 'Bu konunun yayınlanmış bir anlatımı yok';
  end if;

  select * into old from public.lesson_progress p where p.student_id = auth.uid() and p.topic_id = p_topic;
  elapsed := case when old.student_id is null then 60 else extract(epoch from now() - old.updated_at) end;
  gained := greatest(0, least(coalesce(p_seconds, 0), 120, floor(elapsed)::integer + 2));
  seen := greatest(coalesce(old.sections_seen, 0), least(greatest(coalesce(p_sections, 0), 0), regexp_count(lesson_body, '^## ', 1, 'n')));

  merged := coalesce(old.videos, '{}'::jsonb);
  budget := floor(least(elapsed, 120) * 2 / 5)::integer + 2;
  for vid, entry in select e.key, e.value from jsonb_each(coalesce(p_videos, '{}'::jsonb)) e limit 10 loop
    continue when position('{id="' || vid || '"' in lesson_body) = 0 or jsonb_typeof(entry) <> 'object';
    dur := least(14400, greatest(5, coalesce((entry ->> 'duration')::numeric, 0)::integer));
    have := coalesce(array(select jsonb_array_elements_text(merged -> vid -> 'buckets')::integer), '{}');
    fresh := coalesce(array(
      select distinct b from (select jsonb_array_elements_text(coalesce(entry -> 'buckets', '[]'::jsonb))::integer as b) x
      where b >= 0 and b < ceil(dur / 5.0) and not (b = any(have))
      order by b limit greatest(budget, 0)
    ), '{}');
    budget := budget - cardinality(fresh);
    merged := jsonb_set(merged, array[vid], jsonb_build_object('duration', dur, 'buckets', to_jsonb(have || fresh)));
  end loop;

  insert into public.lesson_progress (student_id, topic_id, active_seconds, sections_seen, videos, updated_at)
  values (auth.uid(), p_topic, gained, seen, merged, now())
  on conflict (student_id, topic_id) do update set
    active_seconds = least(public.lesson_progress.active_seconds + excluded.active_seconds, 86400),
    sections_seen = excluded.sections_seen,
    videos = excluded.videos,
    updated_at = now();
end $$;

revoke all on function public.record_lesson_progress(integer, integer, integer, jsonb) from public, anon;
grant execute on function public.record_lesson_progress(integer, integer, integer, jsonb) to authenticated, service_role;

-- Ölçütler: okuma (süre ve bölümler), video (her videonun en az %70'i), mini test (son cevaplarla en az %75).
-- Yalnızca etkinliği olan konular döner. p_topic verilirse yalnızca o konu.
create or replace function public.lesson_completion(p_student uuid, p_topic integer default null)
returns table (
  topic_id integer,
  reading_pct integer,
  video_count integer,
  video_pct integer,
  test_total integer,
  test_answered integer,
  test_first integer,
  test_now integer,
  reading_ok boolean,
  video_ok boolean,
  test_ok boolean,
  complete boolean
)
language sql stable security definer set search_path = ''
as $$
  with base as (
    select l.topic_id, l.body, l.reading_minutes,
           regexp_count(l.body, '^## ', 1, 'n') as sections,
           regexp_count(l.body, '^:::soru', 1, 'n') as questions
    from public.lessons l
    where private.can_read_student(p_student) and l.published
      and (p_topic is null or l.topic_id = p_topic)
      and (p_topic is not null
           or exists (select 1 from public.lesson_progress p where p.student_id = p_student and p.topic_id = l.topic_id)
           or exists (select 1 from public.lesson_answers a where a.student_id = p_student and a.topic_id = l.topic_id))
  ),
  vf as (
    select b.topic_id,
           least(1, coalesce(jsonb_array_length(p.videos -> v.id -> 'buckets') * 5.0 / nullif((p.videos -> v.id ->> 'duration')::numeric, 0), 0)) as frac
    from base b
    cross join lateral (select m[1] as id from regexp_matches(b.body, '^::video\{id="([^"]+)"', 'gn') m) v
    left join public.lesson_progress p on p.student_id = p_student and p.topic_id = b.topic_id
  ),
  vs as (
    select vf.topic_id, count(*)::integer as n, avg(vf.frac) as avg_frac, (count(*) filter (where vf.frac >= 0.7))::integer as ok_n
    from vf group by vf.topic_id
  ),
  ans as (
    select a.topic_id, count(*)::integer as answered,
           (count(*) filter (where a.first_correct))::integer as first_ok,
           (count(*) filter (where a.last_correct))::integer as now_ok
    from public.lesson_answers a where a.student_id = p_student group by a.topic_id
  ),
  calc as (
    select b.topic_id, b.questions, coalesce(vs.n, 0) as vn, vs.avg_frac, vs.ok_n,
           least(b.questions, coalesce(ans.answered, 0)) as answered,
           least(b.questions, coalesce(ans.first_ok, 0)) as first_ok,
           least(b.questions, coalesce(ans.now_ok, 0)) as now_ok,
           least(
             1.0,
             coalesce(p.active_seconds, 0) / greatest(60, least(900, round(0.4 * b.reading_minutes * 60)))::numeric,
             case when b.sections = 0 then 1.0 else coalesce(p.sections_seen, 0) / ceil(0.8 * b.sections) end
           ) as read_frac
    from base b
    left join vs on vs.topic_id = b.topic_id
    left join ans on ans.topic_id = b.topic_id
    left join public.lesson_progress p on p.student_id = p_student and p.topic_id = b.topic_id
  )
  select c.topic_id,
         floor(100 * c.read_frac)::integer,
         c.vn,
         case when c.vn = 0 then 100 else floor(100 * coalesce(c.avg_frac, 0))::integer end,
         c.questions,
         c.answered,
         c.first_ok,
         c.now_ok,
         c.read_frac >= 1,
         c.vn = 0 or c.ok_n = c.vn,
         c.questions = 0 or (c.answered >= c.questions and c.now_ok >= ceil(0.75 * c.questions)),
         c.read_frac >= 1
           and (c.vn = 0 or c.ok_n = c.vn)
           and (c.questions = 0 or (c.answered >= c.questions and c.now_ok >= ceil(0.75 * c.questions)))
  from calc c
$$;

revoke all on function public.lesson_completion(uuid, integer) from public, anon;
grant execute on function public.lesson_completion(uuid, integer) to authenticated, service_role;

-- Yayında anlatımı olan bir konuyu öğrenci kendisi "Tamam" yapamaz, ölçütler karşılanmadan.
-- Öğretmen ve yönetici serbesttir. Zaten Tamam olan kayıtlar etkilenmez.
create or replace function private.require_lesson_completion()
returns trigger
language plpgsql security definer set search_path = ''
as $$
begin
  if new.status = 'done'
     and auth.uid() is not null and auth.uid() = new.student_id
     and (tg_op = 'INSERT' or old.status is distinct from 'done')
     and exists (select 1 from public.lessons l where l.topic_id = new.topic_id and l.published)
     and not exists (select 1 from public.topic_progress p where p.student_id = new.student_id and p.topic_id = new.topic_id and p.status = 'done')
     and not coalesce((select c.complete from public.lesson_completion(new.student_id, new.topic_id) c), false) then
    raise exception 'Tamam için konu anlatımındaki ölçütlerin tamamlanması gerekir';
  end if;
  return new;
end $$;

create trigger topic_progress_require_lesson before insert or update on public.topic_progress
  for each row execute function private.require_lesson_completion();
