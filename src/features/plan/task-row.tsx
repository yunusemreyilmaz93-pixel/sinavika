import { CalendarArrowUp, EllipsisVertical, GraduationCap, Pencil, StickyNote, Trash2, UserRound } from 'lucide-react'
import { motion } from 'motion/react'
import type { DraggableSyntheticListeners } from '@dnd-kit/core'
import type { Ref } from 'react'
import { Badge } from '@/components/ui/badge'
import { Menu, MenuContent, MenuItem, MenuSeparator, MenuTrigger } from '@/components/ui/menu'
import { cn } from '@/lib/cn'
import { subjectColor, type Subject } from '@/lib/exam'
import { VideoChip } from '@/features/video/video-player'
import { isTeacherTask, kindLabel, targetsText, type PlanViewer, type Task, type TaskPermissions } from './lib'

export function TaskCheck({
  done,
  interactive,
  onToggle,
  label,
  size = 'md',
}: {
  done: boolean
  interactive: boolean
  onToggle?: () => void
  label: string
  size?: 'sm' | 'md'
}) {
  const box = (
    <motion.span
      aria-hidden
      initial={false}
      animate={done ? { scale: [1, 0.86, 1] } : { scale: 1 }}
      transition={{ duration: 0.22 }}
      className={cn(
        'grid place-items-center rounded-lg border-2 transition-colors duration-200',
        size === 'sm' ? 'size-5 rounded-md' : 'size-6',
        done ? 'border-primary bg-primary text-primary-fg' : 'border-line-strong bg-surface',
        interactive && !done && 'group-hover/check:border-primary',
      )}
    >
      <svg viewBox="0 0 24 24" className={size === 'sm' ? 'size-3.5' : 'size-4'} fill="none">
        <motion.path
          d="M5 12.5l4.5 4.5L19 7.5"
          stroke="currentColor"
          strokeWidth={3.2}
          strokeLinecap="round"
          strokeLinejoin="round"
          initial={false}
          animate={{ pathLength: done ? 1 : 0, opacity: done ? 1 : 0 }}
          transition={{ duration: done ? 0.28 : 0.15, ease: 'easeOut' }}
        />
      </svg>
    </motion.span>
  )
  const area = size === 'sm' ? 'size-8 -m-1.5' : 'size-11 -m-2.5'
  if (!interactive) {
    return (
      <span role="img" aria-label={done ? `${label}, tamamlandı` : `${label}, tamamlanmadı`} className={cn('grid shrink-0 place-items-center', area)}>
        {box}
      </span>
    )
  }
  return (
    <button
      type="button"
      role="checkbox"
      aria-checked={done}
      aria-label={label}
      onClick={onToggle}
      className={cn('group/check grid shrink-0 cursor-pointer place-items-center rounded-xl active:scale-95', area)}
    >
      {box}
    </button>
  )
}

type RowProps = {
  task: Task
  subject?: Subject
  viewer: PlanViewer
  permissions: TaskPermissions
  onToggle: (done: boolean) => void
  onEdit: () => void
  onMove: () => void
  onDelete: () => void
  dueLabel?: string
  compact?: boolean
  dragging?: boolean
  rootRef?: Ref<HTMLDivElement>
  dragProps?: DraggableSyntheticListeners
  className?: string
}

