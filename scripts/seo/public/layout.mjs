import { readFileSync } from 'node:fs'
import { join } from 'node:path'
import * as lucide from 'lucide-react'
import { createElement } from 'react'
import { renderToStaticMarkup } from 'react-dom/server'
import { escapeHtml, siteUrl, verificationTag } from '../html.mjs'

const CONTACT_EMAIL = 'yunusemreyilmaz93@gmail.com'

// Uygulamadaki wordmark ile aynı (src/components/ui/logo-paths.ts)
const logoSrc = readFileSync(join(process.cwd(), 'src/components/ui/logo-paths.ts'), 'utf8')
const WORD = logoSrc.match(/const WORD = '([^']+)'/)?.[1]
if (!WORD) throw new Error('logo-paths.ts içinde WORD bulunamadı')
const logo = `<svg viewBox="0 0 301.6 100" height="28" role="img" aria-label="İzlek"><path d="${WORD}" fill="currentColor"/><circle cx="14.0" cy="14.8" r="14.0" fill="var(--marker)"/></svg>`


// Uygulamadaki ders paleti ve ikonları (src/lib/exam.ts, src/lib/subject-icons.ts)
const examSrc = readFileSync(join(process.cwd(), 'src/lib/exam.ts'), 'utf8')
export const palette = Object.fromEntries([...(examSrc.match(/subjectColors[^{]*\{([^}]+)\}/)?.[1] ?? '').matchAll(/(\w+):\s*'(#[0-9a-f]{6})'/g)].map((m) => [m[1], m[2]]))
if (!palette.slate) throw new Error('exam.ts içinde subjectColors bulunamadı')
const iconSrc = readFileSync(join(process.cwd(), 'src/lib/subject-icons.ts'), 'utf8')
const subjectIconNames = Object.fromEntries([...(iconSrc.match(/subjectIconNames[^{]*\{([^}]+)\}/)?.[1] ?? '').matchAll(/(\w+):\s*'(\w+)'/g)].map((m) => [m[1], m[2]]))
if (!subjectIconNames.mat) throw new Error('subject-icons.ts içinde subjectIconNames bulunamadı')
const subjectIconName = (id) => subjectIconNames[id?.split('-')[1] ?? ''] ?? 'Shapes'

const iconCache = new Map()
export function icon(name, cls = '') {
  const key = `${name}|${cls}`
  if (!iconCache.has(key)) iconCache.set(key, renderToStaticMarkup(createElement(lucide[name] ?? lucide.Shapes, { 'aria-hidden': true, className: cls || undefined })))
  return iconCache.get(key)
}

export const hueColor = (hue) => palette[hue] ?? palette.slate
export const subjectColorOf = (subject) => hueColor(subject?.color)

// Renkli zeminli ikon kutusu. size: sm, md, lg
export const chip = (name, color, size = 'md') => `<span class="ic ic-${size}" style="color:${color};background:${color}1f" aria-hidden="true">${icon(name)}</span>`
// Ders kodu (tr, mat, fiz...) ve renk adıyla ikon kutusu, veritabanı olmadan
export const codeChip = (code, hue, size = 'md') => chip(subjectIconName(`x-${code}`), hueColor(hue), size)
export const subjectChip = (subject, size = 'md') => chip(subjectIconName(subject?.id), subjectColorOf(subject), size)

export const resources = [
  { href: '/konu-anlatimi', icon: 'BookOpenText', hue: 'pine', title: 'Konu anlatımları', text: 'LGS, TYT, AYT ve YDT' },
  { href: '/araclar/lgs-puan-hesaplama', icon: 'Gauge', hue: 'coral', title: 'LGS puan hesaplama', text: 'Netlerden LGS puanı' },
  { href: '/araclar/yks-puan-hesaplama', icon: 'Gauge', hue: 'violet', title: 'YKS puan hesaplama', text: 'TYT, SAY, EA, SÖZ, DİL' },
  { href: '/araclar/net-hesaplama', icon: 'Calculator', hue: 'amber', title: 'Net hesaplama', text: 'Ders ders ve toplam net' },
  { href: '/calisma-programlari', icon: 'CalendarDays', hue: 'teal', title: 'Çalışma programları', text: 'Hazır haftalık programlar' },
  { href: '/yks-bolumleri', icon: 'GraduationCap', hue: 'rose', title: 'YKS bölümleri', text: 'YÖK Atlas netleri ve sıralamalar' },
  { href: '/blog', icon: 'Newspaper', hue: 'sea', title: 'Blog', text: 'Çalışma düzeni ve sınav hazırlığı' },
]

export function crumbHtml(items) {
  return `<nav class="crumbs" aria-label="Sayfa yolu">${items
    .map(([name, path], i) => (i < items.length - 1 ? `<a href="${path}">${escapeHtml(name)}</a><span>/</span>` : `<span aria-current="page">${escapeHtml(name)}</span>`))
    .join('')}</nav>`
}

export const fmtNum = (n) => Number(n).toLocaleString('tr-TR')

export const statTiles = (stats) => (stats.length ? `<dl class="stats">${stats.map(([value, label]) => `<div><dt>${escapeHtml(label)}</dt><dd>${value}</dd></div>`).join('')}</dl>` : '')

