import { escapeHtml } from '../html.mjs'

const letters = ['A', 'B', 'C', 'D', 'E']

// Her blok, JavaScript olmadan da çalışan anlamlı HTML üretir. Açılır cevaplar için yerel <details> kullanılır
export function renderBlocks(blocks, { md, parse }) {
  const { listItems, parseQuestion, parseEras, plainText, splitPipes, parseLabSentence } = parse
  let questions = 0
  const out = []

  for (const block of blocks) {
    if (block.type === 'md') {
      out.push(md.block(block.text))
      continue
    }

    if (block.type === 'leaf') {
      if (block.name === 'video') {
        const id = block.attrs.id || /(?:v=|youtu\.be\/|embed\/)([A-Za-z0-9_-]{11})/.exec(block.attrs.url ?? '')?.[1] || ''
        if (!/^[A-Za-z0-9_-]{11}$/.test(id)) continue
        const title = escapeHtml(block.attrs.baslik || 'Video')
        out.push(
          `<figure class="video"><div class="video-frame"><iframe src="https://www.youtube-nocookie.com/embed/${id}" title="${title}" loading="lazy" allow="encrypted-media; picture-in-picture" allowfullscreen referrerpolicy="strict-origin-when-cross-origin"></iframe></div><figcaption>${title}${block.attrs.kanal ? ` · ${escapeHtml(block.attrs.kanal)}` : ''}</figcaption></figure>`,
        )
      } else if (block.name === 'sim') {
        out.push(`<aside class="box sim"><strong>Etkileşimli simülasyon</strong><p>Bu bölümde değerleri değiştirerek deneyebileceğiniz bir simülasyon var. Uygulamada açılır.</p><p><a href="/giris">Giriş yapın</a></p></aside>`)
      }
      continue
    }

    const { name, attrs, text } = block
    switch (name) {
      case 'ipucu':
        out.push(`<aside class="box tip"><strong>${escapeHtml(attrs.baslik || 'İpucu')}</strong>${md.block(text)}</aside>`)
        break
      case 'baglanti':
        out.push(`<aside class="box link"><strong>Bağlantı</strong>${md.block(text)}</aside>`)
        break
      case 'hedefler':
        out.push(`<section class="goals"><h2 id="hedefler">Hedefler</h2><ol>${listItems(text).map((g) => `<li>${md.inline(g)}</li>`).join('')}</ol></section>`)
        break
      case 'neden-sonuc':
        out.push(
          `<ul class="cause">${listItems(text)
            .map((line) => {
              const [cause, ...rest] = line.split('=>')
              return `<li><span class="cause-a">${escapeHtml(plainText(cause))}</span><span class="cause-b">${md.inline(rest.join('=>').trim())}</span></li>`
            })
            .join('')}</ul>`,
        )
        break
      case 'cizelge':
      case 'zaman': {
        const rows = listItems(text)
          .map((l) => splitPipes(l))
          .filter(([year]) => Number.isFinite(Number(year)) && Number(year) > 0)
        const eras = name === 'zaman' ? parseEras(attrs.donemler) : []
        const title = attrs.baslik || (name === 'zaman' ? 'Zaman çizelgesi' : '')
        out.push(
          `<section class="timeline">${title ? `<h3>${escapeHtml(title)}</h3>` : ''}${eras.length ? `<p class="eras">${eras.map((e) => `${escapeHtml(e.label)} (${e.from}-${e.to})`).join(', ')}</p>` : ''}<ul>${rows
            .map(([year, label, detail]) => `<li><b>${escapeHtml(year)}</b> ${md.inline(label ?? '')}${detail ? `<br><span class="muted">${md.inline(detail)}</span>` : ''}</li>`)
            .join('')}</ul></section>`,
        )
        break
      }
      case 'formul':
        out.push(
          `<div class="tw"><table><thead><tr><th>Kök</th><th>Ek</th><th>Sonuç</th><th>Tür</th></tr></thead><tbody>${listItems(text)
            .map((l) => {
              const [root, suffix, result, kind] = splitPipes(l)
              return `<tr><td>${md.inline(root ?? '')}</td><td>${md.inline(suffix ?? '')}</td><td>${md.inline(result ?? '')}</td><td>${escapeHtml(kind ?? '')}</td></tr>`
            })
            .join('')}</tbody></table></div>`,
        )
        break
      case 'cumle-lab':
        out.push(
          `<ul class="lab">${text
            .split('\n')
            .filter((l) => l.trim())
            .map((l) => `<li>${parseLabSentence(l).map((t) => escapeHtml(t.text) + (t.note ? ` <span class="muted">(${escapeHtml(t.note)})</span>` : '')).join(' / ')}</li>`)
            .join('')}</ul>`,
        )
        break
      case 'soru': {
        questions++
        const q = parseQuestion(text)
        const answer = Math.max('ABCDE'.indexOf((attrs.cevap || 'A').trim().toUpperCase()), 0)
        out.push(
          `<section class="q"><p class="q-n">Soru ${questions}</p>${q.passage ? `<blockquote>${md.inline(q.passage)}</blockquote>` : ''}<p class="q-stem">${md.inline(q.stem)}</p><ol class="opts">${q.options
            .map((o, i) => `<li><span class="opt-l">${letters[i]}</span><span>${md.inline(o)}</span></li>`)
            .join('')}</ol><details><summary>Cevabı ve çözümü göster</summary><p><strong>Doğru cevap: ${letters[answer]}</strong></p>${md.block(q.solution)}</details></section>`,
        )
        break
      }
      case 'dene':
        out.push(
          `<section class="self"><h3>Kendini dene</h3>${listItems(text)
            .map((line) => {
              const [question, ...rest] = line.split('=>')
              return `<details><summary>${md.inline(question.trim())}</summary><p>${md.inline(rest.join('=>').trim())}</p></details>`
            })
            .join('')}</section>`,
        )
        break
      default:
        out.push(md.block(text))
    }
  }
  return out.join('\n')
}
