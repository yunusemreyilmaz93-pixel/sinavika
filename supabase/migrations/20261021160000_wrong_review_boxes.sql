-- Yanlış defterinde aralıklı tekrar: başarısız tekrar aralığı sıfırlar, art arda 5 başarı soruyu öğrenildi yapar.
alter table public.wrong_questions
  add column box smallint not null default 0 check (box between 0 and 10),
  add column lapses smallint not null default 0 check (lapses between 0 and 100);
update public.wrong_questions set box = least(review_count, 4);

create or replace function public.review_wrong_result(p_id bigint, p_result text) returns public.wrong_questions
language plpgsql security invoker set search_path = ''
as $$
declare
  steps constant integer[] := array[1, 3, 7, 14, 30];
  result public.wrong_questions;
begin
  if p_result not in ('again', 'good', 'learned') then
    raise exception 'Geçersiz tekrar sonucu';
  end if;
  update public.wrong_questions w set
    review_count = least(w.review_count + 1, 100),
    last_reviewed_at = now(),
    box = case when p_result = 'again' then 0 else least(w.box + 1, 5) end,
    lapses = case when p_result = 'again' then least(w.lapses + 1, 100) else w.lapses end,
    learned_at = case when p_result = 'learned' or (p_result = 'good' and w.box + 1 >= 5) then now() else null end,
    next_review_on = private.today() + steps[case when p_result = 'again' then 1 else least(w.box + 2, 5) end]
  where w.id = p_id
  returning * into result;
  if result.id is null then
    raise exception 'Bu soruyu değiştirme yetkin yok';
  end if;
  return result;
end $$;

revoke all on function public.review_wrong_result(bigint, text) from public, anon;
grant execute on function public.review_wrong_result(bigint, text) to authenticated, service_role;
