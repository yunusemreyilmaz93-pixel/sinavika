// index.html kabuğundan sayfa başına başlık, açıklama ve canonical üreten yardımcılar
export const DEFAULT_SITE = 'https://yolumnet.vercel.app'

export function siteUrl() {
  return (process.env.SITE_URL || DEFAULT_SITE).trim().replace(/\/+$/, '')
}

export const escapeHtml = (s) => String(s).replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;')

// Kabuktaki adresleri gerçek alan adına çevirir
export function withSite(html, site = siteUrl()) {
  return html.split(DEFAULT_SITE).join(site)
}

function setTag(html, pattern, replacement) {
  if (!pattern.test(html)) throw new Error(`Kabukta beklenen etiket yok: ${pattern}`)
  return html.replace(pattern, () => replacement)
}

export function verificationTag() {
  const token = (process.env.GOOGLE_SITE_VERIFICATION || '').trim()
  return token ? `<meta name="google-site-verification" content="${escapeHtml(token)}" />` : ''
}

export function withVerification(html) {
  const tag = verificationTag()
  return tag ? html.replace('</head>', `    ${tag}\n  </head>`) : html
}

export function pageHead(shell, { path, title, description, noindex = false, site = siteUrl() }) {
  const url = `${site}${path === '/' ? '/' : path}`
  let html = shell
  html = setTag(html, /<title>.*?<\/title>/s, `<title>${escapeHtml(title)}</title>`)
  html = setTag(html, /<meta name="description" content=".*?" \/>/s, `<meta name="description" content="${escapeHtml(description)}" />`)
  html = setTag(html, /<link rel="canonical" href=".*?" \/>/s, `<link rel="canonical" href="${url}" />`)
  html = setTag(html, /<meta property="og:title" content=".*?" \/>/s, `<meta property="og:title" content="${escapeHtml(title)}" />`)
  html = setTag(html, /<meta property="og:description" content=".*?" \/>/s, `<meta property="og:description" content="${escapeHtml(description)}" />`)
  html = setTag(html, /<meta property="og:url" content=".*?" \/>/s, `<meta property="og:url" content="${url}" />`)
  html = withVerification(html)
  if (noindex) html = html.replace('</head>', '    <meta name="robots" content="noindex, nofollow" />\n  </head>')
  return html
}
