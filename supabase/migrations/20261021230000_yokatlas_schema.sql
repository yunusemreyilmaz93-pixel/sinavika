-- Hedef üniversite ve bölüm için YÖK Atlas referans verisi ---------------------------------

create table public.universities (
  id integer primary key,
  name text not null,
  short_name text not null,
  kind text not null check (kind in ('devlet', 'vakif')),
  city text
);

create table public.programs (
  code bigint primary key,
  university_id integer not null references public.universities (id) on delete cascade,
  name text not null,
  group_id integer not null,
  group_name text not null,
  faculty text,
  score_type text not null check (score_type in ('SAY', 'SÖZ', 'EA', 'DİL', 'TYT')),
  language text,
  duration smallint,
  scholarship text,
  city text
);
create index programs_university_idx on public.programs (university_id);

create table public.program_results (
  program_code bigint not null references public.programs (code) on delete cascade,
  year smallint not null,
  quota smallint,
  placed smallint,
  min_score numeric(10, 5),
  rank integer,
  nets jsonb,
  primary key (program_code, year)
);

alter table public.universities enable row level security;
alter table public.programs enable row level security;
alter table public.program_results enable row level security;
create policy "universities readable" on public.universities for select to authenticated using (true);
create policy "programs readable" on public.programs for select to authenticated using (true);
create policy "program results readable" on public.program_results for select to authenticated using (true);
revoke all on public.universities, public.programs, public.program_results from anon;
grant select on public.universities, public.programs, public.program_results to authenticated;

-- Öğrencinin hedef bölümü listeden seçilir. Lise hedefi ve listede olmayan hedefler mevcut target metin alanında durur
alter table public.students add column target_program bigint references public.programs (code) on delete set null;
grant update (target_program) on public.students to authenticated;
