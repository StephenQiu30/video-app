import { screen } from '@testing-library/react'
import { beforeEach, describe, expect, it, vi } from 'vitest'

import { renderWithProviders } from './test/test-utils'
import App from './App'

vi.mock('./lib/api', async () => {
  const actual = await vi.importActual<typeof import('./lib/api')>('./lib/api')
  return {
    ...actual,
    listTasks: vi.fn().mockResolvedValue([]),
  }
})

describe('路由鉴权', () => {
  beforeEach(() => {
    window.localStorage.clear()
    window.sessionStorage.clear()
  })

  it('未登录访问工作台会重定向到登录页', async () => {
    renderWithProviders(<App />, { initialEntries: ['/workbench'] })

    expect(await screen.findByRole('heading', { name: '登录' })).toBeInTheDocument()
  })

  it('授权页访问时会展示回跳按钮', async () => {
    renderWithProviders(<App />, { initialEntries: ['/auth'] })

    expect(await screen.findByRole('link', { name: 'GitHub 登录' })).toBeInTheDocument()
  })

  it('未登录访问任务详情页会跳转到登录页', async () => {
    renderWithProviders(<App />, { initialEntries: ['/tasks/abc'] })

    expect(await screen.findByRole('heading', { name: '登录' })).toBeInTheDocument()
  })

  it('登录回跳后存在 pending URL 时返回首页并恢复输入', async () => {
    window.sessionStorage.setItem('video_web_pending_url', 'https://v.douyin.com/pending')

    renderWithProviders(<App />, { initialEntries: ['/auth?token=unit-token'] })

    expect(await screen.findByRole('heading', { name: '万能视频解析下载器' })).toBeInTheDocument()
    expect(screen.getByLabelText('视频链接')).toHaveValue('https://v.douyin.com/pending')
  })
})
