-- Supabase denetçisinin performans uyarıları:
-- 1. RLS kurallarında auth.uid() her satır için yeniden hesaplanmasın, sorgu başına bir kez çalışsın
-- 2. Dizini olmayan yabancı anahtarlara dizin (silme ve birleştirmelerde tam tarama olmasın)

do $$
declare
  p record;
  q text;
  c text;
  sql text;
begin
  for p in
    select schemaname, tablename, policyname, qual, with_check from pg_policies
    where schemaname = 'public'
      and (qual ~ 'auth\.uid\(\)' or with_check ~ 'auth\.uid\(\)')
  loop
    q := regexp_replace(p.qual, '(?<!SELECT )auth\.uid\(\)', '(SELECT auth.uid())', 'g');
    c := regexp_replace(p.with_check, '(?<!SELECT )auth\.uid\(\)', '(SELECT auth.uid())', 'g');
    sql := format('alter policy %I on %I.%I', p.policyname, p.schemaname, p.tablename);
    if q is not null then sql := sql || format(' using (%s)', q); end if;
    if c is not null then sql := sql || format(' with check (%s)', c); end if;
    execute sql;
  end loop;
end $$;

do $$
declare
  fk record;
begin
  for fk in
    select c.conrelid::regclass as tbl, c.conname, a.attname as col
    from pg_constraint c
    join pg_class t on t.oid = c.conrelid
    join pg_namespace n on n.oid = t.relnamespace
    join pg_attribute a on a.attrelid = c.conrelid and a.attnum = c.conkey[1]
    where c.contype = 'f' and n.nspname = 'public' and array_length(c.conkey, 1) = 1
      and not exists (
        select 1 from pg_index i where i.indrelid = c.conrelid and i.indkey[0] = c.conkey[1]
      )
  loop
    execute format('create index if not exists %I on %s (%I)', fk.conname || '_idx', fk.tbl, fk.col);
  end loop;
end $$;
