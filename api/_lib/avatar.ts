export const MAX_AVATAR_BYTES = 100 * 1024
export const MIN_SIDE = 96
export const MAX_SIDE = 512

const ascii = (b: Uint8Array, from: number, to: number) => String.fromCharCode(...b.subarray(from, to))

// WebP dosyasının başlığını okur, genişlik ve yüksekliği döner. Geçerli bir WebP değilse null
export function webpSize(b: Uint8Array): { width: number; height: number } | null {
  if (b.length < 25 || ascii(b, 0, 4) !== 'RIFF' || ascii(b, 8, 12) !== 'WEBP') return null
  const riff = b[4] | (b[5] << 8) | (b[6] << 16) | (b[7] << 24)
  if (riff + 8 !== b.length) return null
  const kind = ascii(b, 12, 16)
  if (kind === 'VP8 ') {
    if (b.length < 30) return null
    if (b[23] !== 0x9d || b[24] !== 0x01 || b[25] !== 0x2a) return null
    return { width: (b[26] | (b[27] << 8)) & 0x3fff, height: (b[28] | (b[29] << 8)) & 0x3fff }
  }
  if (kind === 'VP8L') {
    if (b[20] !== 0x2f) return null
    const bits = (b[21] | (b[22] << 8) | (b[23] << 16) | (b[24] << 24)) >>> 0
    return { width: (bits & 0x3fff) + 1, height: ((bits >>> 14) & 0x3fff) + 1 }
  }
  if (kind === 'VP8X') {
    if (b.length < 30) return null
    return {
      width: (b[24] | (b[25] << 8) | (b[26] << 16)) + 1,
      height: (b[27] | (b[28] << 8) | (b[29] << 16)) + 1,
    }
  }
  return null
}

export function validateAvatar(bytes: Uint8Array): string | null {
  if (!bytes.length) return 'Dosya boş'
  if (bytes.length > MAX_AVATAR_BYTES) return 'Fotoğraf çok büyük'
  const size = webpSize(bytes)
  if (!size) return 'Fotoğraf okunamadı'
  if (size.width < MIN_SIDE || size.height < MIN_SIDE || size.width > MAX_SIDE || size.height > MAX_SIDE) return 'Fotoğraf boyutu uygun değil'
  if (Math.abs(size.width - size.height) > 2) return 'Fotoğraf kare olmalı'
  return null
}

export type Verdict = { verdict: 'pass' } | { verdict: 'flagged'; reason: string } | { verdict: 'unavailable' }

// OpenAI moderasyon uç noktası görüntüleri de denetler ve ücretsizdir. Anahtar yoksa ya da çağrı başarısızsa 'unavailable' döner, fotoğraf yönetici onayına düşer
export async function moderateImage(bytes: Uint8Array, fetcher: typeof fetch = fetch): Promise<Verdict> {
  const key = process.env.OPENAI_API_KEY
  if (!key) return { verdict: 'unavailable' }
  try {
    const res = await fetcher('https://api.openai.com/v1/moderations', {
      method: 'POST',
      headers: { 'content-type': 'application/json', authorization: `Bearer ${key}` },
      body: JSON.stringify({
        model: 'omni-moderation-latest',
        input: [{ type: 'image_url', image_url: { url: `data:image/webp;base64,${Buffer.from(bytes).toString('base64')}` } }],
      }),
      signal: AbortSignal.timeout(10000),
    })
    if (!res.ok) return { verdict: 'unavailable' }
    const body = (await res.json()) as { results?: { flagged?: boolean; categories?: Record<string, boolean> }[] }
    const result = body.results?.[0]
    if (!result) return { verdict: 'unavailable' }
    if (!result.flagged) return { verdict: 'pass' }
    const reason = Object.entries(result.categories ?? {})
      .filter(([, on]) => on)
      .map(([name]) => name)
      .join(', ')
    return { verdict: 'flagged', reason: reason.slice(0, 200) || 'flagged' }
  } catch {
    return { verdict: 'unavailable' }
  }
}
