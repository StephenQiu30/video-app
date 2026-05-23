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

  it('顶部布局提供解析、任务、报告、账号入口', async () => {
    renderWithProviders(<App />)

    expect(await screen.findByRole('banner', { name: '应用顶部栏' })).toBeInTheDocument()
    expect(screen.getByRole('navigation', { name: '主导航' })).toBeInTheDocument()
    expect(screen.getByRole('link', { name: '解析' })).toHaveAttribute('href', '/')
    expect(screen.getByRole('link', { name: '任务' })).toHaveAttribute('href', '/tasks')
    expect(screen.getByRole('link', { name: '报告' })).toHaveAttribute('href', '/tasks?state=SUCCEEDED')
    expect(screen.getByRole('link', { name: '账号' })).toHaveAttribute('href', '/account')
  })

  it('未登录访问任务页会重定向到登录页', async () => {
    renderWithProviders(<App />, { initialEntries: ['/tasks'] })

    expect(await screen.findByRole('heading', { name: '登录' })).toBeInTheDocument()
  })

  it('旧工作台地址在登录后兼容跳转到任务页', async () => {
    window.localStorage.setItem('video_web_access_token', 'unit-token')

    renderWithProviders(<App />, { initialEntries: ['/workbench'] })

    expect(await screen.findByRole('heading', { name: '下载任务' })).toBeInTheDocument()
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

  it('登录回跳没有 pending URL 时进入任务页', async () => {
    renderWithProviders(<App />, { initialEntries: ['/auth?token=unit-token'] })

    expect(await screen.findByRole('heading', { name: '下载任务' })).toBeInTheDocument()
  })

  it('未知路由展示 404 页面并提供返回入口', async () => {
    renderWithProviders(<App />, { initialEntries: ['/missing-page'] })

    expect(await screen.findByRole('heading', { name: '页面不存在' })).toBeInTheDocument()
    expect(screen.getByRole('link', { name: '返回解析页' })).toHaveAttribute('href', '/')
    expect(screen.getByRole('link', { name: '查看任务' })).toHaveAttribute('href', '/tasks')
  })
})
