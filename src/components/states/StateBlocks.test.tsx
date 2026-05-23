import { render, screen } from '@testing-library/react'
import { MemoryRouter } from 'react-router-dom'
import { describe, expect, it, vi } from 'vitest'

import { EmptyState, ErrorState, ForbiddenState, LoadingState } from './StateBlocks'

describe('StateBlocks', () => {
  it('渲染统一空态和操作入口', () => {
    render(
      <MemoryRouter>
        <EmptyState title="暂无任务" description="返回解析页创建任务" actionLabel="返回解析页" actionTo="/" />
      </MemoryRouter>,
    )

    expect(screen.getByRole('status')).toHaveTextContent('暂无任务')
    expect(screen.getByRole('link', { name: '返回解析页' })).toHaveAttribute('href', '/')
  })

  it('渲染错误态并支持重试', async () => {
    const retry = vi.fn()
    render(<ErrorState title="加载失败" description="网络错误" retryLabel="重试" onRetry={retry} />)

    expect(screen.getByRole('alert')).toHaveTextContent('加载失败')
    screen.getByRole('button', { name: '重试' }).click()
    expect(retry).toHaveBeenCalledTimes(1)
  })

  it('渲染加载态和无权限态', () => {
    const { rerender } = render(<LoadingState title="任务加载中" />)
    expect(screen.getByRole('status')).toHaveTextContent('任务加载中')

    rerender(
      <MemoryRouter>
        <ForbiddenState />
      </MemoryRouter>,
    )
    expect(screen.getByRole('alert')).toHaveTextContent('没有访问权限')
    expect(screen.getByRole('link', { name: '返回任务页' })).toHaveAttribute('href', '/tasks')
  })
})
