export const OUTPUT = 256
export const MAX_INPUT_BYTES = 5 * 1024 * 1024
export const MAX_OUTPUT_BYTES = 100 * 1024
export const MAX_ZOOM = 3

type Offset = { x: number; y: number }

// Görüntü, kısa kenarı kare alanı dolduracak şekilde ölçeklenir. Zoom bunun üstüne çarpılır
export function drawSize(width: number, height: number, zoom: number) {
  const scale = (OUTPUT / Math.min(width, height)) * zoom
  return { width: width * scale, height: height * scale }
}

export function clampOffset(width: number, height: number, zoom: number, offset: Offset): Offset {
  const size = drawSize(width, height, zoom)
  const limitX = Math.max(0, (size.width - OUTPUT) / 2)
  const limitY = Math.max(0, (size.height - OUTPUT) / 2)
  return { x: Math.min(limitX, Math.max(-limitX, offset.x)), y: Math.min(limitY, Math.max(-limitY, offset.y)) }
}

export function drawRect(width: number, height: number, zoom: number, offset: Offset) {
  const size = drawSize(width, height, zoom)
  const o = clampOffset(width, height, zoom, offset)
  return { x: (OUTPUT - size.width) / 2 + o.x, y: (OUTPUT - size.height) / 2 + o.y, width: size.width, height: size.height }
}

export function checkInput(file: File): string | null {
  if (!/^image\/(jpeg|png|webp|gif)$/.test(file.type)) return 'Yalnızca JPEG, PNG ya da WebP fotoğraf yüklenebilir'
  if (file.size > MAX_INPUT_BYTES) return 'Fotoğraf 5 MB değerinden büyük olamaz'
  return null
}

export async function encodeWebp(canvas: HTMLCanvasElement): Promise<Blob | null> {
  for (const quality of [0.85, 0.7, 0.55, 0.4]) {
    const blob = await new Promise<Blob | null>((resolve) => canvas.toBlob(resolve, 'image/webp', quality))
    if (!blob || blob.type !== 'image/webp') return null
    if (blob.size <= MAX_OUTPUT_BYTES) return blob
  }
  return null
}
