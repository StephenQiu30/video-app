import { Link, useSearchParams } from 'react-router-dom'
import { useMemo } from 'react'
import { useQuery } from '@tanstack/react-query'

import { listTasks, type TaskRead } from '../lib/api'
import { useAuth } from '../contexts/auth'
import { PageContainer } from '../components/layout/PageContainer'
import { EmptyState, ErrorState, LoadingState } from '../components/states/StateBlocks'
import { TaskList } from '../components/tasks/TaskList'
import { Button } from '../components/ui/button'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '../components/ui/card'

const FILTERS = [
  { key: 'ALL', label: '全部' },
  { key: 'RUNNING', label: '进行中' },
  { key: 'SUCCEEDED', label: '已完成' },
  { key: 'FAILED', label: '失败' },
] as const

type TaskFilter = (typeof FILTERS)[number]['key']

function matchesFilter(task: TaskRead, filter: TaskFilter) {
  if (filter === 'ALL') return true
  if (filter === 'RUNNING') return ['PENDING', 'QUEUED', 'STARTING', 'DOWNLOADING', 'MERGING', 'PROCESSING'].includes(task.state)
  return task.state === filter
}

function filterFromSearch(searchParams: URLSearchParams): TaskFilter {
  const state = searchParams.get('state')
  if (state === 'SUCCEEDED') return 'SUCCEEDED'
  if (state === 'FAILED') return 'FAILED'
  if (state === 'RUNNING') return 'RUNNING'
  return 'ALL'
}

export function WorkbenchPage() {
  const { token } = useAuth()
  const [searchParams, setSearchParams] = useSearchParams()
  const filter = filterFromSearch(searchParams)
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

  const onFilterChange = (next: TaskFilter) => {
    if (next === 'ALL') {
      setSearchParams({})
      return
    }
    setSearchParams({ state: next })
  }

  const visibleTasks = useMemo(() => tasks.filter((task) => matchesFilter(task, filter)), [filter, tasks])
  const isReportFilter = filter === 'SUCCEEDED'

  return (
    <PageContainer
      title="下载任务"
      description="查看解析后的下载队列、任务状态与报告出口。"
      actions={
        <Button asChild variant="outline">
          <Link to="/">新建解析</Link>
        </Button>
      }
    >
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
                aria-pressed={filter === item.key}
                variant={filter === item.key ? 'default' : 'outline'}
                onClick={() => onFilterChange(item.key)}
              >
                {item.label}
              </Button>
            ))}
          </div>

          {isLoading && <LoadingState title="任务加载中" />}

          {!isLoading && isError && <ErrorState description={(error as Error).message} />}

          {!isLoading && tasks.length === 0 && !isError && !isReportFilter && (
            <EmptyState title="暂无任务，返回首页粘贴链接创建任务" actionLabel="返回解析页" actionTo="/" />
          )}

          {!isLoading && !isError && isReportFilter && visibleTasks.length === 0 && (
            <EmptyState title="暂无可导出的报告" description="已完成任务会在这里导出 PDF 报告。" actionLabel="返回解析页" actionTo="/" />
          )}

          <TaskList tasks={visibleTasks} />
        </CardContent>
      </Card>
    </PageContainer>
  )
}
