import { Link } from 'react-router-dom'

import type { TaskRead } from '../../lib/api'
import { Badge } from '../ui/badge'
import { Progress } from '../ui/progress'

type TaskListProps = {
  tasks: TaskRead[]
}

const STATE_TAG: Record<string, string> = {
  PENDING: 'pending',
  QUEUED: 'pending',
  DOWNLOADING: 'running',
  SUCCEEDED: 'done',
  FAILED: 'failed',
  CANCELED: 'canceled',
}

function stateBadge(state: string) {
  return <Badge className={`state-${STATE_TAG[state] ?? 'pending'}`}>{state}</Badge>
}

function formatDate(value: string) {
  const date = new Date(value)
  if (Number.isNaN(date.getTime())) return value
  return date.toLocaleString()
}

function formatDuration(seconds?: number | null) {
  if (!seconds) return '未知'
  const minutes = Math.floor(seconds / 60)
  const rest = seconds % 60
  return `${String(minutes).padStart(2, '0')}:${String(rest).padStart(2, '0')}`
}

function aiStatusLabel(status?: string | null) {
  if (status === 'SUCCEEDED') return '已生成'
  if (status === 'FAILED') return '失败'
  if (status === 'PENDING') return '等待处理'
  if (status === 'PROCESSING') return '生成中'
  return '未开始'
}

function taskTitle(task: TaskRead) {
  return task.title || task.source_url
}

export function TaskMobileCard({ task }: { task: TaskRead }) {
  const title = taskTitle(task)

  return (
    <article className="task-card task-mobile-card">
      {task.cover_url && <img className="task-thumb" src={task.cover_url} alt={title} />}
      <div className="task-title-row">
        <h4>{title}</h4>
        {stateBadge(task.state)}
      </div>
      <div className="task-fields">
        <p className="task-meta">格式：{task.format_label || task.format_id || '默认'}</p>
        <p className="task-meta">时长：{formatDuration(task.duration_seconds)}</p>
        <p className="task-meta">AI：{aiStatusLabel(task.ai_status)}</p>
        <p className="task-meta">报告：{task.state === 'SUCCEEDED' ? '可导出' : '待完成'}</p>
        <p className="task-meta">更新时间：{formatDate(task.updated_at)}</p>
      </div>
      <Progress value={task.progress} />
      <span className="task-detail-text">详情</span>
    </article>
  )
}

export function TaskList({ tasks }: TaskListProps) {
  return (
    <div className="task-list">
      {tasks.map((task) => (
        <Link
          to={`/tasks/${task.id}`}
          key={task.id}
          className="task-card-link"
          aria-label={`查看详情：${taskTitle(task)}`}
        >
          <TaskMobileCard task={task} />
        </Link>
      ))}
    </div>
  )
}
