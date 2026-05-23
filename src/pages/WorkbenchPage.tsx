import { Link } from 'react-router-dom'
import { useMemo } from 'react'
import { useQuery } from '@tanstack/react-query'

import { listTasks, type TaskRead } from '../lib/api'
import { useAuth } from '../contexts/auth'
import { Badge } from '../components/ui/badge'
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

function stateBadge(state: string) {
  return <Badge className={`state-${STATE_TAG[state] ?? 'pending'}`}>{state}</Badge>
}

function formatDate(value: string) {
  const date = new Date(value)
  if (Number.isNaN(date.getTime())) return value
  return date.toLocaleString()
}

export function WorkbenchPage() {
  const { token } = useAuth()
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

  return (
    <section className="page">
      <Card>
        <CardHeader>
          <CardTitle>下载工作台</CardTitle>
          <CardDescription>展示任务列表与实时状态</CardDescription>
        </CardHeader>
        <CardContent>
          <div className="workbench-meta">
            <span>总任务：{summary.total}</span>
            <span>进行中：{summary.running}</span>
            <span>成功：{summary.done}</span>
            <span>失败：{summary.failed}</span>
          </div>

          {isLoading && <p>任务加载中...</p>}

          {!isLoading && isError && <p className="error-text">{(error as Error).message}</p>}

          {!isLoading && tasks.length === 0 && !isError && (
            <p className="empty-state">暂无任务，返回首页粘贴链接创建任务</p>
          )}

          <div className="task-list">
            {tasks.map((task: TaskRead) => (
              <Link to={`/tasks/${task.id}`} key={task.id} className="task-card-link">
                <article className="task-card">
                  <div className="task-title-row">
                    <h4>{task.title || task.source_url}</h4>
                    {stateBadge(task.state)}
                  </div>
                  <p className="task-meta">格式：{task.format_label || task.format_id || '默认'}</p>
                  <Progress value={task.progress} />
                  <p className="task-meta">更新时间：{formatDate(task.updated_at)}</p>
                </article>
              </Link>
            ))}
          </div>
        </CardContent>
      </Card>
    </section>
  )
}
