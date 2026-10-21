-- Ana sayfada "yeni eklenen konu anlatımları" için. Sadece konu, ders ve tarih döner, metin dönmez.
alter table public.lessons add column published_at timestamptz;
update public.lessons set published_at = created_at where published;

create or replace function private.stamp_lesson_published() returns trigger
language plpgsql set search_path = ''
as $$
begin
  if not new.published then
    new.published_at := null;
  elsif tg_op = 'INSERT' or not old.published then
    new.published_at := now();
  end if;
  return new;
end $$;

create trigger lessons_published_stamp before insert or update on public.lessons
for each row execute function private.stamp_lesson_published();

create or replace function public.recent_lessons(p_limit integer default 6)
returns table (topic_id integer, topic_name text, subject_name text, exam public.exam_kind, published_at timestamptz)
language sql stable security definer set search_path = ''
as $$
  select t.id, t.name, s.name, s.exam, l.published_at
  from public.lessons l
  join public.topics t on t.id = l.topic_id
  join public.subjects s on s.id = t.subject_id
  where l.published and l.published_at is not null
  order by l.published_at desc, t.id
  limit least(greatest(p_limit, 1), 20)
$$;

revoke all on function public.recent_lessons(integer) from public;
grant execute on function public.recent_lessons(integer) to anon, authenticated, service_role;
