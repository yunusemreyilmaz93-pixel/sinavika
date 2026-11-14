import { Document, Font, Page, Path, StyleSheet, Svg, Text, View } from '@react-pdf/renderer'
import type { ReactNode } from 'react'
import tokensCss from '@/index.css?raw'
import { WORD } from '@/components/ui/logo-paths'
import { formatDate, formatMinutes } from '@/lib/dates'
import { formatNet } from '@/lib/exam'
import { scoreFormat } from '@/lib/score'
import type { WeeklyReport } from './weekly-data'

// Renkler index.css içindeki açık tema token'larından okunur. PDF her zaman açık temada basılır
function readTokens() {
  const root = tokensCss.match(/:root\s*\{([^}]*)\}/)?.[1] ?? ''
  const map = new Map<string, string>()
  for (const m of root.matchAll(/--([\w-]+):\s*([^;]+);/g)) map.set(m[1], m[2].trim())
  const get = (name: string) => {
    const value = map.get(name)
    if (!value || !value.startsWith('#')) throw new Error(`index.css içinde --${name} bulunamadı`)
    return value
  }
  return {
    bg: get('bg'),
    surface2: get('surface-2'),
    fg: get('fg'),
    muted: get('fg-muted'),
    line: get('line'),
    primary: get('primary'),
    primarySoft: get('primary-soft'),
    accent: get('accent'),
    marker: get('marker'),
    danger: get('danger'),
    dangerSoft: get('danger-soft'),
    warning: get('warning'),
    warningSoft: get('warning-soft'),
  }
}

const c = readTokens()

let fontsReady = false
function registerFonts(base: string) {
  if (fontsReady) return
  Font.register({
    family: 'Figtree',
    fonts: [
      { src: `${base}/Figtree-400.ttf`, fontWeight: 400 },
      { src: `${base}/Figtree-600.ttf`, fontWeight: 600 },
      { src: `${base}/Figtree-700.ttf`, fontWeight: 700 },
    ],
  })
  Font.register({ family: 'Bricolage', src: `${base}/Bricolage-800.ttf`, fontWeight: 800 })
  Font.registerHyphenationCallback((word) => [word])
  fontsReady = true
}

const s = StyleSheet.create({
  page: { paddingTop: 36, paddingBottom: 52, paddingHorizontal: 36, fontFamily: 'Figtree', fontSize: 9.5, color: c.fg },
  display: { fontFamily: 'Bricolage', fontWeight: 800, lineHeight: 1.15 },
  muted: { color: c.muted },
  row: { flexDirection: 'row' },
  section: { marginTop: 18 },
  h2: { fontFamily: 'Bricolage', fontWeight: 800, fontSize: 13, lineHeight: 1.2, marginBottom: 8 },
  card: { borderWidth: 1, borderColor: c.line, borderRadius: 8, padding: 10 },
  th: { fontSize: 8, color: c.muted, fontWeight: 600 },
  td: { paddingVertical: 4, borderTopWidth: 1, borderTopColor: c.line, alignItems: 'center' },
  footer: { position: 'absolute', bottom: 22, left: 36, right: 36, flexDirection: 'row', justifyContent: 'space-between', fontSize: 7.5, color: c.muted },
})

const percent = (v: number | null) => (v == null ? '-' : `%${Math.round(v * 100)}`)

function delta(now: number, before: number, format: (n: number) => string) {
  if (!before && !now) return null
  const diff = now - before
  if (diff === 0) return { text: 'Geçen haftayla aynı', color: c.muted }
  return { text: `${diff > 0 ? '+' : '-'}${format(Math.abs(diff))} geçen haftaya göre`, color: diff > 0 ? c.primary : c.danger }
}

function Section({ title, children, wrap = false }: { title: string; children: ReactNode; wrap?: boolean }) {
  return (
    <View style={s.section} wrap={wrap}>
      <Text style={s.h2} minPresenceAhead={40}>
        {title}
      </Text>
      {children}
    </View>
  )
}

function Empty({ children }: { children: string }) {
  return <Text style={[s.muted, { paddingVertical: 4 }]}>{children}</Text>
}

function Dot({ color, size = 6 }: { color: string; size?: number }) {
  return <View style={{ width: size, height: size, borderRadius: size / 2, backgroundColor: color }} />
}

