import { useMutation, useQuery, useQueryClient } from '@tanstack/react-query'
import { callApi } from '@/lib/api'

export type AiProvider = 'anthropic' | 'openai' | 'gemini'
export type AiStatus = {
  configured: boolean
  dailyLimit: number
  key: { provider: AiProvider; model: string; key_last4: string; consented_at: string } | null
}

export type ProposalTask = {
  title: string
  kind: 'study' | 'questions' | 'reading' | 'video' | 'review' | 'other'
  subject_id: string | null
  topic_id: number | null
  due_on: string
  target_questions: number | null
  target_minutes: number | null
  note: string | null
  subjectName: string | null
  topicName: string | null
}
export type Proposal = { studentId: string; studentName: string; tasks: ProposalTask[]; warnings: string[] }
export type Sent = { system: string; turns: { rol: string; metin: string }[] }
export type ChatMessage = { role: 'user' | 'assistant'; content: string; proposals?: Proposal[]; sent?: Sent }

export const providerLabels: Record<AiProvider, string> = { anthropic: 'Anthropic (Claude)', openai: 'OpenAI', gemini: 'Google (Gemini)' }
export const modelHints: Record<AiProvider, string[]> = {
  anthropic: ['claude-sonnet-5-5', 'claude-haiku-5-5'],
  openai: ['gpt-4.1-mini', 'gpt-4.1', 'gpt-4o-mini'],
  gemini: ['gemini-2.5-flash', 'gemini-2.5-pro'],
}

const statusKey = ['ai', 'status'] as const

export function useAiStatus() {
  return useQuery({ queryKey: statusKey, staleTime: 60_000, queryFn: () => callApi<AiStatus & { ok: true }>('ai', { action: 'status' }) })
}

export function useSaveAiKey() {
  const qc = useQueryClient()
  return useMutation({
    mutationFn: (values: { provider: AiProvider; model: string; apiKey: string }) => callApi('ai', { action: 'save_key', consent: true, ...values }),
    onSuccess: () => qc.invalidateQueries({ queryKey: statusKey }),
  })
}

export function useRemoveAiKey() {
  const qc = useQueryClient()
  return useMutation({
    mutationFn: () => callApi('ai', { action: 'remove_key' }),
    onSuccess: () => qc.invalidateQueries({ queryKey: statusKey }),
  })
}

export function askAssistant(messages: Pick<ChatMessage, 'role' | 'content'>[]) {
  return callApi<{ text: string; proposals: Proposal[]; sent: Sent }>('ai', { action: 'chat', messages })
}
