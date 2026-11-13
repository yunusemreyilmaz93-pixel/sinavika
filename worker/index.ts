// Cloudflare Worker: statik dosyaları sunar, /api isteklerini api/ fonksiyonlarına, zamanlanmış işi /api/cron'a yönlendirir.
import * as account from '../api/account.js'
import * as ai from '../api/ai.js'
import * as auth from '../api/auth.js'
import * as avatar from '../api/avatar.js'
import * as cron from '../api/cron.js'
import * as health from '../api/health.js'
import * as hit from '../api/hit.js'
import * as push from '../api/push.js'
import * as video from '../api/video.js'

type Handler = (request: Request) => Promise<Response>
type Env = { ASSETS: { fetch: (request: Request) => Promise<Response> } }
type Ctx = { waitUntil: (promise: Promise<unknown>) => void }

const routes: Record<string, Record<string, Handler | undefined>> = { account, ai, auth, avatar, cron, health, hit, push, video }
const OLD_HOSTS = new Set(['www.izlek.site'])
const noindex = { 'X-Robots-Tag': 'noindex, nofollow' }

export default {
  async fetch(request: Request, env: Env) {
    const url = new URL(request.url)
    if (OLD_HOSTS.has(url.hostname)) return Response.redirect(`https://izlek.site${url.pathname}${url.search}`, 301)

    if (url.pathname.startsWith('/api/')) {
      const route = routes[url.pathname.slice(5)]
      if (!route) return new Response('Not found', { status: 404 })
      const handler = route[request.method]
      if (!handler) return new Response('Method not allowed', { status: 405, headers: { allow: Object.keys(route).join(', ') } })
      return handler(request)
    }

    // /app ve /rapor tek sayfalık uygulama kabuğudur, arama motoruna kapalıdır
    const shell = await env.ASSETS.fetch(new Request(new URL('/', url), request))
    const response = new Response(shell.body, shell)
    for (const [k, v] of Object.entries(noindex)) response.headers.set(k, v)
    if (url.pathname.startsWith('/rapor/')) response.headers.set('Referrer-Policy', 'no-referrer')
    return response
  },

  async scheduled(_event: unknown, _env: Env, ctx: Ctx) {
    const headers = process.env.CRON_SECRET ? { authorization: `Bearer ${process.env.CRON_SECRET}` } : undefined
    ctx.waitUntil(cron.GET(new Request('https://izlek.site/api/cron', { headers })).then(async (r) => console.log('cron', r.status, await r.text())))
  },
}
