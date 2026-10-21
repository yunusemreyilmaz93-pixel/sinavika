// Migration'ları boş bir Postgres'e uygular ve RLS kurallarını gerçek sorgularla dener.
// Kullanım: TEST_DATABASE_URL=postgresql://postgres@localhost:54329/postgres npm run test:db
import { readdirSync, readFileSync } from 'node:fs'
import { randomUUID } from 'node:crypto'
import assert from 'node:assert/strict'
import pg from 'pg'

const baseUrl = process.env.TEST_DATABASE_URL ?? 'postgresql://postgres@localhost:54329/postgres'
const dbName = 'sinavika_test'
const migrationsDir = new URL('../supabase/migrations/', import.meta.url)

const supabaseStub = `
create schema if not exists extensions;
create extension if not exists pgcrypto with schema extensions;
do $$ begin
  create role anon nologin; create role authenticated nologin; create role service_role nologin bypassrls;
exception when duplicate_object then null; end $$;
create schema auth;
create table auth.users (id uuid primary key, email text);
create function auth.uid() returns uuid language sql stable as $$
  select (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'sub')::uuid $$;
grant usage on schema auth to anon, authenticated, service_role;
grant execute on function auth.uid() to anon, authenticated, service_role;
grant usage on schema extensions to anon, authenticated, service_role;
`

const admin = new pg.Client({ connectionString: baseUrl })
await admin.connect()
await admin.query(`drop database if exists ${dbName} with (force)`)
await admin.query(`create database ${dbName}`)
await admin.end()

const url = new URL(baseUrl)
url.pathname = `/${dbName}`
const db = new pg.Client({ connectionString: url.toString() })
await db.connect()
await db.query(supabaseStub)
for (const file of readdirSync(migrationsDir).filter((f) => f.endsWith('.sql')).sort()) {
  await db.query(readFileSync(new URL(file, migrationsDir), 'utf8'))
}

async function as(user, sql, params = []) {
  await db.query('begin')
  try {
    await db.query(`set local role ${user ? 'authenticated' : 'anon'}`)
    await db.query(`select set_config('request.jwt.claims', $1, true)`, [
      JSON.stringify(user ? { sub: user, role: 'authenticated' } : { role: 'anon' }),
    ])
    const res = await db.query(sql, params)
    await db.query('commit')
    return res.rows
  } catch (err) {
    await db.query('rollback')
    throw err
  }
}
const service = async (sql, params = []) => (await db.query(sql, params)).rows

async function rejects(promise, pattern, label) {
  await assert.rejects(promise, pattern, label)
}

let passed = 0
async function test(name, fn) {
  try {
    await fn()
    passed++
    console.log(`  ok  ${name}`)
  } catch (err) {
    console.error(`  FAIL  ${name}\n${err.stack}`)
    process.exitCode = 1
  }
}

async function user(email) {
  const id = randomUUID()
  await service('insert into auth.users (id, email) values ($1, $2)', [id, email])
  return id
}

const adminId = await user('admin@x.test')
const teacherA = await user('a@x.test')
const teacherB = await user('b@x.test')
await service(`select public.register_teacher($1, 'Yönetici', 'admin@x.test', null, null, null, true)`, [adminId])
await service(`select public.register_teacher($1, 'Ayşe Öğretmen', 'a@x.test', 'Okul', 'Matematik', null, false)`, [teacherA])
await service(`select public.register_teacher($1, 'Burak Öğretmen', 'b@x.test', null, null, null, false)`, [teacherB])

async function redeem(code, name, username) {
  const id = await user(`${username}@u.test`)
  await service('select public.redeem_invite($1, $2, $3, $4)', [code, id, name, username])
  return id
}

console.log('Veritabanı testleri')

await test('bekleyen öğretmen davet oluşturamaz', async () => {
  await rejects(as(teacherA, `select public.create_student_invite('Ali', 'lgs', 8::smallint)`), /onaylı öğretmen/)
})

await test('admin olmayan öğretmen onaylayamaz', async () => {
  await rejects(as(teacherB, `select public.set_teacher_status($1, 'active')`, [teacherA]), /Yetkin yok/)
})

await test('admin öğretmeni onaylar ve bildirim gider', async () => {
  await as(adminId, `select public.set_teacher_status($1, 'active')`, [teacherA])
  await as(adminId, `select public.set_teacher_status($1, 'active')`, [teacherB])
  const n = await as(teacherA, `select kind from public.notifications`)
  assert.deepEqual(n.map((r) => r.kind), ['approved'])
})

