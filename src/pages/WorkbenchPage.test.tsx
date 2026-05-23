import { describe, expect, it, vi } from 'vitest'
import { screen } from '@testing-library/react'
import userEvent from '@testing-library/user-event'
import { afterEach, beforeEach } from 'vitest'

import { listTasks } from '../lib/api'
import { WorkbenchPage } from './WorkbenchPage'
import { renderWithProviders } from '../test/test-utils'

vi.mock('../lib/api', async () => {
  const actual = await vi.importActual<typeof import('../lib/api')>('../lib/api')
  return {
    ...actual,
    listTasks: vi.fn(),
  }
})

describe('WorkbenchPage', () => {
  beforeEach(() => {
    window.localStorage.setItem('video_web_access_token', 'unit-test-token')
    vi.clearAllMocks()
  })

  afterEach(() => {
    window.localStorage.removeItem('video_web_access_token')
  })

  it('无任务时显示空态并引导回首页', async () => {
    vi.mocked(listTasks).mockResolvedValueOnce([])

    renderWithProviders(<WorkbenchPage />)

    expect(await screen.findByText('暂无任务，返回首页粘贴链接创建任务')).toBeInTheDocument()
  })

  it('汇总信息与状态标签正常展示', async () => {
    vi.mocked(listTasks).mockResolvedValueOnce([
      {
        id: 't-1',
        source_url: 'https://example.com/1',
        title: '视频一',
        state: 'QUEUED',
        progress: 0,
        format_id: '1080',
        format_label: '1080P MP4',
        failure_code: null,
        failure_reason: null,
        output_filename: null,
        object_size: null,
        expires_at: null,
        created_at: '2026-01-01T00:00:00Z',
        updated_at: '2026-01-01T00:00:00Z',
        attempt_no: 1,
        is_latest_attempt: true,
        retry_of_task_id: null,
        ai_summary: null,
        ai_status: null,
        ai_error: null,
      },
      {
        id: 't-2',
        source_url: 'https://example.com/2',
        title: null,
        state: 'DOWNLOADING',
        progress: 45,
        format_id: null,
        format_label: null,
        failure_code: null,
        failure_reason: null,
        output_filename: null,
        object_size: null,
        expires_at: null,
        created_at: '2026-01-01T00:00:00Z',
        updated_at: '2026-01-01T00:00:00Z',
        attempt_no: 1,
        is_latest_attempt: true,
        retry_of_task_id: null,
        ai_summary: null,
        ai_status: null,
        ai_error: null,
      },
      {
        id: 't-3',
        source_url: 'https://example.com/3',
        title: '失败视频',
        state: 'FAILED',
        progress: 1,
        format_id: null,
        format_label: null,
        failure_code: 'download_failed',
        failure_reason: '下载失败',
        output_filename: null,
        object_size: null,
        expires_at: null,
        created_at: '2026-01-01T00:00:00Z',
        updated_at: '2026-01-01T00:00:00Z',
        attempt_no: 1,
        is_latest_attempt: true,
        retry_of_task_id: null,
        ai_summary: null,
        ai_status: null,
        ai_error: null,
      },
      {
        id: 't-4',
        source_url: 'https://example.com/4',
        title: '成功视频',
        state: 'SUCCEEDED',
        progress: 100,
        format_id: null,
        format_label: null,
        failure_code: null,
        failure_reason: null,
        output_filename: null,
        object_size: null,
        expires_at: '2026-01-02T00:00:00Z',
        created_at: '2026-01-01T00:00:00Z',
        updated_at: '2026-01-01T00:00:00Z',
        attempt_no: 1,
        is_latest_attempt: true,
        retry_of_task_id: null,
        ai_summary: null,
        ai_status: null,
        ai_error: null,
      },
    ])

    renderWithProviders(<WorkbenchPage />)

    expect(await screen.findByText('总任务：4')).toBeInTheDocument()
    expect(await screen.findByText('进行中：1')).toBeInTheDocument()
    expect(await screen.findByText('失败：1')).toBeInTheDocument()
    expect(await screen.findByText('成功：1')).toBeInTheDocument()
    expect(await screen.findByText('失败视频')).toBeInTheDocument()
  })

  it('可按任务状态筛选并展示封面与能力状态', async () => {
    vi.mocked(listTasks).mockResolvedValueOnce([
      {
        id: 't-running',
        source_url: 'https://v.douyin.com/running',
        title: '正在下载的视频',
        cover_url: 'https://cdn.example.com/running.jpg',
        duration_seconds: 95,
        state: 'DOWNLOADING',
        progress: 42,
        format_id: '1080',
        format_label: '1080P MP4',
        failure_code: null,
        failure_reason: null,
        output_filename: null,
        object_size: null,
        expires_at: null,
        created_at: '2026-01-01T00:00:00Z',
        updated_at: '2026-01-01T00:00:00Z',
        attempt_no: 1,
        is_latest_attempt: true,
        retry_of_task_id: null,
        ai_summary: null,
        ai_status: 'PENDING',
        ai_error: null,
      },
      {
        id: 't-done',
        source_url: 'https://www.bilibili.com/video/BV1xx411c7mD',
        title: '已完成的视频',
        cover_url: 'https://cdn.example.com/done.jpg',
        duration_seconds: 360,
        state: 'SUCCEEDED',
        progress: 100,
        format_id: '720',
        format_label: '720P MP4',
        failure_code: null,
        failure_reason: null,
        output_filename: 'done.mp4',
        object_size: 1200000,
        expires_at: '2026-01-02T00:00:00Z',
        created_at: '2026-01-01T00:00:00Z',
        updated_at: '2026-01-01T00:00:00Z',
        attempt_no: 1,
        is_latest_attempt: true,
        retry_of_task_id: null,
        ai_summary: '已生成摘要',
        ai_status: 'SUCCEEDED',
        ai_error: null,
      },
    ])

    const user = userEvent.setup()
    renderWithProviders(<WorkbenchPage />)

    expect(await screen.findByAltText('正在下载的视频')).toHaveAttribute(
      'src',
      'https://cdn.example.com/running.jpg',
    )
    expect(screen.getByText('时长：01:35')).toBeInTheDocument()
    expect(screen.getByText('AI：等待处理')).toBeInTheDocument()
    expect(screen.getByText('报告：可导出')).toBeInTheDocument()

    await user.click(screen.getByRole('button', { name: '已完成' }))

    expect(screen.queryByText('正在下载的视频')).not.toBeInTheDocument()
    expect(screen.getByText('已完成的视频')).toBeInTheDocument()
  })

  it('错误态能展示任务列表请求异常', async () => {
    vi.mocked(listTasks).mockRejectedValueOnce(new Error('任务查询失败'))

    renderWithProviders(<WorkbenchPage />)

    expect(await screen.findByText('任务查询失败')).toBeInTheDocument()
  })
})
