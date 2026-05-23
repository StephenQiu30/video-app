import { expect, test } from '@playwright/test'

test('解析分享链接并创建任务后可进入详情页获取下载链接', async ({ page }) => {
  const task = {
    id: 't-e2e-01',
    source_url: 'https://v.douyin.com/abc',
    title: '抖音样例视频',
    state: 'SUCCEEDED',
    progress: 100,
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
    ai_summary: 'AI 已提炼视频重点，适合生成分享报告。',
    ai_status: 'SUCCEEDED',
    ai_error: null,
    ai_mindmap: JSON.stringify({
      title: '报告要点',
      points: ['视频亮点', '下载规格', '分享建议'],
    }),
  }

  await page.addInitScript(() => {
    localStorage.setItem('video_web_access_token', 'e2e-token')
  })

  await page.route('**/api/parse', async (route) => {
    if (route.request().method() === 'POST') {
      await route.fulfill({
        status: 200,
        contentType: 'application/json',
        body: JSON.stringify({
          url: 'https://v.douyin.com/abc',
          title: '抖音样例视频',
          cover_url: 'https://cdn.example.com/cover.jpg',
          duration_seconds: 88,
          source_site: '抖音',
          extractor: 'douyin',
          formats: [
            {
              format_id: '1080',
              label: '1080P MP4',
              ext: 'mp4',
              resolution: '1920x1080',
              filesize: 1024,
              quality_label: '1080p',
              available: true,
              note: null,
            },
          ],
        }),
      })
      return
    }

    await route.fallback()
  })

  await page.route('**/api/tasks', async (route) => {
    if (route.request().method() === 'GET') {
      await route.fulfill({
        status: 200,
        contentType: 'application/json',
        body: JSON.stringify([]),
      })
      return
    }

    if (route.request().method() === 'POST') {
      await route.fulfill({
        status: 201,
        contentType: 'application/json',
        body: JSON.stringify(task),
      })
      return
    }

    await route.fallback()
  })

  await page.route('**/api/tasks/**', async (route) => {
    if (route.request().url().endsWith('/events')) {
      await route.fulfill({
        status: 200,
        contentType: 'application/json',
        body: JSON.stringify([
          {
            id: 1,
            task_id: 't-e2e-01',
            state: 'SUCCEEDED',
            message: '下载完成',
            created_at: '2026-01-01T00:00:00Z',
          },
        ]),
      })
      return
    }

    if (route.request().url().endsWith('/download-link')) {
      await route.fulfill({
        status: 200,
        contentType: 'application/json',
        body: JSON.stringify({
          url: 'https://cdn.example.com/video.mp4',
          expires_in_seconds: 900,
        }),
      })
      return
    }

    if (route.request().url().endsWith('/pdf')) {
      await route.fulfill({
        status: 200,
        contentType: 'application/pdf',
        body: '%PDF-1.4',
      })
      return
    }

    await route.fulfill({
      status: 200,
      contentType: 'application/json',
      body: JSON.stringify(task),
    })
  })

  await page.goto('/tasks')
  await expect(page.getByRole('heading', { name: '下载任务' })).toBeVisible()

  await page.goto('/')
  await page.getByLabel('视频链接').fill('https://v.douyin.com/abc')
  await page.getByRole('button', { name: '解析视频' }).click()
  await expect(page.getByText('解析完成，选择规格后可创建下载任务')).toBeVisible()

  await page.getByRole('button', { name: '创建下载任务' }).click()

  await expect(page).toHaveURL(/\/tasks\/t-e2e-01/)
  await expect(page.getByText('抖音样例视频')).toBeVisible()
  await expect(page.getByRole('heading', { name: 'AI 摘要' })).toBeVisible()
  await expect(page.getByText('AI 已提炼视频重点，适合生成分享报告。')).toBeVisible()
  await expect(page.getByText('报告要点')).toBeVisible()
  await expect(page.getByText('事件流')).toBeVisible()
  await expect(page.getByText('下载完成')).toBeVisible()

  const downloadButton = page.getByRole('button', { name: '获取下载链接' })
  await expect(downloadButton).toBeEnabled()
  await downloadButton.click()
  await expect(page.getByRole('link', { name: '打开下载文件' })).toHaveAttribute(
    'href',
    'https://cdn.example.com/video.mp4',
  )

  await page.getByRole('button', { name: '导出 PDF 报告' }).click()
  await expect(page.getByRole('link', { name: '打开 PDF 报告' })).toHaveAttribute('href', /^blob:/)
})
