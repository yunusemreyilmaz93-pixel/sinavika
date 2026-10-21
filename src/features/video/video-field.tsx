import { useQuery } from '@tanstack/react-query'
import { useEffect } from 'react'
import { CircleAlert, CirclePlay } from 'lucide-react'
import { Field, Input } from '@/components/ui/field'
import { Skeleton } from '@/components/ui/skeleton'
import { callApi } from '@/lib/api'
import { parseYouTubeId, thumbnailUrl } from './youtube'

type Info = { embeddable: boolean; title: string | null; author: string | null }

export function useVideoInfo(id: string | null) {
  return useQuery({
    queryKey: ['video-info', id],
    enabled: Boolean(id),
    staleTime: Infinity,
    retry: false,
    queryFn: () => callApi<Info>('video', { action: 'info', id }),
  })
}

export function VideoField({
  value,
  currentTitle,
  onChange,
  onTitle,
}: {
  value: string
  currentTitle: string | null
  onChange: (v: string) => void
  onTitle: (title: string | null) => void
}) {
  const id = parseYouTubeId(value)
  const info = useVideoInfo(id)
  const invalid = value.trim() !== '' && !id
  const title = id ? (info.data?.title ?? null) : null

  useEffect(() => {
    if (!id && currentTitle) onTitle(null)
    else if (title && title !== currentTitle) onTitle(title)
  }, [id, title, currentTitle, onTitle])

  return (
    <div className="space-y-3">
      <Field
        label="YouTube bağlantısı"
        error={invalid ? 'Bu bir YouTube bağlantısı değil. Videonun adresini kopyalayıp yapıştırın' : undefined}
        hint={!value.trim() ? 'Öğrenciniz videoyu uygulamanın içinde izler, ne kadarını izlediğini görürsünüz.' : undefined}
      >
        {(props) => (
          <Input
            {...props}
            inputMode="url"
            value={value}
            placeholder="https://www.youtube.com/watch?v=..."
            onChange={(e) => onChange(e.target.value)}
          />
        )}
      </Field>

      {id && (
        <div className="flex items-center gap-3 rounded-xl border border-line p-2">
          <div className="relative aspect-video w-28 shrink-0 overflow-hidden rounded-lg bg-surface-2">
            <img src={thumbnailUrl(id)} alt="" className="size-full object-cover" loading="lazy" />
            <CirclePlay className="absolute inset-0 m-auto size-7 text-white drop-shadow" aria-hidden />
          </div>
          <div className="min-w-0 flex-1 text-sm">
            {info.isPending ? (
              <Skeleton className="h-4 w-40" />
            ) : info.data?.title ? (
              <>
                <p className="line-clamp-2 font-semibold">{info.data.title}</p>
                {info.data.author && <p className="truncate text-xs text-muted">{info.data.author}</p>}
              </>
            ) : info.isError ? (
              <p className="text-danger">{info.error.message}</p>
            ) : (
              <p className="text-muted">Video bulundu</p>
            )}
            {info.data && !info.data.embeddable && (
              <p className="mt-1 flex items-start gap-1.5 text-xs text-warning">
                <CircleAlert className="mt-px size-3.5 shrink-0" />
                Bu video başka sitelerde oynatılamıyor. Öğrenciniz YouTube'da izleyebilir ama izleme kaydı tutulamaz.
              </p>
            )}
          </div>
        </div>
      )}
    </div>
  )
}