// Sayfa başı bandı. title HTML olarak gelir, vurgulanacak kelime <mark> içinde olabilir
export function hero({ crumbs = [], pill = '', title, lead = '', stats = [], actions = '', aside = '', lead2 = '', iconHtml = '', tint = '' }) {
  return `<section class="hero${tint ? ' tint' : ''}${aside ? ' split' : ''}"${tint ? ` style="--tint:${tint}"` : ''}><div class="wide">
<div class="hero-main">${crumbs.length ? crumbHtml(crumbs) : ''}
${pill ? `<p class="pill">${pill}</p>` : ''}
<div class="hero-title">${iconHtml}<h1>${title}</h1></div>
${lead ? `<p class="lead">${lead}</p>` : ''}${lead2}
${statTiles(stats)}
${actions ? `<div class="actions">${actions}</div>` : ''}</div>
${aside ? `<div class="hero-aside">${aside}</div>` : ''}
</div></section>`
}

export const secHead = (eyebrow, title, extra = '') => `<div class="sec-head"><div>${eyebrow ? `<p class="eyebrow">${eyebrow}</p>` : ''}<h2>${title}</h2></div>${extra}</div>`

export const ctaBand = `<aside class="cta"><div><h2>Çalışmanızı İzlek'te takip edin</h2><p>İzlek, LGS ve YKS öğrencileri için ücretsiz ve reklamsız bir koçluk uygulamasıdır. Öğretmeniniz haftalık görev verir, soru çözümünüzü, denemelerinizi ve konu ilerlemenizi tek yerde görür.</p></div><div class="row"><a class="btn light" href="/katil">Davet koduyla katıl</a><a class="btn ghost" href="/ogretmen-basvurusu">Öğretmen başvurusu</a></div></aside>`

const themeScript = `try{var t=localStorage.getItem('sinavika-theme');if(t==='dark'||(!t&&matchMedia('(prefers-color-scheme: dark)').matches))document.documentElement.classList.add('dark');var a=localStorage.getItem('sinavika-accent');if(a)document.documentElement.setAttribute('data-accent',a)}catch(e){}`

// Giriş yapmış kullanıcı sayılmaz. Çerez yok, yalnızca sayfa adı gider
const beaconScript = `try{if(!localStorage.getItem('sinavika-auth')&&navigator.sendBeacon){navigator.sendBeacon('/api/hit',new Blob([JSON.stringify({path:location.pathname,ref:document.referrer,utm:new URLSearchParams(location.search).get('utm_source')})],{type:'text/plain'}))}}catch(e){}`

const navScript = `document.addEventListener('click',function(e){document.querySelectorAll('details.dd[open]').forEach(function(d){if(!d.contains(e.target))d.removeAttribute('open')})});document.addEventListener('keydown',function(e){if(e.key==='Escape')document.querySelectorAll('details.dd[open]').forEach(function(d){d.removeAttribute('open');d.querySelector('summary').focus()})})`

const videoScript = `document.addEventListener('click',function(e){var b=e.target.closest&&e.target.closest('.yt-play');if(!b)return;var f=document.createElement('iframe');f.src='https://www.youtube-nocookie.com/embed/'+b.getAttribute('data-yt')+'?autoplay=1';f.title=b.getAttribute('data-title')||'Video';f.allow='autoplay; encrypted-media; picture-in-picture';f.allowFullscreen=true;f.referrerPolicy='strict-origin-when-cross-origin';b.replaceWith(f)})`