await test('admin öğretmen listesini görür, öğretmen göremez', async () => {
  assert.equal((await as(adminId, 'select * from public.admin_teachers()')).length, 3)
  await rejects(as(teacherA, 'select * from public.admin_teachers()'), /Yetkin yok/)
})

const codes = []
await test('10 öğrenci sınırı davetlerle birlikte uygulanır', async () => {
  for (let i = 0; i < 10; i++) {
    const [row] = await as(teacherA, `select (public.create_student_invite('Öğrenci ${i}', 'yks', 12::smallint, 'say')).code`)
    codes.push(row.code)
  }
  await rejects(as(teacherA, `select public.create_student_invite('Fazla', 'lgs', 8::smallint)`), /kontenjanı dolu/)
  await as(teacherA, 'delete from public.invites where code = $1', [codes.pop()])
  const [row] = await as(teacherA, `select (public.create_student_invite('Elif', 'lgs', 8::smallint)).code`)
  codes.push(row.code)
})

let s1, s2, parent
await test('davet kodu ile öğrenci katılır', async () => {
  const preview = await as(null, 'select * from public.preview_invite($1)', [codes[0].toLowerCase()])
  assert.equal(preview[0].teacher_name, 'Ayşe Öğretmen')
  s1 = await redeem(codes[0], 'Deniz Yılmaz', 'deniz')
  s2 = await redeem(codes[1], 'Kerem Kaya', 'kerem')
  await rejects(redeem(codes[0], 'Tekrar', 'tekrar'), /geçersiz/)
  const [s] = await as(s1, 'select track, grade, field, teacher_id from public.students where id = $1', [s1])
  assert.deepEqual(s, { track: 'yks', grade: 12, field: 'say', teacher_id: teacherA })
})

await test('kod kullanılınca kontenjan dolu kalır', async () => {
  await rejects(as(teacherA, `select public.create_student_invite('X', 'lgs', 8::smallint)`), /kontenjanı dolu/)
})

await test('öğrenci başka öğrenciyi göremez, diğer öğretmen hiç göremez', async () => {
  assert.equal((await as(s1, 'select id from public.students')).length, 1)
  assert.equal((await as(teacherB, 'select id from public.students')).length, 0)
  assert.equal((await as(teacherB, 'select id from public.profiles where id = $1', [s1])).length, 0)
  assert.equal((await as(teacherA, 'select id from public.students')).length, 2)
})

await test('öğrenci kendi profilini ve öğretmenini görür', async () => {
  const rows = await as(s1, 'select id from public.profiles order by full_name')
  assert.deepEqual(new Set(rows.map((r) => r.id)), new Set([s1, teacherA]))
})

await test('öğrenci soru kaydı ekler, başkasına ekleyemez', async () => {
  await as(s1, `insert into public.question_logs (student_id, subject_id, correct, wrong, blank) values ($1, 'tyt-mat', 30, 5, 5)`, [s1])
  await rejects(
    as(s1, `insert into public.question_logs (student_id, subject_id, correct) values ($1, 'tyt-mat', 3)`, [s2]),
    /row-level security/,
  )
})

await test('öğrenci sınav türünü değiştiremez, öğretmen değiştirir', async () => {
  await rejects(as(s1, `update public.students set grade = 11 where id = $1`, [s1]), /sadece öğretmenin/)
  await as(s1, `update public.students set daily_minutes_goal = 180 where id = $1`, [s1])
  await as(teacherA, `update public.students set grade = 11 where id = $1`, [s1])
})

await test('öğrenci yetki alanlarını değiştiremez', async () => {
  await rejects(as(s1, `update public.profiles set is_admin = true where id = $1`, [s1]), /permission denied/)
  await as(s1, `update public.profiles set full_name = 'Deniz Y.' where id = $1`, [s1])
})

let taskId
await test('öğretmen görev verir, öğrenciye bildirim gider', async () => {
  const [t] = await as(teacherA, `insert into public.tasks (student_id, title, due_on) values ($1, 'Türev 40 soru', current_date) returning id`, [s1])
  taskId = t.id
  await as(teacherA, `insert into public.tasks (student_id, title, due_on) values ($1, 'İntegral tekrar', current_date) returning id`, [s1])
  const n = await as(s1, `select title from public.notifications where kind = 'task'`)
  assert.equal(n.length, 1)
  assert.equal(n[0].title, '2 yeni görev')
})

