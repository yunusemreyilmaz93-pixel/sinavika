import { join } from 'node:path'
import { escapeHtml } from '../html.mjs'
import { loadTs } from '../ts-load.mjs'
import { chip, ctaBand, fmtNum, hero, hueColor, icon, layout, resources, secHead, subjectChip } from './layout.mjs'
import { slug } from './slugs.mjs'
import { LGS_SCORE, lgsBody, rowHtml, scoreCss, scoreScript, YKS_SCORE, yksBody } from './score-tool.mjs'

const kindLabel = { study: 'Konu çalışma', questions: 'Soru çözme', reading: 'Okuma', video: 'Video', review: 'Tekrar', other: 'Diğer' }
const weekdays = ['Pazartesi', 'Salı', 'Çarşamba', 'Perşembe', 'Cuma', 'Cumartesi', 'Pazar']
const PROGRAMS = '/calisma-programlari'
const groupLook = { LGS: ['School', 'pine'], TYT: ['BookOpen', 'sea'], AYT: ['Layers', 'violet'], YKS: ['GraduationCap', 'amber'], YDT: ['Languages', 'coral'], Genel: ['CalendarDays', 'teal'] }
const NET = '/araclar/net-hesaplama'

// Dersler ve soru sayıları sınav yönetmeliğine göredir. YKS netinde yanlış 4'te 1, LGS'de 3'te 1 götürür
export const exams = [
  {
    key: 'lgs',
    name: 'LGS',
    divisor: 3,
    sections: [['Türkçe', 20, 'tr'], ['Matematik', 20, 'mat'], ['Fen Bilimleri', 20, 'fen'], ['T.C. İnkılap Tarihi ve Atatürkçülük', 10, 'ink'], ['Din Kültürü ve Ahlak Bilgisi', 10, 'din'], ['Yabancı Dil', 10, 'ing']],
    // Yaklaşık puan: taban + ağırlıklı net x çarpan (src/lib/score.ts ile aynı katsayılar)
    score: { base: 194.752, factor: (500 - 194.752) / 270, weights: [4, 4, 4, 1, 1, 1] },
  },
  {
    key: 'tyt',
    name: 'TYT',
    divisor: 4,
    sections: [['Türkçe', 40, 'tr'], ['Sosyal Bilimler', 20, 'sos'], ['Temel Matematik', 40, 'mat'], ['Fen Bilimleri', 20, 'fen']],
    // MEB OGM Materyal YKS puan hesaplama motorunun TYT katsayıları. Türkçe ya da matematikten 0,5 net gerekir
    score: { base: 144.79811555479816, factor: 1, weights: [2.93041546699554, 3.0192159356054, 2.93041546699554, 3.0192159356054], need: [0, 2] },
  },
  {
    key: 'ayt',
    name: 'AYT',
    divisor: 4,
    sections: [['Matematik', 40, 'mat'], ['Fen Bilimleri', 40, 'fiz'], ['Türk Dili ve Edebiyatı, Sosyal Bilimler-1', 40, 'edb'], ['Sosyal Bilimler-2', 40, 'cog1']],
  },
  { key: 'ydt', name: 'YDT', divisor: 4, sections: [['Yabancı Dil', 80, 'dil']] },
]

