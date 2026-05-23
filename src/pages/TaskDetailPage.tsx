import { useMemo, useState } from 'react'
import { useNavigate, useParams } from 'react-router-dom'
import { useMutation, useQuery } from '@tanstack/react-query'

import {
  cancelTask,
  getTask,
  getTaskEvents,
  getTaskDownloadLink,
  retryTask,
  type TaskEventRead,
} from '../lib/api'
import { useAuth } from '../contexts/auth'
import { Badge } from '../components/ui/badge'
import { Button } from '../components/ui/button'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '../components/ui/card'
import { Alert, AlertDescription, AlertTitle } from '../components/ui/alert'
import { Progress } from '../components/ui/progress'

function parseErrorMessage(error: unknown): string {
  if (error instanceof Error) return error.message
  return '请求失败，请重试'
}

function stateName(state: string) {
  return state.toUpperCase()
}

export function TaskDetailPage() {
  const navigate = useNavigate()
  const { taskId = '' } = useParams()
  const { token } = useAuth()
  const [errorText, setErrorText] = useState('')
  const [downloadUrl, setDownloadUrl] = useState('')

  const { data: task, isLoading, isError, error } = useQuery({
    queryKey: ['task', taskId, token],
    queryFn: () => getTask(token, taskId),
    enabled: Boolean(token && taskId),
    refetchInterval: 2000,
  })

  const { data: events = [] } = useQuery({
    queryKey: ['task-events', taskId, token],
    queryFn: () => getTaskEvents(token, taskId),
    enabled: Boolean(token && taskId),
    refetchInterval: 3000,
  })

  const cancelMut = useMutation({
    mutationFn: () => cancelTask(token, taskId),
    onSuccess: () => setErrorText(''),
    onError: (err) => setErrorText(parseErrorMessage(err)),
  })

  const retryMut = useMutation({
    mutationFn: () => retryTask(token, taskId),
    onSuccess: () => setErrorText(''),
    onError: (err) => setErrorText(parseErrorMessage(err)),
  })

  const downloadMut = useMutation({
    mutationFn: async () => {
      const result = await getTaskDownloadLink(token, taskId)
      setDownloadUrl(result.url)
      return result
    },
    onError: (err) => setErrorText(parseErrorMessage(err)),
  })

  const latestEvents = useMemo(() => {
    if (!events.length) return []
    return events.slice(0, 30)
  }, [events])

  if (isLoading) return <p className="page">任务加载中...</p>
  if (isError) return <p className="error-text">加载失败：{error ? parseErrorMessage(error) : '未知错误'}</p>
  if (!task) return null

  const canCancel = task.state === 'QUEUED' || task.state === 'STARTING' || task.state === 'DOWNLOADING'
  const canRetry = task.state === 'FAILED' || task.state === 'CANCELED'
  const canDownload = task.state === 'SUCCEEDED' && !downloadUrl

  return (
    <section className="page">
      <Card>
        <CardHeader>
          <CardTitle>{task.title || task.source_url}</CardTitle>
          <CardDescription>任务 ID：{task.id}</CardDescription>
        </CardHeader>
        <CardContent>
          <div className="task-meta-row">
            <Badge>{stateName(task.state)}</Badge>
            <p>进度：{task.progress}%</p>
            <Progress value={task.progress} />
          </div>
          <div className="task-actions">
            <Button type="button" onClick={() => navigate('/workbench')} variant="outline">
              返回工作台
            </Button>
            <Button type="button" onClick={() => cancelMut.mutate()} disabled={!canCancel || cancelMut.isPending}>
              {cancelMut.isPending ? '取消中...' : '取消'}
            </Button>
            <Button type="button" onClick={() => retryMut.mutate()} disabled={!canRetry || retryMut.isPending}>
              {retryMut.isPending ? '重试中...' : '重试'}
            </Button>
            <Button
              type="button"
              onClick={() => downloadMut.mutate()}
              disabled={!canDownload || downloadMut.isPending}
            >
              {downloadMut.isPending ? '获取链接...' : canDownload ? '获取下载链接' : '不可下载'}
            </Button>
          </div>
          {downloadUrl && (
            <a className="download-link" href={downloadUrl} target="_blank" rel="noreferrer">
              打开下载文件
            </a>
          )}
          {errorText && (
            <Alert>
              <AlertTitle>操作失败</AlertTitle>
              <AlertDescription>{errorText}</AlertDescription>
            </Alert>
          )}

          <h3 className="section-title">事件流</h3>
          <ul className="events">
            {latestEvents.map((item: TaskEventRead) => (
              <li key={item.id}>
                <strong>[{new Date(item.created_at).toLocaleTimeString()}]</strong>
                <span>{item.state}</span>
                <p>{item.message || '无内容'}</p>
              </li>
            ))}
          </ul>
        </CardContent>
      </Card>
    </section>
  )
}