export const css = `
.pub{margin:0;background:var(--bg);color:var(--fg);font-family:'Figtree Variable',ui-sans-serif,system-ui,sans-serif;line-height:1.65;-webkit-text-size-adjust:100%}
.pub *,.pub *::before,.pub *::after{box-sizing:border-box}
.pub a{color:var(--accent);text-underline-offset:3px}
.pub a:hover{text-decoration-thickness:2px}
.pub h1,.pub h2,.pub h3{font-family:'Bricolage Grotesque Variable','Figtree Variable',ui-sans-serif,sans-serif;line-height:1.15;font-weight:800;letter-spacing:-0.01em;margin:0}
.pub svg{flex:none}
.pub .wrap{max-width:46rem;margin:0 auto;padding:0 1rem}
.pub .wide{max-width:72rem;margin:0 auto;padding:0 1rem}
.pub header.top{position:sticky;top:0;z-index:30;background:var(--bg);border-bottom:1px solid var(--line)}
.pub header.top .bar{display:flex;align-items:center;gap:1rem;min-height:3.75rem}
.pub .brand{display:inline-flex;align-items:center;min-height:2.75rem;color:var(--primary)}
.pub .brand svg{height:1.75rem;width:auto}
.pub nav.main{display:flex;gap:.25rem;margin-left:auto;align-items:center}
.pub nav.main>a:not(.btn),.pub .dd>summary{color:var(--fg-muted);font-weight:600;text-decoration:none;min-height:2.75rem;padding:0 .65rem;border-radius:.75rem;display:inline-flex;align-items:center;gap:.3rem;font-size:.95rem;cursor:pointer;list-style:none}
.pub .dd>summary::-webkit-details-marker{display:none}
.pub nav.main>a:not(.btn):hover,.pub .dd>summary:hover,.pub .dd[open]>summary{color:var(--fg)}
.pub .dd>summary svg{width:1rem;height:1rem}
.pub .dd[open]>summary svg{transform:rotate(180deg)}
.pub .dd{margin:0}
.pub .dd-panel{position:absolute;left:0;right:0;top:100%;background:var(--surface);border-bottom:1px solid var(--line);max-height:calc(100dvh - 3.75rem);overflow-y:auto}
.pub .dd-panel .wide{display:grid;gap:1rem;padding-top:1rem;padding-bottom:1.25rem}
.pub .dd-grid{list-style:none;margin:0;padding:0;display:grid;gap:.25rem}
.pub .dd-grid a{display:flex;gap:.8rem;align-items:center;padding:.6rem;border-radius:1rem;text-decoration:none;color:var(--fg);min-height:3.5rem}
.pub .dd-grid a:hover{background:var(--surface-2)}
.pub .dd-grid b{display:block;font-size:.95rem}
.pub .dd-grid span.t{display:block;color:var(--fg-muted);font-size:.85rem;line-height:1.35}
.pub .dd-side{padding:1rem 1.1rem;border-radius:1rem;background:var(--primary-soft);color:var(--primary-soft-fg)}
.pub .dd-side b{display:block}
.pub .dd-side p{margin:.3rem 0 .5rem;font-size:.9rem}
.pub .dd-side a{color:inherit;font-weight:700;display:inline-flex;align-items:center;gap:.3rem;min-height:2.75rem;text-decoration:none}
.pub .dd-side svg,.pub .more svg{width:1rem;height:1rem}
@media(min-width:48rem){.pub .dd-panel .wide{grid-template-columns:minmax(0,1fr) 16rem;padding-top:1.5rem;padding-bottom:1.75rem}.pub .dd-grid{grid-template-columns:repeat(2,minmax(0,1fr))}}
@media(min-width:64rem){.pub .dd-grid{grid-template-columns:repeat(3,minmax(0,1fr))}}
@media(max-width:40rem){.pub nav.main>a.nl{display:none}}
.pub .btn{display:inline-flex;align-items:center;justify-content:center;gap:.45rem;min-height:2.75rem;padding:0 1.1rem;border-radius:.75rem;font-weight:700;text-decoration:none;border:1px solid var(--line-strong);background:var(--surface);color:var(--fg)!important;white-space:nowrap}
.pub .btn svg{width:1.1rem;height:1.1rem}
.pub .btn.primary{background:var(--primary);color:var(--primary-fg)!important;border-color:transparent}
.pub .btn.primary:hover{background:var(--primary-hover)}
.pub .ic{display:inline-grid;place-items:center;flex:none}
.pub .ic-sm{width:2rem;height:2rem;border-radius:.6rem}.pub .ic-sm svg{width:1rem;height:1rem}
.pub .ic-md{width:2.5rem;height:2.5rem;border-radius:.75rem}.pub .ic-md svg{width:1.2rem;height:1.2rem}
.pub .ic-lg{width:3.5rem;height:3.5rem;border-radius:1rem}.pub .ic-lg svg{width:1.75rem;height:1.75rem}
.pub .crumbs{font-size:.875rem;color:var(--fg-muted);padding:0 0 .75rem;display:flex;flex-wrap:wrap;align-items:center}
.pub .crumbs a{color:var(--fg-muted);min-height:2rem;display:inline-flex;align-items:center}
.pub .crumbs span{margin:0 .35rem}
.pub .crumbs span[aria-current]{margin:0}
.pub h1{font-size:clamp(1.9rem,5vw,2.9rem);overflow-wrap:break-word}
.pub h1 mark,.pub .cta mark{background:linear-gradient(transparent 60%,var(--marker) 60%,var(--marker) 90%,transparent 90%);color:inherit;padding:0 .05em}
.pub .hero{background-color:var(--surface);background-image:linear-gradient(var(--grid-line) 1px,transparent 1px),linear-gradient(90deg,var(--grid-line) 1px,transparent 1px);background-size:24px 24px;border-bottom:1px solid var(--line);padding:1.5rem 0 2rem}
.pub .hero.tint{background-color:color-mix(in srgb,var(--tint) 9%,var(--surface))}
.pub .hero .wide{display:grid;gap:2rem;align-items:center}
@media(max-width:47.99rem){.pub .hero-aside{display:none}}
@media(min-width:64rem){.pub .hero.split .wide{grid-template-columns:minmax(0,1fr) 25rem}.pub .hero{padding:2.5rem 0 3rem}}
.pub .hero-title{display:flex;gap:1rem;align-items:center}
.pub .pill{display:inline-flex;align-items:center;gap:.4rem;margin:0 0 .75rem;padding:.25rem .7rem;border-radius:999px;background:var(--primary-soft);color:var(--primary-soft-fg);font-size:.85rem;font-weight:700}
.pub .pill svg{width:.95rem;height:.95rem}
.pub .lead{font-size:1.1rem;color:var(--fg-muted);margin:.75rem 0 0;max-width:40rem}
.pub .stats{display:grid;grid-template-columns:repeat(2,minmax(0,1fr));gap:.5rem;margin:1.5rem 0 0;max-width:40rem}
@media(min-width:36rem){.pub .stats{grid-template-columns:repeat(4,minmax(0,1fr))}}
.pub .stats div{padding:.7rem .9rem;border:1px solid var(--line);border-radius:1rem;background:var(--surface);display:flex;flex-direction:column-reverse}
.pub .stats dt{font-size:.8rem;color:var(--fg-muted);line-height:1.3}
.pub .stats dd{margin:0;font-family:'Bricolage Grotesque Variable',sans-serif;font-weight:800;font-size:1.5rem;line-height:1.2;font-variant-numeric:tabular-nums}
.pub .actions{display:flex;gap:.6rem;flex-wrap:wrap;margin-top:1.5rem}
.pub .kicker{color:var(--primary);font-weight:700;font-size:.9rem;margin:.5rem 0 0}
.pub .meta{color:var(--fg-muted);font-size:.9rem;margin-top:.75rem}
.pub main{padding-bottom:3rem}
.pub .page{padding-top:2rem}
.pub .sec{margin-top:3rem}
.pub .sec:first-child{margin-top:0}
.pub .sec-head{display:flex;align-items:end;justify-content:space-between;gap:1rem;margin-bottom:1rem}
.pub .sec-head h2{font-size:clamp(1.35rem,3vw,1.65rem)}
.pub .eyebrow{margin:0 0 .3rem;color:var(--primary);font-weight:800;font-size:.78rem;letter-spacing:.06em;text-transform:uppercase}
.pub .rc{display:block;padding:1.1rem 1.2rem;border:1px solid var(--line);border-radius:1.5rem;background:var(--surface);color:var(--fg);text-decoration:none}
a.rc:hover{border-color:var(--line-strong)}
.pub .rc h2,.pub .rc h3{font-size:1.15rem;margin-top:.9rem}
.pub .rc p{margin:.3rem 0 0;color:var(--fg-muted);font-size:.92rem}
.pub .rc .sec-head h2{margin-top:0;font-size:clamp(1.35rem,3vw,1.65rem)}
.pub .rc .top{display:flex;justify-content:space-between;align-items:start;gap:.5rem}
.pub .tag{display:inline-flex;align-items:center;gap:.3rem;padding:.15rem .6rem;border-radius:999px;background:var(--surface-2);color:var(--fg-muted);font-size:.78rem;font-weight:700;white-space:nowrap}
.pub .tag svg{width:.85rem;height:.85rem}
.pub .more{display:inline-flex;align-items:center;gap:.3rem;margin-top:.9rem;color:var(--accent);font-weight:700;font-size:.92rem;min-height:2.75rem;text-decoration:none}
.pub .grid{display:grid;gap:.9rem;grid-template-columns:repeat(auto-fill,minmax(min(100%,17rem),1fr))}
.pub .grid.two{grid-template-columns:repeat(auto-fill,minmax(min(100%,24rem),1fr))}
.pub .tlist{list-style:none;margin:1rem 0 0;padding:.9rem 0 0;border-top:1px solid var(--line);display:grid;gap:.4rem}
.pub .tlist li{display:flex;gap:.6rem;align-items:center;font-size:.92rem}
.pub .tlist .n{flex:none;width:1.4rem;height:1.4rem;border-radius:.45rem;display:grid;place-items:center;font-size:.72rem;font-weight:800}
.pub .tlist a{color:var(--fg);text-decoration:none}
.pub .tlist a:hover{text-decoration:underline}
.pub .rows{list-style:none;margin:0;padding:0;display:grid;gap:.5rem}
.pub .rows a{display:flex;align-items:center;gap:.9rem;padding:.75rem .9rem;border:1px solid var(--line);border-radius:1rem;background:var(--surface);color:var(--fg);text-decoration:none;min-height:3.75rem}
.pub .rows a:hover{border-color:var(--line-strong)}
.pub .rows .n{flex:none;width:2.25rem;height:2.25rem;border-radius:.75rem;display:grid;place-items:center;font-weight:800;font-size:.9rem;font-variant-numeric:tabular-nums}
.pub .rows .tx{flex:1;min-width:0}
.pub .rows b{display:block;line-height:1.35}
.pub .rows .go{color:var(--fg-subtle);width:1.15rem;height:1.15rem}
.pub .facts{display:flex;flex-wrap:wrap;gap:.25rem .8rem;margin-top:.2rem;color:var(--fg-muted);font-size:.82rem}
.pub .facts span{display:inline-flex;align-items:center;gap:.25rem}
.pub .facts svg{width:.85rem;height:.85rem}
.pub .chips{display:flex;gap:.4rem;flex-wrap:wrap;margin-top:1rem}
.pub .chips .tag{background:var(--surface);border:1px solid var(--line);padding:.3rem .7rem;font-size:.85rem;color:var(--fg)}
.pub .dlist{list-style:none;margin:0;padding:0;gap:.5rem;grid-template-columns:repeat(auto-fill,minmax(min(100%,15rem),1fr))}
.pub .dlist a{display:flex;justify-content:space-between;align-items:center;gap:.75rem;min-height:3.25rem;padding:.6rem .9rem;border:1px solid var(--line);border-radius:1rem;background:var(--surface);color:var(--fg);text-decoration:none}
.pub .dlist a:hover{border-color:var(--line-strong)}
.pub .dlist b{font-weight:600;line-height:1.3}
.pub .dlist span{flex:none;color:var(--fg-muted);font-size:.82rem}
.pub .sec-head h2 .ic{vertical-align:middle;margin-right:.35rem}
.pub a.tag{text-decoration:none;min-height:2.25rem}
.pub .with-rail{display:grid;gap:1.5rem}
@media(min-width:64rem){.pub .dlist{list-style:none;margin:0;padding:0;gap:.5rem;grid-template-columns:repeat(auto-fill,minmax(min(100%,15rem),1fr))}
.pub .dlist a{display:flex;justify-content:space-between;align-items:center;gap:.75rem;min-height:3.25rem;padding:.6rem .9rem;border:1px solid var(--line);border-radius:1rem;background:var(--surface);color:var(--fg);text-decoration:none}
.pub .dlist a:hover{border-color:var(--line-strong)}
.pub .dlist b{font-weight:600;line-height:1.3}
.pub .dlist span{flex:none;color:var(--fg-muted);font-size:.82rem}
.pub .sec-head h2 .ic{vertical-align:middle;margin-right:.35rem}
.pub a.tag{text-decoration:none;min-height:2.25rem}
.pub .with-rail{grid-template-columns:minmax(0,1fr) 20rem;align-items:start}.pub .rail{position:sticky;top:5rem}}
.pub .rail{display:grid;gap:.9rem}
.pub .rail .rc h2{font-size:1.05rem;margin:0 0 .5rem}
.pub .links{list-style:none;margin:0;padding:0}
.pub .links a{display:flex;align-items:center;gap:.7rem;min-height:2.75rem;color:var(--fg);font-weight:600;text-decoration:none}
.pub .links a:hover{color:var(--accent)}
.pub .links svg{width:1.1rem;height:1.1rem;color:var(--fg-muted)}
.pub .links .go{margin-left:auto}
.pub .rc.solid{background:var(--primary);border-color:transparent;color:var(--primary-fg)}
.pub .rc.solid p{color:inherit;opacity:.9}
.pub .rc.solid .btn{margin-top:.9rem;background:var(--surface);border-color:transparent}
.pub .steps{display:grid;gap:1.25rem}
@media(min-width:48rem){.pub .steps{grid-template-columns:repeat(3,minmax(0,1fr))}}
.pub .steps h3{font-size:1.05rem;margin-top:.8rem}
.pub .steps p{margin:.3rem 0 0;color:var(--fg-muted);font-size:.92rem}
.pub .strip{display:grid;grid-auto-flow:column;grid-auto-columns:min(78%,15rem);gap:.75rem;overflow-x:auto;scroll-snap-type:x mandatory;padding-bottom:.5rem;scrollbar-width:thin}
.pub .strip>*{scroll-snap-align:start}
.pub .strip .rc{padding:.9rem}
.pub .strip .thumb{display:grid;place-items:center;height:5.5rem;border-radius:1rem}
.pub .strip small{display:block;margin-top:.7rem;color:var(--fg-muted);font-size:.78rem}
.pub .strip b{display:block;line-height:1.3}
.pub .bars{display:grid;gap:.75rem;margin-top:1rem}
.pub .bars div{display:grid;grid-template-columns:1fr auto;gap:.3rem .75rem;font-size:.9rem}
.pub .bars i{grid-column:1/-1;height:.5rem;border-radius:999px;background:var(--surface-2);overflow:hidden}
.pub .bars i b{display:block;height:100%;border-radius:999px}
.pub .faq details{border-top:1px solid var(--line);margin:0}
.pub .faq details:first-of-type{border-top:0}
.pub .faq summary{color:var(--fg);justify-content:space-between;gap:1rem}
.pub .faq summary svg{width:1rem;height:1rem;color:var(--fg-muted)}
.pub .faq details[open] summary svg{transform:rotate(180deg)}
.pub .faq p{margin:0 0 .9rem;color:var(--fg-muted);font-size:.95rem}
.pub .search{display:flex;align-items:center;gap:.6rem;min-height:3rem;padding:0 .9rem;border:1px solid var(--line-strong);border-radius:.75rem;background:var(--surface);max-width:32rem;margin-top:1.5rem}
.pub .search svg{width:1.15rem;height:1.15rem;color:var(--fg-muted)}
.pub .search input{flex:1;min-width:0;min-height:2.75rem;border:0;background:transparent;color:var(--fg);font:inherit;font-size:1rem;outline:0}
.pub .search:focus-within{border-color:var(--primary)}
.pub .sres{list-style:none;margin:.5rem 0 0;padding:0;max-width:32rem;display:grid;gap:.25rem}
.pub .sres a{display:flex;flex-direction:column;padding:.55rem .8rem;border-radius:.75rem;background:var(--surface);border:1px solid var(--line);text-decoration:none;color:var(--fg)}
.pub .sres small{color:var(--fg-muted)}
.pub .toc{margin:1.5rem 0;padding:1rem 1.25rem;border:1px solid var(--line);border-radius:1rem;background:var(--surface)}
.pub .toc h2{font-size:1rem;margin-bottom:.5rem}
.pub .toc ol{margin:0;padding-left:1.25rem}
.pub .toc li{margin:.2rem 0}
.pub .lesson{display:grid;gap:1.5rem;padding-top:1.5rem}
.pub .lesson-side{display:grid;gap:1rem;align-content:start}
.pub .otl{border:1px solid var(--line);border-radius:1rem;background:var(--surface)}
.pub .otl summary{padding:0 1rem;margin:0;color:var(--fg);justify-content:space-between}
.pub .otl ol{list-style:none;margin:0;padding:0 1rem .75rem;display:grid}
.pub .otl a{display:block;padding:.4rem .7rem;border-left:2px solid var(--line);color:var(--fg-muted);text-decoration:none;font-size:.9rem;line-height:1.4}
.pub .otl a:hover,.pub .otl a.on{color:var(--fg);border-color:var(--primary);font-weight:600}
.pub .side-cta{padding:1rem;border:1px solid var(--line);border-radius:1rem;background:var(--surface)}
.pub .side-cta b{display:block;font-size:.95rem}
.pub .side-cta p{margin:.25rem 0 .75rem;color:var(--fg-muted);font-size:.85rem;line-height:1.45}
.pub .side-cta .btn{width:100%}
@media(max-width:63.99rem){.pub .side-cta{display:none}}
@media(min-width:64rem){.pub .lesson{grid-template-columns:15rem minmax(0,1fr);gap:2.5rem;padding-top:2rem}.pub .lesson-side{position:sticky;top:5rem;max-height:calc(100dvh - 6rem);overflow-y:auto}.pub .otl{border:0;background:transparent}.pub .otl summary{pointer-events:none;padding:0;min-height:0;margin-bottom:.6rem;font-size:.75rem;letter-spacing:.06em;text-transform:uppercase;color:var(--fg-muted)}.pub .otl summary svg{display:none}.pub .otl ol{padding:0}}
.pub .readbar{position:fixed;top:0;left:0;height:3px;width:100%;transform-origin:0 50%;transform:scaleX(0);background:var(--primary);z-index:40}
.pub article{font-size:1.0625rem;min-width:0}
.pub article>*+*{margin-top:1rem}
.pub article h2{font-size:1.5rem;margin-top:2.5rem;scroll-margin-top:5rem}
.pub article h3{font-size:1.2rem;margin-top:1.75rem}
.pub article>h2:first-child{margin-top:0}
.pub article ul,.pub article ol{padding-left:1.4rem}
.pub article li{margin:.3rem 0}
.pub article li::marker{color:var(--primary)}
.pub article blockquote{margin:1rem 0;padding:.25rem 1rem;border-left:4px solid var(--line-strong);color:var(--fg-muted);font-style:italic}
.pub article hr{border:0;border-top:1px solid var(--line);margin:2rem 0}
.pub article mark{background:linear-gradient(transparent 58%,var(--marker) 58%,var(--marker) 92%,transparent 92%);color:inherit;padding:0 .08em}
.pub .ek{font-style:italic;color:var(--fg-muted)}
.pub .tw{overflow-x:auto;border:1px solid var(--line);border-radius:1rem;background:var(--surface)}
.pub table{border-collapse:collapse;width:100%;font-size:.95rem}
.pub th,.pub td{padding:.55rem .75rem;text-align:left;border-bottom:1px solid var(--line);vertical-align:top}
.pub th{background:var(--surface-2);font-weight:700}
.pub tr:last-child td{border-bottom:0}
.pub figure{margin:1.25rem 0}
.pub figure img{max-width:100%;height:auto;border-radius:1rem;display:block}
.pub figcaption{font-size:.85rem;color:var(--fg-muted);margin-top:.4rem}
.pub .video-frame{position:relative;aspect-ratio:16/9;border-radius:1.5rem;overflow:hidden;background:var(--fg)}
.pub .yt-play{position:absolute;inset:0;width:100%;height:100%;display:flex;flex-direction:column;align-items:center;justify-content:center;gap:.6rem;border:0;background:var(--fg);color:var(--bg);font:inherit;font-weight:700;cursor:pointer}
.pub .yt-play svg{width:3.5rem;height:3.5rem;padding:.9rem;border-radius:999px;background:var(--bg);color:var(--fg)}
.pub .video-frame iframe{position:absolute;inset:0;width:100%;height:100%;border:0}
.pub .box{padding:1rem 1.2rem;border-radius:1.5rem;border:1px solid var(--line);background:var(--surface)}
.pub .box>strong{display:block;margin-bottom:.25rem}
.pub .box p{margin:.4rem 0 0}
.pub .box.tip{background:var(--primary-soft);border-color:transparent;color:var(--primary-soft-fg)}
.pub .box.link{background:var(--accent-soft);border-color:transparent;color:var(--accent-soft-fg)}
.pub .box.sim{border-style:dashed}
.pub .goals{border:1px solid var(--line);border-radius:1.5rem;padding:1rem 1.25rem;background:var(--surface)}
.pub .goals ol{list-style:none;padding:0!important}
.pub .goals li{position:relative;padding-left:1.75rem}
.pub .goals li::before{content:'';position:absolute;left:0;top:.3em;width:1.05rem;height:1.05rem;border-radius:999px;border:2px solid var(--primary)}
.pub .goals li::after{content:'';position:absolute;left:.36rem;top:.5em;width:.3rem;height:.5rem;border:solid var(--primary);border-width:0 2px 2px 0;transform:rotate(45deg)}
.pub .lesson .cta{grid-template-columns:1fr}
.pub .goals h2{font-size:1.1rem;margin:0 0 .5rem!important}
.pub .cause{list-style:none;padding:0!important}
.pub .cause li{display:grid;gap:.25rem;padding:.6rem .9rem;border:1px solid var(--line);border-radius:1rem;background:var(--surface)}
.pub .cause-a{font-weight:700}
.pub .cause-b::before{content:'Sonuç: ';color:var(--fg-muted);font-weight:600}
.pub .muted{color:var(--fg-muted)}
.pub .timeline ul{list-style:none;padding:0!important}
.pub .q{padding:1.1rem 1.2rem;border:1px solid var(--line);border-radius:1.5rem;background:var(--surface)}
.pub .q-n{margin:0;font-weight:700;color:var(--primary);font-size:.9rem}
.pub .q-stem{margin:.4rem 0 0;font-weight:600}
.pub .opts{list-style:none;padding:0!important;margin:.75rem 0 0;display:grid;gap:.4rem}
@media(min-width:40rem){.pub .opts{grid-template-columns:1fr 1fr}}
.pub .opts li{display:flex;gap:.6rem;align-items:center;margin:0;padding:.55rem .75rem;border:1px solid var(--line);border-radius:.75rem}
.pub .opt-l{flex:none;width:1.6rem;height:1.6rem;border-radius:999px;background:var(--surface-2);display:grid;place-items:center;font-weight:700;font-size:.8rem}
.pub details{margin-top:.75rem}
.pub summary{cursor:pointer;font-weight:700;color:var(--accent);min-height:2.75rem;display:flex;align-items:center}
.pub .self{display:grid;grid-template-columns:minmax(0,1fr);gap:.4rem;padding:1.1rem 1.2rem;border:1px solid var(--line);border-radius:1.5rem;background:var(--surface)}
.pub .self h3{margin:0 0 .25rem!important;font-size:1rem;color:var(--accent)}
.pub .self details{margin:0;border:1px solid var(--line);border-radius:.75rem;padding:0 .9rem;background:var(--bg)}
.pub .cta{margin:3rem 0 0;padding:1.75rem;border-radius:2rem;background:var(--primary);color:var(--primary-fg);display:grid;gap:1.25rem}
@media(min-width:48rem){.pub .cta{grid-template-columns:minmax(0,1fr) auto;align-items:center;padding:2.25rem}}
.pub .cta h2{font-size:clamp(1.35rem,3vw,1.75rem);margin:0}
.pub .cta p{margin:.5rem 0 0;opacity:.9;max-width:38rem}
.pub .cta .row{display:flex;gap:.6rem;flex-wrap:wrap}
.pub .cta .btn.light{background:var(--surface);border-color:transparent}
.pub .cta .btn.ghost{background:transparent;border-color:color-mix(in srgb,var(--primary-fg) 45%,transparent);color:var(--primary-fg)!important}
.pub .pager{display:grid;gap:.75rem;margin-top:2rem;grid-template-columns:1fr}
@media(min-width:40rem){.pub .pager{grid-template-columns:1fr 1fr}}
.pub .pager a{display:block;padding:.9rem 1.1rem;border:1px solid var(--line);border-radius:1.5rem;background:var(--surface);text-decoration:none;color:var(--fg);font-weight:700}
.pub .pager a:hover{border-color:var(--line-strong)}
.pub .pager small{display:flex;align-items:center;gap:.3rem;color:var(--fg-muted);font-weight:600}
.pub .pager small svg{width:.9rem;height:.9rem}
.pub .pager .next{text-align:right}
.pub .pager .next small{justify-content:flex-end}
.pub .cards{display:grid;gap:.75rem;grid-template-columns:repeat(auto-fill,minmax(min(100%,15rem),1fr));margin-top:1.25rem}
.pub .card{display:block;padding:1rem 1.1rem;border:1px solid var(--line);border-radius:1.5rem;background:var(--surface);text-decoration:none;color:var(--fg)}
.pub .card:hover{border-color:var(--line-strong)}
.pub .card h2,.pub .card h3{font-size:1.1rem}
.pub .card p{margin:.4rem 0 0;color:var(--fg-muted);font-size:.92rem}
.pub .list{list-style:none;padding:0;margin:1.25rem 0 0;display:grid;gap:.5rem}
.pub .list a{display:block;padding:.8rem 1rem;border:1px solid var(--line);border-radius:1rem;background:var(--surface);text-decoration:none;color:var(--fg)}
.pub .list a:hover{border-color:var(--line-strong)}
.pub .list b{display:block}
.pub .list span{display:block;color:var(--fg-muted);font-size:.9rem;margin-top:.15rem}
.pub article .katex{display:inline-block;max-width:100%;overflow-x:auto;overflow-y:hidden;vertical-align:middle}
.pub article .katex-display{display:block;text-align:center;margin:1rem 0}
.pub .section{margin-top:2.25rem}
.pub .section>h2{font-size:1.4rem}
.pub footer.foot{border-top:1px solid var(--line);padding:2.5rem 0 3rem;background:var(--surface);font-size:.92rem}
.pub footer.foot .wide{display:grid;gap:1.5rem;grid-template-columns:repeat(auto-fit,minmax(11rem,1fr))}
.pub footer.foot h2{font-size:.95rem;margin-bottom:.5rem}
.pub footer.foot ul{list-style:none;margin:0;padding:0}
.pub footer.foot li a{display:inline-flex;align-items:center;min-height:2.25rem;color:var(--fg-muted);text-decoration:none}
.pub footer.foot li a:hover{color:var(--fg)}
.pub footer.foot .editor a{text-decoration:underline}
.pub footer.foot .editor{grid-column:1/-1;color:var(--fg-muted);margin:0;padding-top:1.25rem;border-top:1px solid var(--line)}
@media(prefers-reduced-motion:no-preference){.pub a,.pub .rc,.pub .rows a{transition:border-color .15s,background-color .15s,color .15s}.pub .dd>summary svg,.pub .faq summary svg{transition:transform .2s}}
`

