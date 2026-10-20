// api/ fonksiyonlarını Vercel'in yaptığı gibi tek tek .js'e derleyip yükler.
// Bir import çözülemezse ya da fonksiyon açılışta çökerse build durur.
import { mkdirSync, mkdtempSync, readdirSync, readFileSync, rmSync, statSync, symlinkSync, writeFileSync } from 'node:fs'
import { tmpdir } from 'node:os'
import { dirname, join, relative } from 'node:path'
import { pathToFileURL } from 'node:url'
import ts from 'typescript'

const root = process.cwd()
const out = mkdtempSync(join(tmpdir(), 'sinavika-api-'))

function walk(dir) {
  return readdirSync(dir).flatMap((name) => {
    const path = join(dir, name)
    return statSync(path).isDirectory() ? walk(path) : [path]
  })
}

const sources = [...walk(join(root, 'api')), ...walk(join(root, 'shared'))].filter((f) => f.endsWith('.ts'))
for (const file of sources) {
  const { outputText } = ts.transpileModule(readFileSync(file, 'utf8'), {
    compilerOptions: { module: ts.ModuleKind.ESNext, target: ts.ScriptTarget.ES2022 },
    fileName: file,
  })
  const target = join(out, relative(root, file)).replace(/\.ts$/, '.js')
  mkdirSync(dirname(target), { recursive: true })
  writeFileSync(target, outputText)
}
writeFileSync(join(out, 'package.json'), '{"type":"module"}')
symlinkSync(join(root, 'node_modules'), join(out, 'node_modules'), 'dir')

const methods = ['GET', 'POST', 'PUT', 'PATCH', 'DELETE']
const entries = readdirSync(join(root, 'api')).filter((f) => f.endsWith('.ts'))
let failed = false
for (const entry of entries) {
  const name = entry.replace(/\.ts$/, '')
  try {
    const mod = await import(pathToFileURL(join(out, 'api', `${name}.js`)).href)
    const handlers = methods.filter((m) => typeof mod[m] === 'function')
    if (!handlers.length) throw new Error('GET ya da POST gibi bir fonksiyon dışa aktarılmıyor')
    console.log(`api/${entry}: ${handlers.join(', ')}`)
  } catch (error) {
    failed = true
    console.error(`api/${entry} yüklenemedi: ${error.message.split('\n')[0]}`)
  }
}

rmSync(out, { recursive: true, force: true })
if (failed) {
  console.error('Sunucu fonksiyonları Vercel ortamında açılamaz. Yayın durduruldu.')
  process.exit(1)
}
