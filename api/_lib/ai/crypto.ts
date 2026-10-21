import { createCipheriv, createDecipheriv, createHmac, hkdfSync, randomBytes } from 'node:crypto'
import { HttpError } from '../server.js'

function secret() {
  const value = process.env.AI_KEY_SECRET
  if (!value || value.length < 24) throw new HttpError(503, 'Asistan henüz yapılandırılmadı. Yönetici sunucuya AI_KEY_SECRET değişkenini eklemeli')
  return value
}

const derive = (label: string) => Buffer.from(hkdfSync('sha256', secret(), 'yolumnet', label, 32))

export function isConfigured() {
  return Boolean(process.env.AI_KEY_SECRET && process.env.AI_KEY_SECRET.length >= 24)
}

// AES-256-GCM. Öğretmen kimliği ilişkili veri olarak bağlanır, şifreli metin başka satıra taşınamaz
export function encryptKey(plain: string, teacherId: string) {
  const nonce = randomBytes(12)
  const cipher = createCipheriv('aes-256-gcm', derive('ai-key'), nonce)
  cipher.setAAD(Buffer.from(teacherId))
  const body = Buffer.concat([cipher.update(plain, 'utf8'), cipher.final()])
  return ['v1', nonce.toString('base64url'), body.toString('base64url'), cipher.getAuthTag().toString('base64url')].join('.')
}

export function decryptKey(blob: string, teacherId: string) {
  const [version, nonce, body, tag] = blob.split('.')
  if (version !== 'v1' || !nonce || !body || !tag) throw new HttpError(500, 'Kayıtlı anahtar okunamadı. Anahtarı silip yeniden gir')
  try {
    const decipher = createDecipheriv('aes-256-gcm', derive('ai-key'), Buffer.from(nonce, 'base64url'))
    decipher.setAAD(Buffer.from(teacherId))
    decipher.setAuthTag(Buffer.from(tag, 'base64url'))
    return Buffer.concat([decipher.update(Buffer.from(body, 'base64url')), decipher.final()]).toString('utf8')
  } catch {
    throw new HttpError(500, 'Kayıtlı anahtar okunamadı. Anahtarı silip yeniden gir')
  }
}

// Aynı öğretmen ve aynı kişi için hep aynı takma kimlik. Eşleme veritabanında tutulmaz
export function pseudonym(prefix: string, teacherId: string, personId: string, attempt = 0) {
  const digest = createHmac('sha256', derive('pseudonym')).update(`${teacherId}|${personId}|${attempt}`).digest()
  return `${prefix}-${String(digest.readUInt32BE(0) % 1_000_000).padStart(6, '0')}`
}
