import { formatBytes } from './workspace';

export type HealthRow = {
  key: string;
  name: string;
  status: 'ok' | 'degraded' | 'failed';
  message: string;
};

export type PlatformCapabilityRow = {
  id: string;
  name: string;
  category: string;
  adapter: string;
  status: string;
  capability: string;
  compliance: string;
};

export function userRoleLabel(user: Pick<API.UserRead, 'is_admin'>) {
  return user.is_admin ? '管理员' : '普通用户';
}

export function userStatusLabel(user: Pick<API.UserRead, 'is_active'>) {
  return user.is_active ? '正常' : '停用';
}

export function userStatusColor(user: Pick<API.UserRead, 'is_active'>) {
  return user.is_active ? 'green' : 'red';
}

export function quotaSummary(user: API.UserRead) {
  return [
    `每日 ${user.daily_task_quota} 次`,
    `并发 ${user.concurrent_task_quota}`,
    `单文件 ${formatBytes(user.max_file_size_bytes)}`,
    `存储 ${formatBytes(user.storage_quota_bytes)}`,
  ].join(' / ');
}

function normalizeReadyCheck(key: string, value: any): HealthRow {
  const ok = value?.ok === true;
  const name = value?.name || key;
  const message =
    value?.message ||
    (ok ? '检查通过' : '检查失败，请查看后端 /ready 诊断信息');

  return {
    key: `ready.${key}`,
    name: `/ready ${name}`,
    status: ok ? 'ok' : 'failed',
    message,
  };
}

export function buildHealthRows(
  health?: API.HealthResponse,
  readiness?: API.ReadinessResponse,
  errors: { health?: string; readiness?: string } = {},
): HealthRow[] {
  const rows: HealthRow[] = [
    {
      key: 'health',
      name: 'API /health',
      status: health?.status === 'ok' ? 'ok' : 'failed',
      message:
        errors.health ||
        (health
          ? `${health.app || 'video-server'} 返回 ${health.status}`
          : '未能获取 /health 响应'),
    },
  ];

  if (readiness?.checks) {
    rows.push(
      ...Object.entries(readiness.checks).map(([key, value]) =>
        normalizeReadyCheck(key, value),
      ),
    );
  } else {
    rows.push({
      key: 'ready',
      name: 'API /ready',
      status: 'failed',
      message: errors.readiness || '未能获取 /ready 响应',
    });
  }

  rows.push({
    key: 'openapi',
    name: 'OpenAPI 契约',
    status: 'ok',
    message: '已内置 docs/openapi/video-server.openapi.json，并通过生成脚本校验。',
  });

  return rows;
}

export const platformCapabilityRows: PlatformCapabilityRow[] = [
  {
    id: 'bilibili',
    name: 'B站',
    category: '主流长视频',
    adapter: 'B站适配器 + yt-dlp',
    status: '已支持',
    capability: '公开视频解析、格式识别、下载任务创建。',
    compliance: '不绕过 DRM、番剧、会员、付费、版权受限或需登录内容。',
  },
  {
    id: 'douyin',
    name: '抖音',
    category: '国内短视频',
    adapter: '国内短视频适配器 + yt-dlp',
    status: '已支持',
    capability: '公开分享链接解析、平台画像、下载任务创建。',
    compliance: '不绕过 DRM、平台风控、私密作品、登录态或访问控制。',
  },
  {
    id: 'kuaishou',
    name: '快手',
    category: '国内短视频',
    adapter: '国内短视频适配器 + yt-dlp',
    status: '已支持',
    capability: '公开分享链接解析、平台画像、下载任务创建。',
    compliance: '不绕过 DRM、平台风控、私密作品、登录态或访问控制。',
  },
];
