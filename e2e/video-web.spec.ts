import { expect, test, type Page } from '@playwright/test';

const adminUser = {
  id: 1,
  email: 'admin@example.com',
  display_name: '管理员',
  is_active: true,
  is_admin: true,
  daily_task_quota: 100,
  concurrent_task_quota: 5,
  max_file_size_bytes: 1073741824,
  file_retention_hours: 72,
  storage_quota_bytes: 10737418240,
  created_at: '2026-05-23T00:00:00Z',
};

const normalUser = {
  ...adminUser,
  id: 2,
  email: 'user@example.com',
  display_name: '普通用户',
  is_admin: false,
};

const task = {
  id: 'task-1',
  source_url: 'https://www.bilibili.com/video/BV1xx411c7mD',
  title: '测试视频',
  cover_url: null,
  duration_seconds: 60,
  format_id: 'best',
  format_label: '推荐格式',
  retry_of_task_id: null,
  attempt_no: 1,
  is_latest_attempt: true,
  state: 'completed',
  progress: 100,
  failure_code: null,
  failure_reason: null,
  output_filename: 'task-1.mp4',
  object_size: 1048576,
  expires_at: '2026-05-24T00:00:00Z',
  created_at: '2026-05-23T00:00:00Z',
  updated_at: '2026-05-23T00:10:00Z',
};

async function mockApi(page: Page, user = adminUser) {
  await page.route('**/api/auth/login', async (route) => {
    await route.fulfill({ json: { access_token: 'e2e-token', token_type: 'bearer' } });
  });
  await page.route('**/api/auth/me', async (route) => {
    await route.fulfill({ json: user });
  });
  await page.route('**/api/parse', async (route) => {
    await route.fulfill({
      json: {
        url: task.source_url,
        title: task.title,
        cover_url: null,
        duration_seconds: 60,
        source_site: 'B站',
        platform_id: 'bilibili',
        platform_category: 'long_video',
        compliance_note: '仅处理公开或授权内容。',
        extractor: 'yt-dlp',
        formats: [
          {
            format_id: 'best',
            label: '推荐格式',
            ext: 'mp4',
            resolution: '1080p',
            available: true,
            kind: 'recommended',
          },
        ],
      },
    });
  });
  await page.route('**/api/tasks/task-1/events', async (route) => {
    await route.fulfill({
      json: [
        {
          id: 1,
          task_id: 'task-1',
          state: 'completed',
          message: '下载完成',
          created_at: '2026-05-23T00:10:00Z',
        },
      ],
    });
  });
  await page.route('**/api/tasks/task-1', async (route) => {
    await route.fulfill({ json: task });
  });
  await page.route('**/api/tasks', async (route) => {
    if (route.request().method() === 'POST') {
      await route.fulfill({ json: task });
      return;
    }
    await route.fulfill({ json: [task] });
  });
  await page.route('**/api/admin/users**', async (route) => {
    await route.fulfill({ json: [adminUser, normalUser] });
  });
  await page.route('**/api/admin/metrics', async (route) => {
    await route.fulfill({
      json: {
        active_tasks: 1,
        total_users: 2,
        total_storage_bytes: 1048576,
        queue_depth: 0,
      },
    });
  });
  await page.route('**/health', async (route) => {
    await route.fulfill({ json: { status: 'ok', app: 'video-server' } });
  });
  await page.route('**/ready', async (route) => {
    await route.fulfill({
      json: {
        status: 'ok',
        checks: {
          database: { ok: true, message: 'connected' },
          redis: { ok: true, message: 'connected' },
        },
      },
    });
  });
}

async function loginAs(page: Page, user = adminUser) {
  await mockApi(page, user);
  await page.addInitScript(() => {
    window.localStorage.setItem('video_web_access_token', 'e2e-token');
  });
}

test('邮箱密码登录后进入解析下载页', async ({ page }) => {
  await mockApi(page, normalUser);
  await page.goto('/user/login');
  await page.getByPlaceholder('邮箱').fill('user@example.com');
  await page.getByPlaceholder('密码').fill('password123');
  await page.getByRole('button', { name: '登录' }).click();

  await expect(page).toHaveURL(/\/parser$/);
  await expect(page.getByRole('heading', { name: '解析下载' })).toBeVisible();
});

test('登录用户可以解析链接、创建任务并查看详情', async ({ page }) => {
  await loginAs(page, adminUser);
  await page.goto('/parser');
  await page.getByLabel('视频链接').fill(task.source_url);
  await page.getByRole('button', { name: '解析链接' }).click();
  await expect(page.getByText('推荐格式')).toBeVisible();

  await page.getByRole('button', { name: '创建下载任务' }).click();
  await expect(page).toHaveURL(/\/tasks\/task-1$/);
  await expect(page.getByRole('heading', { name: '测试视频' })).toBeVisible();
  await expect(page.getByText('下载完成')).toBeVisible();
});

test('任务列表展示状态筛选、失败原因和详情入口', async ({ page }) => {
  await loginAs(page, adminUser);
  await page.goto('/tasks');

  await expect(page.getByText('测试视频')).toBeVisible();
  await expect(page.getByText('已完成')).toBeVisible();
  await page.getByRole('button', { name: '详情' }).click();
  await expect(page).toHaveURL(/\/tasks\/task-1$/);
});

test('管理员菜单可用，普通用户访问管理后台显示 403', async ({ page }) => {
  await loginAs(page, adminUser);
  await page.goto('/admin/users');
  await expect(page.getByRole('heading', { name: '用户管理' })).toBeVisible();
  await expect(page.getByText('普通用户')).toBeVisible();

  const normalPage = await page.context().newPage();
  await loginAs(normalPage, normalUser);
  await normalPage.goto('/admin/users');
  await expect(normalPage.getByText('无权限访问')).toBeVisible();
});
