// Yerel geliştirmede api/ fonksiyonlarını Vercel olmadan çalıştırır.
import { createServer } from 'node:http'

type Handler = (request: Request) => Promise<Response>
const routes: Record<string, () => Promise<Record<string, Handler>>> = {
  auth: () => import('../api/auth.ts'),
  account: () => import('../api/account.ts'),
  cron: () => import('../api/cron.ts'),
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