await test('öğrenci öğretmen görevini düzenleyemez ama tamamlayabilir', async () => {
  await rejects(as(s1, `update public.tasks set title = 'x' where id = $1`, [taskId]), /tamamlandı olarak/)
  const rows = await as(s1, `update public.tasks set done_at = now() where id = $1 returning id`, [taskId])
  assert.equal(rows.length, 1)
  await rejects(as(s1, `delete from public.tasks where id = $1 returning id`, [taskId]).then((r) => { if (!r.length) throw new Error('row-level security') }), /row-level security/)
})

await test('deneme neti doğru hesaplanır, fazla soru reddedilir', async () => {
  const [e] = await as(s1, `insert into public.mock_exams (student_id, kind, title) values ($1, 'TYT', 'Deneme 1') returning id`, [s1])
  await as(s1, `insert into public.mock_exam_scores (mock_exam_id, subject_id, correct, wrong, blank) values ($1, 'tyt-mat', 30, 8, 2), ($1, 'tyt-tr', 35, 4, 1)`, [e.id])
  const [r] = await as(s1, `select net from public.mock_exam_results where id = $1`, [e.id])
  assert.equal(Number(r.net), 30 - 2 + 35 - 1)
  await rejects(as(s1, `insert into public.mock_exam_scores (mock_exam_id, subject_id, correct) values ($1, 'tyt-fiz', 8)`, [e.id]), /en fazla 7/)
  await rejects(as(s1, `insert into public.mock_exam_scores (mock_exam_id, subject_id, correct) values ($1, 'lgs-mat', 3)`, [e.id]), /sınav türüne/)
})

await test('veli davet koduyla bağlanır ve sadece okur', async () => {
  const [inv] = await as(s1, `select (public.create_parent_invite($1)).code`, [s1])
  parent = await redeem(inv.code, 'Fatma Yılmaz', 'fatma.yilmaz')
  assert.equal((await as(parent, 'select id from public.students')).length, 1)
  assert.equal((await as(parent, 'select id from public.question_logs')).length, 1)
  await rejects(
    as(parent, `insert into public.question_logs (student_id, subject_id, correct) values ($1, 'tyt-mat', 3)`, [s1]),
    /row-level security/,
  )
  const seen = await as(parent, 'select id from public.profiles')
  assert.deepEqual(new Set(seen.map((r) => r.id)), new Set([parent, s1, teacherA]))
  assert.equal((await as(teacherA, 'select * from public.parent_links')).length, 1)
})

await test('notlar görünürlüğe göre paylaşılır', async () => {
  await as(teacherA, `insert into public.notes (student_id, body) values ($1, 'özel not')`, [s1])
  await as(teacherA, `insert into public.notes (student_id, body, visibility) values ($1, 'veliye not', 'parent')`, [s1])
  await as(teacherA, `insert into public.notes (student_id, body, visibility) values ($1, 'herkese not', 'both')`, [s1])
  assert.deepEqual((await as(s1, 'select body from public.notes order by id')).map((r) => r.body), ['herkese not'])
  assert.deepEqual((await as(parent, 'select body from public.notes order by id')).map((r) => r.body), ['veliye not', 'herkese not'])
  assert.equal((await as(teacherB, 'select body from public.notes')).length, 0)
  await rejects(as(teacherB, `insert into public.notes (student_id, body) values ($1, 'x')`, [s1]), /row-level security/)
})

await test('mesaj kanalları ayrıdır', async () => {
  await as(s1, `insert into public.messages (student_id, channel, body) values ($1, 'student', 'Hocam merhaba')`, [s1])
  await as(parent, `insert into public.messages (student_id, channel, body) values ($1, 'parent', 'İyi günler')`, [s1])
  assert.equal((await as(parent, 'select id from public.messages')).length, 1)
  assert.equal((await as(s1, 'select id from public.messages')).length, 1)
  assert.equal((await as(teacherA, 'select id from public.messages')).length, 2)
  await rejects(as(parent, `insert into public.messages (student_id, channel, body) values ($1, 'student', 'x')`, [s1]), /row-level security/)
  const n = await as(teacherA, `select title from public.notifications where kind = 'message'`)
  assert.equal(n.length, 2)
})

await test('öğretmen özeti doğru döner', async () => {
  const rows = await as(teacherA, 'select * from public.teacher_overview()')
  const d = rows.find((r) => r.id === s1)
  assert.equal(d.questions_7d, 40)
  assert.equal(Number(d.last_net), 62)
  assert.equal(d.parent_count, 1)
  assert.equal(d.tasks_week, 2)
  assert.equal((await as(teacherB, 'select * from public.teacher_overview()')).length, 0)
})

