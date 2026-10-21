import { useMutation, useQuery, useQueryClient } from '@tanstack/react-query'
import { Library } from 'lucide-react'
import { useState } from 'react'
import { toast } from 'sonner'
import { Button } from '@/components/ui/button'
import { Card, CardBody } from '@/components/ui/card'
import { EmptyState } from '@/components/ui/empty-state'
import { Input } from '@/components/ui/field'
import { Skeleton } from '@/components/ui/skeleton'
import { formatRelative } from '@/lib/dates'
import { errorMessage, supabase, unwrap, type RpcReturn } from '@/lib/supabase'
import { LoadError } from './ui'

type Suggestion = RpcReturn<'admin_book_suggestions'>[number]

const KEY = ['admin', 'book-suggestions'] as const

function SuggestionCard({ suggestion }: { suggestion: Suggestion }) {
  const qc = useQueryClient()
  const [title, setTitle] = useState(suggestion.title)
  const [author, setAuthor] = useState(suggestion.author)
  const review = useMutation({
    mutationFn: async (approve: boolean) =>
      unwrap(await supabase.rpc('review_book_suggestion', { p_id: suggestion.id, p_approve: approve, p_title: title, p_author: author })),
    onSuccess: () => qc.invalidateQueries({ queryKey: KEY }),
    onError: (error) => toast.error(errorMessage(error)),
  })

  return (
    <Card>
      <CardBody className="space-y-3">
        <p className="text-sm text-muted">
          {suggestion.votes} öğrenci ekledi · {formatRelative(suggestion.created_at)}
        </p>
        <div className="grid gap-2 sm:grid-cols-2">
          <Input value={title} onChange={(e) => setTitle(e.target.value)} maxLength={120} aria-label="Kitap adı" />
          <Input value={author} onChange={(e) => setAuthor(e.target.value)} maxLength={80} aria-label="Yazar" />
        </div>
        <div className="flex gap-2">
          <Button className="min-h-11" disabled={title.trim().length < 2 || author.trim().length < 2} loading={review.isPending} onClick={() => review.mutate(true)}>
            Listeye ekle
          </Button>
          <Button variant="secondary" className="min-h-11" disabled={review.isPending} onClick={() => review.mutate(false)}>
            Reddet
          </Button>
        </div>
      </CardBody>
    </Card>
  )
}

export function BookSuggestionsSection() {
  const suggestions = useQuery({ queryKey: KEY, queryFn: async () => unwrap(await supabase.rpc('admin_book_suggestions')) })

  return (
    <div className="max-w-3xl space-y-4">
      <p className="text-[15px] text-muted">
        Listede olmayan kitaplar, öğrenciler yazarıyla birlikte eklediğinde burada toplanır. Üç farklı öğrenci aynı kitabı ve adı büyük harfle başlıyorsa liste kendiliğinden güncellenir. Diğerleri burada onayınızı bekler.
      </p>
      {suggestions.isPending ? (
        <Skeleton className="h-32 rounded-2xl" />
      ) : suggestions.isError ? (
        <LoadError error={suggestions.error} onRetry={() => void suggestions.refetch()} />
      ) : suggestions.data.length === 0 ? (
        <EmptyState icon={Library} title="Bekleyen öneri yok" description="Öğrenciler listede olmayan bir kitap eklediğinde burada görünür." />
      ) : (
        <ul className="space-y-3">
          {suggestions.data.map((s) => (
            <li key={s.id}>
              <SuggestionCard suggestion={s} />
            </li>
          ))}
        </ul>
      )}
    </div>
  )
}
