export const USERNAME_EMAIL_DOMAIN = 'hesap.sinavika.app'
export const USERNAME_PATTERN = /^[a-z0-9._]{3,24}$/
export const PASSWORD_MIN = 8

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
