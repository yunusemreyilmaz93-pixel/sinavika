const folded: Record<string, string> = { ı: 'i', ş: 's', ğ: 'g', ü: 'u', ö: 'o', ç: 'c', â: 'a', î: 'i', û: 'u' }

export function fold(value: string) {
  return value
    .toLocaleLowerCase('tr')
    .replace(/[ışğüöçâîû]/g, (c) => folded[c])
    .replace(/\s+/g, ' ')
    .trim()
}