export const calcScript = (data) => `(function(){var D=${JSON.stringify(data).replace(/</g, '\\u003c')};var root=document.getElementById('calc');if(!root)return;var cur='lgs';function q(sel){return root.querySelector(sel)}
function fmt(n){return (Math.round(n*100)/100).toString().replace('.',',')}
function num(r,k){return parseInt(r.querySelector('[data-k='+k+']').value,10)||0}
function calc(){var e=D[cur],total=0,bad=false,w=0,sd=0,sy=0,sb=0,qs=0,nets=[];root.querySelectorAll('[data-panel="'+cur+'"] [data-row]').forEach(function(r,i){var d=num(r,'d'),y=num(r,'y'),max=+r.dataset.max,o=r.querySelector('[data-net]'),b=r.querySelector('[data-b]');qs+=max;var over=d+y>max;o.classList.toggle('bad',over);if(over){bad=true;o.textContent='-';b.textContent='-';nets.push(0);return}var net=d-y/e.divisor;nets.push(net);total+=net;sd+=d;sy+=y;sb+=max-d-y;if(e.score)w+=Math.max(0,net)*e.score.weights[i];o.textContent=fmt(net);b.textContent=String(max-d-y)});
q('[data-total]').textContent=fmt(total);q('[data-total-label]').textContent='Toplam '+e.name+' neti';q('[data-sum]').textContent=qs+' soruda '+sd+' doğru, '+sy+' yanlış, '+sb+' boş';
var sr=q('[data-score-row]');sr.hidden=!e.score;if(e.score){var ok=!e.score.need||e.score.need.some(function(i){return nets[i]>=0.5});q('[data-score-label]').textContent=e.name+' puanı, bilgi amaçlı';q('[data-score]').textContent=ok&&sd?String(Math.round(e.score.base+w*e.score.factor)):'-'}
var link=q('[data-score-link]');link.href=cur==='lgs'?'${LGS_SCORE}':'${YKS_SCORE}';link.querySelector('b').textContent=cur==='lgs'?'LGS puan hesaplama':'YKS puan hesaplama';
var note=q('[data-note]');note.classList.toggle('warn',bad);note.textContent=bad?'Doğru ve yanlış toplamı soru sayısını aşmamalı':'Net = Doğru - Yanlış / '+e.divisor}
root.querySelectorAll('[data-tab]').forEach(function(t){t.addEventListener('click',function(){cur=t.dataset.tab;root.querySelectorAll('[data-tab]').forEach(function(x){x.setAttribute('aria-pressed',String(x===t))});root.querySelectorAll('[data-panel]').forEach(function(p){p.hidden=p.dataset.panel!==cur});calc()})});
q('[data-reset]').addEventListener('click',function(){root.querySelectorAll('[data-panel="'+cur+'"] input').forEach(function(i){i.value=''});calc()});
root.addEventListener('input',function(ev){var t=ev.target;if(t.tagName==='INPUT'){t.value=t.value.replace(/[^0-9]/g,'');calc()}});calc()})()`

// Net hesaplama aracının işaretlemesi. Sayfa ve test aynı çıktıyı kullanır
export function netToolHtml() {
  const panels = exams
    .map((e, i) => `<div data-panel="${e.key}"${i ? ' hidden' : ''}><div class="trows">${e.sections.map(([name, count, key]) => rowHtml(e.key, [key, name, count])).join('')}</div></div>`)
    .join('')
  return `<section id="calc" aria-label="Net hesaplama aracı">
<div class="seg" role="group" aria-label="Sınav">${exams.map((e, i) => `<button type="button" data-tab="${e.key}" aria-pressed="${i === 0}">${e.name}</button>`).join('')}</div>
<div class="tool"><div>${panels}</div>
<aside class="tool-side"><div class="best" aria-live="polite"><span data-total-label>Toplam LGS neti</span><strong data-total>0</strong><small data-sum></small></div>
<div class="result" data-score-row><span data-score-label>LGS puanı, bilgi amaçlı</span><strong data-score>-</strong></div>
<a class="side-link" data-score-link href="${LGS_SCORE}">${chip('Gauge', hueColor('violet'))}<span><b>LGS puan hesaplama</b><small>Puan türlerini ayrı ayrı görün</small></span>${icon('ArrowRight')}</a>
<button type="button" class="btn" data-reset>${icon('RotateCcw')}Sıfırla</button>
<p class="calc-note" data-note></p></aside></div>
</section>`
}

const toolCss = `<style>
.pub .days{display:grid;gap:.75rem;grid-template-columns:repeat(auto-fill,minmax(min(100%,16rem),1fr))}
.pub .day{border:1px solid var(--line);border-radius:1.5rem;background:var(--surface);padding:.9rem 1rem}
.pub .day h3{font-size:.95rem;margin-bottom:.4rem}
.pub .day ul{list-style:none;margin:0;padding:0}
.pub .day li{padding:.55rem 0;border-bottom:1px solid var(--line)}
.pub .day li:last-child{border-bottom:0}
.pub .day li b{display:block}
.pub .day li span{color:var(--fg-muted);font-size:.9rem}
</style>`

