import { ExternalLink, FileText, Plus } from 'lucide-react'
import { Link } from 'react-router'
import { Badge } from '@/components/ui/badge'
import { Button } from '@/components/ui/button'
import { Card } from '@/components/ui/card'
import { EmptyState } from '@/components/ui/empty-state'
import { Skeleton } from '@/components/ui/skeleton'
import { formatDate } from '@/lib/dates'
import { errorMessage } from '@/lib/supabase'
import { audienceLabel, usePosts } from './queries'

// Yönetim > Blog: yazıların listesi. Yayındaki yazılar sitenin bir sonraki derlemesinde /blog altında yayımlanır
export function BlogSection() {
  const posts = usePosts()
  return (
    <div className="space-y-4">
      <div className="flex flex-wrap items-center justify-between gap-3">
        <p className="text-sm text-muted">Yayındaki yazılar bir sonraki yayından sonra izlek.site/blog adresinde görünür.</p>
        <Button asChild>
          <Link to="/app/yonetim/blog/yeni">
            <Plus />
            Yeni yazı
          </Link>
        </Button>
      </div>
      {posts.isPending ? (
        <Skeleton className="h-40 rounded-3xl" />
      ) : posts.isError ? (
        <EmptyState icon={FileText} title="Yazılar yüklenemedi" description={errorMessage(posts.error)} />
      ) : !posts.data.length ? (
        <EmptyState
          icon={FileText}
          title="Henüz yazı yok"
          description="İlk yazıyı yazın. Konu anlatımlarındaki bütün bloklar burada da kullanılır."
          action={
            <Button asChild>
              <Link to="/app/yonetim/blog/yeni">Yeni yazı</Link>
            </Button>
          }
        />
      ) : (
        <Card className="divide-y divide-line">
          {posts.data.map((p) => (
            <div key={p.id} className="flex min-h-16 items-center gap-3 px-4 py-3 sm:px-5">
              <Link to={`/app/yonetim/blog/${p.id}`} className="min-w-0 flex-1 hover:underline">
                <p className="truncate font-semibold">{p.title}</p>
                <p className="truncate text-xs text-muted">
                  {audienceLabel[p.audience] ?? p.audience} · {p.reading_minutes} dk · güncelleme {formatDate(p.updated_at, 'd MMM yyyy')}
                </p>
              </Link>
              <Badge tone={p.published ? 'primary' : 'neutral'}>{p.published ? 'Yayında' : 'Taslak'}</Badge>
              {p.published && (
                <a
                  href={`/blog/${p.slug}`}
                  target="_blank"
                  rel="noopener noreferrer"
                  aria-label="Sitede aç"
                  className="grid size-11 place-items-center rounded-xl text-muted hover:bg-surface-2"
                >
                  <ExternalLink className="size-4" />
                </a>
              )}
            </div>
          ))}
        </Card>
      )}
    </div>
  )
}
