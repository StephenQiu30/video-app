import {
  buildHealthRows,
  platformCapabilityRows,
  userRoleLabel,
  userStatusColor,
  userStatusLabel,
} from './admin-console';

const user = (extra: Partial<API.UserRead> = {}): API.UserRead => ({
  id: 1,
  email: 'ops@example.com',
  is_active: true,
  is_admin: false,
  daily_task_quota: 10,
  concurrent_task_quota: 2,
  max_file_size_bytes: 1024,
  file_retention_hours: 24,
  storage_quota_bytes: 1024 * 1024,
  created_at: '2026-05-23T00:00:00Z',
  ...extra,
});

describe('admin console helpers', () => {
  it('maps user role and status to admin-facing labels', () => {
    expect(userRoleLabel(user({ is_admin: true }))).toBe('管理员');
    expect(userRoleLabel(user({ is_admin: false }))).toBe('普通用户');
    expect(userStatusLabel(user({ is_active: true }))).toBe('正常');
    expect(userStatusColor(user({ is_active: false }))).toBe('red');
  });

  it('normalizes health and readiness checks with readable failure messages', () => {
    const rows = buildHealthRows(
      { app: 'video-server', status: 'ok' },
      {
        status: 'degraded',
        checks: {
          database: { ok: true, message: 'connected' },
          redis: { ok: false, message: 'connection refused' },
        },
      },
    );

    expect(rows).toEqual(
      expect.arrayContaining([
        expect.objectContaining({ key: 'health', status: 'ok' }),
        expect.objectContaining({
          key: 'ready.redis',
          status: 'failed',
          message: 'connection refused',
        }),
      ]),
    );
  });

  it('declares only supported public-platform capabilities and compliance limits', () => {
    expect(platformCapabilityRows.map((item) => item.name)).toEqual(
      expect.arrayContaining(['B站', '抖音', '快手']),
    );
    expect(platformCapabilityRows.map((item) => item.status)).not.toContain(
      '规划接入',
    );
    expect(platformCapabilityRows.map((item) => item.compliance).join(' ')).toContain(
      '不绕过 DRM',
    );
  });
});