const cut = (text, max) => (text.length <= max ? text : `${text.slice(0, max - 3).replace(/\s+\S*$/, '')}...`)

export async function buildPublicTools({ write, shell, cssHref, site, subjects = [], examLinks = [] }) {
  const starters = (await loadTs(join(process.cwd(), 'src/features/templates/starters.ts'))).starterTemplates
  const subjectName = new Map(subjects.map((s) => [s.id, s.name]))
  const urls = []
  const wrap = ({ css = '', ...opts }) => {
    const html = layout({ shell, cssHref, site, examLinks, ...opts })
    return html.replace('</head>', `${toolCss}${css}\n</head>`)
  }
  const crumbLd = (items) => ({
    '@context': 'https://schema.org',
    '@type': 'BreadcrumbList',
    itemListElement: items.map(([name, path], i) => ({ '@type': 'ListItem', position: i + 1, name, item: `${site}${path}` })),
  })
  const cta = `<aside class="cta"><div><h2>Programı öğrencinize tek tıkla uygulayın</h2><p>İzlek'te öğretmen şablonu seçer, öğrencilere haftalara dağıtır ve tamamlanma durumunu izler. Uygulama ücretsizdir ve reklam içermez.</p></div><div class="row"><a class="btn light" href="/ogretmen-basvurusu">Öğretmen başvurusu</a><a class="btn ghost" href="/katil">Davet koduyla katıl</a></div></aside>`

  // Net hesaplama
  {
    const data = Object.fromEntries(exams.map((e) => [e.key, { name: e.name, divisor: e.divisor, score: e.score }]))
    const trail = [['Ana sayfa', '/'], ['Kaynaklar', '/kaynaklar'], ['Net hesaplama', NET]]
    const faq = [
      ['LGS netinde yanlışlar nasıl hesaplanır?', 'LGS\'de 3 yanlış 1 doğruyu götürür. Net = Doğru - Yanlış / 3 formülüyle hesaplanır.'],
      ['TYT ve AYT netinde yanlışlar nasıl hesaplanır?', 'YKS\'de 4 yanlış 1 doğruyu götürür. Net = Doğru - Yanlış / 4 formülüyle hesaplanır.'],
      ['Bu araç puan hesaplar mı?', 'LGS ve TYT puanını da gösterir, SAY, EA, SÖZ ve DİL puanı için YKS puan hesaplama aracı vardır. Resmi puan o yıl sınava girenlerin sonuçlarına göre hesaplandığı için gerçek puan farklı çıkabilir. TYT için MEB OGM Materyal puan hesaplama motorunun katsayıları, LGS için önceki yılların ortalaması kullanılır.'],
    ]
    const table = `<div class="tw"><table><thead><tr><th>Sınav</th><th>Bölüm</th><th>Soru</th></tr></thead><tbody>${exams
      .flatMap((e) => e.sections.map(([name, count]) => `<tr><td>${e.name}</td><td>${escapeHtml(name)}</td><td>${count}</td></tr>`))
      .join('')}</tbody></table></div>`
    const formula = `<div class="rc" style="padding:1.25rem"><p style="margin:0;font-weight:700;color:var(--fg)">Formül</p><div class="minis" style="margin-top:.75rem"><div class="mini" style="background:${hueColor('coral')}14"><b style="color:${hueColor('coral')}">LGS</b><code>Net = D - Y / 3</code></div><div class="mini" style="background:${hueColor('sea')}14"><b style="color:${hueColor('sea')}">YKS</b><code>Net = D - Y / 4</code></div></div><div class="mini" style="margin-top:.6rem;background:var(--surface-2)"><span>Örnek: TYT Matematik 28 doğru, 8 yanlış</span><code>28 - 8 / 4 = <mark>26 net</mark></code></div></div>`
    const body = `<main>${hero({
      crumbs: trail,
      pill: `${icon('Calculator')}LGS, TYT, AYT, YDT`,
      title: 'Net <mark>hesaplama</mark>',
      lead: "Doğru ve yanlışınızı girin, ders ders ve toplam netiniz anında görünsün. LGS'de 3, YKS'de 4 yanlış bir doğruyu götürür.",
      aside: formula,
    })}
<div class="wide page">${netToolHtml()}
<noscript><p class="box">Hesaplama için JavaScript gerekir. Formül LGS'de Doğru - Yanlış / 3, YKS'de Doğru - Yanlış / 4 şeklindedir.</p></noscript>
<div class="sec with-rail"><article>
<h2>Net nasıl hesaplanır?</h2>
<p>Net, doğru sayısından yanlış sayısının belirli bir oranının çıkarılmasıyla bulunur. Boş bırakılan sorular neti etkilemez.</p>
<ul><li>LGS: Net = Doğru - Yanlış / 3</li><li>TYT, AYT ve YDT: Net = Doğru - Yanlış / 4</li></ul>
<p>Örneğin TYT Matematik'te 28 doğru ve 8 yanlış yapan bir öğrencinin neti 28 - 8 / 4 = 26 olur.</p>
<h2>Sınavlardaki soru sayıları</h2>
${table}
</article>
<section class="rc faq"><h2 style="margin:0 0 .5rem">Sık sorulanlar</h2>${faq.map(([q, a]) => `<details><summary>${escapeHtml(q)}${icon('ChevronDown')}</summary><p>${escapeHtml(a)}</p></details>`).join('')}</section></div>
${ctaBand}
</div></main>
<script>${calcScript(data)}</script>`
    write(`${NET.slice(1)}.html`, wrap({
      title: 'LGS, TYT, AYT, YDT net hesaplama · İzlek',
      description: 'LGS, TYT, AYT ve YDT için doğru ve yanlış sayısından net hesaplayın. LGS\'de yanlış 3\'te 1, YKS\'de 4\'te 1 oranında doğruyu götürür.',
      path: NET,
      css: scoreCss,
      body,
      ld: [
        { '@context': 'https://schema.org', '@type': 'WebApplication', name: 'Net hesaplama', applicationCategory: 'EducationalApplication', operatingSystem: 'Any', inLanguage: 'tr', offers: { '@type': 'Offer', price: '0', priceCurrency: 'TRY' }, url: `${site}${NET}` },
        { '@context': 'https://schema.org', '@type': 'FAQPage', mainEntity: faq.map(([q, a]) => ({ '@type': 'Question', name: q, acceptedAnswer: { '@type': 'Answer', text: a } })) },
        crumbLd(trail),
      ],
    }))
    urls.push({ path: NET })
  }

  // Puan hesaplama: LGS ve YKS ayrı sayfa
  {
    const formulas = (await loadTs(join(process.cwd(), 'src/lib/score.ts'))).scoreFormulas
    const cta = `<aside class="cta"><div><h2>Denemelerinizi zamanla izleyin</h2><p>İzlek'te her denemenin neti ve puanı kaydedilir, ders ders gelişiminiz görünür. Öğretmeniniz bu verilere bakarak çalışma planınızı günceller.</p></div><div class="row"><a class="btn light" href="/katil">Davet koduyla katıl</a><a class="btn ghost" href="/ogretmen-basvurusu">Öğretmen başvurusu</a></div></aside>`
    const pages = [
      {
        path: LGS_SCORE,
        name: 'LGS puan hesaplama',
        title: 'LGS puan hesaplama · İzlek',
        description: 'LGS puanınızı doğru ve yanlış sayılarınızdan hesaplayın. 3 yanlış 1 doğruyu götürür, Türkçe, Matematik ve Fen netleri 4 katsayıyla sayılır.',
        lead: 'Doğru ve yanlış sayılarınızı girin, LGS puanınız anında hesaplansın. Kayıt ya da üyelik gerekmez.',
        notice: 'Gerçek puan o yıl sınava girenlerin sonuçlarına göre hesaplanır ve her yıl değişir. Hesap önceki yılların ortalamasına dayanır.',
        body: lgsBody,
        pill: `${icon('Gauge')}Bilgi amaçlı, her yıl değişir`,
        info: [['SÖZ', 'coral', 'Sözel bölüm', '50 soru · 75 dk'], ['SAY', 'sea', 'Sayısal bölüm', '40 soru · 80 dk'], ['x4', 'pine', 'Türkçe, Mat, Fen', 'Net 4 katsayıyla'], ['x1', 'amber', 'İnkılap, Din, Dil', 'Net 1 katsayıyla']],
        article: `<h2>LGS puanı nasıl hesaplanır?</h2>
<p>Önce her dersin neti bulunur, 3 yanlış 1 doğruyu götürür. Türkçe, Matematik ve Fen Bilimleri netleri 4, İnkılap Tarihi, Din Kültürü ve Yabancı Dil netleri 1 katsayıyla çarpılır. Bu ağırlıklı net taban puana eklenir ve sonuç 500 üzerinden gösterilir.</p>
<p>Netlerinizi tek tek görmek için <a href="${NET}">net hesaplama</a> aracını kullanabilirsiniz.</p>`,
        faq: [
          ['Hesaplanan LGS puanı kesin midir?', 'Hayır, bilgi amaçlıdır. Resmi LGS puanı o yıl sınava girenlerin sonuçlarına göre hesaplanır ve her yıl değişir.'],
          ['LGS\'de hangi dersler daha çok etkiler?', 'Türkçe, Matematik ve Fen Bilimleri netleri 4 katsayıyla, İnkılap Tarihi, Din Kültürü ve Yabancı Dil netleri 1 katsayıyla sayılır.'],
          ['Bütün soruları doğru yapan kaç puan alır?', 'Tüm soruları doğru yanıtlayan öğrenci 500 puan alır.'],
        ],
      },
      {
        path: YKS_SCORE,
        name: 'YKS puan hesaplama',
        title: 'YKS puan hesaplama: TYT, SAY, EA, SÖZ, DİL · İzlek',
        description: 'TYT, AYT ve YDT netlerinizden TYT, SAY, EA, SÖZ ve DİL puanınızı hesaplayın. Katsayılar MEB OGM Materyal puan hesaplama motorundan alınmıştır.',
        lead: 'TYT, AYT ve YDT doğru ve yanlış sayılarınızı girin, TYT, SAY, EA, SÖZ ve DİL puanınız anında hesaplansın. Kayıt ya da üyelik gerekmez.',
        notice: 'Gerçek puan o yıl sınava girenlerin sonuçlarına göre hesaplanır ve her yıl değişir. Katsayılar MEB OGM Materyal puan hesaplama motorundan alınmıştır.',
        body: yksBody,
        pill: `${icon('Gauge')}MEB OGM Materyal katsayılarıyla`,
        info: [['TYT', 'coral', 'Temel Yeterlilik', '120 soru · 165 dk'], ['AYT', 'sea', 'Alan Yeterlilik', '160 soru · 180 dk'], ['YDT', 'violet', 'Yabancı Dil', '80 soru · 120 dk'], ['OBP', 'amber', 'Diploma notu', 'x 0,6 eklenir']],
        article: `<h2>YKS puanı nasıl hesaplanır?</h2>
<p>Önce her testin neti bulunur, 4 yanlış 1 doğruyu götürür. TYT puanı yalnızca TYT netleriyle, SAY, EA, SÖZ ve DİL puanları TYT ve AYT ya da YDT netleriyle birlikte hesaplanır. Netler katsayılarla çarpılıp taban puana eklenir. Yerleştirme puanına diploma notunun 0,6 katı (OBP katkısı) eklenir.</p>
<p>Netlerinizi tek tek görmek için <a href="${NET}">net hesaplama</a> aracını, puanınızın hangi bölümlere yaklaştığını görmek için <a href="/yks-bolumleri">YKS bölümleri</a> sayfasını kullanabilirsiniz.</p>`,
        faq: [
          ['Hesaplanan YKS puanı kesin midir?', 'Hayır, bilgi amaçlıdır. Resmi puan o yıl sınava girenlerin sonuçlarına göre hesaplanır ve her yıl değişir.'],
          ['Katsayılar nereden alındı?', 'MEB OGM Materyal YKS puan hesaplama motorundan alınmıştır.'],
          ['Diploma notu puanı nasıl etkiler?', 'Diploma notu 0,6 ile çarpılarak yerleştirme puanına eklenir. Örneğin 85 diploma notu 51 puan katkı sağlar.'],
          ['TYT neti olmadan AYT puanı hesaplanır mı?', 'SAY, EA, SÖZ ve DİL puanının bir kısmı TYT netlerinden gelir. Türkçe ya da Temel Matematikten en az 0,5 net yoksa TYT puanı hesaplanmaz ve alan puanı 100 kabul edilir.'],
        ],
      },
    ]
    for (const page of pages) {
      const trail = [['Ana sayfa', '/'], ['Kaynaklar', '/kaynaklar'], [page.name, page.path]]
      const [first, ...rest] = page.name.split(' ')
      const info = `<div class="infos">${page.info.map(([badge, hue, title, text]) => `<div class="rc"><span class="ic ic-md" style="color:${hueColor(hue)};background:${hueColor(hue)}1f">${badge}</span><b>${title}</b><small>${text}</small></div>`).join('')}</div>`
      const body = `<main>${hero({ crumbs: trail, pill: page.pill, title: `${first} ${rest.slice(0, -1).join(' ')} <mark>${rest.at(-1)}</mark>`, lead: page.lead, aside: info })}
<div class="wide page">
${page.body(page.notice)}
<noscript><p class="box">Hesaplama için JavaScript gerekir.</p></noscript>
<div class="sec with-rail"><article>
${page.article}
</article>
<section class="rc faq"><h2 style="margin:0 0 .5rem">Sık sorulanlar</h2>${page.faq.map(([q, a]) => `<details><summary>${escapeHtml(q)}${icon('ChevronDown')}</summary><p>${escapeHtml(a)}</p></details>`).join('')}</section></div>
${cta}
</div></main>
<script>${scoreScript(formulas)}</script>`
      write(`${page.path.slice(1)}.html`, wrap({
        title: page.title,
        description: page.description,
        path: page.path,
        body,
        ld: [
          { '@context': 'https://schema.org', '@type': 'WebApplication', name: page.name, applicationCategory: 'EducationalApplication', operatingSystem: 'Web', inLanguage: 'tr', isAccessibleForFree: true, url: `${site}${page.path}` },
          { '@context': 'https://schema.org', '@type': 'FAQPage', mainEntity: page.faq.map(([q, a]) => ({ '@type': 'Question', name: q, acceptedAnswer: { '@type': 'Answer', text: a } })) },
          crumbLd(trail),
        ],
      }).replace('</head>', `${scoreCss}\n</head>`))
      urls.push({ path: page.path })
    }
  }

  // Çalışma programları
  const programs = starters.map((t) => ({ ...t, slug: slug(t.name), weeks: Math.max(...t.items.map((i) => i.week)) + 1 }))
  const groupOrder = ['LGS', 'TYT', 'AYT', 'YKS', 'YDT', 'Genel']
  for (const t of programs) {
    const path = `${PROGRAMS}/${t.slug}`
    const trail = [['Ana sayfa', '/'], ['Kaynaklar', '/kaynaklar'], ['Çalışma programları', PROGRAMS], [t.name, path]]
    const questions = t.items.reduce((n, i) => n + (i.target_questions ?? 0), 0)
    const weekHtml = Array.from({ length: t.weeks }, (_, w) => {
      const days = weekdays
        .map((day, d) => {
          const list = t.items.filter((i) => i.week === w && i.weekday === d)
          if (!list.length) return ''
          return `<div class="day"><h3>${day}</h3><ul>${list
            .map((i) => {
              const meta = [kindLabel[i.kind], subjectName.get(i.subject_id), i.target_questions && `${i.target_questions} soru`, i.target_minutes && `${i.target_minutes} dk`].filter(Boolean).join(' · ')
              return `<li><b>${escapeHtml(i.title)}</b><span>${escapeHtml(meta)}</span></li>`
            })
            .join('')}</ul></div>`
        })
        .join('')
      return `<section class="sec">${secHead('', t.weeks > 1 ? `${w + 1}. hafta` : 'Haftalık program')}<div class="days">${days}</div></section>`
    }).join('')
    const [gi, gh] = groupLook[t.group] ?? groupLook.Genel
    const body = `<main>${hero({
      crumbs: trail,
      pill: `${icon(gi)}${t.group}`,
      title: escapeHtml(t.name),
      lead: `${escapeHtml(t.description)}.`,
      stats: [[t.weeks, 'hafta'], [t.items.length, 'görev'], ...(questions ? [[fmtNum(questions), 'soru hedefi']] : [])],
      tint: hueColor(gh),
    })}
<div class="wide page">${weekHtml}
${cta}</div></main>`
    write(`${path.slice(1)}.html`, wrap({
      title: `${t.name}, ücretsiz çalışma programı · İzlek`,
      description: cut(`${t.name}: ${t.description}. ${t.weeks} haftalık, ${t.items.length} görevlik program, gün gün ders ve görev listesiyle.`, 158),
      path,
      body,
      ld: [
        { '@context': 'https://schema.org', '@type': 'Article', headline: t.name, description: t.description, inLanguage: 'tr', mainEntityOfPage: `${site}${path}`, author: { '@type': 'Organization', name: 'İzlek' }, publisher: { '@type': 'Organization', name: 'İzlek' }, isAccessibleForFree: true },
        crumbLd(trail),
      ],
    }))
    urls.push({ path })
  }

  {
    const trail = [['Ana sayfa', '/'], ['Kaynaklar', '/kaynaklar'], ['Çalışma programları', PROGRAMS]]
    const groups = groupOrder.filter((g) => programs.some((p) => p.group === g))
    const body = `<main>${hero({
      crumbs: trail,
      title: 'Çalışma <mark>programları</mark>',
      lead: 'LGS, TYT, AYT ve YDT için hazır haftalık programlar. Her programda gün gün ders, görev, soru ve süre hedefleri yer alır.',
      stats: [[programs.length, 'program'], [groups.length, 'grup']],
    })}
<div class="wide page">${groups
      .map((g) => {
        const [gi, gh] = groupLook[g] ?? groupLook.Genel
        return `<section class="sec">${secHead('', `${chip(gi, hueColor(gh), 'sm')} ${g}`)}<div class="grid">${programs
          .filter((p) => p.group === g)
          .map((p) => `<a class="rc" href="${PROGRAMS}/${p.slug}"><h3 style="margin:0">${escapeHtml(p.name)}</h3><p>${escapeHtml(p.description)}</p><div class="chips" style="margin-top:.75rem"><span class="tag">${icon('CalendarDays')}${p.weeks} hafta</span><span class="tag">${icon('ListChecks')}${p.items.length} görev</span></div></a>`)
          .join('')}</div></section>`
      })
      .join('')}
${cta}</div></main>`
    write(`${PROGRAMS.slice(1)}.html`, wrap({
      title: 'LGS, TYT, AYT, YDT çalışma programları · İzlek',
      description: `LGS, TYT, AYT ve YDT için ${programs.length} hazır haftalık çalışma programı. Gün gün ders, soru ve süre hedefleri, ücretsiz.`,
      path: PROGRAMS,
      body,
      ld: [{ '@context': 'https://schema.org', '@type': 'CollectionPage', name: 'Çalışma programları', inLanguage: 'tr' }, crumbLd(trail)],
    }))
    urls.push({ path: PROGRAMS })
  }

  return { urls, plans: programs.length }
}