function Bar({ value, color, height = 5, track = c.surface2 }: { value: number; color: string; height?: number; track?: string }) {
  return (
    <View style={{ height, borderRadius: height / 2, backgroundColor: track, flexGrow: 1 }}>
      <View style={{ width: `${Math.max(0, Math.min(1, value)) * 100}%`, height, borderRadius: height / 2, backgroundColor: color }} />
    </View>
  )
}

function Stat({ label, value, note }: { label: string; value: string; note?: { text: string; color: string } | null }) {
  return (
    <View style={[s.card, { flex: 1, backgroundColor: c.bg, borderColor: c.bg }]}>
      <Text style={[s.muted, { fontSize: 8, fontWeight: 600 }]}>{label}</Text>
      <Text style={[s.display, { fontSize: 18, marginTop: 3 }]}>{value}</Text>
      {note && <Text style={{ fontSize: 7.5, color: note.color, marginTop: 2 }}>{note.text}</Text>}
    </View>
  )
}

function Cover({ r }: { r: WeeklyReport }) {
  return (
    <View>
      <View style={[s.row, { justifyContent: 'space-between', alignItems: 'center' }]}>
        <Svg viewBox="0 0 301.6 100" style={{ width: 66, height: 22 }}>
          <Path d={WORD} fill={c.primary} />
          <Path d="M0 14.8a14 14 0 1 0 28 0a14 14 0 1 0 -28 0" fill={c.marker} />
        </Svg>
        <Text style={[s.muted, { fontSize: 8 }]}>Oluşturulma: {formatDate(r.generatedOn, 'd MMMM yyyy')}</Text>
      </View>

      <View style={[s.row, { marginTop: 22, alignItems: 'flex-end', justifyContent: 'space-between' }]}>
        <View style={{ flex: 1 }}>
          <Text style={{ fontSize: 9, fontWeight: 700, color: c.primary, letterSpacing: 0.6 }}>HAFTALIK RAPOR</Text>
          <Text style={[s.display, { fontSize: 26, marginTop: 4 }]}>{r.student.name}</Text>
          <Text style={[s.muted, { fontSize: 10.5, marginTop: 3 }]}>
            {r.student.label}
            {r.teacherName ? ` · Koç: ${r.teacherName}` : ''}
          </Text>
          <Text style={{ fontSize: 10.5, fontWeight: 600, marginTop: 6 }}>{r.week.label}</Text>
        </View>
        {r.exam && (
          <View style={{ backgroundColor: c.primarySoft, borderRadius: 10, paddingVertical: 10, paddingHorizontal: 14, alignItems: 'flex-end' }}>
            <Text style={[s.display, { fontSize: 24, color: c.primary }]}>{r.exam.daysLeft}</Text>
            <Text style={{ fontSize: 8.5, fontWeight: 600, color: c.primary }}>gün kaldı</Text>
            <Text style={{ fontSize: 7.5, color: c.muted, marginTop: 1 }}>
              {r.exam.label} · {formatDate(r.exam.date, 'd MMMM yyyy')}
              {r.exam.official ? '' : ' (tahmini)'}
            </Text>
          </View>
        )}
      </View>
      <View style={{ height: 3, backgroundColor: c.marker, width: 48, marginTop: 14, borderRadius: 2 }} />
    </View>
  )
}

function Summary({ r }: { r: WeeklyReport }) {
  const m = r.summary
  const taskShare = m.tasksTotal ? m.tasksDone / m.tasksTotal : null
  const accDelta =
    m.accuracy != null && m.prevAccuracy != null && Math.round(m.accuracy * 100) !== Math.round(m.prevAccuracy * 100)
      ? {
          text: `${m.accuracy > m.prevAccuracy ? '+' : '-'}${Math.abs(Math.round((m.accuracy - m.prevAccuracy) * 100))} puan geçen haftaya göre`,
          color: m.accuracy > m.prevAccuracy ? c.primary : c.danger,
        }
      : null
  return (
    <Section title="Haftanın özeti">
      <View style={[s.row, { gap: 8 }]}>
        <Stat label="Çalışma süresi" value={formatMinutes(m.minutes)} note={delta(m.minutes, m.prevMinutes, formatMinutes)} />
        <Stat label="Çözülen soru" value={String(m.questions)} note={delta(m.questions, m.prevQuestions, String)} />
        <Stat label="Doğruluk" value={percent(m.accuracy)} note={accDelta} />
        <Stat label="Görev" value={`${m.tasksDone}/${m.tasksTotal}`} note={taskShare == null ? null : { text: `${percent(taskShare)} tamamlandı`, color: c.muted }} />
      </View>
      <Text style={[s.muted, { marginTop: 6, fontSize: 8.5 }]}>
        7 günün {m.activeDays} gününde kayıt girildi.
        {r.rest.days ? ` ${r.rest.days} gün dinlenme görevi tamamlandı.` : ''}
      </Text>
      {r.rest.heavy && (
        <View style={{ marginTop: 6, backgroundColor: c.warningSoft, borderRadius: 6, padding: 7 }}>
          <Text style={{ color: c.warning, fontWeight: 600, fontSize: 8.5 }}>Bu hafta çok yoğun çalışıldı ve hiç dinlenilmedi. Bir dinlenme günü planlanması önerilir.</Text>
        </View>
      )}
    </Section>
  )
}

