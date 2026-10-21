-- Asistan için daha fazla sağlayıcı
alter table public.teacher_ai_keys drop constraint teacher_ai_keys_provider_check;
alter table public.teacher_ai_keys add constraint teacher_ai_keys_provider_check
  check (provider in ('anthropic', 'openai', 'gemini', 'xai', 'mistral', 'deepseek', 'groq', 'openrouter', 'together'));