await test('arşivlenen öğrenci yer açar, dolu kontenjanda geri alınamaz', async () => {
  await as(teacherA, 'update public.students set archived_at = now() where id = $1', [s2])
  const [row] = await as(teacherA, `select (public.create_student_invite('Yeni', 'lgs', 8::smallint)).code`)
  assert.ok(row.code)
  await rejects(as(teacherA, 'update public.students set archived_at = null where id = $1', [s2]), /kontenjanı dolu/)
})

await test('anonim kullanıcı müfredatı okur, kişisel veriyi okuyamaz', async () => {
  assert.ok((await as(null, 'select id from public.subjects')).length > 20)
  await rejects(as(null, 'select id from public.profiles'), /permission denied/)
  await rejects(as(null, 'select id from public.students'), /permission denied/)
})

await test('müfredat tam yüklendi', async () => {
  const [r] = await service('select count(*)::int as n from public.topics')
  assert.ok(r.n > 300, `topic sayısı ${r.n}`)
  const empty = await service('select s.id from public.subjects s where not exists (select 1 from public.topics t where t.subject_id = s.id)')
  assert.deepEqual(empty, [])
})

await test('deneme tek işlemde kaydedilir, hatada hiçbir şey kalmaz', async () => {
  const before = (await service('select count(*)::int as n from public.mock_exams'))[0].n
  await rejects(
    as(s1, `select public.create_mock_exam($1, 'TYT', 'Bozuk', current_date, '[{"subject_id":"tyt-fiz","correct":9,"wrong":0,"blank":0}]')`, [s1]),
    /en fazla 7/,
  )
  assert.equal((await service('select count(*)::int as n from public.mock_exams'))[0].n, before)
  const [r] = await as(s1, `select public.create_mock_exam($1, 'TYT', 'Tam', current_date, '[{"subject_id":"tyt-fiz","correct":5,"wrong":1,"blank":1}]') as id`, [s1])
  await rejects(as(s1, `update public.mock_exams set kind = 'AYT' where id = $1`, [r.id]), /türü değiştirilemez/)
  await rejects(as(s1, `select public.create_mock_exam($1, 'TYT', 'Gelecek', current_date + 5, '[{"subject_id":"tyt-fiz","correct":1,"wrong":0,"blank":0}]')`, [s1]), /not_future/)
  await rejects(as(s2, `select public.create_mock_exam($1, 'TYT', 'Başkası', current_date, '[{"subject_id":"tyt-fiz","correct":1,"wrong":0,"blank":0}]')`, [s1]), /row-level security/)
})

await test('aynı öğrencinin velileri birbirini görür', async () => {
  const [inv] = await as(teacherA, `select (public.create_parent_invite($1)).code`, [s1])
  const parent2 = await redeem(inv.code, 'Ali Yılmaz', 'ali.yilmaz')
  const seen = await as(parent2, 'select id from public.profiles')
  assert.ok(seen.some((r) => r.id === parent))
  assert.ok(!seen.some((r) => r.id === s2))
})

await test('davet önizlemesi YKS alanını döner', async () => {
  const [row] = await as(teacherB, `select (public.create_student_invite('Alanlı', 'yks', 11::smallint, 'ea')).code`)
  const [p] = await as(null, 'select field from public.preview_invite($1)', [row.code])
  assert.equal(p.field, 'ea')
})

await test('haftalık veli raporu bir kez gider ve geçen haftayı özetler', async () => {
  await service(
    `insert into public.study_sessions (student_id, minutes, studied_on)
     values ($1, 95, private.today() - extract(isodow from private.today())::int - 2)`,
    [s1],
  )
  await service('select public.send_weekly_reports()')
  await service('select public.send_weekly_reports()')
  const rows = await as(parent, `select title, body from public.notifications where kind = 'report'`)
  assert.equal(rows.length, 1)
  assert.match(rows[0].body, /1 sa 35 dk çalıştı/)
})

