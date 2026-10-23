import rehypeKatex from 'rehype-katex'
import rehypeStringify from 'rehype-stringify'
import remarkGfm from 'remark-gfm'
import remarkMath from 'remark-math'
import remarkParse from 'remark-parse'
import remarkRehype from 'remark-rehype'
import { unified } from 'unified'
import { slug } from './slugs.mjs'

const text = (node) => (node.type === 'text' ? node.value : (node.children ?? []).map(text).join(''))
const element = (tagName, properties, children) => ({ type: 'element', tagName, properties, children })

// Uygulamadaki Markdown dilinin açık sayfa karşılığı: altçizgi, ek bilgi, görsel altyazısı, tablo kaydırma, güvenli bağlantılar
function tidy({ topicUrl, seen }) {
  const walk = (node) => {
    if (!node.children) return node
    node.children = node.children.flatMap((child) => {
      if (child.type !== 'element') return [child]
      walk(child)
      const { tagName, properties = {} } = child
      if (tagName === 'h2') {
        const base = slug(text(child)) || 'bolum'
        const n = seen.get(base) ?? 0
        seen.set(base, n + 1)
        child.properties = { ...properties, id: n ? `${base}-${n + 1}` : base }
      }
      if (tagName === 'a') {
        const href = String(properties.href ?? '')
        if (href === '#altcizgi') return [element('mark', {}, child.children)]
        if (href === '#ek') return [element('span', { className: ['ek'] }, child.children)]
        const lesson = /^\/app\/konular\/(\d+)/.exec(href)
        if (lesson) {
          const url = topicUrl(Number(lesson[1]))
          return url ? [element('a', { href: url }, child.children)] : child.children
        }
        if (href.startsWith('/konu-anlatimi')) return [child]
        if (href.startsWith('/')) return child.children
        if (/^https?:\/\//.test(href)) child.properties = { href, rel: 'noopener', target: '_blank' }
        else if (!href.startsWith('#')) return child.children
      }
      if (tagName === 'img') {
        child.properties = { ...properties, loading: 'lazy', decoding: 'async' }
      }
      if (tagName === 'p') {
        const kids = child.children.filter((c) => !(c.type === 'text' && !c.value.trim()))
        if (kids.length === 1 && kids[0].type === 'element' && kids[0].tagName === 'img') {
          const img = kids[0]
          const [caption, credit] = String(img.properties.title ?? '').split('|').map((p) => p.trim())
          const label = caption || String(img.properties.alt ?? '')
          const { title: _title, ...rest } = img.properties
          const note = [label, credit].filter(Boolean).join(' · ')
          return [
            element('figure', {}, [
              element('img', rest, []),
              ...(note ? [element('figcaption', {}, [{ type: 'text', value: note }])] : []),
            ]),
          ]
        }
      }
      if (tagName === 'table') return [element('div', { className: ['tw'] }, [child])]
      return [child]
    })
    return node
  }
  return () => (tree) => walk(tree)
}

export function createMarkdown({ topicUrl }) {
  const seen = new Map()
  const processor = unified()
    .use(remarkParse)
    .use(remarkGfm)
    .use(remarkMath)
    .use(remarkRehype)
    .use(rehypeKatex, { output: 'mathml', throwOnError: false, strict: false })
    .use(tidy({ topicUrl, seen }))
    .use(rehypeStringify)
  const run = (source) => String(processor.processSync(source))
  return {
    block: run,
    inline: (source) => run(source).trim().replace(/^<p>([\s\S]*)<\/p>$/, '$1'),
  }
}
