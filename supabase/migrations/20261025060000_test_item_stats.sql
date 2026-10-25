-- Madde analizi (yalnızca yönetici). Her öğrencinin testi ilk çözümü sayılır.
-- p: doğru yapanların oranı (güçlük), r: maddenin kalan puanla ilişkisi (ayırt edicilik), kr20: iç tutarlık güvenirliği
create or replace function public.test_item_stats(p_set integer) returns jsonb
language plpgsql stable security definer set search_path = ''
as $$
declare result jsonb;
begin
  if not private.is_admin() then
    raise exception 'Madde analizi yalnızca yöneticiler içindir';
  end if;
  with first_try as (
    select distinct on (student_id) id, student_id from public.test_attempts where set_id = p_set order by student_id, created_at, id
  ), ans as (
    select f.student_id, a.question_id, a.is_correct::int as c, a.choice
    from first_try f join public.test_answers a on a.attempt_id = f.id
  ), tot as (
    select student_id, sum(c)::float as total from ans group by student_id
  ), whole as (
    select count(*)::int as n, avg(total) as mean, var_pop(total) as variance from tot
  ), items as (
    select a.question_id, count(*)::int as n, avg(a.c::float) as p,
      corr(a.c::float, (t.total - a.c)::float) as r,
      jsonb_object_agg(coalesce(a.choice::text, 'bos'), a.cnt) as choices
    from (select question_id, student_id, c, choice, count(*) over (partition by question_id, coalesce(choice::text, 'bos')) as cnt from ans) a
    join tot t using (student_id)
    group by a.question_id
  )
  select jsonb_build_object(
    'n', w.n,
    'mean', round(w.mean::numeric, 2),
    'sd', round(sqrt(w.variance)::numeric, 2),
    'kr20', case when w.n >= 2 and w.variance > 0 and (select count(*) from items) > 1
      then round(((count(i.question_id)::float / (count(i.question_id) - 1)) * (1 - sum(i.p * (1 - i.p)) / w.variance))::numeric, 3) end,
    'items', coalesce(jsonb_agg(jsonb_build_object(
      'question_id', i.question_id, 'n', i.n, 'p', round(i.p::numeric, 3), 'r', round(i.r::numeric, 3), 'choices', i.choices
    ) order by q.position) filter (where i.question_id is not null), '[]'::jsonb)
  ) into result
  from whole w left join items i on true left join public.questions q on q.id = i.question_id
  group by w.n, w.mean, w.variance;
  return coalesce(result, jsonb_build_object('n', 0, 'items', '[]'::jsonb));
end $$;

revoke all on function public.test_item_stats(integer) from public, anon;
grant execute on function public.test_item_stats(integer) to authenticated, service_role;