function Days({ r }: { r: WeeklyReport }) {
  const peak = Math.max(1, ...r.days.map((d) => d.minutes))
  const H = 92
  return (
    <Section title="Gün gün çalışma">
      <View style={[s.card, { paddingBottom: 6 }]}>
        <View style={[s.row, { alignItems: 'flex-end', height: H + 14, gap: 8 }]}>
          {r.days.map((d) => (
            <View key={d.date} style={{ flex: 1, alignItems: 'center', justifyContent: 'flex-end', height: H + 14 }}>
              <Text style={{ fontSize: 7, color: c.muted, marginBottom: 2 }}>{d.minutes ? formatMinutes(d.minutes) : ''}</Text>
              <View style={{ width: '70%', height: d.minutes ? Math.max(3, (d.minutes / peak) * H) : 2, borderRadius: 3, backgroundColor: d.minutes ? c.primary : c.line }} />
            </View>
          ))}
        </View>
        <View style={[s.row, { gap: 8, marginTop: 5 }]}>
          {r.days.map((d) => (
            <View key={d.date} style={{ flex: 1, alignItems: 'center' }}>
              <Text style={{ fontSize: 8, fontWeight: 700 }}>{d.label}</Text>
              <Text style={{ fontSize: 7, color: c.muted }}>{d.questions ? `${d.questions} soru` : '-'}</Text>
            </View>
          ))}
        </View>
      </View>
    </Section>
  )
}

function Subjects({ r }: { r: WeeklyReport }) {
  const peak = Math.max(1, ...r.subjects.map((x) => x.minutes))
  return (
    <Section title="Ders dağılımı">
      {r.subjects.length === 0 ? (
        <Empty>Bu hafta ders kaydı yok.</Empty>
      ) : (
        <View>
          <View style={[s.row, { paddingBottom: 3 }]}>
            <Text style={[s.th, { width: '28%' }]}>Ders</Text>
            <Text style={[s.th, { flex: 1 }]}>Süre</Text>
            <Text style={[s.th, { width: 52, textAlign: 'right' }]}>Soru</Text>
            <Text style={[s.th, { width: 70, textAlign: 'right' }]}>D / Y / B</Text>
            <Text style={[s.th, { width: 52, textAlign: 'right' }]}>Doğruluk</Text>
          </View>
          {r.subjects.map((x) => (
            <View key={x.name} style={[s.row, s.td]} wrap={false}>
              <View style={[s.row, { width: '28%', alignItems: 'center', gap: 5, paddingRight: 6 }]}>
                <Dot color={x.color} />
                <Text style={{ fontWeight: 600, flex: 1 }}>{x.name}</Text>
              </View>
              <View style={[s.row, { flex: 1, alignItems: 'center', gap: 6, paddingRight: 8 }]}>
                <Bar value={x.minutes / peak} color={x.color} />
                <Text style={{ width: 52, fontSize: 8 }}>{x.minutes ? formatMinutes(x.minutes) : '-'}</Text>
              </View>
              <Text style={{ width: 52, textAlign: 'right' }}>{x.questions || '-'}</Text>
              <Text style={{ width: 70, textAlign: 'right', color: c.muted }}>{x.questions ? `${x.correct} / ${x.wrong} / ${x.blank}` : '-'}</Text>
              <Text style={{ width: 52, textAlign: 'right', fontWeight: 600 }}>{percent(x.accuracy)}</Text>
            </View>
          ))}
        </View>
      )}
    </Section>
  )
}

