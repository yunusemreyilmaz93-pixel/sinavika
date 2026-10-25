-- Bir konu için birden fazla test olabilir. İlk teste süre verilir (soru başına iki dakika).
drop index public.question_sets_topic_idx;
create unique index question_sets_topic_title_idx on public.question_sets (topic_id, title) where kind = 'konu';
update public.question_sets set duration_min = 32 where kind = 'konu' and duration_min is null and title = 'Çarpanlar ve Katlar konu testi';

create or replace function public.preview_set(p_set integer) returns jsonb
language plpgsql stable security definer set search_path = ''
as $$
begin
  if not (private.is_admin() or private.is_active_teacher()) then
    raise exception 'Bu önizleme yalnızca yönetici ve öğretmenler içindir';
  end if;
  return (
    select jsonb_build_object(
      'title', s.title,
      'exam', s.exam,
      'kind', s.kind,
      'published', s.published,
      'duration', s.duration_min,
      'questions', coalesce(jsonb_agg(jsonb_build_object(
        'id', q.id,
        'position', q.position,
        'subject_id', q.subject_id,
        'topic_id', q.topic_id,
        'stem', q.stem,
        'options', q.options,
        'correct', q.correct,
        'explanation', q.explanation,
        'difficulty', q.difficulty
      ) order by q.position) filter (where q.id is not null), '[]'::jsonb)
    )
    from public.question_sets s
    left join public.questions q on q.set_id = s.id
    where s.id = p_set and (s.published or private.is_admin())
    group by s.id
  );
end $$;

