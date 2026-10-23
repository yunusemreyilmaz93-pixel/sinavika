import { escapeHtml, siteUrl } from '../html.mjs'

const CONTACT_EMAIL = 'yunusemreyilmaz93@gmail.com'

const logo = `<svg viewBox="0 0 32 32" width="32" height="32" aria-hidden="true"><rect width="32" height="32" rx="9" fill="var(--brand)"/><path d="M16 26.5V17L9 8.5M16 17l6.2-7.4" fill="none" stroke="var(--brand-ink)" stroke-width="3.4" stroke-linecap="round" stroke-linejoin="round"/><circle cx="23.4" cy="8.2" r="2.9" fill="var(--marker)"/></svg>`

const themeScript = `try{var t=localStorage.getItem('sinavika-theme');if(t==='dark'||(!t&&matchMedia('(prefers-color-scheme: dark)').matches))document.documentElement.classList.add('dark');var a=localStorage.getItem('sinavika-accent');if(a)document.documentElement.setAttribute('data-accent',a)}catch(e){}`

// Giriş yapmış kullanıcı sayılmaz. Çerez yok, yalnızca sayfa adı gider
const beaconScript = `try{if(!localStorage.getItem('sinavika-auth')&&navigator.sendBeacon){navigator.sendBeacon('/api/hit',new Blob([JSON.stringify({path:location.pathname,ref:document.referrer,utm:new URLSearchParams(location.search).get('utm_source')})],{type:'text/plain'}))}}catch(e){}`