function Topics({ r }: { r: WeeklyReport }) {
  return (
    <Section title="Konu ayrıntısı" wrap>
      {r.topics.length === 0 ? (
        <Empty>Bu hafta konu seçilerek kayıt girilmedi.</Empty>
      ) : (
        <View>
          <View style={[s.row, { paddingBottom: 3 }]}>
            <Text style={[s.th, { flex: 1 }]}>Konu</Text>
            <Text style={[s.th, { width: 56, textAlign: 'right' }]}>Süre</Text>
            <Text style={[s.th, { width: 44, textAlign: 'right' }]}>Soru</Text>
            <Text style={[s.th, { width: 60, textAlign: 'right' }]}>D / Y</Text>
            <Text style={[s.th, { width: 52, textAlign: 'right' }]}>Doğruluk</Text>
          </View>
          {r.topics.map((t, i) => (
            <View key={`${t.name}-${i}`} style={[s.row, s.td]} wrap={false}>
              <View style={[s.row, { flex: 1, alignItems: 'center', gap: 5, paddingRight: 6 }]}>
                <Dot color={t.color} size={5} />
                <Text style={{ flex: 1 }}>
                  <Text style={{ fontWeight: 600 }}>{t.name}</Text>
                  <Text style={[s.muted, { fontSize: 7.5 }]}>{`  ${t.subject}`}</Text>
                </Text>
              </View>
              <Text style={{ width: 56, textAlign: 'right', color: c.muted }}>{t.minutes ? formatMinutes(t.minutes) : '-'}</Text>
              <Text style={{ width: 44, textAlign: 'right' }}>{t.questions || '-'}</Text>
              <Text style={{ width: 60, textAlign: 'right', color: c.muted }}>{t.questions ? `${t.correct} / ${t.wrong}` : '-'}</Text>
              <Text style={{ width: 52, textAlign: 'right', fontWeight: 600, color: t.accuracy != null && t.accuracy < 0.5 ? c.danger : c.fg }}>{percent(t.accuracy)}</Text>
            </View>
          ))}
        </View>
      )}
      {r.weakTopics.length > 0 && (
        <View style={{ marginTop: 10, backgroundColor: c.dangerSoft, borderRadius: 8, padding: 10 }} wrap={false}>
          <Text style={{ fontWeight: 700, color: c.danger, marginBottom: 4 }}>En çok zorlanılan konular</Text>
          {r.weakTopics.map((t, i) => (
            <Text key={t.name} style={{ fontSize: 9 }}>
              {i + 1}. {t.name} ({t.subject}): {t.wrong} yanlış, doğruluk {percent(t.accuracy)}
            </Text>
          ))}
        </View>
      )}
    </Section>
  )
}

const kindLabel: Record<string, string> = { study: 'Çalışma', questions: 'Soru', reading: 'Okuma', video: 'Video', review: 'Tekrar', other: 'Diğer', rest: 'Dinlenme' }

function Check({ done, late }: { done: boolean; late: boolean }) {
  const color = done ? (late ? c.warning : c.primary) : c.danger
  return (
    <View style={{ width: 9, height: 9, borderRadius: 2.5, borderWidth: 1.2, borderColor: color, backgroundColor: done ? color : 'transparent', marginTop: 1.5 }} />
  )
}

function Tasks({ r }: { r: WeeklyReport }) {
  const byDay = new Map<string, WeeklyReport['tasks']>()
  for (const t of r.tasks) byDay.set(t.date, [...(byDay.get(t.date) ?? []), t])
  return (
    <Section title="Görevler" wrap>
      {r.tasks.length === 0 ? (
        <Empty>Bu hafta için görev verilmemiş.</Empty>
      ) : (
        <View>
          <View style={[s.row, { gap: 12, marginBottom: 6 }]}>
            {[
              [c.primary, 'Zamanında yapıldı'],
              [c.warning, 'Geç yapıldı'],
              [c.danger, 'Yapılmadı'],
            ].map(([color, label]) => (
              <View key={label} style={[s.row, { alignItems: 'center', gap: 4 }]}>
                <Dot color={color} size={6} />
                <Text style={[s.muted, { fontSize: 7.5 }]}>{label}</Text>
              </View>
            ))}
          </View>
          {[...byDay.entries()].map(([date, list]) => (
            <View key={date} style={[s.row, { borderTopWidth: 1, borderTopColor: c.line, paddingVertical: 5 }]} wrap={false}>
              <Text style={{ width: 78, fontWeight: 700, fontSize: 8.5 }}>{formatDate(date, 'd MMM EEEE')}</Text>
              <View style={{ flex: 1, gap: 3 }}>
                {list.map((t, i) => (
                  <View key={i} style={[s.row, { gap: 6 }]}>
                    <Check done={t.done} late={t.late} />
                    <Text style={{ flex: 1, color: t.done ? c.fg : c.muted }}>
                      {t.title}
                      <Text style={[s.muted, { fontSize: 7.5 }]}>
                        {'  '}
                        {kindLabel[t.kind] ?? ''}
                        {t.subject ? ` · ${t.subject}` : ''}
                      </Text>
                    </Text>
                  </View>
                ))}
              </View>
            </View>
          ))}
        </View>
      )}
    </Section>
  )
}

