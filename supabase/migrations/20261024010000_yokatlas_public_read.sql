-- YÖK Atlas verisi herkese açık bilgidir. Herkese açık bölüm sayfaları derleme sırasında anonim anahtarla okur
create policy "universities public read" on public.universities for select to anon using (true);
create policy "programs public read" on public.programs for select to anon using (true);
create policy "program results public read" on public.program_results for select to anon using (true);
grant select on public.universities, public.programs, public.program_results to anon;