await test('öğretmen dikkat özeti bir kez gider, gecikmiş görevi söyler, öğrenci tetikleyemez', async () => {
  await service(
    `insert into public.tasks (student_id, title, due_on)
     select $1, 'Gecikmiş ' || g, private.today() - g from generate_series(1, 3) g`,
    [s1],
  )
  await service('select public.send_teacher_digests()')
  await service('select public.send_teacher_digests()')
  const rows = await as(teacherA, `select title, body from public.notifications where kind = 'report' and dedupe_key like 'teacher-digest:%'`)
  assert.equal(rows.length, 1)
  assert.match(rows[0].body, /3 gecikmiş görev/)
  assert.equal((await as(s1, `select 1 from public.notifications where dedupe_key like 'teacher-digest:%'`)).length, 0)
  await rejects(as(teacherA, 'select public.send_teacher_digests()'), /permission denied/)
})

await test('günlük hatırlatma bugünkü görevleri söyler, arşivdekine gitmez, öğrenci tetikleyemez', async () => {
  await as(teacherA, `insert into public.tasks (student_id, title, due_on) values ($1, 'Paragraf', private.today())`, [s1])
  await as(teacherA, `insert into public.tasks (student_id, title, due_on) values ($1, 'Problemler', private.today())`, [s2])
  await service('select public.send_daily_reminders()')
  const rows = await as(s1, `select title from public.notifications where kind = 'reminder'`)
  const [{ n }] = await service(
    `select count(*)::int as n from public.tasks where student_id = $1 and due_on = private.today() and done_at is null`,
    [s1],
  )
  assert.deepEqual(rows.map((r) => r.title), [n === 1 ? 'Bugün 1 görevin var' : `Bugün ${n} görevin var`])
  assert.equal((await as(s2, `select 1 from public.notifications where kind = 'reminder'`)).length, 0)
  await rejects(as(s1, 'select public.send_daily_reminders()'), /permission denied/)
})

await test('push anahtarlarını ve başkasının aboneliğini kimse göremez', async () => {
  await service(`insert into public.push_keys (public_key, private_key) values ('pub', 'priv')`)
  await rejects(as(s2, 'select * from public.push_keys'), /permission denied/)
  await as(s2, `insert into public.push_subscriptions (endpoint, p256dh, auth) values ('https://push.test/a', 'k', 'a')`)
  assert.equal((await as(s1, 'select * from public.push_subscriptions')).length, 0)
  await rejects(
    as(s1, `insert into public.push_subscriptions (endpoint, user_id, p256dh, auth) values ('https://push.test/b', $1, 'k', 'a')`, [s2]),
    /row-level security/,
  )
})

await test('yanlış soru defteri: öğrenci ve öğretmen ekler, veli sadece görür, başkası göremez', async () => {
  const [w] = await as(s1, `insert into public.wrong_questions (student_id, subject_id, note) values ($1, 'tyt-mat', 'Üslü sayı') returning id, next_review_on`, [s1])
  await as(teacherA, `insert into public.wrong_questions (student_id, subject_id, note) values ($1, 'tyt-fiz', 'Hareket') returning id`, [s1])
  assert.equal((await as(parent, 'select id from public.wrong_questions')).length, 2)
  await rejects(as(parent, `insert into public.wrong_questions (student_id, subject_id, note) values ($1, 'tyt-mat', 'x')`, [s1]), /row-level security/)
  assert.equal((await as(teacherB, 'select id from public.wrong_questions')).length, 0)
  await rejects(as(s1, `insert into public.wrong_questions (student_id, subject_id) values ($1, 'tyt-mat')`, [s1]), /check/)
  const [r1] = await as(s1, 'select review_count, next_review_on - private.today() as gap, learned_at from public.review_wrong_question($1, false)', [w.id])
  assert.deepEqual([r1.review_count, r1.gap, r1.learned_at], [1, 3, null])
  const [r2] = await as(s1, 'select review_count, next_review_on - private.today() as gap from public.review_wrong_question($1, false)', [w.id])
  assert.deepEqual([r2.review_count, r2.gap], [2, 7])
  const [r3] = await as(s1, 'select learned_at is not null as learned from public.review_wrong_question($1, true)', [w.id])
  assert.equal(r3.learned, true)
  await rejects(as(parent, 'select public.review_wrong_question($1, true)', [w.id]), /bulunamadı/)
})

await test('tekrar zamanı gelen yanlışlar hatırlatmaya eklenir', async () => {
  await service(`update public.wrong_questions set next_review_on = private.today() where note = 'Hareket'`)
  await service(`delete from public.notifications where kind = 'reminder'`)
  await service('select public.send_daily_reminders()')
  const [n] = await as(s1, `select body from public.notifications where kind = 'reminder'`)
  assert.match(n.body, /tekrar zamanı gelen 1 yanlış sorun var/)
})

