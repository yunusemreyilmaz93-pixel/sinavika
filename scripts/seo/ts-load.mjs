// Yalnızca tip içeren, başka modül çağırmayan bir .ts dosyasını derleme sırasında yükler
import { mkdtempSync, readFileSync, writeFileSync } from 'node:fs'
import { tmpdir } from 'node:os'
import { join } from 'node:path'
import { pathToFileURL } from 'node:url'
import ts from 'typescript'

export async function loadTs(file) {
  const { outputText } = ts.transpileModule(readFileSync(file, 'utf8'), {
    compilerOptions: { module: ts.ModuleKind.ESNext, target: ts.ScriptTarget.ES2022 },
    fileName: file,
  })
  const dir = mkdtempSync(join(tmpdir(), 'yolumnet-seo-'))
  const target = join(dir, 'module.mjs')
  writeFileSync(target, outputText)
  return import(pathToFileURL(target).href)
}