const fontCache = new Map()

// Ana yazı tipi dosyaları CSS'in içinden bulunur, böylece CSS çözülmeden indirilmeye başlar
function fontPreloads(cssHref) {
  if (!cssHref) return []
  if (!fontCache.has(cssHref)) {
    let urls = []
    try {
      const text = readFileSync(join(process.cwd(), 'dist', cssHref), 'utf8')
      urls = [...text.matchAll(/url\((\/assets\/(?:figtree|bricolage-grotesque)-latin-wght-normal-[^)]+\.woff2)\)/g)].map((m) => m[1])
    } catch {
      urls = []
    }
    fontCache.set(cssHref, [...new Set(urls)])
  }
  return fontCache.get(cssHref)
}

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
${verificationTag()}
${noindex ? '<meta name="robots" content="noindex, nofollow" />\n' : ''}<meta name="theme-color" content="#f4f6f1" />
<link rel="icon" href="/favicon.svg" type="image/svg+xml" />
<link rel="apple-touch-icon" href="/apple-touch-icon.png" />
<meta property="og:type" content="article" />
<meta property="og:locale" content="tr_TR" />
<meta property="og:title" content="${escapeHtml(title)}" />
<meta property="og:description" content="${escapeHtml(description)}" />
<meta property="og:url" content="${url}" />
<meta property="og:site_name" content="İzlek" />
<meta property="og:image" content="${site}/og.png" />
<meta name="twitter:card" content="summary_large_image" />
${fontPreloads(cssHref).map((href) => `<link rel="preload" href="${href}" as="font" type="font/woff2" crossorigin />`).join('\n')}
${cssHref ? `<link rel="stylesheet" href="${cssHref}" />` : ''}
<style>${css}</style>
<script>${themeScript}</script>
${ld.map(jsonLd).join('\n')}
</head>`
  void shell
  const extra = links.map(([href, label]) => `<a class="nl" href="${href}">${escapeHtml(label)}</a>`).join('')
  const menu = `<details class="dd"><summary>Kaynaklar${icon('ChevronDown')}</summary><div class="dd-panel"><div class="wide"><ul class="dd-grid">${resources
    .map((r) => `<li><a href="${r.href}">${chip(r.icon, hueColor(r.hue))}<span><b>${escapeHtml(r.title)}</b><span class="t">${escapeHtml(r.text)}</span></span></a></li>`)
    .join('')}</ul><div class="dd-side"><b>Hepsi ücretsiz</b><p>Konu anlatımları ve araçlar üye olmadan kullanılır.</p><a href="/kaynaklar">Tüm kaynaklar${icon('ArrowRight')}</a></div></div></div></details>`
  const header = `<header class="top"><div class="wide bar"><a class="brand" href="/">${logo}</a><nav class="main" aria-label="Ana menü"><a class="nl" href="/konu-anlatimi">Konu anlatımları</a>${extra}${menu}<a class="btn" href="/giris">Giriş yap</a></nav></div></header>`
  const footer = `<footer class="foot"><div class="wide">
