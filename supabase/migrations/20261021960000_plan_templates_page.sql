-- Şablonlar ayrı sayfaya taşındı: çok haftalık şablon, açıklama ve sınav türü.
-- Görevler items içinde durur, her görevin week (0 tabanlı hafta) alanı vardır. Eski şablonlar tek haftalık kalır.

alter table public.plan_templates
  add column description text check (char_length(description) <= 200),
  add column track public.exam_track,
  add column updated_at timestamptz not null default now();

alter table public.plan_templates drop constraint plan_templates_items_check;
alter table public.plan_templates
  add constraint plan_templates_items_check
  check (jsonb_typeof(items) = 'array' and jsonb_array_length(items) <= 400);

create trigger plan_templates_touch before update on public.plan_templates
for each row execute function private.touch_updated_at();

create or replace function private.limit_plan_templates() returns trigger
language plpgsql security definer set search_path = ''
as $$
begin
  if (select count(*) from public.plan_templates t where t.teacher_id = new.teacher_id) >= 4 then
    raise exception 'En fazla 4 şablon kaydedebilirsiniz. Yenisi için birini silin';
  end if;
  return new;
end $$;

create trigger plan_templates_limit before insert on public.plan_templates
for each row execute function private.limit_plan_templates();