await test('denemede konu yanlışları dersin yanlış ve boş toplamını aşamaz', async () => {
  const [e] = await as(s1, `select public.create_mock_exam($1, 'TYT', 'Konu analizi', current_date, '[{"subject_id":"tyt-fiz","correct":3,"wrong":2,"blank":2}]') as id`, [s1])
  const [t1, t2] = await service(`select id from public.topics where subject_id = 'tyt-fiz' order by sort limit 2`)
  const [mat] = await service(`select id from public.topics where subject_id = 'tyt-mat' order by sort limit 1`)
  await as(s1, 'insert into public.mock_exam_topic_misses (mock_exam_id, topic_id, misses) values ($1, $2, 3)', [e.id, t1.id])
  await rejects(as(s1, 'insert into public.mock_exam_topic_misses (mock_exam_id, topic_id, misses) values ($1, $2, 2)', [e.id, t2.id]), /aşıyor/)
  await as(s1, 'insert into public.mock_exam_topic_misses (mock_exam_id, topic_id, misses) values ($1, $2, 1)', [e.id, t2.id])
  await rejects(as(s1, 'insert into public.mock_exam_topic_misses (mock_exam_id, topic_id, misses) values ($1, $2, 1)', [e.id, mat.id]), /aşıyor/)
  await rejects(as(parent, 'delete from public.mock_exam_topic_misses where mock_exam_id = $1 returning 1', [e.id]).then((r) => { if (!r.length) throw new Error('row-level security') }), /row-level security/)
  assert.equal((await as(parent, 'select * from public.mock_exam_topic_misses where mock_exam_id = $1', [e.id])).length, 2)
})

await test('video izleme: ileri sarılan kısım sayılmaz, yüzde 90 izlenince görev tamamlanır', async () => {
  const [t] = await as(teacherA, `insert into public.tasks (student_id, title, kind, due_on, video_id) values ($1, 'Basınç anlatımı', 'video', private.today(), 'dQw4w9WgXcQ') returning id`, [s1])
  await rejects(as(teacherA, 'select public.save_video_progress($1, 10, 100, array[0], 1, true)', [t.id]), /yetkin yok/)
  await rejects(as(s1, `update public.tasks set video_id = 'aaaaaaaaaaa' where id = $1`, [t.id]), /sadece tamamlandı/)
  const [p1] = await as(s1, 'select watched_seconds, sessions, completed_at from public.save_video_progress($1, 30, 100, array[0,1,2], 1.5, true)', [t.id])
  assert.deepEqual([p1.watched_seconds, p1.sessions, p1.completed_at], [30, 1, null])
  const [p2] = await as(s1, 'select watched_seconds, buckets, max_rate from public.save_video_progress($1, 90, 100, array[2,8], 1, false)', [t.id])
  assert.equal(p2.watched_seconds, 40)
  assert.deepEqual(p2.buckets.slice(0, 3), [1, 1, 2])
  assert.equal(Number(p2.max_rate), 1.5)
  await as(s1, 'select public.save_video_progress($1, 100, 100, array[3,4,5,6,7,9], 1, false)', [t.id])
  const [task] = await as(s1, 'select done_at is not null as done, video_seconds from public.tasks where id = $1', [t.id])
  assert.deepEqual([task.done, task.video_seconds], [true, 100])
  assert.equal((await as(parent, 'select 1 from public.video_progress where task_id = $1', [t.id])).length, 1)
  assert.equal((await as(teacherB, 'select 1 from public.video_progress where task_id = $1', [t.id])).length, 0)
  await rejects(as(s1, `insert into public.tasks (student_id, title, kind, due_on, video_id) values ($1, 'x', 'video', private.today(), 'kisa')`, [s1]), /check/)
})

await test('hata kaydı: herkes yazabilir, sadece admin okur, sınır aşılınca yazılmaz', async () => {
  await as(s1, `select public.log_client_error('TypeError: x is undefined', 'Beklenmeyen bir hata oluştu', '/app/plan', null, 'test', 'abc1234')`)
  await as(null, `select public.log_client_error('Giriş sayfası hatası', null, '/giris', null, null, null)`)
  const rows = await as(adminId, 'select role, message from public.client_errors order by id')
  assert.deepEqual(rows.map((r) => r.role), ['student', null])
  assert.equal((await as(s1, 'select * from public.client_errors')).length, 0)
  assert.equal((await as(teacherA, 'select * from public.client_errors')).length, 0)
  for (let i = 0; i < 35; i++) await as(s1, `select public.log_client_error('tekrar', null, null, null, null, null)`)
  const [{ n }] = await service('select count(*)::int as n from public.client_errors where user_id = $1', [s1])
  assert.equal(n, 30)
})

