// Soru yazmadan önce doğru şık dizisini planlar. Her şık eşit sayıda gelir, aynı harf en fazla iki kez üst üste gelmez.
// Kullanım: node scripts/questions/plan-keys.mjs <soru sayısı> [şık sayısı=4] [tohum]
const count = Number(process.argv[2])
const options = Number(process.argv[3] ?? 4)
let seed = process.argv[4] ? Number(process.argv[4]) : Math.floor(Math.random() * 2 ** 31)

if (!Number.isInteger(count) || count < 1 || ![3, 4, 5].includes(options)) {
  console.error('Kullanım: node scripts/questions/plan-keys.mjs <soru sayısı> [3, 4 ya da 5] [tohum]')
  process.exit(1)
}

const random = () => {
  seed = (seed * 1664525 + 1013904223) % 2 ** 32
  return seed / 2 ** 32
}
const letters = 'ABCDE'.slice(0, options).split('')

function plan() {
  const pool = Array.from({ length: count }, (_, i) => letters[i % options])
  for (let i = pool.length - 1; i > 0; i--) {
    const j = Math.floor(random() * (i + 1))
    ;[pool[i], pool[j]] = [pool[j], pool[i]]
  }
  return pool
}

const ok = (keys) => keys.every((k, i) => i < 2 || !(k === keys[i - 1] && k === keys[i - 2]))
let keys = plan()
for (let tries = 0; !ok(keys) && tries < 1000; tries++) keys = plan()

const tally = letters.map((l) => `${l}: ${keys.filter((k) => k === l).length}`).join('  ')
console.log(keys.join(' '))
console.log(tally)