function Exams({ r }: { r: WeeklyReport }) {
  return (
    <Section title="Denemeler" wrap>
      {r.exams.length === 0 ? (
        <Empty>Bu hafta deneme girilmedi.</Empty>
      ) : (
        r.exams.map((e, i) => {
          const diff = e.prevNet == null ? null : Math.round((e.net - e.prevNet) * 100) / 100
          return (
            <View key={i} style={[s.card, { marginBottom: 8 }]} wrap={false}>
              <View style={[s.row, { justifyContent: 'space-between', alignItems: 'flex-start' }]}>
                <View style={{ flex: 1 }}>
                  <Text style={{ fontWeight: 700, fontSize: 10.5 }}>{e.title}</Text>
                  <Text style={[s.muted, { fontSize: 8 }]}>
                    {e.kind} · {formatDate(e.date, 'd MMMM EEEE')}
                  </Text>
                </View>
                <View style={[s.row, { gap: 14 }]}>
                  <View style={{ alignItems: 'flex-end' }}>
                    <Text style={[s.display, { fontSize: 17 }]}>{formatNet(e.net)}</Text>
                    <Text style={{ fontSize: 7.5, color: diff == null ? c.muted : diff >= 0 ? c.primary : c.danger }}>
                      {diff == null ? 'net' : `net, öncekine göre ${diff >= 0 ? '+' : ''}${formatNet(diff)}`}
                    </Text>
                  </View>
                  {e.score != null && (
                    <View style={{ alignItems: 'flex-end' }}>
                      <Text style={[s.display, { fontSize: 17 }]}>{scoreFormat.format(e.score)}</Text>
                      <Text style={[s.muted, { fontSize: 7.5 }]}>puan, bilgi amaçlı</Text>
                    </View>
                  )}
                </View>
              </View>
              {e.subjects.length > 0 && (
                <View style={{ marginTop: 8 }}>
                  <View style={[s.row, { paddingBottom: 2 }]}>
                    <Text style={[s.th, { flex: 1 }]}>Ders</Text>
                    <Text style={[s.th, { width: 40, textAlign: 'right' }]}>Doğru</Text>
                    <Text style={[s.th, { width: 40, textAlign: 'right' }]}>Yanlış</Text>
                    <Text style={[s.th, { width: 40, textAlign: 'right' }]}>Boş</Text>
                    <Text style={[s.th, { width: 44, textAlign: 'right' }]}>Net</Text>
                  </View>
                  {e.subjects.map((x) => (
                    <View key={x.name} style={[s.row, { paddingVertical: 2.5, borderTopWidth: 1, borderTopColor: c.line, alignItems: 'center' }]}>
                      <View style={[s.row, { flex: 1, alignItems: 'center', gap: 5 }]}>
                        <Dot color={x.color} size={5} />
                        <Text>{x.name}</Text>
                      </View>
                      <Text style={{ width: 40, textAlign: 'right' }}>{x.correct}</Text>
                      <Text style={{ width: 40, textAlign: 'right' }}>{x.wrong}</Text>
                      <Text style={{ width: 40, textAlign: 'right' }}>{x.blank}</Text>
                      <Text style={{ width: 44, textAlign: 'right', fontWeight: 700 }}>{formatNet(x.net)}</Text>
                    </View>
                  ))}
                </View>
              )}
            </View>
          )
        })
      )}
      {r.exams.some((e) => e.score != null) && (
        <Text style={[s.muted, { fontSize: 7.5 }]}>Puan bilgi amaçlıdır. Gerçek puan o yıl sınava girenlerin sonuçlarına göre hesaplanır ve her yıl değişir.</Text>
      )}
    </Section>
  )
}

