export const USERNAME_EMAIL_DOMAIN = 'hesap.sinavika.app'
export const USERNAME_PATTERN = /^[a-z0-9._]{3,24}$/
export const PASSWORD_MIN = 8
export const PASSWORD_MAX = 72

export const PASSWORD_RULES = [
  { id: 'length', label: `En az ${PASSWORD_MIN} karakter`, test: (p: string) => p.length >= PASSWORD_MIN },
  { id: 'lower', label: 'Bir küçük harf (a, b, c gibi)', test: (p: string) => /[a-z]/.test(p) },
  { id: 'upper', label: 'Bir büyük harf (A, B, C gibi)', test: (p: string) => /[A-Z]/.test(p) },
  { id: 'digit', label: 'Bir rakam', test: (p: string) => /[0-9]/.test(p) },
  { id: 'symbol', label: 'Bir sembol (! ? . * gibi)', test: (p: string) => /[!@#$%^&*()_+\-=[\]{};':"\\|<>?,./`~]/.test(p) },
] as const

export function passwordIssues(password: string) {
  const missing = PASSWORD_RULES.filter((r) => !r.test(password))
  if (password.length > PASSWORD_MAX) return [`En fazla ${PASSWORD_MAX} karakter olabilir`]
  return missing.map((r) => r.label)
}

export function passwordIssueMessage(password: string) {
  const issues = passwordIssues(password)
  if (!issues.length) return null
  if (password.length > PASSWORD_MAX) return issues[0]
  return `Şifrende eksik olanlar: ${issues.map((i) => i.replace(/ \(.*\)$/, '').toLocaleLowerCase('tr')).join(', ')}`
}

export function usernameToEmail(username: string) {
  return `${username.trim().toLowerCase()}@${USERNAME_EMAIL_DOMAIN}`
}

export function loginEmail(identifier: string) {
  const value = identifier.trim().toLowerCase()
  return value.includes('@') ? value : usernameToEmail(value)
}

const turkish: Record<string, string> = { ç: 'c', ğ: 'g', ı: 'i', ö: 'o', ş: 's', ü: 'u', â: 'a', î: 'i', û: 'u' }

export function suggestUsername(fullName: string) {
  return fullName
    .toLocaleLowerCase('tr')
    .replace(/[çğıöşüâîû]/g, (c) => turkish[c] ?? c)
    .replace(/[^a-z0-9]+/g, '.')
    .replace(/^\.+|\.+$/g, '')
    .slice(0, 24)
}

export function passwordProblem(error: unknown) {
  const reasons = ((error as { reasons?: string[] } | null)?.reasons ?? []).join(' ')
  const message = `${(error as { message?: string } | null)?.message ?? ''} ${reasons}`
  if (/pwned|leaked|breach|known to be weak|easy to guess/i.test(message)) {
    return 'Bu şifre çok yaygın, daha önce sızdırılmış şifre listelerinde var. Daha az tahmin edilir bir şifre seç'
  }
  const length = message.match(/at least (\d+) characters/i)
  if (length) return `Şifren en az ${length[1]} karakter olmalı`
  if (/character of each|characters?\b.*\b(lower|upper|digit|symbol)|characters/i.test(message)) {
    const parts: string[] = []
    if (/abcdefghijklmnopqrstuvwxyz/.test(message)) parts.push('bir küçük harf')
    if (/ABCDEFGHIJKLMNOPQRSTUVWXYZ/.test(message)) parts.push('bir büyük harf')
    if (/0123456789/.test(message)) parts.push('bir rakam')
    if (/[!@#$%^&*()_+\-=[\]{};':"|<>?,./`~]{4,}/.test(message)) parts.push('bir sembol (örneğin ! ya da ?)')
    if (parts.length) return `Şifren en az ${parts.join(', ')} içermeli`
    return 'Şifren küçük harf, büyük harf, rakam ve sembol içermeli'
  }
  return 'Bu şifre kabul edilmedi. Daha uzun, harf ve rakam karışık bir şifre seç'
}
