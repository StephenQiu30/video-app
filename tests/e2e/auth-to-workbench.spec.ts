import { expect, test } from '@playwright/test'

test('未登录时访问 tasks 重定向到 auth', async ({ page }) => {
  await page.goto('/tasks')
  await expect(page).toHaveURL(/\/auth/)
  await expect(page.getByRole('heading', { name: '登录' })).toBeVisible()
})

test('带 token 回跳到 auth 后自动进入 tasks', async ({ page }) => {
  await page.route('**/api/tasks*', (route) =>
    route.fulfill({
      status: 200,
      contentType: 'application/json',
      body: JSON.stringify([]),
    }),
  )

  await page.goto('/auth?token=e2e-token')
  await expect(page).toHaveURL(/\/tasks/)
  await expect(page.getByRole('heading', { name: '下载任务' })).toBeVisible()
})

test('未知路由展示 404 页面', async ({ page }) => {
  await page.goto('/not-found-here')
  await expect(page.getByRole('heading', { name: '页面不存在' })).toBeVisible()
  await expect(page.getByRole('link', { name: '返回解析页' })).toBeVisible()
})

test('顶部报告入口跳转已完成任务筛选', async ({ page }) => {
  await page.addInitScript(() => {
    localStorage.setItem('video_web_access_token', 'e2e-token')
  })
  await page.route('**/api/tasks*', (route) =>
    route.fulfill({
      status: 200,
      contentType: 'application/json',
      body: JSON.stringify([
        {
          id: 't-running',
          source_url: 'https://v.douyin.com/running',
          title: '正在下载的视频',
          state: 'DOWNLOADING',
          progress: 50,
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
          id: 't-done',
          source_url: 'https://www.bilibili.com/video/BV1xx411c7mD',
          title: '已完成的视频',
          state: 'SUCCEEDED',
          progress: 100,
          failure_code: null,
          failure_reason: null,
          output_filename: 'done.mp4',
          object_size: 1000,
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
      ]),
    }),
  )

  await page.goto('/')
  await page.getByRole('navigation', { name: '主导航' }).getByRole('link', { name: '报告', exact: true }).click()

  await expect(page).toHaveURL(/\/tasks\?state=SUCCEEDED/)
  await expect(page.getByText('已完成的视频')).toBeVisible()
  await expect(page.getByText('正在下载的视频')).toBeHidden()
  await expect(page.getByRole('button', { name: '已完成' })).toHaveAttribute('aria-pressed', 'true')
})
