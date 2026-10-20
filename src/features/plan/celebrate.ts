import { prefersReducedMotion } from './hooks'

export function celebrate() {
  if (prefersReducedMotion()) return
  const style = getComputedStyle(document.documentElement)
  const colors = ['--primary', '--accent', '--marker', '--success']
    .map((name) => style.getPropertyValue(name).trim())
    .filter(Boolean)
  void import('canvas-confetti').then(({ default: confetti }) =>
    confetti({
      particleCount: 70,
      spread: 70,
      startVelocity: 32,
      gravity: 1.1,
      ticks: 160,
      scalar: 0.9,
      origin: { y: 0.75 },
      colors,
      disableForReducedMotion: true,
    }),
  )
}
