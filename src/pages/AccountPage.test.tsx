import { screen } from '@testing-library/react'
import { beforeEach, describe, expect, it, vi } from 'vitest'

import { getCurrentUser } from '../lib/api'
import { renderWithProviders } from '../test/test-utils'
import { AccountPage } from './AccountPage'

vi.mock('../lib/api', async () => {
  const actual = await vi.importActual<typeof import('../lib/api')>('../lib/api')
  return {
    ...actual,
    getCurrentUser: vi.fn(),
  }
})

describe('AccountPage', () => {
  beforeEach(() => {
    window.localStorage.setItem('video_web_access_token', 'unit-test-token')
    vi.clearAllMocks()
  })

  it('展示当前用户资料与额度信息', async () => {
    vi.mocked(getCurrentUser).mockResolvedValueOnce({
      id: 1,
      email: 'demo@example.com',
      github_id: '10001',
      avatar_url: 'https://cdn.example.com/avatar.png',
      display_name: 'Demo User',
      is_active: true,
      is_admin: false,
      daily_task_quota: 20,
      concurrent_task_quota: 3,
      max_file_size_bytes: 2 * 1024 * 1024 * 1024,
      storage_quota_bytes: 50 * 1024 * 1024 * 1024,
      file_retention_hours: 72,
      created_at: '2026-01-01T00:00:00Z',
    })

    renderWithProviders(<AccountPage />)

    expect(await screen.findByText('Demo User')).toBeInTheDocument()
    expect(screen.getByText('demo@example.com')).toBeInTheDocument()
    expect(screen.getByText('每日任务额度')).toBeInTheDocument()
    expect(screen.getByText('20 次')).toBeInTheDocument()
    expect(screen.getByText('并发额度')).toBeInTheDocument()
    expect(screen.getByText('3 个任务')).toBeInTheDocument()
    expect(screen.getByText('最大文件大小')).toBeInTheDocument()
    expect(screen.getByText('2 GB')).toBeInTheDocument()
    expect(screen.getByText('存储额度')).toBeInTheDocument()
    expect(screen.getByText('50 GB')).toBeInTheDocument()
    expect(screen.getByText('文件保留时间')).toBeInTheDocument()
    expect(screen.getByText('72 小时')).toBeInTheDocument()
  })
})
