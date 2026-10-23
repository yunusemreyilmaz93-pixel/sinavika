import { join } from 'node:path'
import { escapeHtml } from '../html.mjs'
import { loadTs } from '../ts-load.mjs'
import { layout } from './layout.mjs'
import { slug } from './slugs.mjs'

const kindLabel = { study: 'Konu çalışma', questions: 'Soru çözme', reading: 'Okuma', video: 'Video', review: 'Tekrar', other: 'Diğer' }
const weekdays = ['Pazartesi', 'Salı', 'Çarşamba', 'Perşembe', 'Cuma', 'Cumartesi', 'Pazar']
const PROGRAMS = '/calisma-programlari'
const NET = '/araclar/net-hesaplama'

// Dersler ve soru sayıları sınav yönetmeliğine göredir. YKS netinde yanlış 4'te 1, LGS'de 3'te 1 götürür
export const exams = [
  {
    key: 'lgs',
    name: 'LGS',
    divisor: 3,
    sections: [['Türkçe', 20], ['Matematik', 20], ['Fen Bilimleri', 20], ['T.C. İnkılap Tarihi ve Atatürkçülük', 10], ['Din Kültürü ve Ahlak Bilgisi', 10], ['Yabancı Dil', 10]],
  },
  {
    key: 'tyt',
    name: 'TYT',
    divisor: 4,
    sections: [['Türkçe', 40], ['Sosyal Bilimler', 20], ['Temel Matematik', 40], ['Fen Bilimleri', 20]],
  },
  {
    key: 'ayt',
    name: 'AYT',
    divisor: 4,
    sections: [['Matematik', 40], ['Fen Bilimleri', 40], ['Türk Dili ve Edebiyatı, Sosyal Bilimler-1', 40], ['Sosyal Bilimler-2', 40]],
  },
  { key: 'ydt', name: 'YDT', divisor: 4, sections: [['Yabancı Dil', 80]] },
]

export const calcScript = (data) => `(function(){var D=${JSON.stringify(data).replace(/</g, '\\u003c')};var root=document.getElementById('calc');if(!root)return;var sel=root.querySelector('[data-exam]');var body=root.querySelector('[data-body]');var out=root.querySelector('[data-total]');var note=root.querySelector('[data-note]');
function fmt(n){return (Math.round(n*100)/100).toString().replace('.',',')}
function draw(){var e=D[sel.value];body.innerHTML='';e.sections.forEach(function(s,i){var row=document.createElement('div');row.className='calc-row';row.innerHTML='<div class="calc-name"><b></b><span></span></div><label>Doğru<input inputmode="numeric" pattern="[0-9]*" maxlength="3" data-k="d" data-i="'+i+'" autocomplete="off"></label><label>Yanlış<input inputmode="numeric" pattern="[0-9]*" maxlength="3" data-k="y" data-i="'+i+'" autocomplete="off"></label><output data-net="'+i+'">0</output>';row.querySelector('b').textContent=s[0];row.querySelector('span').textContent=s[1]+' soru';body.appendChild(row)});calc()}
function calc(){var e=D[sel.value];var total=0,bad=false;e.sections.forEach(function(s,i){var d=parseInt(body.querySelector('[data-k=d][data-i="'+i+'"]').value,10)||0;var y=parseInt(body.querySelector('[data-k=y][data-i="'+i+'"]').value,10)||0;var over=d+y>s[1];if(over)bad=true;var net=d-y/e.divisor;if(!over)total+=net;var o=body.querySelector('[data-net="'+i+'"]');o.textContent=over?'-':fmt(net);o.classList.toggle('bad',over)});out.textContent=fmt(total);note.textContent=bad?'Doğru ve yanlış toplamı soru sayısını aşmamalı':'Net = Doğru - Yanlış / '+e.divisor}
sel.addEventListener('change',draw);root.addEventListener('input',function(ev){var t=ev.target;if(t.tagName==='INPUT'){t.value=t.value.replace(/[^0-9]/g,'');calc()}});draw()})()`

