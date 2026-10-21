// pdf.js yalnızca bir PDF seçildiğinde yüklenir. Dosya tarayıcıdan çıkmaz
export async function pdfToText(file: File): Promise<string> {
  const [pdfjs, worker] = await Promise.all([
    import('pdfjs-dist/legacy/build/pdf.mjs'),
    import('pdfjs-dist/legacy/build/pdf.worker.min.mjs?url'),
  ])
  pdfjs.GlobalWorkerOptions.workerSrc = worker.default
  const doc = await pdfjs.getDocument({ data: await file.arrayBuffer() }).promise
  const lines: string[] = []
  for (let n = 1; n <= Math.min(doc.numPages, 6); n++) {
    const page = await (await doc.getPage(n)).getTextContent()
    const rows: { y: number; items: { x: number; text: string }[] }[] = []
    for (const item of page.items) {
      if (!('str' in item) || !item.str.trim()) continue
      const [, , , , x, y] = item.transform as number[]
      const row = rows.find((r) => Math.abs(r.y - y) < 3)
      if (row) row.items.push({ x, text: item.str })
      else rows.push({ y, items: [{ x, text: item.str }] })
    }
    rows.sort((a, b) => b.y - a.y)
    for (const row of rows)
      lines.push(
        row.items
          .sort((a, b) => a.x - b.x)
          .map((i) => i.text.trim())
          .join(' '),
      )
  }
  return lines.join('\n')
}
