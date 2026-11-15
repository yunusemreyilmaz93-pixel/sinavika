-- Ana sayfadaki sayı şeridi için herkese açık toplamlar. Satır döndürmez, yalnızca sayı
create or replace function public.public_stats()
returns jsonb
language sql
stable
security definer
set search_path = ''
as $$
  select jsonb_build_object(
    'lessons', (select count(*) from public.lessons where published),
    'questions', (select coalesce(sum(question_count), 0) from public.question_sets where published),
    'tests', (select count(*) from public.question_sets where published and kind = 'konu'),
    'programs', (select count(*) from public.programs)
  )
$$;

revoke all on function public.public_stats() from public;
grant execute on function public.public_stats() to anon, authenticated;