export function TaskRow({
  task,
  subject,
  viewer,
  permissions,
  onToggle,
  onEdit,
  onMove,
  onDelete,
  dueLabel,
  compact,
  dragging,
  rootRef,
  dragProps,
  className,
}: RowProps) {
  const done = Boolean(task.done_at)
  const targets = targetsText(task)
  const teacherTask = isTeacherTask(task)
  const badge =
    viewer === 'teacher' ? (!teacherTask ? 'Öğrenci' : null) : teacherTask ? 'Öğretmen' : null
  const menu = permissions.canEdit || permissions.canMove

  return (
    <div
      ref={rootRef}
      {...dragProps}
      className={cn(
        'group relative flex items-start',
        compact ? 'gap-2 rounded-xl border border-line bg-surface p-2 shadow-card' : 'gap-3 px-4 py-3',
        dragProps && 'cursor-grab',
        dragging && 'opacity-40',
        className,
      )}
    >
      <div className={compact ? 'pt-0.5' : 'pt-px'}>
        <TaskCheck
          done={done}
          interactive={permissions.canToggle}
          onToggle={() => onToggle(!done)}
          label={task.title}
          size={compact ? 'sm' : 'md'}
        />
      </div>
      <motion.div
        initial={false}
        animate={{ opacity: done ? 0.55 : 1 }}
        transition={{ duration: 0.25 }}
        className="min-w-0 flex-1"
      >
        <button
          type="button"
          disabled={!permissions.canEdit}
          onClick={onEdit}
          className={cn(
            'block w-full text-left font-semibold break-words text-fg disabled:cursor-default',
            compact ? 'line-clamp-3 text-[13px] leading-snug hyphens-auto' : 'text-[15px] leading-snug',
            done && 'text-muted line-through decoration-muted/70 decoration-2',
          )}
        >
          {task.title}
        </button>
        <div
          className={cn(
            'flex flex-wrap items-center gap-x-2 gap-y-1 text-muted',
            compact ? 'mt-1 pr-5 text-xs' : 'mt-1 text-[13px]',
          )}
        >
          {subject ? (
            <span className="inline-flex min-w-0 items-center gap-1.5 font-medium">
              <span className="size-2 shrink-0 rounded-full" style={{ backgroundColor: subjectColor(subject) }} aria-hidden />
              <span className="truncate">{subject.short}</span>
            </span>
          ) : (
            !targets.length && <span>{kindLabel[task.kind]}</span>
          )}
          {targets.map((t) => (
            <span key={t} className="tabular whitespace-nowrap">
              {t}
            </span>
          ))}
          {task.note && compact && <StickyNote className="size-3.5" role="img" aria-label="Not var" />}
          {badge && compact && (badge === 'Öğretmen' ? (
            <GraduationCap className="size-3.5 text-primary" role="img" aria-label="Öğretmenin verdiği görev" />
          ) : (
            <UserRound className="size-3.5 text-accent" role="img" aria-label="Öğrencinin eklediği görev" />
          ))}
          {dueLabel && <span className="font-semibold text-warning">{dueLabel}</span>}
          {badge && !compact && (
            <Badge tone={badge === 'Öğretmen' ? 'primary' : 'accent'} className="px-1.5 text-[11px]">
              {badge}
            </Badge>
          )}
        </div>
        {task.note && !compact && <p className="mt-1.5 line-clamp-2 text-[13px] leading-relaxed text-muted">{task.note}</p>}
        {task.video_id && <VideoChip task={task} tracking={viewer === 'student'} compact={compact} />}
      </motion.div>
      {menu && (
        <Menu modal={false}>
          <MenuTrigger asChild>
            <button
              type="button"
              aria-label={`${task.title} için seçenekler`}
              className={cn(
                'grid shrink-0 place-items-center rounded-lg text-muted hover:bg-surface-2 hover:text-fg data-[state=open]:bg-surface-2',
                compact
                  ? 'absolute right-1 bottom-1 size-7 opacity-0 group-hover:opacity-100 focus-visible:opacity-100 data-[state=open]:opacity-100 [@media(hover:none)]:opacity-100'
                  : '-my-1.5 -mr-2 size-11',
              )}
            >
              <EllipsisVertical className="size-4" />
            </button>
          </MenuTrigger>
          <MenuContent>
            {permissions.canEdit && (
              <MenuItem onSelect={onEdit}>
                <Pencil />
                Düzenle
              </MenuItem>
            )}
            {permissions.canMove && (
              <MenuItem onSelect={onMove}>
                <CalendarArrowUp />
                Taşı
              </MenuItem>
            )}
            {permissions.canEdit && (
              <>
                <MenuSeparator />
                <MenuItem tone="danger" onSelect={onDelete}>
                  <Trash2 />
                  Sil
                </MenuItem>
              </>
            )}
          </MenuContent>
        </Menu>
      )}
    </div>
  )
}
