import { expect, test } from '@playwright/test'

test('未登录时访问 workbench 重定向到 auth', async ({ page }) => {
  await page.goto('/workbench')
  await expect(page).toHaveURL(/\/auth/)
  await expect(page.getByRole('heading', { name: '登录' })).toBeVisible()
})

test('带 token 回跳到 auth 后自动进入 workbench', async ({ page }) => {
  await page.route('**/api/tasks*', (route) =>
    route.fulfill({
      status: 200,
      contentType: 'application/json',
      body: JSON.stringify([]),
    }),
  )

  await page.goto('/auth?token=e2e-token')
  await expect(page).toHaveURL(/\/workbench/)
  await expect(page.getByText('下载工作台')).toBeVisible()
})