const toolCss = `<style>
.pub .calc{margin-top:1.5rem;padding:1rem;border:1px solid var(--line);border-radius:1rem;background:var(--surface)}
.pub .calc select{width:100%;min-height:2.75rem;padding:0 .75rem;border:1px solid var(--line-strong);border-radius:.75rem;background:var(--bg);color:var(--fg);font:inherit}
.pub .calc-row{display:grid;grid-template-columns:minmax(0,1fr) 4.5rem 4.5rem 3.5rem;gap:.5rem;align-items:end;padding:.75rem 0;border-bottom:1px solid var(--line)}
.pub .calc-name b{display:block;font-size:.95rem;line-height:1.3}
.pub .calc-name span{color:var(--fg-muted);font-size:.85rem}
.pub .calc label{display:grid;gap:.2rem;font-size:.8rem;color:var(--fg-muted);font-weight:600}
.pub .calc input{width:100%;min-height:2.75rem;padding:0 .5rem;border:1px solid var(--line-strong);border-radius:.6rem;background:var(--bg);color:var(--fg);font:inherit;text-align:center}
.pub .calc output{min-height:2.75rem;display:grid;place-items:center;font-weight:800}
.pub .calc output.bad{color:var(--danger)}
@media(max-width:30rem){.pub .calc-row{grid-template-columns:1fr 1fr 3.25rem}.pub .calc-name{grid-column:1/-1}}
.pub .calc-total{display:flex;justify-content:space-between;align-items:baseline;gap:1rem;padding-top:1rem}
.pub .calc-total strong{font-family:'Bricolage Grotesque Variable',sans-serif;font-size:2rem}
.pub .calc-note{margin:.25rem 0 0;color:var(--fg-muted);font-size:.9rem}
.pub .week{margin-top:2rem}
.pub .week h2{font-size:1.35rem}
.pub .day{margin-top:1rem}
.pub .day h3{font-size:1rem;color:var(--fg-muted)}
.pub .day ul{list-style:none;margin:.4rem 0 0;padding:0;border:1px solid var(--line);border-radius:.9rem;background:var(--surface)}
.pub .day li{padding:.6rem .9rem;border-bottom:1px solid var(--line)}
.pub .day li:last-child{border-bottom:0}
.pub .day li b{display:block}
.pub .day li span{color:var(--fg-muted);font-size:.9rem}
.pub .chips{display:flex;gap:.4rem;flex-wrap:wrap;margin-top:.75rem}
.pub .chip{padding:.2rem .65rem;border:1px solid var(--line);border-radius:999px;background:var(--surface);font-size:.85rem;font-weight:600;color:var(--fg-muted)}
</style>`

const cut = (text, max) => (text.length <= max ? text : `${text.slice(0, max - 3).replace(/\s+\S*$/, '')}...`)