function GoalsAndPace({ r }: { r: WeeklyReport }) {
  const p = r.pace
  if (!r.goals.length && !p) return null
  const paceText =
    p == null
      ? ''
      : p.state === 'done'
        ? 'Tüm konular tamamlandı.'
        : p.state === 'ahead'
          ? 'Bu hızla konular sınavdan önce biter.'
          : p.state === 'behind'
            ? `Bu hızla konular sınavdan ${p.lateDays} gün sonra biter.`
            : 'Son 4 haftada tamamlanan konu yok.'
  return (
    <Section title="Hedef ve tempo">
      <View style={[s.row, { gap: 10 }]}>
        {r.goals.length > 0 && (
          <View style={[s.card, { flex: 1 }]}>
            <Text style={{ fontWeight: 700, marginBottom: 5 }}>Hedef netler</Text>
            {r.goals.map((g) => (
              <View key={g.kind} style={[s.row, { justifyContent: 'space-between', paddingVertical: 3, borderTopWidth: 1, borderTopColor: c.line }]}>
                <Text style={{ fontWeight: 600 }}>{g.kind}</Text>
                <Text style={s.muted}>
                  Hedef {formatNet(g.target)} · Son {formatNet(g.last)}
                </Text>
                <Text style={{ fontWeight: 700, color: g.gap == null ? c.muted : g.gap <= 0 ? c.primary : c.warning }}>
                  {g.gap == null ? '-' : g.gap <= 0 ? 'Ulaşıldı' : `${formatNet(g.gap)} net kaldı`}
                </Text>
              </View>
            ))}
          </View>
        )}
        {p && (
          <View style={[s.card, { flex: 1 }]}>
            <View style={[s.row, { justifyContent: 'space-between' }]}>
              <Text style={{ fontWeight: 700 }}>Konu temposu</Text>
              <Text style={{ fontWeight: 700 }}>
                {p.done}/{p.total} konu
              </Text>
            </View>
            <View style={{ marginTop: 6 }}>
              <Bar value={p.total ? p.done / p.total : 0} color={p.state === 'behind' || p.state === 'stalled' ? c.warning : c.primary} height={6} />
            </View>
            <Text style={{ marginTop: 6, fontSize: 8.5 }}>{paceText}</Text>
            <Text style={[s.muted, { fontSize: 8 }]}>
              Son 4 haftada haftada {p.weeklyRate.toLocaleString('tr-TR', { maximumFractionDigits: 1 })} konu, yetişmesi için haftada {p.required.toLocaleString('tr-TR', { maximumFractionDigits: 1 })} konu gerekiyor.
            </Text>
          </View>
        )}
      </View>
    </Section>
  )
}

function Learning({ r }: { r: WeeklyReport }) {
  const w = r.wrong
  return (
    <Section title="Öğrenme">
      <View style={[s.row, { gap: 10 }]}>
        <View style={[s.card, { flex: 1 }]}>
          <Text style={{ fontWeight: 700, marginBottom: 4 }}>Tamamlanan konular</Text>
          {r.topicsCompleted.length ? r.topicsCompleted.slice(0, 10).map((t) => <Text key={t}>{t}</Text>) : <Empty>Bu hafta tamamlanan konu yok.</Empty>}
          {r.lessons.length > 0 && (
            <>
              <Text style={{ fontWeight: 700, marginTop: 8, marginBottom: 4 }}>Okunan konu anlatımları</Text>
              {r.lessons.map((l) => (
                <View key={l.name} style={[s.row, { justifyContent: 'space-between' }]}>
                  <Text>{l.name}</Text>
                  <Text style={s.muted}>{formatMinutes(l.minutes)}</Text>
                </View>
              ))}
            </>
          )}
        </View>
        <View style={[s.card, { width: 180 }]}>
          <Text style={{ fontWeight: 700, marginBottom: 6 }}>Yanlış defteri</Text>
          {[
            ['Eklenen soru', w.added],
            ['Tekrar edilen', w.reviewed],
            ['Öğrenildi', w.learned],
            ['Gelecek hafta tekrar', w.due],
          ].map(([label, value]) => (
            <View key={label} style={[s.row, { justifyContent: 'space-between', paddingVertical: 2.5 }]}>
              <Text style={s.muted}>{label}</Text>
              <Text style={{ fontWeight: 700 }}>{value}</Text>
            </View>
          ))}
        </View>
      </View>
    </Section>
  )
}

