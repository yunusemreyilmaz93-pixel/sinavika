import { describe, expect, it } from 'vitest'
import { formatClock, parseYouTubeId } from './youtube'

describe('parseYouTubeId', () => {
  it('yaygın YouTube bağlantılarından video kimliğini çıkarır', () => {
    for (const url of [
      'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
      'https://youtube.com/watch?list=PL1&v=dQw4w9WgXcQ&t=42s',
      'https://youtu.be/dQw4w9WgXcQ?si=abc',
      'https://www.youtube.com/shorts/dQw4w9WgXcQ',
      'https://m.youtube.com/watch?v=dQw4w9WgXcQ',
      'https://www.youtube-nocookie.com/embed/dQw4w9WgXcQ',
      '  dQw4w9WgXcQ  ',
    ]) {
      expect(parseYouTubeId(url)).toBe('dQw4w9WgXcQ')
    }
  })

  it('YouTube olmayan bağlantıları reddeder', () => {
    expect(parseYouTubeId('https://vimeo.com/12345678')).toBeNull()
    expect(parseYouTubeId('merhaba')).toBeNull()
  })
})

describe('formatClock', () => {
  it('süreyi dakika ve saniye olarak yazar', () => {
    expect(formatClock(75)).toBe('1:15')
    expect(formatClock(3725)).toBe('1:02:05')
  })
})