export async function buildPublicTools({ write, shell, cssHref, site, subjects = [], examLinks = [] }) {
  const starters = (await loadTs(join(process.cwd(), 'src/features/templates/starters.ts'))).starterTemplates
  const subjectName = new Map(subjects.map((s) => [s.id, s.name]))
  const urls = []
  const wrap = (opts) => {
    const html = layout({ shell, cssHref, site, examLinks, ...opts })
    return html.replace('</head>', `${toolCss}\n</head>`)
  }
  const crumbHtml = (items) =>
    `<nav class="crumbs" aria-label="Sayfa yolu">${items
      .map(([name, path], i) => (i < items.length - 1 ? `<a href="${path}">${escapeHtml(name)}</a><span>/</span>` : escapeHtml(name)))
      .join('')}</nav>`
  const crumbLd = (items) => ({
    '@context': 'https://schema.org',
    '@type': 'BreadcrumbList',
    itemListElement: items.map(([name, path], i) => ({ '@type': 'ListItem', position: i + 1, name, item: `${site}${path}` })),
  })
  const cta = `<aside class="cta"><h2>Programı öğrencinize tek tıkla uygulayın</h2><p>Yolumnet'te öğretmen şablonu seçer, öğrencilere haftalara dağıtır ve tamamlanma durumunu izler. Uygulama ücretsizdir ve reklam içermez.</p><div class="row"><a class="btn" href="/ogretmen-basvurusu">Öğretmen başvurusu</a><a class="btn" href="/katil">Davet koduyla katıl</a></div></aside>`

  // Net hesaplama
  {
    const data = Object.fromEntries(exams.map((e) => [e.key, { divisor: e.divisor, sections: e.sections }]))
    const trail = [['Ana sayfa', '/'], ['Net hesaplama', NET]]
    const faq = [
      ['LGS netinde yanlışlar nasıl hesaplanır?', 'LGS\'de 3 yanlış 1 doğruyu götürür. Net = Doğru - Yanlış / 3 formülüyle hesaplanır.'],
      ['TYT ve AYT netinde yanlışlar nasıl hesaplanır?', 'YKS\'de 4 yanlış 1 doğruyu götürür. Net = Doğru - Yanlış / 4 formülüyle hesaplanır.'],
      ['Bu araç puan hesaplar mı?', 'Hayır. Araç yalnızca netinizi hesaplar. Puan, her yıl sınavın genel sonuçlarına göre değiştiği için önceden hesaplanamaz.'],
    ]
    const table = `<div class="tw"><table><thead><tr><th>Sınav</th><th>Bölüm</th><th>Soru</th></tr></thead><tbody>${exams
      .flatMap((e) => e.sections.map(([name, count]) => `<tr><td>${e.name}</td><td>${escapeHtml(name)}</td><td>${count}</td></tr>`))
      .join('')}</tbody></table></div>`
    const body = `<main><div class="wrap">${crumbHtml(trail)}
<h1>LGS, TYT, AYT ve YDT net hesaplama</h1>
<p class="lead">Doğru ve yanlış sayılarını girin, bölüm bölüm ve toplam netiniz anında görünsün. Kayıt ya da üyelik gerekmez.</p>
<section class="calc" id="calc" aria-label="Net hesaplama aracı"><label class="muted" for="calc-exam">Sınav</label><select id="calc-exam" data-exam>${exams.map((e) => `<option value="${e.key}">${e.name}</option>`).join('')}</select><div data-body></div><div class="calc-total"><span>Toplam net</span><strong data-total>0</strong></div><p class="calc-note" data-note></p></section>
<noscript><p class="box">Hesaplama için JavaScript gerekir. Formül LGS'de Doğru - Yanlış / 3, YKS'de Doğru - Yanlış / 4 şeklindedir.</p></noscript>
<article>
<h2>Net nasıl hesaplanır?</h2>
<p>Net, doğru sayısından yanlış sayısının belirli bir oranının çıkarılmasıyla bulunur. Boş bırakılan sorular neti etkilemez.</p>
<ul><li>LGS: Net = Doğru - Yanlış / 3</li><li>TYT, AYT ve YDT: Net = Doğru - Yanlış / 4</li></ul>
<p>Örneğin TYT Matematik'te 28 doğru ve 8 yanlış yapan bir öğrencinin neti 28 - 8 / 4 = 26 olur.</p>
<h2>Sınavlardaki soru sayıları</h2>
${table}
<h2>Sık sorulanlar</h2>
${faq.map(([q, a]) => `<h3>${escapeHtml(q)}</h3><p>${escapeHtml(a)}</p>`).join('')}
</article>
<aside class="cta"><h2>Netlerinizi zamanla izleyin</h2><p>Yolumnet'te denemelerinizi ekleyerek ders ve konu bazında net gelişiminizi görebilirsiniz. Öğretmeniniz bu verilere bakarak çalışma planınızı günceller.</p><div class="row"><a class="btn" href="/katil">Davet koduyla katıl</a><a class="btn" href="/ogretmen-basvurusu">Öğretmen başvurusu</a></div></aside>
</div></main>
<script>${calcScript(data)}</script>`
    write(`${NET.slice(1)}.html`, wrap({
      title: 'LGS, TYT, AYT, YDT net hesaplama · Yolumnet',
      description: 'LGS, TYT, AYT ve YDT için doğru ve yanlış sayısından net hesaplayın. LGS\'de yanlış 3\'te 1, YKS\'de 4\'te 1 oranında doğruyu götürür.',
      path: NET,
      body,
      ld: [
        { '@context': 'https://schema.org', '@type': 'WebApplication', name: 'Net hesaplama', applicationCategory: 'EducationalApplication', operatingSystem: 'Any', inLanguage: 'tr', offers: { '@type': 'Offer', price: '0', priceCurrency: 'TRY' }, url: `${site}${NET}` },
        { '@context': 'https://schema.org', '@type': 'FAQPage', mainEntity: faq.map(([q, a]) => ({ '@type': 'Question', name: q, acceptedAnswer: { '@type': 'Answer', text: a } })) },
        crumbLd(trail),
      ],
    }))
    urls.push({ path: NET })
  }

  // Çalışma programları
  const programs = starters.map((t) => ({ ...t, slug: slug(t.name), weeks: Math.max(...t.items.map((i) => i.week)) + 1 }))
  const groupOrder = ['LGS', 'TYT', 'AYT', 'YKS', 'YDT', 'Genel']
  for (const t of programs) {
    const path = `${PROGRAMS}/${t.slug}`
    const trail = [['Ana sayfa', '/'], ['Çalışma programları', PROGRAMS], [t.name, path]]
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
      return `<section class="week"><h2>${t.weeks > 1 ? `${w + 1}. hafta` : 'Haftalık program'}</h2>${days}</section>`
    }).join('')
    const body = `<main><div class="wrap">${crumbHtml(trail)}
<p class="kicker">${t.group}</p>
<h1>${escapeHtml(t.name)}</h1>
<p class="lead">${escapeHtml(t.description)}.</p>
<div class="chips"><span class="chip">${t.weeks} hafta</span><span class="chip">${t.items.length} görev</span>${questions ? `<span class="chip">${questions} soru</span>` : ''}</div>
${weekHtml}
${cta}</div></main>`
    write(`${path.slice(1)}.html`, wrap({
      title: `${t.name}, ücretsiz çalışma programı · Yolumnet`,
      description: cut(`${t.name}: ${t.description}. ${t.weeks} haftalık, ${t.items.length} görevlik program, gün gün ders ve görev listesiyle.`, 158),
      path,
      body,
      ld: [
        { '@context': 'https://schema.org', '@type': 'Article', headline: t.name, description: t.description, inLanguage: 'tr', mainEntityOfPage: `${site}${path}`, author: { '@type': 'Organization', name: 'Yolumnet editör ekibi' }, publisher: { '@type': 'Organization', name: 'Yolumnet' }, isAccessibleForFree: true },
        crumbLd(trail),
      ],
    }))
    urls.push({ path })
  }

  {
    const trail = [['Ana sayfa', '/'], ['Çalışma programları', PROGRAMS]]
    const groups = groupOrder.filter((g) => programs.some((p) => p.group === g))
    const body = `<main><div class="wrap">${crumbHtml(trail)}
<h1>Çalışma programları</h1>
<p class="lead">LGS, TYT, AYT ve YDT için hazır haftalık programlar. Her programda gün gün ders, görev, soru ve süre hedefleri yer alır.</p>
${groups.map((g) => `<section class="section"><h2>${g}</h2><div class="cards">${programs.filter((p) => p.group === g).map((p) => `<a class="card" href="${PROGRAMS}/${p.slug}"><h3>${escapeHtml(p.name)}</h3><p>${escapeHtml(p.description)}</p><p>${p.weeks} hafta · ${p.items.length} görev</p></a>`).join('')}</div></section>`).join('')}
${cta}</div></main>`
    write(`${PROGRAMS.slice(1)}.html`, wrap({
      title: 'LGS, TYT, AYT, YDT çalışma programları · Yolumnet',
      description: `LGS, TYT, AYT ve YDT için ${programs.length} hazır haftalık çalışma programı. Gün gün ders, soru ve süre hedefleri, ücretsiz.`,
      path: PROGRAMS,
      body,
      ld: [{ '@context': 'https://schema.org', '@type': 'CollectionPage', name: 'Çalışma programları', inLanguage: 'tr' }, crumbLd(trail)],
    }))
    urls.push({ path: PROGRAMS })
  }

  return { urls }
}