await test('konu anlatımı: sadece admin yazar, taslağı sadece admin görür, öğretmen notunu öğrenci ve veli göremez', async () => {
  const [{ id: topic }] = await service('select id from public.topics where id not in (select topic_id from public.lessons) order by id limit 1')
  await as(adminId, `insert into public.lessons (topic_id, body, published) values ($1, '## Taslak', false)`, [topic])
  await as(adminId, `insert into public.lesson_notes (topic_id, body) values ($1, 'gizli not')`, [topic])
  assert.equal((await as(adminId, 'select * from public.lessons where topic_id = $1', [topic])).length, 1)
  assert.equal((await as(s1, 'select * from public.lessons where topic_id = $1', [topic])).length, 0)
  assert.equal((await as(teacherA, 'select * from public.lessons where topic_id = $1', [topic])).length, 0)
  await as(adminId, `update public.lessons set published = true where topic_id = $1`, [topic])
  for (const who of [s1, parent, teacherA]) assert.equal((await as(who, 'select * from public.lessons where topic_id = $1', [topic])).length, 1)
  assert.equal((await as(teacherA, 'select * from public.lesson_notes where topic_id = $1', [topic])).length, 1)
  assert.equal((await as(s1, 'select * from public.lesson_notes where topic_id = $1', [topic])).length, 0)
  assert.equal((await as(parent, 'select * from public.lesson_notes where topic_id = $1', [topic])).length, 0)
  for (const who of [s1, parent, teacherA]) {
    await rejects(as(who, `insert into public.lessons (topic_id, body) values ($1, 'x') on conflict (topic_id) do update set body = 'x'`, [topic]), /row-level security/)
    await rejects(as(who, `insert into public.lesson_notes (topic_id, body) values ($1, 'x')`, [topic]), /row-level security/)
    assert.equal((await as(who, `update public.lessons set body = 'ele geçirildi' where topic_id = $1 returning 1`, [topic])).length, 0)
    assert.equal((await as(who, `delete from public.lessons where topic_id = $1 returning 1`, [topic])).length, 0)
  }
  const [row] = await service('select body, updated_by from public.lessons where topic_id = $1', [topic])
  assert.equal(row.body, '## Taslak')
  assert.equal(row.updated_by, adminId)
})

await test('anlatım sorusu: ilk cevap istatistiğe yazılır, tekrar yazılmaz, sadece yayındaki anlatım ve öğrenci', async () => {
  const [{ id: topic, subject_id: subject }] = await service(`select id, subject_id from public.topics where id in (select topic_id from public.lessons where published) order by id limit 1`)
  const before = (await service('select count(*)::int as n from public.question_logs where student_id = $1 and topic_id = $2', [s1, topic]))[0].n
  const first = (await as(s1, 'select * from public.answer_lesson_question($1, $2, $3)', [topic, 'abc', false]))[0]
  assert.equal(first.first_correct, false)
  const again = (await as(s1, 'select * from public.answer_lesson_question($1, $2, $3)', [topic, 'abc', true]))[0]
  assert.equal(again.first_correct, false)
  assert.equal(again.last_correct, true)
  assert.equal(again.attempts, 2)
  const logs = await service('select correct, wrong, subject_id from public.question_logs where student_id = $1 and topic_id = $2', [s1, topic])
  assert.equal(logs.length, before + 1)
  assert.deepEqual([logs.at(-1).correct, logs.at(-1).wrong, logs.at(-1).subject_id], [0, 1, subject])
  assert.equal((await as(s1, 'select * from public.lesson_answers where topic_id = $1', [topic])).length, 1)
  assert.equal((await as(s2, 'select * from public.lesson_answers')).length, 0)
  await rejects(as(teacherA, 'select * from public.answer_lesson_question($1, $2, $3)', [topic, 'x', true]), /Sadece öğrenciler/)
  await rejects(as(s1, 'select * from public.answer_lesson_question($1, $2, $3)', [topic, 'x'.repeat(65), true]), /check constraint/)
  const [{ id: bare }] = await service('select id from public.topics where id not in (select topic_id from public.lessons) order by id limit 1')
  await rejects(as(s1, 'select * from public.answer_lesson_question($1, $2, $3)', [bare, 'x', true]), /yayınlanmış/)
  await rejects(as(s1, 'insert into public.lesson_answers (student_id, topic_id, question_key, first_correct, last_correct) values ($1, $2, $3, true, true)', [s1, topic, 'z']), /permission denied/)
})

