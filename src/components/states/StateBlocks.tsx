import { Link } from 'react-router-dom'

import { Button } from '../ui/button'

type EmptyStateProps = {
  title: string
  description?: string
  actionLabel?: string
  actionTo?: string
}

type ErrorStateProps = {
  title?: string
  description: string
  retryLabel?: string
  onRetry?: () => void
}

export function EmptyState({ title, description, actionLabel, actionTo }: EmptyStateProps) {
  return (
    <div className="state-block empty-state" role="status">
      <strong>{title}</strong>
      {description && <p>{description}</p>}
      {actionLabel && actionTo && (
        <Button asChild variant="outline">
          <Link to={actionTo}>{actionLabel}</Link>
        </Button>
      )}
    </div>
  )
}

export function LoadingState({ title = '加载中...' }: { title?: string }) {
  return (
    <div className="state-block loading-state" role="status">
      <span className="loading-dot" />
      <strong>{title}</strong>
    </div>
  )
}

export function ErrorState({ title = '加载失败', description, retryLabel, onRetry }: ErrorStateProps) {
  return (
    <div className="state-block error-state" role="alert">
      <strong>{title}</strong>
      <p>{description}</p>
      {retryLabel && onRetry && (
        <Button type="button" variant="outline" onClick={onRetry}>
          {retryLabel}
        </Button>
      )}
    </div>
  )
}

export function ForbiddenState() {
  return (
    <div className="state-block error-state" role="alert">
      <strong>没有访问权限</strong>
      <p>当前账号无权访问该内容。</p>
      <Button asChild variant="outline">
        <Link to="/tasks">返回任务页</Link>
      </Button>
    </div>
  )
}
