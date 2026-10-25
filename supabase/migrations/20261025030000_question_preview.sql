-- Yönetici ve öğretmenler setleri doğru cevap ve çözümle birlikte görebilir. Öğrenci ve veli bu fonksiyonu çalıştıramaz.
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

revoke all on function public.preview_set(integer) from public, anon;
grant execute on function public.preview_set(integer) to authenticated, service_role;