${examLinks.length ? `<div><h2>Konu anlatımları</h2><ul>${examLinks.map(([href, label]) => `<li><a href="${href}">${escapeHtml(label)}</a></li>`).join('')}</ul></div>` : ''}
<div><h2>Kaynaklar</h2><ul>${resources.slice(1).map((r) => `<li><a href="${r.href}">${escapeHtml(r.title)}</a></li>`).join('')}<li><a href="/kaynaklar">Tüm kaynaklar</a></li></ul></div>
<div><h2>İzlek</h2><ul><li><a href="/hakkinda">Hakkında</a></li><li><a href="/ogretmen-basvurusu">Öğretmen başvurusu</a></li><li><a href="/katil">Davet koduyla katıl</a></li><li><a href="/kvkk">KVKK aydınlatma metni</a></li><li><a href="/durum">Sistem durumu</a></li></ul></div>
<p class="editor">Anlatımlar İzlek'in geliştiricisi tarafından hazırlanır ve gözden geçirilir. Bir hata ya da eksik görürseniz <a href="mailto:${CONTACT_EMAIL}">${CONTACT_EMAIL}</a> adresine yazabilirsiniz. İzlek ücretsizdir ve reklam içermez.</p>
</div></footer>`
  return `${head}\n<body class="pub">\n${header}\n${body}\n${footer}\n<script>${navScript};${videoScript}</script>\n<script>${beaconScript}</script>\n</body>\n</html>\n`
}
