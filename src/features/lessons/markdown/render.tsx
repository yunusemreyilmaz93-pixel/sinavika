import { isValidElement, memo, type ReactNode } from 'react'
import ReactMarkdown, { type Components } from 'react-markdown'
import { Link } from 'react-router'
import rehypeKatex from 'rehype-katex'
import remarkGfm from 'remark-gfm'
import remarkMath from 'remark-math'
import 'katex/dist/katex.min.css'
import { parseYouTubeId } from '@/features/video/youtube'
import { CauseEffect, Connect, Ek, Figure, Formula, Hit, LifeTimeline, Question, SelfCheck, SentenceLab, Tip, Video, YearScale } from '../blocks'
import { listItems, parseBlocks, parseEras, parseLabSentence, parseQuestion, plainText, slug, splitPipes, type Block } from './parse'

type HastNode = { type: string; tagName?: string; value?: string; properties?: Record<string, unknown>; children?: HastNode[] }

function hastText(node: HastNode): string {
  if (node.type === 'text') return node.value ?? ''
  return (node.children ?? []).map(hastText).join('')
}

function columnLabel(header = '') {
  return !header || /[?!.:]$/.test(header) ? header : `${header}:`
}

function labelTables() {
  const walk = (node: HastNode) => {
    if (node.type === 'element' && node.tagName === 'table') {
      const headers: string[] = []
      const collect = (n: HastNode) => {
        if (n.type === 'element' && n.tagName === 'th') headers.push(hastText(n).trim())
        n.children?.forEach(collect)
      }
      collect(node)
      node.properties = { ...node.properties, dataCols: String(headers.length) }
      const label = (n: HastNode) => {
        if (n.type === 'element' && n.tagName === 'tr') {
          let i = 0
          for (const cell of n.children ?? []) {
            if (cell.type === 'element' && cell.tagName === 'td') {
              cell.properties = { ...cell.properties, dataLabel: columnLabel(headers[i]) }
              i++
            }
          }
        }
        n.children?.forEach(label)
      }
      label(node)
    }
    node.children?.forEach(walk)
  }
  return (tree: HastNode) => walk(tree)
}

function nodeText(node: ReactNode): string {
  if (typeof node === 'string' || typeof node === 'number') return String(node)
  if (Array.isArray(node)) return node.map(nodeText).join('')
  if (isValidElement<{ children?: ReactNode }>(node)) return nodeText(node.props.children)
  return ''
}

const baseComponents: Components = {
  h2: ({ children }) => {
    const text = nodeText(children)
    const m = /^(\d+)\.\s+(.*)$/.exec(text)
    return (
      <h2 id={slug(plainText(text)) || 'bolum'} className="mt-14 scroll-mt-24 flex items-baseline gap-3 text-xl font-extrabold first:mt-0 sm:text-2xl">
        {m ? (
          <>
            <span className="font-display text-primary tabular">{m[1]}.</span>
            {m[2]}
          </>
        ) : (
          children
        )}
      </h2>
    )
  },
  h3: ({ children }) => <h3 className="mt-8 text-lg font-bold">{children}</h3>,
  p: ({ node, children }) => {
    const only = (node as HastNode | undefined)?.children?.filter((c) => !(c.type === 'text' && !(c.value ?? '').trim()))
    if (only?.length === 1 && only[0].type === 'element' && only[0].tagName === 'img') return <>{children}</>
    return <p>{children}</p>
  },
  ul: ({ children }) => <ul className="list-disc space-y-1.5 pl-5 marker:text-primary">{children}</ul>,
  ol: ({ children }) => <ol className="list-decimal space-y-1.5 pl-5 marker:font-semibold marker:text-primary">{children}</ol>,
  blockquote: ({ children }) => (
    <blockquote className="space-y-2 border-l-4 border-line-strong pl-4 text-[15px] leading-relaxed text-fg/90 italic">{children}</blockquote>
  ),
  hr: () => <hr className="my-8 border-line" />,
  a: ({ href = '', children }) => {
    if (href === '#altcizgi') return <Hit>{children}</Hit>
    if (href === '#ek') return <Ek>{children}</Ek>
    if (href.startsWith('/')) {
      return (
        <Link to={href} className="font-semibold text-accent hover:underline">
          {children}
        </Link>
      )
    }
    return (
      <a href={href} target="_blank" rel="noreferrer" className="font-semibold text-accent hover:underline">
        {children}
      </a>
    )
  },
  img: ({ src, alt, title }) => {
    const [caption, credit] = (title ?? '').split('|').map((p) => p.trim())
    return <Figure src={String(src ?? '')} alt={alt ?? ''} caption={caption || alt || ''} credit={credit ?? ''} />
  },
  table: ({ node, children }) => (
    <div className="lesson-table-wrap overflow-hidden rounded-2xl border border-line">
      <table className="lesson-table" data-cols={(node?.properties as Record<string, unknown> | undefined)?.dataCols as string | undefined}>
        {children}
      </table>
    </div>
  ),
  td: ({ node, children }) => <td data-label={(node?.properties as Record<string, unknown> | undefined)?.dataLabel as string | undefined}>{children}</td>,
}

