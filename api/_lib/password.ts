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