// Kaynaklar: herkese açık içerik ve araçların tek sayfadaki listesi
export function buildResourcesPage({ write, shell, cssHref, site, examLinks = [], subjects = [], stats = {} }) {
  const path = '/kaynaklar'
  const trail = [['Ana sayfa', '/'], ['Kaynaklar', path]]
  const meta = { '/konu-anlatimi': 'LGS, TYT, AYT, YDT', '/araclar/lgs-puan-hesaplama': 'Bilgi amaçlı', '/araclar/yks-puan-hesaplama': 'OGM katsayıları', '/araclar/net-hesaplama': 'LGS, TYT, AYT, YDT', '/calisma-programlari': 'Gün gün', '/yks-bolumleri': 'YÖK Atlas verisi', '/blog': 'Yazılar' }
  const [lessons, ...tools] = resources
  const shown = new Set()
  const chips = subjects.filter((x) => (shown.has(x.color) ? false : shown.add(x.color))).slice(0, 8).map((x) => subjectChip(x, 'sm')).join('')
  const body = `<main>${hero({
    crumbs: trail,
    title: 'Ücretsiz <mark>kaynaklar</mark>',
    lead: 'Konu anlatımları, çalışma programları ve hesaplama araçları. Hepsi üye olmadan kullanılır.',
    stats: [
      ...(stats.lessons ? [[fmtNum(stats.lessons), 'konu anlatımı']] : []),
      ...(stats.questions ? [[fmtNum(stats.questions), 'çözümlü soru']] : []),
      ...(stats.programs ? [[fmtNum(stats.programs), 'üniversite programı']] : []),
      ...(stats.plans ? [[stats.plans, 'çalışma programı']] : []),
    ],
  })}
<div class="wide page"><div class="grid two">
<a class="rc" href="${lessons.href}" style="padding:1.5rem"><div class="top">${chip(lessons.icon, hueColor(lessons.hue), 'lg')}<span class="tag">${meta[lessons.href]}</span></div><h2>${lessons.title}</h2><p>${stats.lessons ? `${fmtNum(stats.lessons)} konu, örnek ve çözümlü soru` : 'Örnekli anlatım ve çözümlü soru'}</p><div class="chips" style="gap:.35rem">${chips}</div><span class="more">Açın${icon('ArrowRight')}</span></a>
<a class="rc" href="/giris" style="padding:1.5rem"><div class="top">${chip('ListChecks', hueColor('sea'), 'lg')}<span class="tag">${icon('Lock')}Hesapla çözülür</span></div><h2>Konu testleri ve denemeler</h2><p>Uygulamada konu testleri ve branş denemeleri çözülür, yanlışlar deftere eklenir. Öğretmeninizden aldığınız davet koduyla katılabilirsiniz.</p><span class="more">Giriş yapın${icon('ArrowRight')}</span></a>
</div>
<div class="grid sec" style="margin-top:.9rem">${tools
    .map((r) => `<a class="rc" href="${r.href}">${chip(r.icon, hueColor(r.hue))}<h3>${r.title}</h3><p>${r.text}</p><p style="font-size:.8rem;margin-top:.6rem">${meta[r.href] ?? ''}</p></a>`)
    .join('')}</div>
${ctaBand}</div></main>`
  const html = layout({
    shell,
    cssHref,
    site,
    examLinks,
    title: 'Ücretsiz LGS ve YKS kaynakları · İzlek',
    description: 'LGS, TYT, AYT ve YDT konu anlatımları, net ve puan hesaplama, hazır çalışma programları ve YKS bölümleri. Ücretsiz, reklamsız, üyeliksiz.',
    path,
    body,
    ld: [
      { '@context': 'https://schema.org', '@type': 'CollectionPage', name: 'Ücretsiz kaynaklar', inLanguage: 'tr', hasPart: resources.map((r) => ({ '@type': 'WebPage', name: r.title, url: `${site}${r.href}` })) },
      { '@context': 'https://schema.org', '@type': 'BreadcrumbList', itemListElement: trail.map(([n, p], i) => ({ '@type': 'ListItem', position: i + 1, name: n, item: `${site}${p}` })) },
    ],
  })
  write('kaynaklar.html', html)
  return { urls: [{ path }] }
}