const inlineComponents: Components = { ...baseComponents, p: ({ children }) => <>{children}</> }

export const Md = memo(function Md({ text, inline }: { text: string; inline?: boolean }) {
  return (
    <ReactMarkdown
      remarkPlugins={[remarkGfm, remarkMath]}
      rehypePlugins={[labelTables, rehypeKatex]}
      components={inline ? inlineComponents : baseComponents}
      urlTransform={(url) => url}
    >
      {text}
    </ReactMarkdown>
  )
})

const formulaTones = { yesil: 'primary', mavi: 'accent', sari: 'warning' } as const

function BlockView({ block, questionNumber }: { block: Block; questionNumber: number }) {
  if (block.type === 'md') return <Md text={block.text} />

  if (block.type === 'leaf') {
    if (block.name === 'video') {
      const id = block.attrs.id || parseYouTubeId(block.attrs.url ?? '') || ''
      if (!id) return null
      return <Video id={id} title={block.attrs.baslik || 'Video'} channel={block.attrs.kanal || ''} label={block.attrs.etiket || 'Video'} />
    }
    return null
  }

  const { name, attrs, text } = block
  switch (name) {
    case 'ipucu':
      return (
        <Tip title={attrs.baslik}>
          <Md text={text} />
        </Tip>
      )
    case 'baglanti':
      return (
        <Connect>
          <Md text={text} />
        </Connect>
      )
    case 'hedefler':
      return (
        <ol className="grid gap-2 sm:grid-cols-2">
          {listItems(text).map((goal, i) => (
            <li key={i} className="flex gap-3 rounded-2xl border border-line bg-surface p-4">
              <span className="grid size-7 shrink-0 place-items-center rounded-lg bg-primary-soft font-display text-sm font-bold text-primary-soft-fg">{i + 1}</span>
              <span className="text-[15px] leading-relaxed">
                <Md text={goal} inline />
              </span>
            </li>
          ))}
        </ol>
      )
    case 'neden-sonuc':
      return (
        <CauseEffect
          items={listItems(text).map((line) => {
            const [cause, ...rest] = line.split('=>')
            return { cause: plainText(cause), effect: <Md text={rest.join('=>').trim()} inline /> }
          })}
        />
      )
    case 'cizelge':
      return (
        <YearScale
          title={attrs.baslik || ''}
          events={listItems(text).map((l) => {
            const [year, label] = splitPipes(l)
            return { year: Number(year), label: label ?? '' }
          })}
        />
      )
    case 'zaman':
      return (
        <LifeTimeline
          title={attrs.baslik || 'Zaman çizelgesi'}
          eras={parseEras(attrs.donemler)}
          events={listItems(text).map((l) => {
            const [year, label, detail] = splitPipes(l)
            return { year: Number(year), label: label ?? '', detail: detail || undefined }
          })}
        />
      )
    case 'formul':
      return (
        <Formula
          items={listItems(text).map((l) => {
            const [root, suffix, result, kind, tone] = splitPipes(l)
            return { root, suffix, result, kind: kind ?? '', tone: formulaTones[tone as keyof typeof formulaTones] ?? 'primary' }
          })}
        />
      )
    case 'cumle-lab':
      return <SentenceLab sentences={text.split('\n').filter((l) => l.trim()).map(parseLabSentence)} />
    case 'soru': {
      const q = parseQuestion(text)
      const answer = Math.max('ABCDE'.indexOf((attrs.cevap || 'A').trim().toUpperCase()), 0)
      return (
        <Question
          number={questionNumber}
          passage={q.passage ? <Md text={q.passage} inline /> : undefined}
          stem={<Md text={q.stem} inline />}
          options={q.options.map((o, i) => (
            <Md key={i} text={o} inline />
          ))}
          answer={answer}
          solution={<Md text={q.solution} />}
        />
      )
    }
    case 'dene':
      return (
        <SelfCheck
          items={listItems(text).map((line) => {
            const [question, ...rest] = line.split('=>')
            return { question: <Md text={question.trim()} inline />, answer: <Md text={rest.join('=>').trim()} inline /> }
          })}
        />
      )
    default:
      return <Md text={text} />
  }
}

export function LessonBody({ source }: { source: string }) {
  let questions = 0
  const blocks = parseBlocks(source)
  return (
    <div className="space-y-4 text-[16px] leading-relaxed text-fg/90 [&_strong]:font-semibold [&_strong]:text-fg">
      {blocks.map((block, i) => {
        if (block.type === 'box' && block.name === 'soru') questions++
        return <BlockView key={i} block={block} questionNumber={questions} />
      })}
    </div>
  )
}

