import { cleanup, render, screen } from '@testing-library/react'
import userEvent from '@testing-library/user-event'
import { useState } from 'react'
import { afterEach, describe, expect, it } from 'vitest'
import { AffixForm, LifeTimelineForm, PairsForm, TimelineForm } from './forms'
import type { EditorBlock } from './model'

type Box = Extract<EditorBlock, { kind: 'box' }>

function Harness({ name, Form }: { name: string; Form: (p: { block: Box; onPatch: (c: { text?: string; attrs?: Record<string, string> }) => void }) => React.ReactNode }) {
  const [block, setBlock] = useState<Box>({ id: 'x', kind: 'box', name, attrs: {}, text: '' })
  return (
    <>
      {Form({ block, onPatch: (c) => setBlock((b) => ({ ...b, ...(c.text !== undefined ? { text: c.text } : {}), ...(c.attrs ? { attrs: c.attrs } : {}) })) })}
      <pre data-testid="out">{`${JSON.stringify(block.attrs)}\n${block.text}`}</pre>
    </>
  )
}
const out = () => screen.getByTestId('out').textContent ?? ''

afterEach(cleanup)

describe('satır formları gerçek yazımla', () => {
  it('çizelge: sözcük aralarındaki ve sondaki boşluk korunur, Enter ilerler, yeni satır açar', async () => {
    const user = userEvent.setup()
    render(<Harness name="cizelge" Form={(p) => <TimelineForm {...p} />} />)
    await user.click(screen.getByLabelText('Yıl 1'))
    await user.keyboard('1839{Enter}Tanzimat Fermanı ilan edildi{Enter}1856{Enter}Islahat Fermanı')
    expect(out()).toContain('- 1839 | Tanzimat Fermanı ilan edildi\n- 1856 | Islahat Fermanı')
    expect(screen.getAllByLabelText(/^Yıl \d/)).toHaveLength(2)
  })

  it('çizelge: yıl alanına yalnızca rakam girilir', async () => {
    const user = userEvent.setup()
    render(<Harness name="cizelge" Form={(p) => <TimelineForm {...p} />} />)
    await user.type(screen.getByLabelText('Yıl 1'), '18a39x')
    expect((screen.getByLabelText('Yıl 1') as HTMLInputElement).value).toBe('1839')
  })

  it('kendini dene: soru ve cevap yazılır, satır sonu girilemez', async () => {
    const user = userEvent.setup()
    render(<Harness name="dene" Form={(p) => <PairsForm {...p} labels={['Soru', 'Cevap']} numbered />} />)
    await user.click(screen.getByLabelText('Soru 1'))
    await user.keyboard('Tanzimat ne zaman? {Enter}1839 yılında{Enter}Islahat?{Enter}1856')
    expect(out()).toContain('1. Tanzimat ne zaman? => 1839 yılında\n2. Islahat? => 1856')
  })

  it('hayat çizgisi: olaylar, ayrıntı ve dönem birlikte yazılır', async () => {
    const user = userEvent.setup()
    render(<Harness name="zaman" Form={(p) => <LifeTimelineForm {...p} />} />)
    await user.click(screen.getByLabelText('Yıl 1'))
    await user.keyboard("1881{Enter}Selanik'te doğdu{Enter}Ali Rıza Efendi'nin oğlu")
    await user.click(screen.getByRole('button', { name: 'Dönem ekle' }))
    await user.keyboard('Çocukluk{Enter}1881{Enter}1893')
    expect(out()).toContain("- 1881 | Selanik'te doğdu | Ali Rıza Efendi'nin oğlu")
    expect(out()).toContain('"donemler":"Çocukluk:1881-1893"')
  })

  it('ek formülü: beş alan ve renk yazılır', async () => {
    const user = userEvent.setup()
    render(<Harness name="formul" Form={(p) => <AffixForm {...p} />} />)
    await user.click(screen.getByLabelText('Kök 1'))
    await user.keyboard('koş{Enter}mak{Enter}koşmak{Enter}İsim-fiil')
    expect(out()).toContain('- koş | mak | koşmak | İsim-fiil | yesil')
  })
})
