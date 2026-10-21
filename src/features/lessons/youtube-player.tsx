import { useEffect, useRef } from 'react'
import { useLessonProgress } from './progress'

type YTPlayer = { getCurrentTime(): number; getDuration(): number; destroy(): void }
type YTApi = {
  Player: new (
    el: HTMLElement,
    options: {
      videoId: string
      host: string
      width: string
      height: string
      playerVars: Record<string, number>
      events: { onStateChange?: (e: { data: number }) => void; onError?: () => void }
    },
  ) => YTPlayer
}

type Win = { YT?: YTApi; onYouTubeIframeAPIReady?: () => void }

const PLAYING = 1
let apiPromise: Promise<YTApi> | null = null

function loadApi(): Promise<YTApi> {
  const w = window as unknown as Win
  if (w.YT?.Player) return Promise.resolve(w.YT)
  apiPromise ??= new Promise<YTApi>((resolve, reject) => {
    const previous = w.onYouTubeIframeAPIReady
    w.onYouTubeIframeAPIReady = () => {
      previous?.()
      resolve(w.YT!)
    }
    const script = document.createElement('script')
    script.src = 'https://www.youtube.com/iframe_api'
    script.async = true
    script.onerror = () => {
      apiPromise = null
      reject(new Error('YouTube yüklenemedi'))
    }
    document.head.append(script)
  })
  return apiPromise
}

// Oynatıcı yüklenemezse onFallback çağrılır ve sade iframe'e dönülür, izleme kaydı tutulmaz
export function TrackedPlayer({ id, onFallback }: { id: string; onFallback: () => void }) {
  const reporter = useLessonProgress()
  const host = useRef<HTMLDivElement>(null)

  useEffect(() => {
    let player: YTPlayer | undefined
    let timer: number | undefined
    let cancelled = false
    const report = () => {
      if (player) reporter?.reportVideo(id, player.getCurrentTime(), player.getDuration())
    }
    loadApi().then(
      (YT) => {
        if (cancelled || !host.current) return
        const target = document.createElement('div')
        host.current.append(target)
        player = new YT.Player(target, {
          videoId: id,
          host: 'https://www.youtube-nocookie.com',
          width: '100%',
          height: '100%',
          playerVars: { autoplay: 1, rel: 0, playsinline: 1 },
          events: {
            onStateChange: (e) => {
              window.clearInterval(timer)
              if (e.data === PLAYING) timer = window.setInterval(report, 1000)
            },
          },
        })
      },
      () => {
        if (!cancelled) onFallback()
      },
    )
    return () => {
      cancelled = true
      window.clearInterval(timer)
      player?.destroy()
    }
  }, [id, reporter, onFallback])

  return <div ref={host} className="absolute inset-0 [&>iframe]:size-full" />
}
