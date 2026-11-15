import { ExternalLink, Video } from 'lucide-react'
import { useEffect, useState } from 'react'
import { Link } from 'react-router'
import { Button } from '@/components/ui/button'
import { Card, CardHeader } from '@/components/ui/card'
import { formatDate } from '@/lib/dates'
import { phaseOf, useMeetings, type Meeting } from './queries'

const WEEK = 7 * 24 * 60 * 60_000

// Önümüzdeki 7 gündeki ilk görüşme. Yoksa hiç görünmez
export function NextMeetingCard({ nameOf }: { nameOf?: (m: Meeting) => string }) {
  const meetings = useMeetings()
  const now = useNow()
  const next = (meetings.data ?? []).find(
    (m) => ['upcoming', 'open', 'live'].includes(phaseOf(m, now)) && Date.parse(m.starts_at) < now + WEEK,
  )
  if (!next) return null
  const phase = phaseOf(next, now)
  const open = phase === 'open' || phase === 'live'
  return (
    <Card>
      <CardHeader title="Yaklaşan görüşme" action={<Video aria-hidden className="size-5 text-muted" />} />
      <div className="px-4 pb-4 sm:px-5 sm:pb-5">
        {nameOf && <p className="truncate font-semibold">{nameOf(next)}</p>}
        <p className="text-sm text-muted">
          {formatDate(next.starts_at, 'd MMMM EEEE, HH:mm')} · {next.mode === 'app' ? 'uygulama içinde' : 'dış bağlantı'}
        </p>
        {next.mode === 'app' ? (
          <Button asChild={open} disabled={!open} variant={open ? 'primary' : 'secondary'} className="mt-3 w-full">
            {open ? (
              <Link to={`/app/gorusme/${next.id}`}>
                <Video />
                Katıl
              </Link>
            ) : (
              <>
                <Video />
                10 dk önce açılır
              </>
            )}
          </Button>
        ) : (
          <Button asChild variant={open ? 'primary' : 'secondary'} className="mt-3 w-full">
            <a href={next.link ?? '#'} target="_blank" rel="noopener noreferrer">
              <ExternalLink />
              Bağlantıyı aç
            </a>
          </Button>
        )}
      </div>
    </Card>
  )
}

// Görüşme durumları zamanla değişir, kart dakikada bir yeniden hesaplanır
export function useNow(ms = 30_000) {
  const [now, setNow] = useState(() => Date.now())
  useEffect(() => {
    const id = setInterval(() => setNow(Date.now()), ms)
    return () => clearInterval(id)
  }, [ms])
  return now
}
