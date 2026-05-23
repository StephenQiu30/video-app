import { screen } from '@testing-library/react'
import userEvent from '@testing-library/user-event'
import { beforeEach, describe, expect, it, vi } from 'vitest'

import { parseVideo, createTask, getGitHubAuthorizeUrl } from '../lib/api'
import { HomePage } from './HomePage'
import { renderWithProviders } from '../test/test-utils'

vi.mock('../lib/api', async () => {
  const actual = await vi.importActual<typeof import('../lib/api')>('../lib/api')
  return {
    ...actual,
    parseVideo: vi.fn(),
    createTask: vi.fn(),
    getGitHubAuthorizeUrl: () => 'https://github.com/login',
  }
})

describe('HomePage', () => {
  beforeEach(() => {
    window.localStorage.setItem('video_web_access_token', 'unit-test-token')
    vi.clearAllMocks()
  })

  it('解析失败时展示后端错误文案', async () => {
    const parseVideoMock = vi.mocked(parseVideo)
    const user = userEvent.setup()

    parseVideoMock.mockRejectedValueOnce(new Error('解析失败，请检查链接内容'))

    renderWithProviders(<HomePage />)
    await user.type(screen.getByLabelText('视频链接'), 'https://v.douyin.com/bad')
    await user.click(screen.getByRole('button', { name: '解析视频' }))

    expect(await screen.findByRole('alert')).toHaveTextContent('解析失败，请检查链接内容')
  })

  it('解析视频成功后可生成任务创建请求', async () => {
    const parseVideoMock = vi.mocked(parseVideo)
    const createTaskMock = vi.mocked(createTask)
    const user = userEvent.setup()

    parseVideoMock.mockResolvedValueOnce({
      url: 'https://v.douyin.com/test',
      title: 'demo title',
      cover_url: null,
      duration_seconds: 120,
      source_site: 'douyin',
      extractor: 'douyin',
      formats: [
        {
          format_id: '1080',
          label: '1080P MP4',
          ext: 'mp4',
          resolution: '1920x1080',
          filesize: 20 * 1024 * 1024,
          quality_label: '高',
          available: true,
          note: null,
        },
      ],
    })
    createTaskMock.mockResolvedValueOnce({
      id: 't-1',
      source_url: 'https://v.douyin.com/test',
      title: 'demo title',
      state: 'PENDING',
      progress: 0,
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
    })

    renderWithProviders(<HomePage />)
    await user.type(screen.getByLabelText('视频链接'), 'https://v.douyin.com/test')
    await user.click(screen.getByRole('button', { name: '解析视频' }))

    expect(await screen.findByText('解析完成，选择规格后可创建下载任务')).toBeInTheDocument()
    expect(parseVideoMock).toHaveBeenCalledWith('unit-test-token', 'https://v.douyin.com/test')

    await user.click(screen.getByRole('button', { name: '创建下载任务' }))

    expect(createTaskMock).toHaveBeenCalledWith(
      'unit-test-token',
      expect.objectContaining({
        url: 'https://v.douyin.com/test',
        format_id: '1080',
        format_label: '1080P MP4',
      }),
    )
  })

  it('未登录时展示登录引导', () => {
    window.localStorage.removeItem('video_web_access_token')
    renderWithProviders(<HomePage />)

    expect(screen.getByText(/当前未登录，解析\/创建需要登录。请先/)).toBeInTheDocument()
    expect(screen.getByRole('link', { name: '前往 GitHub 登录' })).toHaveAttribute(
      'href',
      getGitHubAuthorizeUrl(),
    )
  })
})
