import type { ComponentType, SVGProps } from 'react'
import { AnthropicIcon, DeepSeekIcon, GeminiIcon, GroqIcon, MistralIcon, OpenAIIcon, OpenRouterIcon, TogetherIcon, XAIIcon } from './provider-icons'

export const PROVIDER_IDS = ['anthropic', 'openai', 'gemini', 'xai', 'mistral', 'deepseek', 'groq', 'openrouter', 'together'] as const
export type AiProvider = (typeof PROVIDER_IDS)[number]

export type ProviderInfo = { id: AiProvider; label: string; icon: ComponentType<SVGProps<SVGSVGElement>>; keyUrl: string }

export const providers: ProviderInfo[] = [
  { id: 'anthropic', label: 'Claude', icon: AnthropicIcon, keyUrl: 'https://console.anthropic.com/settings/keys' },
  { id: 'openai', label: 'OpenAI', icon: OpenAIIcon, keyUrl: 'https://platform.openai.com/api-keys' },
  { id: 'gemini', label: 'Gemini', icon: GeminiIcon, keyUrl: 'https://aistudio.google.com/apikey' },
  { id: 'xai', label: 'Grok', icon: XAIIcon, keyUrl: 'https://console.x.ai' },
  { id: 'mistral', label: 'Mistral', icon: MistralIcon, keyUrl: 'https://console.mistral.ai/api-keys' },
  { id: 'deepseek', label: 'DeepSeek', icon: DeepSeekIcon, keyUrl: 'https://platform.deepseek.com/api_keys' },
  { id: 'groq', label: 'Groq', icon: GroqIcon, keyUrl: 'https://console.groq.com/keys' },
  { id: 'openrouter', label: 'OpenRouter', icon: OpenRouterIcon, keyUrl: 'https://openrouter.ai/keys' },
  { id: 'together', label: 'Together', icon: TogetherIcon, keyUrl: 'https://api.together.ai/settings/api-keys' },
]

export const providerById = Object.fromEntries(providers.map((p) => [p.id, p])) as Record<AiProvider, ProviderInfo>