await test('yanlış defteri tekrarı: başarısızlık aralığı sıfırlar, art arda beş başarı öğrenildi yapar, başkası değiştiremez', async () => {
  const [{ id }] = await as(s1, `insert into public.wrong_questions (student_id, subject_id, note) values ($1, 'lgs-mat', 'tekrar sorusu') returning id`, [s1])
  const days = async () => (await service(`select (next_review_on - private.today())::int as d, box, lapses, learned_at is not null as learned from public.wrong_questions where id = $1`, [id]))[0]
  const seen = []
  for (let i = 0; i < 4; i++) {
    await as(s1, `select * from public.review_wrong_result($1, 'good')`, [id])
    seen.push((await days()).d)
  }
  assert.deepEqual(seen, [3, 7, 14, 30])
  await as(s1, `select * from public.review_wrong_result($1, 'again')`, [id])
  assert.deepEqual(await days(), { d: 1, box: 0, lapses: 1, learned: false })
  for (let i = 0; i < 5; i++) await as(s1, `select * from public.review_wrong_result($1, 'good')`, [id])
  assert.equal((await days()).learned, true)
  await as(s1, `select * from public.review_wrong_result($1, 'again')`, [id])
  assert.equal((await days()).learned, false)
  await as(s1, `select * from public.review_wrong_result($1, 'learned')`, [id])
  assert.equal((await days()).learned, true)
  await rejects(as(s1, `select * from public.review_wrong_result($1, 'belki')`, [id]), /Geçersiz/)
  await rejects(as(s2, `select * from public.review_wrong_result($1, 'good')`, [id]), /yetkin yok/)
  await rejects(as(parent, `select * from public.review_wrong_result($1, 'good')`, [id]), /yetkin yok/)
})

await test('yapay zekâ anahtarı: durumu sahibi görür, şifreli metni kimse okuyamaz, istemci yazamaz, günlük sınır çalışır', async () => {
  await service(
    `insert into public.teacher_ai_keys (teacher_id, provider, model, key_ciphertext, key_last4) values ($1, 'openai', 'gpt-x', 'v1.gizli', 'abcd')`,
    [teacherA],
  )
  const [own] = await as(teacherA, 'select provider, model, key_last4 from public.teacher_ai_keys')
  assert.deepEqual({ ...own }, { provider: 'openai', model: 'gpt-x', key_last4: 'abcd' })
  await rejects(as(teacherA, 'select key_ciphertext from public.teacher_ai_keys'), /permission denied/)
  await rejects(as(teacherA, 'select * from public.teacher_ai_keys'), /permission denied/)
  await rejects(as(adminId, 'select key_ciphertext from public.teacher_ai_keys'), /permission denied/)
  assert.equal((await as(teacherB, 'select provider from public.teacher_ai_keys')).length, 0)
  await rejects(as(teacherA, `update public.teacher_ai_keys set model = 'x'`), /permission denied/)
  await rejects(as(teacherA, 'delete from public.teacher_ai_keys'), /permission denied/)
  await rejects(as(teacherA, `insert into public.teacher_ai_keys (teacher_id, provider, model, key_ciphertext, key_last4) values ($1, 'openai', 'm', 'c', 'abcd')`, [teacherA]), /permission denied/)
  await rejects(as(teacherA, 'select * from public.ai_usage'), /permission denied/)
  await rejects(as(teacherA, 'select public.ai_take_quota($1, 5)', [teacherA]), /permission denied/)
  const takes = []
  for (let i = 0; i < 4; i++) takes.push((await service('select public.ai_take_quota($1, 3) as ok', [teacherA]))[0].ok)
  assert.deepEqual(takes, [true, true, true, false])
  await service('delete from public.teacher_ai_keys where teacher_id = $1', [teacherA])
})

await test('görevi ve kayıtları olan öğrenci silinebilir', async () => {
  await as(s1, `insert into public.tasks (student_id, title, due_on) values ($1, 'kendi görevim', current_date)`, [s1])
  await service('delete from auth.users where id = $1', [s1])
  const [r] = await service('select count(*)::int as n from public.tasks where student_id = $1', [s1])
  assert.equal(r.n, 0)
})

await db.end()
console.log(`\n${passed} test geçti`)
