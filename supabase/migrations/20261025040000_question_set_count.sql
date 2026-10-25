-- Set başına soru sayısı. PostgREST'in gömülü sayımı sütun izniyle çalışmadığı için sütunda tutulur.
alter table public.question_sets add column question_count smallint not null default 0;
update public.question_sets s set question_count = (select count(*) from public.questions q where q.set_id = s.id);

create or replace function private.sync_question_count() returns trigger
language plpgsql security definer set search_path = ''
as $$
declare target integer := coalesce(new.set_id, old.set_id);
begin
  update public.question_sets s set question_count = (select count(*) from public.questions q where q.set_id = target) where s.id = target;
  return null;
end $$;

create trigger questions_count after insert or delete on public.questions
for each row execute function private.sync_question_count();
