import { useEffect, useRef, useState, type KeyboardEvent, type PointerEvent } from 'react'
import { Button } from '@/components/ui/button'
import { clampOffset, drawRect, encodeWebp, MAX_ZOOM, OUTPUT } from './crop'

async function loadBitmap(file: File): Promise<ImageBitmap | HTMLImageElement> {
  if ('createImageBitmap' in window) {
    try {
      return await createImageBitmap(file, { imageOrientation: 'from-image' })
    } catch {
      // Eski tarayıcılarda Image ile denenir
    }
  }
  const url = URL.createObjectURL(file)
  try {
    const img = new Image()
    img.src = url
    await img.decode()
    return img
  } finally {
    URL.revokeObjectURL(url)
  }
}

export function PhotoCropper({
  file,
  busy,
  onCancel,
  onConfirm,
  onError,
}: {
  file: File
  busy: boolean
  onCancel: () => void
  onConfirm: (blob: Blob) => void
  onError: (message: string) => void
}) {
  const canvasRef = useRef<HTMLCanvasElement>(null)
  const [image, setImage] = useState<ImageBitmap | HTMLImageElement | null>(null)
  const [zoom, setZoom] = useState(1)
  const [offset, setOffset] = useState({ x: 0, y: 0 })
  const drag = useRef<{ x: number; y: number; start: { x: number; y: number } } | null>(null)

  useEffect(() => {
    let cancelled = false
    loadBitmap(file)
      .then((img) => !cancelled && setImage(img))
      .catch(() => !cancelled && onError('Fotoğraf açılamadı. Başka bir fotoğraf deneyin'))
    return () => {
      cancelled = true
    }
  }, [file, onError])

  const width = image ? ('naturalWidth' in image ? image.naturalWidth : image.width) : 0
  const height = image ? ('naturalHeight' in image ? image.naturalHeight : image.height) : 0

  useEffect(() => {
    const ctx = canvasRef.current?.getContext('2d')
    if (!ctx || !image) return
    const r = drawRect(width, height, zoom, offset)
    ctx.clearRect(0, 0, OUTPUT, OUTPUT)
    ctx.fillStyle = '#fff'
    ctx.fillRect(0, 0, OUTPUT, OUTPUT)
    ctx.imageSmoothingQuality = 'high'
    ctx.drawImage(image, r.x, r.y, r.width, r.height)
  }, [image, width, height, zoom, offset])

  const move = (dx: number, dy: number, from = offset) => setOffset(clampOffset(width, height, zoom, { x: from.x + dx, y: from.y + dy }))

  const onPointerDown = (e: PointerEvent<HTMLCanvasElement>) => {
    e.currentTarget.setPointerCapture(e.pointerId)
    drag.current = { x: e.clientX, y: e.clientY, start: offset }
  }
  const onPointerMove = (e: PointerEvent<HTMLCanvasElement>) => {
    if (!drag.current) return
    const k = OUTPUT / e.currentTarget.clientWidth
    move((e.clientX - drag.current.x) * k, (e.clientY - drag.current.y) * k, drag.current.start)
  }
  const onKeyDown = (e: KeyboardEvent<HTMLCanvasElement>) => {
    const step = 12
    const delta = { ArrowLeft: [step, 0], ArrowRight: [-step, 0], ArrowUp: [0, step], ArrowDown: [0, -step] }[e.key]
    if (!delta) return
    e.preventDefault()
    move(delta[0], delta[1])
  }

  const changeZoom = (next: number) => {
    setZoom(next)
    setOffset((o) => clampOffset(width, height, next, o))
  }

  const confirm = async () => {
    const canvas = canvasRef.current
    if (!canvas) return
    const blob = await encodeWebp(canvas)
    if (!blob) return onError('Bu tarayıcı fotoğrafı dönüştüremiyor. Hazır avatarlardan birini seçin')
    onConfirm(blob)
  }

  return (
    <div className="space-y-4">
      <div className="mx-auto w-full max-w-64">
        <canvas
          ref={canvasRef}
          width={OUTPUT}
          height={OUTPUT}
          tabIndex={0}
          role="img"
          aria-label="Fotoğraf kırpma alanı. Kaydırmak için sürükleyin ya da ok tuşlarını kullanın"
          onPointerDown={onPointerDown}
          onPointerMove={onPointerMove}
          onPointerUp={() => (drag.current = null)}
          onPointerCancel={() => (drag.current = null)}
          onKeyDown={onKeyDown}
          className="aspect-square w-full cursor-grab touch-none rounded-full border border-line bg-surface-2 outline-none focus-visible:ring-3 focus-visible:ring-accent/30 active:cursor-grabbing"
        />
      </div>
      <label className="block">
        <span className="text-sm font-semibold">Yakınlaştır</span>
        <input
          type="range"
          min={1}
          max={MAX_ZOOM}
          step={0.01}
          value={zoom}
          onChange={(e) => changeZoom(Number(e.target.value))}
          className="mt-2 h-11 w-full accent-primary"
        />
      </label>
      <div className="flex gap-2 [&>*]:flex-1">
        <Button type="button" variant="secondary" onClick={onCancel} disabled={busy}>
          Başka fotoğraf
        </Button>
        <Button type="button" onClick={() => void confirm()} loading={busy} disabled={!image}>
          Kullan
        </Button>
      </div>
    </div>
  )
}
