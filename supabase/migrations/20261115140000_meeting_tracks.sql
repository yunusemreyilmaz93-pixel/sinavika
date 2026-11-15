-- Görüşmede her tarafın yayınladığı izler (ses, kamera, ekran) ve açık kapalı durumu. Yalnızca sunucu yazar ve okur
alter table public.meeting_peers
  add column tracks jsonb not null default '[]'::jsonb,
  add column media jsonb not null default '{}'::jsonb;

alter table public.meeting_peers alter column session_id drop not null;
