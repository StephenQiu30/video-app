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