export const css = `
.pub{margin:0;background:var(--bg);color:var(--fg);font-family:'Figtree Variable',ui-sans-serif,system-ui,sans-serif;line-height:1.65;-webkit-text-size-adjust:100%}
.pub *,.pub *::before,.pub *::after{box-sizing:border-box}
.pub a{color:var(--accent);text-underline-offset:3px}
.pub a:hover{text-decoration-thickness:2px}
.pub h1,.pub h2,.pub h3{font-family:'Bricolage Grotesque Variable','Figtree Variable',ui-sans-serif,sans-serif;line-height:1.15;font-weight:800;letter-spacing:-0.01em;margin:0}
.pub .wrap{max-width:46rem;margin:0 auto;padding:0 1rem}
.pub .wide{max-width:64rem;margin:0 auto;padding:0 1rem}
.pub header.top{position:sticky;top:0;z-index:20;background:var(--bg);border-bottom:1px solid var(--line)}
.pub header.top .wide{display:flex;align-items:center;gap:1rem;min-height:3.75rem;flex-wrap:wrap}
.pub .brand{display:inline-flex;align-items:center;gap:.5rem;text-decoration:none;color:var(--fg);font-family:'Bricolage Grotesque Variable',sans-serif;font-weight:800;font-size:1.25rem}
.pub .brand b{color:var(--primary)}
.pub nav.main{display:flex;gap:.25rem 1rem;flex-wrap:wrap;margin-left:auto;align-items:center}
.pub nav.main a{color:var(--fg-muted);font-weight:600;text-decoration:none;min-height:2.75rem;display:inline-flex;align-items:center;font-size:.95rem}
.pub nav.main a:hover{color:var(--fg)}
@media(max-width:40rem){.pub nav.main a:not(.btn):not(:first-child){display:none}}
.pub .btn{display:inline-flex;align-items:center;justify-content:center;min-height:2.75rem;padding:0 1.1rem;border-radius:.75rem;font-weight:700;text-decoration:none;border:1px solid var(--line-strong);background:var(--surface);color:var(--fg)!important}
.pub .btn.primary{background:var(--primary);color:var(--primary-fg)!important;border-color:transparent}
.pub .crumbs{font-size:.875rem;color:var(--fg-muted);padding:1.25rem 0 .5rem}
.pub .crumbs a{color:var(--fg-muted)}
.pub .crumbs span{margin:0 .35rem}
.pub h1{font-size:clamp(1.9rem,5vw,2.75rem);margin-top:.25rem}
.pub .kicker{color:var(--primary);font-weight:700;font-size:.9rem;margin:.5rem 0 0}
.pub .lead{font-size:1.1rem;color:var(--fg-muted);margin:.75rem 0 0}
.pub .meta{color:var(--fg-muted);font-size:.9rem;margin-top:.75rem}
.pub main{padding-bottom:3rem}
.pub .toc{margin:1.5rem 0;padding:1rem 1.25rem;border:1px solid var(--line);border-radius:1rem;background:var(--surface)}
.pub .toc h2{font-size:1rem;margin-bottom:.5rem}
.pub .toc ol{margin:0;padding-left:1.25rem}
.pub .toc li{margin:.2rem 0}
.pub article{font-size:1.0625rem}
.pub article>*+*{margin-top:1rem}
.pub article h2{font-size:1.5rem;margin-top:2.5rem;scroll-margin-top:5rem}
.pub article h3{font-size:1.2rem;margin-top:1.75rem}
.pub article ul,.pub article ol{padding-left:1.4rem}
.pub article li{margin:.3rem 0}
.pub article li::marker{color:var(--primary)}
.pub article blockquote{margin:1rem 0;padding:.25rem 1rem;border-left:4px solid var(--line-strong);color:var(--fg-muted);font-style:italic}
.pub article hr{border:0;border-top:1px solid var(--line);margin:2rem 0}
.pub article mark{background:linear-gradient(transparent 58%,var(--marker) 58%,var(--marker) 92%,transparent 92%);color:inherit;padding:0 .08em}
.pub .ek{font-style:italic;color:var(--fg-muted)}
.pub .tw{overflow-x:auto;border:1px solid var(--line);border-radius:.75rem}
.pub table{border-collapse:collapse;width:100%;font-size:.95rem}
.pub th,.pub td{padding:.55rem .75rem;text-align:left;border-bottom:1px solid var(--line);vertical-align:top}
.pub th{background:var(--surface-2);font-weight:700}
.pub tr:last-child td{border-bottom:0}
.pub figure{margin:1.25rem 0}
.pub figure img{max-width:100%;height:auto;border-radius:.75rem;display:block}
.pub figcaption{font-size:.85rem;color:var(--fg-muted);margin-top:.4rem}
.pub .video-frame{position:relative;aspect-ratio:16/9;border-radius:.75rem;overflow:hidden;background:var(--surface-2)}
.pub .video-frame iframe{position:absolute;inset:0;width:100%;height:100%;border:0}
.pub .box{padding:.9rem 1.1rem;border-radius:1rem;border:1px solid var(--line);background:var(--surface)}
.pub .box>strong{display:block;margin-bottom:.25rem}
.pub .box p{margin:.4rem 0 0}
.pub .box.tip{background:var(--primary-soft);border-color:transparent;color:var(--primary-soft-fg)}
.pub .box.link{background:var(--accent-soft);border-color:transparent;color:var(--accent-soft-fg)}
.pub .goals{border:1px solid var(--line);border-radius:1rem;padding:1rem 1.25rem;background:var(--surface)}
.pub .goals h2{font-size:1.1rem;margin:0 0 .5rem!important}
.pub .cause{list-style:none;padding:0!important}
.pub .cause li{display:grid;gap:.25rem;padding:.6rem .9rem;border:1px solid var(--line);border-radius:.75rem;background:var(--surface)}
.pub .cause-a{font-weight:700}
.pub .cause-b::before{content:'Sonuç: ';color:var(--fg-muted);font-weight:600}
.pub .muted{color:var(--fg-muted)}
.pub .timeline ul{list-style:none;padding:0!important}
.pub .q{padding:1rem 1.1rem;border:1px solid var(--line-strong);border-radius:1rem;background:var(--surface)}
.pub .q-n{margin:0;font-weight:700;color:var(--primary);font-size:.9rem}
.pub .q-stem{margin:.4rem 0 0;font-weight:600}
.pub .opts{list-style:none;padding:0!important;margin:.75rem 0 0}
.pub .opts li{display:flex;gap:.6rem;margin:.35rem 0}
.pub .opt-l{flex:none;width:1.6rem;height:1.6rem;border-radius:999px;background:var(--surface-2);display:grid;place-items:center;font-weight:700;font-size:.8rem}
.pub details{margin-top:.75rem}
.pub summary{cursor:pointer;font-weight:700;color:var(--accent);min-height:2.75rem;display:flex;align-items:center}
.pub .self{display:grid;grid-template-columns:minmax(0,1fr);gap:.25rem}
.pub .self details{margin:0;border:1px solid var(--line);border-radius:.75rem;padding:0 .9rem;background:var(--surface)}
.pub .cta{margin:2.5rem 0 0;padding:1.5rem;border-radius:1.25rem;background:var(--primary);color:var(--primary-fg)}
.pub .cta h2{font-size:1.35rem;margin:0}
.pub .cta p{margin:.5rem 0 1rem;opacity:.9}
.pub .cta .btn{background:var(--surface);color:var(--fg)!important}
.pub .cta .row{display:flex;gap:.6rem;flex-wrap:wrap}
.pub .pager{display:grid;gap:.75rem;margin-top:2rem;grid-template-columns:1fr}
@media(min-width:40rem){.pub .pager{grid-template-columns:1fr 1fr}}
.pub .pager a{display:block;padding:.9rem 1rem;border:1px solid var(--line);border-radius:1rem;background:var(--surface);text-decoration:none;color:var(--fg)}
.pub .pager small{display:block;color:var(--fg-muted);font-weight:600}
.pub .pager .next{text-align:right}
.pub .cards{display:grid;gap:.75rem;grid-template-columns:repeat(auto-fill,minmax(15rem,1fr));margin-top:1.25rem}
.pub .card{display:block;padding:1rem 1.1rem;border:1px solid var(--line);border-radius:1rem;background:var(--surface);text-decoration:none;color:var(--fg)}
.pub .card:hover{border-color:var(--line-strong)}
.pub .card h2,.pub .card h3{font-size:1.1rem}
.pub .card p{margin:.4rem 0 0;color:var(--fg-muted);font-size:.92rem}
.pub .list{list-style:none;padding:0;margin:1.25rem 0 0;display:grid;gap:.5rem}
.pub .list a{display:block;padding:.8rem 1rem;border:1px solid var(--line);border-radius:.9rem;background:var(--surface);text-decoration:none;color:var(--fg)}
.pub .list a:hover{border-color:var(--line-strong)}
.pub .list b{display:block}
.pub .list span{display:block;color:var(--fg-muted);font-size:.9rem;margin-top:.15rem}
.pub article .katex{display:inline-block;max-width:100%;overflow-x:auto;overflow-y:hidden;vertical-align:middle}
.pub article .katex-display{display:block;text-align:center;margin:1rem 0}
.pub .section{margin-top:2.25rem}
.pub .section>h2{font-size:1.4rem}
.pub footer.foot{border-top:1px solid var(--line);padding:2rem 0 3rem;background:var(--surface-2);font-size:.92rem}
.pub footer.foot .wide{display:grid;gap:1.5rem;grid-template-columns:repeat(auto-fit,minmax(11rem,1fr))}
.pub footer.foot h2{font-size:.95rem;margin-bottom:.5rem}
.pub footer.foot ul{list-style:none;margin:0;padding:0}
.pub footer.foot li a{display:inline-block;padding:.3rem 0;color:var(--fg-muted)}
.pub footer.foot .editor{grid-column:1/-1;color:var(--fg-muted)}
@media(prefers-reduced-motion:no-preference){.pub a,.pub .card,.pub .list a{transition:border-color .15s}}
`

