import { closestCenter, DndContext, KeyboardSensor, PointerSensor, useSensor, useSensors, type DragEndEvent } from '@dnd-kit/core'
import { SortableContext, sortableKeyboardCoordinates, verticalListSortingStrategy } from '@dnd-kit/sortable'
import { Plus } from 'lucide-react'
import { toast } from 'sonner'
import { Button } from '@/components/ui/button'
import { BlockCard } from './block-card'
import { questionNumberBefore } from './model'
import type { BlockEditor } from './use-block-editor'

type Props = {
  editor: BlockEditor
  optionCount: number
  onInsert: (afterId: string | null) => void
  onSlash: (blockId: string) => void
  onFiles: (files: File[], afterId: string | null) => void
}

export function BlockList({ editor, optionCount, onInsert, onSlash, onFiles }: Props) {
  const sensors = useSensors(useSensor(PointerSensor, { activationConstraint: { distance: 6 } }), useSensor(KeyboardSensor, { coordinateGetter: sortableKeyboardCoordinates }))
  const { blocks } = editor

  const onDragEnd = ({ active, over }: DragEndEvent) => {
    if (over) editor.reorder(String(active.id), String(over.id))
  }

  const remove = (id: string) => {
    editor.remove(id)
    toast('Blok silindi', { action: { label: 'Geri al', onClick: editor.undo } })
  }

  return (
    <div>
      {blocks.length > 0 && (
        <DndContext sensors={sensors} collisionDetection={closestCenter} onDragEnd={onDragEnd}>
          <SortableContext items={blocks.map((b) => b.id)} strategy={verticalListSortingStrategy}>
            <ol className="space-y-1">
              {blocks.map((block, index) => (
                <BlockCard
                  key={block.id}
                  block={block}
                  index={index}
                  total={blocks.length}
                  offset={questionNumberBefore(blocks, index)}
                  optionCount={optionCount}
                  editor={editor}
                  onInsert={onInsert}
                  onSlash={onSlash}
                  onFiles={onFiles}
                  onRemove={remove}
                />
              ))}
            </ol>
          </SortableContext>
        </DndContext>
      )}
      <div className="mt-4 flex flex-col items-center gap-2 rounded-2xl border border-dashed border-line-strong p-5 text-center">
        {blocks.length === 0 && <p className="text-[15px] text-muted">Anlatım boş. İlk bloğu ekleyerek başla.</p>}
        <Button type="button" variant="secondary" className="min-h-11" onClick={() => onInsert(null)}>
          <Plus />
          Blok ekle
        </Button>
      </div>
    </div>
  )
}