function Reading({ r }: { r: WeeklyReport }) {
  if (!r.reading.books.length) return null
  return (
    <Section title="Kitap okuma">
      <View style={s.card}>
        {r.reading.books.map((b) => (
          <View key={b.title} style={[s.row, { justifyContent: 'space-between', paddingVertical: 2.5 }]}>
            <Text>
              <Text style={{ fontWeight: 600 }}>{b.title}</Text>
              <Text style={s.muted}>{b.author ? `  ${b.author}` : ''}</Text>
            </Text>
            <Text style={{ fontWeight: 600 }}>
              {b.pages} sayfa{b.finished ? ', bitirildi' : ''}
            </Text>
          </View>
        ))}
        <Text style={[s.muted, { marginTop: 4, fontSize: 8 }]}>Toplam {r.reading.pages} sayfa okundu.</Text>
      </View>
    </Section>
  )
}

function Notes({ r }: { r: WeeklyReport }) {
  if (!r.comment && !r.notes.length) return null
  return (
    <Section title="Koçun değerlendirmesi" wrap>
      {r.comment ? (
        <View style={{ backgroundColor: c.primarySoft, borderRadius: 8, padding: 12, borderLeftWidth: 3, borderLeftColor: c.primary }} wrap={false}>
          <Text style={{ fontSize: 10.5, lineHeight: 1.5 }}>{r.comment}</Text>
          {r.teacherName && <Text style={{ marginTop: 6, fontSize: 8.5, fontWeight: 700, color: c.primary }}>{r.teacherName}</Text>}
        </View>
      ) : null}
      {r.notes.map((n, i) => (
        <View key={i} style={[s.card, { marginTop: 8 }]} wrap={false}>
          <Text style={[s.muted, { fontSize: 8, fontWeight: 600, marginBottom: 3 }]}>
            {n.kind === 'meeting' ? 'Görüşme notu' : 'Not'} · {formatDate(n.date, 'd MMMM')}
          </Text>
          <Text>{n.body}</Text>
        </View>
      ))}
    </Section>
  )
}

function NextWeek({ r }: { r: WeeklyReport }) {
  if (!r.nextWeek.length) return null
  return (
    <Section title="Gelecek hafta">
      <View style={s.card}>
        {r.nextWeek.slice(0, 24).map((t, i) => (
          <View key={i} style={[s.row, { paddingVertical: 2 }]}>
            <Text style={{ width: 78, fontWeight: 600, fontSize: 8.5 }}>{formatDate(t.date, 'd MMM EEE')}</Text>
            <Text style={{ flex: 1 }}>
              {t.title}
              <Text style={[s.muted, { fontSize: 7.5 }]}>
                {'  '}
                {kindLabel[t.kind] ?? ''}
                {t.subject ? ` · ${t.subject}` : ''}
              </Text>
            </Text>
          </View>
        ))}
        {r.nextWeek.length > 24 && <Text style={[s.muted, { marginTop: 3 }]}>ve {r.nextWeek.length - 24} görev daha</Text>}
      </View>
    </Section>
  )
}

export function WeeklyReportDocument({ report, fontBase = `${window.location.origin}/fonts` }: { report: WeeklyReport; fontBase?: string }) {
  registerFonts(fontBase)
  return (
    <Document title={`${report.student.name} haftalık rapor ${report.week.label}`} author="İzlek" creator="İzlek" producer="İzlek" language="tr">
      <Page size="A4" style={s.page}>
        <View style={s.footer} fixed>
          <Text>
            İzlek · izlek.site · {report.student.name} · {report.week.label}
          </Text>
          <Text render={({ pageNumber, totalPages }) => `${pageNumber} / ${totalPages}`} />
        </View>
        <Cover r={report} />
        <Summary r={report} />
        <Days r={report} />
        <Subjects r={report} />
        <Topics r={report} />
        <Tasks r={report} />
        <Exams r={report} />
        <GoalsAndPace r={report} />
        <Learning r={report} />
        <Reading r={report} />
        <Notes r={report} />
        <NextWeek r={report} />
      </Page>
    </Document>
  )
}