export function jsonLd(data) {
  return `<script type="application/ld+json">${JSON.stringify(data).replace(/</g, '\\u003c')}</script>`
}

export function layout({ shell, cssHref, title, description, path, noindex = false, ld = [], body, links = [], examLinks = [], site = siteUrl() }) {
  const url = `${site}${path}`
  const head = `<!doctype html>
<html lang="tr">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover" />
<title>${escapeHtml(title)}</title>
<meta name="description" content="${escapeHtml(description)}" />
<link rel="canonical" href="${url}" />
${noindex ? '<meta name="robots" content="noindex, nofollow" />\n' : ''}<meta name="theme-color" content="#f4f6f1" />
<link rel="icon" href="/favicon.svg" type="image/svg+xml" />
<link rel="apple-touch-icon" href="/apple-touch-icon.png" />
<meta property="og:type" content="article" />
<meta property="og:locale" content="tr_TR" />
<meta property="og:title" content="${escapeHtml(title)}" />
<meta property="og:description" content="${escapeHtml(description)}" />
<meta property="og:url" content="${url}" />
<meta property="og:site_name" content="Yolumnet" />
<meta property="og:image" content="${site}/og.png" />
<meta name="twitter:card" content="summary_large_image" />
${cssHref ? `<link rel="stylesheet" href="${cssHref}" />` : ''}
<style>${css}</style>
<script>${themeScript}</script>
${ld.map(jsonLd).join('\n')}
</head>`
  void shell
  const nav = [
    ['/konu-anlatimi', 'Konu anlatımları'],
    ['/calisma-programlari', 'Programlar'],
    ['/araclar/net-hesaplama', 'Net hesaplama'],
    ...links,
  ]
  const header = `<header class="top"><div class="wide"><a class="brand" href="/">${logo}<span>Yolum<b>net</b></span></a><nav class="main" aria-label="Ana menü">${nav.map(([href, label]) => `<a href="${href}">${escapeHtml(label)}</a>`).join('')}<a class="btn" href="/giris">Giriş yap</a></nav></div></header>`
  const footer = `<footer class="foot"><div class="wide">
${examLinks.length ? `<div><h2>Konu anlatımları</h2><ul>${examLinks.map(([href, label]) => `<li><a href="${href}">${escapeHtml(label)}</a></li>`).join('')}</ul></div>` : ''}
<div><h2>Araçlar</h2><ul><li><a href="/araclar/net-hesaplama">Net hesaplama</a></li><li><a href="/calisma-programlari">Çalışma programları</a></li></ul></div>
<div><h2>Yolumnet</h2><ul><li><a href="/hakkinda">Hakkında</a></li><li><a href="/ogretmen-basvurusu">Öğretmen başvurusu</a></li><li><a href="/katil">Davet koduyla katıl</a></li><li><a href="/kvkk">KVKK aydınlatma metni</a></li></ul></div>
<p class="editor">Anlatımlar Yolumnet editör ekibi tarafından hazırlanır ve gözden geçirilir. Bir hata ya da eksik görürseniz <a href="mailto:${CONTACT_EMAIL}">${CONTACT_EMAIL}</a> adresine yazabilirsiniz. Yolumnet ücretsizdir ve reklam içermez.</p>
</div></footer>`
  return `${head}\n<body class="pub">\n${header}\n${body}\n${footer}\n<script>${beaconScript}</script>\n</body>\n</html>\n`
}
