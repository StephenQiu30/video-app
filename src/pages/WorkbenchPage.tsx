import { Link } from 'react-router-dom'
import { useMemo, useState } from 'react'
import { useQuery } from '@tanstack/react-query'

import { listTasks, type TaskRead } from '../lib/api'
import { useAuth } from '../contexts/auth'
import { PageContainer } from '../components/layout/PageContainer'
import { Badge } from '../components/ui/badge'
import { Button } from '../components/ui/button'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '../components/ui/card'
import { Progress } from '../components/ui/progress'

const STATE_TAG: Record<string, string> = {
  PENDING: 'pending',
  QUEUED: 'pending',
  DOWNLOADING: 'running',
  SUCCEEDED: 'done',
  FAILED: 'failed',
  CANCELED: 'canceled',
}

const FILTERS = [
  { key: 'ALL', label: '全部' },
  { key: 'RUNNING', label: '进行中' },
  { key: 'SUCCEEDED', label: '已完成' },
  { key: 'FAILED', label: '失败' },
] as const

type TaskFilter = (typeof FILTERS)[number]['key']

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

function matchesFilter(task: TaskRead, filter: TaskFilter) {
  if (filter === 'ALL') return true
  if (filter === 'RUNNING') return ['PENDING', 'QUEUED', 'STARTING', 'DOWNLOADING', 'MERGING', 'PROCESSING'].includes(task.state)
  return task.state === filter
}

export function WorkbenchPage() {
  const { token } = useAuth()
  const [filter, setFilter] = useState<TaskFilter>('ALL')
  const { data: tasks = [], isLoading, isError, error } = useQuery({
    queryKey: ['tasks', token],
    queryFn: () => listTasks(token),
    enabled: Boolean(token),
    refetchInterval: 3000,
  })

  const summary = useMemo(() => {
    return {
      total: tasks.length,
      running: tasks.filter((item) => ['DOWNLOADING', 'MERGING', 'PROCESSING'].includes(item.state)).length,
      failed: tasks.filter((item) => item.state === 'FAILED').length,
      done: tasks.filter((item) => item.state === 'SUCCEEDED').length,
    }
  }, [tasks])

  const visibleTasks = useMemo(() => tasks.filter((task) => matchesFilter(task, filter)), [filter, tasks])

  return (
    <PageContainer title="下载任务" description="查看解析后的下载队列、任务状态与报告出口。">
      <Card>
        <CardHeader>
          <CardTitle>任务列表</CardTitle>
          <CardDescription>展示任务列表与实时状态</CardDescription>
        </CardHeader>
        <CardContent>
          <div className="workbench-meta">
            <span>总任务：{summary.total}</span>
            <span>进行中：{summary.running}</span>
            <span>成功：{summary.done}</span>
            <span>失败：{summary.failed}</span>
          </div>

          <div className="task-filters" aria-label="任务筛选">
            {FILTERS.map((item) => (
              <Button
                key={item.key}
                type="button"
                variant={filter === item.key ? 'default' : 'outline'}
                onClick={() => setFilter(item.key)}
              >
                {item.label}
              </Button>
            ))}
          </div>

          {isLoading && <p>任务加载中...</p>}

          {!isLoading && isError && <p className="error-text">{(error as Error).message}</p>}

          {!isLoading && tasks.length === 0 && !isError && (
            <p className="empty-state">暂无任务，返回首页粘贴链接创建任务</p>
          )}

          <div className="task-list">
            {visibleTasks.map((task: TaskRead) => (
              <Link to={`/tasks/${task.id}`} key={task.id} className="task-card-link">
                <article className="task-card">
                  {task.cover_url && <img className="task-thumb" src={task.cover_url} alt={task.title || task.source_url} />}
                  <div className="task-title-row">
                    <h4>{task.title || task.source_url}</h4>
                    {stateBadge(task.state)}
                  </div>
                  <p className="task-meta">格式：{task.format_label || task.format_id || '默认'}</p>
                  <p className="task-meta">时长：{formatDuration(task.duration_seconds)}</p>
                  <p className="task-meta">AI：{aiStatusLabel(task.ai_status)}</p>
                  <p className="task-meta">报告：{task.state === 'SUCCEEDED' ? '可导出' : '待完成'}</p>
                  <Progress value={task.progress} />
                  <p className="task-meta">更新时间：{formatDate(task.updated_at)}</p>
                </article>
              </Link>
            ))}
          </div>
        </CardContent>
      </Card>
    </PageContainer>
  )
}
