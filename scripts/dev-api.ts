// Yerel geliştirmede api/ fonksiyonlarını Vercel olmadan çalıştırır.
import { createServer } from 'node:http'
import { registerHooks } from 'node:module'

// api/ dosyaları Vercel'de derlendiği için .js ile import eder. Yerelde .ts kaynağına yönlendir.
registerHooks({
  resolve(specifier, context, next) {
    try {
      return next(specifier, context)
    } catch (error) {
      if (!specifier.startsWith('.') || !specifier.endsWith('.js')) throw error
      return next(specifier.slice(0, -3) + '.ts', context)
    }
  },
})

type Handler = (request: Request) => Promise<Response>
const routes: Record<string, () => Promise<Record<string, Handler>>> = {
  ai: () => import('../api/ai.ts'),
  auth: () => import('../api/auth.ts'),
  account: () => import('../api/account.ts'),
  cron: () => import('../api/cron.ts'),
  health: () => import('../api/health.ts'),
  push: () => import('../api/push.ts'),
  video: () => import('../api/video.ts'),
}

createServer(async (req, res) => {
  const url = new URL(req.url ?? '/', 'http://localhost:3001')
  const name = url.pathname.replace(/^\/api\//, '')
  const load = routes[name]
  const handler = load ? (await load())[req.method ?? 'GET'] : undefined
  if (!handler) {
    res.writeHead(404).end()
    return
  }
  const chunks: Buffer[] = []
  for await (const chunk of req) chunks.push(chunk as Buffer)
  const request = new Request(url, {
    method: req.method,
    headers: req.headers as Record<string, string>,
    body: chunks.length ? Buffer.concat(chunks) : undefined,
  })
  const response = await handler(request)
  res.writeHead(response.status, Object.fromEntries(response.headers))
  res.end(Buffer.from(await response.arrayBuffer()))
}).listen(3001, () => console.log('api: http://localhost:3001'))
