import { beforeEach, describe, expect, it, vi } from 'vitest'
import { screen } from '@testing-library/react'
import userEvent from '@testing-library/user-event'
import { Route, Routes } from 'react-router-dom'

import {
  getTask,
  getTaskDownloadLink,
  getTaskEvents,
  getTaskReportLink,
  retryTask,
} from '../lib/api'
import { TaskDetailPage } from './TaskDetailPage'
import { renderWithProviders } from '../test/test-utils'

vi.mock('../lib/api', async () => {
  const actual = await vi.importActual<typeof import('../lib/api')>('../lib/api')
  return {
    ...actual,
    retryTask: vi.fn(),
    getTask: vi.fn(),
    getTaskEvents: vi.fn(),
    getTaskDownloadLink: vi.fn(),
    getTaskReportLink: vi.fn(),
  }
})

function renderTaskDetailPage(initialPath: string = '/tasks/t-detail') {
  return renderWithProviders(
    <Routes>
      <Route path="/tasks/:taskId" element={<TaskDetailPage />} />
    </Routes>,
    { initialEntries: [initialPath] },
  )
}

describe('TaskDetailPage', () => {
  beforeEach(() => {
    window.localStorage.setItem('video_web_access_token', 'unit-test-token')
    vi.clearAllMocks()
  })

  it('下载完成后可拉取下载链接', async () => {
    vi.mocked(getTask).mockResolvedValue({
      id: 't-detail',
      source_url: 'https://example.com/video',
      title: '下载成功样例',
      state: 'SUCCEEDED',
      progress: 100,
      format_id: '1080',
      format_label: '1080P MP4',
      failure_code: null,
      failure_reason: null,
      output_filename: null,
      object_size: null,
      expires_at: '2026-01-01T00:00:00Z',
      created_at: '2026-01-01T00:00:00Z',
      updated_at: '2026-01-01T00:00:00Z',
      attempt_no: 1,
      is_latest_attempt: true,
      retry_of_task_id: null,
      ai_summary: null,
      ai_status: null,
      ai_error: null,
    })
    vi.mocked(getTaskEvents).mockResolvedValue([])
    vi.mocked(getTaskDownloadLink).mockResolvedValue({
      url: 'https://example.com/download.mp4',
      expires_in_seconds: 900,
    })

    renderTaskDetailPage()
    const user = userEvent.setup()

    expect(await screen.findByText('下载成功样例')).toBeInTheDocument()
    const downloadButton = screen.getByRole('button', { name: '获取下载链接' })
    expect(downloadButton).toBeEnabled()
    await user.click(downloadButton)

    expect(await screen.findByRole('link', { name: '打开下载文件' })).toHaveAttribute(
      'href',
      'https://example.com/download.mp4',
    )
  })

  it('任务失败时显示重试能力', async () => {
    vi.mocked(getTask).mockResolvedValue({
      id: 't-detail',
      source_url: 'https://example.com/video',
      title: '失败样例',
      state: 'FAILED',
      progress: 0,
      format_id: null,
      format_label: null,
      failure_code: 'download_failed',
      failure_reason: '下载失败，请稍后重试',
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
    })
    vi.mocked(getTaskEvents).mockResolvedValue([])
    vi.mocked(retryTask).mockResolvedValue({
      id: 't-detail',
      source_url: 'https://example.com/video',
      title: '失败样例',
      state: 'SUCCEEDED',
      progress: 100,
      format_id: null,
      format_label: null,
      failure_code: null,
      failure_reason: null,
      output_filename: null,
      object_size: null,
      expires_at: '2026-01-01T00:00:00Z',
      created_at: '2026-01-01T00:00:00Z',
      updated_at: '2026-01-01T00:00:00Z',
      attempt_no: 1,
      is_latest_attempt: true,
      retry_of_task_id: null,
      ai_summary: null,
      ai_status: null,
      ai_error: null,
    })

    renderTaskDetailPage()

    expect(await screen.findByText('FAILED')).toBeInTheDocument()
    expect(screen.getByRole('button', { name: '重试' })).toBeEnabled()
    expect(screen.getByRole('button', { name: '取消' })).toBeDisabled()
  })

  it('加载失败时展示错误提示', async () => {
    vi.mocked(getTask).mockRejectedValueOnce(new Error('任务加载失败'))
    vi.mocked(getTaskEvents).mockResolvedValue([])

    renderTaskDetailPage()

    expect(await screen.findByText('加载失败：任务加载失败')).toBeInTheDocument()
  })

  it('展示 AI 摘要、关键事件并可导出 PDF 报告', async () => {
    vi.mocked(getTask).mockResolvedValue({
      id: 't-detail',
      source_url: 'https://www.bilibili.com/video/BV1xx411c7mD',
      title: 'B站讲解视频',
      cover_url: 'https://cdn.example.com/bili.jpg',
      duration_seconds: 420,
      state: 'SUCCEEDED',
      progress: 100,
      format_id: '1080',
      format_label: '1080P MP4',
      failure_code: null,
      failure_reason: null,
      output_filename: 'bili.mp4',
      object_size: 8800000,
      expires_at: '2026-01-01T00:00:00Z',
      created_at: '2026-01-01T00:00:00Z',
      updated_at: '2026-01-01T00:00:00Z',
      attempt_no: 1,
      is_latest_attempt: true,
      retry_of_task_id: null,
      ai_summary: '这是一段关于视频下载器工程化的摘要。',
      ai_status: 'SUCCEEDED',
      ai_error: null,
      ai_mindmap: JSON.stringify({
        title: '工程化要点',
        points: ['解析能力', '任务可靠性', '报告导出'],
      }),
    })
    vi.mocked(getTaskEvents).mockResolvedValue([
      {
        id: 1,
        task_id: 't-detail',
        state: 'AI_SUMMARY_DONE',
        message: 'AI 摘要已生成',
        created_at: '2026-01-01T00:01:00Z',
      },
    ])
    vi.mocked(getTaskReportLink).mockResolvedValue({
      url: 'blob:http://localhost/report',
      expires_in_seconds: 900,
    })

    renderTaskDetailPage()
    const user = userEvent.setup()

    expect(await screen.findByRole('heading', { name: 'AI 摘要' })).toBeInTheDocument()
    expect(screen.getByText('这是一段关于视频下载器工程化的摘要。')).toBeInTheDocument()
    expect(screen.getByText('工程化要点')).toBeInTheDocument()
    expect(screen.getByText('报告导出')).toBeInTheDocument()
    expect(screen.getByText('AI 摘要已生成')).toBeInTheDocument()

    await user.click(screen.getByRole('button', { name: '导出 PDF 报告' }))

    expect(await screen.findByRole('link', { name: '打开 PDF 报告' })).toHaveAttribute(
      'href',
      'blob:http://localhost/report',
    )
  })

  it('未登录时依赖组件层级重定向（通过 App 中间件）', () => {
    window.localStorage.removeItem('video_web_access_token')

    renderTaskDetailPage()

    expect(screen.queryByRole('button', { name: '获取下载链接' })).not.toBeInTheDocument()
  })
})
