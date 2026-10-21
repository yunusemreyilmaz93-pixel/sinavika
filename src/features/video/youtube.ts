const patterns = [
  /(?:youtube\.com\/watch\?(?:.*&)?v=)([A-Za-z0-9_-]{11})/,
  /(?:youtu\.be\/)([A-Za-z0-9_-]{11})/,
  /(?:youtube(?:-nocookie)?\.com\/(?:embed|shorts|live|v)\/)([A-Za-z0-9_-]{11})/,
]

export function parseYouTubeId(input: string): string | null {
  const value = input.trim()
  if (/^[A-Za-z0-9_-]{11}$/.test(value)) return value
  for (const p of patterns) {
    const m = value.match(p)
    if (m) return m[1]
  }
  return null
}

export function thumbnailUrl(id: string) {
  return `https://i.ytimg.com/vi/${id}/mqdefault.jpg`
}

export function watchUrl(id: string, start = 0) {
  return `https://www.youtube.com/watch?v=${id}${start > 5 ? `&t=${Math.floor(start)}s` : ''}`
}

export type YTPlayer = {
  getCurrentTime(): number
  getDuration(): number
  getPlaybackRate(): number
  getPlayerState(): number
  seekTo(seconds: number, allowSeekAhead: boolean): void
  pauseVideo(): void
  destroy(): void
}

type YTNamespace = {
  Player: new (
    el: HTMLElement,
    options: {
      videoId: string
      host?: string
      playerVars?: Record<string, number | string>
      events?: {
        onReady?: (e: { target: YTPlayer }) => void
        onStateChange?: (e: { data: number; target: YTPlayer }) => void
        onError?: (e: { data: number }) => void
      }
    },
  ) => YTPlayer
}

declare global {
  interface Window {
    YT?: YTNamespace
    onYouTubeIframeAPIReady?: () => void
  }
}

let loading: Promise<YTNamespace> | null = null

export function loadYouTube(): Promise<YTNamespace> {
  if (window.YT?.Player) return Promise.resolve(window.YT)
  if (loading) return loading
  loading = new Promise((resolve, reject) => {
    const previous = window.onYouTubeIframeAPIReady
    window.onYouTubeIframeAPIReady = () => {
      previous?.()
      if (window.YT) resolve(window.YT)
    }
    const script = document.createElement('script')
    script.src = 'https://www.youtube.com/iframe_api'
    script.async = true
    script.onerror = () => {
      loading = null
      reject(new Error('YouTube oynatıcısı yüklenemedi. Bağlantıyı kontrol edip tekrar deneyin'))
    }
    document.head.appendChild(script)
  })
  return loading
}

export const PLAYING = 1
export const PAUSED = 2
export const ENDED = 0

export function formatClock(seconds: number) {
  const s = Math.max(0, Math.round(seconds))
  const h = Math.floor(s / 3600)
  const m = Math.floor((s % 3600) / 60)
  const sec = String(s % 60).padStart(2, '0')
  return h ? `${h}:${String(m).padStart(2, '0')}:${sec}` : `${m}:${sec}`
}
