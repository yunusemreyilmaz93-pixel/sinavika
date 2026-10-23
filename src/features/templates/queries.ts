import { useMutation, useQuery, useQueryClient } from '@tanstack/react-query'
import { keys } from '@/lib/data'
import { shiftDays } from '@/lib/dates'
import { AppError, supabase, unwrap, type Tables } from '@/lib/supabase'
import { parseTemplateItems, type TemplateItem } from '@/features/plan/lib'
import { starterTemplates, templateWeeks, type TemplateGroup } from './starters'

export const MAX_ITEMS = 400
export const MAX_WEEKS = 12
export const MAX_TEMPLATES = 4
export const LIMIT_MESSAGE = `En fazla ${MAX_TEMPLATES} şablon kaydedebilirsiniz. Yenisi için birini silin`

export type TemplateRecord = {
  key: string
  source: 'own' | 'starter'
  id: number | null
  name: string
  description: string | null
  track: 'lgs' | 'yks' | null
  group: TemplateGroup | null
  items: TemplateItem[]
  weeks: number
}

export type TemplateDraft = Pick<TemplateRecord, 'name' | 'description' | 'track' | 'items'>

export const trackLabel = { lgs: 'LGS', yks: 'YKS' } as const

function fromRow(row: Tables<'plan_templates'>): TemplateRecord {
  const items = parseTemplateItems(row.items)
  return {
    key: String(row.id),
    source: 'own',
    id: row.id,
    name: row.name,
    description: row.description,
    track: row.track,
    group: null,
    items,
    weeks: templateWeeks(items),
  }
}

export const starterRecords: TemplateRecord[] = starterTemplates.map((t) => ({
  key: `hazir-${t.id}`,
  source: 'starter',
  id: null,
  name: t.name,
  description: t.description,
  track: t.track,
  group: t.group,
  items: t.items,
  weeks: templateWeeks(t.items),
}))

export function useOwnTemplates() {
  return useQuery({
    queryKey: keys.templates,
    queryFn: async (): Promise<TemplateRecord[]> =>
      unwrap(await supabase.from('plan_templates').select('*').order('updated_at', { ascending: false })).map(fromRow),
  })
}

export function useTemplateSlots() {
  const own = useOwnTemplates()
  const used = own.data?.length ?? 0
  return { used, full: used >= MAX_TEMPLATES }
}

export function useTemplate(key: string | undefined) {
  const starter = starterRecords.find((t) => t.key === key)
  const own = useQuery({
    queryKey: [...keys.templates, key],
    enabled: !starter && Boolean(key) && /^\d+$/.test(key ?? ''),
    queryFn: async (): Promise<TemplateRecord | null> => {
      const row = unwrap(await supabase.from('plan_templates').select('*').eq('id', Number(key)).maybeSingle())
      return row ? fromRow(row) : null
    },
  })
  if (starter) return { data: starter, isPending: false, error: null, refetch: () => Promise.resolve() }
  if (!/^\d+$/.test(key ?? '')) return { data: null, isPending: false, error: null, refetch: () => Promise.resolve() }
  return own
}

export function validateDraft(draft: TemplateDraft) {
  if (!draft.name.trim()) throw new AppError('Şablona bir ad verin')
  if (!draft.items.length) throw new AppError('Şablonda en az bir görev olmalı')
  if (draft.items.length > MAX_ITEMS) throw new AppError(`Şablona en fazla ${MAX_ITEMS} görev sığar`)
}

function payload(draft: TemplateDraft) {
  const items = [...draft.items].sort((a, b) => a.week - b.week || a.weekday - b.weekday)
  return {
    name: draft.name.trim().slice(0, 60),
    description: draft.description?.trim().slice(0, 200) || null,
    track: draft.track,
    items,
  }
}

export function useSaveTemplate() {
  const qc = useQueryClient()
  return useMutation({
    mutationFn: async ({ id, draft }: { id: number | null; draft: TemplateDraft }): Promise<number> => {
      validateDraft(draft)
      if (id === null) {
        return unwrap(await supabase.from('plan_templates').insert(payload(draft)).select('id').single()).id
      }
      unwrap(await supabase.from('plan_templates').update(payload(draft)).eq('id', id))
      return id
    },
    onSuccess: () => qc.invalidateQueries({ queryKey: keys.templates }),
  })
}

export function useDeleteTemplate() {
  const qc = useQueryClient()
  return useMutation({
    mutationFn: async (id: number) => unwrap(await supabase.from('plan_templates').delete().eq('id', id)),
    onSuccess: () => qc.invalidateQueries({ queryKey: keys.templates }),
  })
}

export function templateRows(items: TemplateItem[], studentIds: string[], start: string) {
  return studentIds.flatMap((student_id) =>
    items.map(({ week, weekday, ...item }) => ({ ...item, student_id, due_on: shiftDays(start, week * 7 + weekday) })),
  )
}
