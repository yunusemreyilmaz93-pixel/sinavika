import { useMutation, useQuery, useQueryClient } from '@tanstack/react-query'
import { callApi } from '@/lib/api'

import type { AiProvider } from './providers'

export type { AiProvider }
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

export function fetchModels(provider: AiProvider, apiKey: string) {
  return callApi<{ models: string[] }>('ai', { action: 'models', provider, apiKey }).then((r) => r.models)
}

export function askAssistant(messages: Pick<ChatMessage, 'role' | 'content'>[]) {
  return callApi<{ text: string; proposals: Proposal[]; sent: Sent }>('ai', { action: 'chat', messages })
}
