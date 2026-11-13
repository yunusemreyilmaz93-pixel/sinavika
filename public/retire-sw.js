// Eski adreste (yolumnet.vercel.app) kalan uygulama önbelleğini kaldırır ve açık sekmeleri izlek.site'a taşır.
// vercel.json /sw.js isteğini bu dosyaya yönlendirir. izlek.site'ta kullanılmaz.
self.addEventListener('install', () => self.skipWaiting())
self.addEventListener('activate', (event) => {
  event.waitUntil(
    (async () => {
      await self.clients.claim()
      for (const key of await caches.keys()) await caches.delete(key)
      for (const client of await self.clients.matchAll({ type: 'window' })) {
        const url = new URL(client.url)
        await client.navigate(`https://izlek.site${url.pathname}${url.search}`).catch(() => {})
      }
      await self.registration.unregister()
    })(),
  )
})
