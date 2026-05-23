export const taskStateOptions = [
  { label: '全部', value: 'all' },
  { label: '排队中', value: 'queued' },
  { label: '下载中', value: 'downloading' },
  { label: '已完成', value: 'completed' },
  { label: '失败', value: 'failed' },
];

const taskStateMap: Record<string, { label: string; color: string }> = {
  queued: { label: '排队中', color: 'processing' },
  pending: { label: '排队中', color: 'processing' },
  downloading: { label: '下载中', color: 'blue' },
  running: { label: '下载中', color: 'blue' },
  completed: { label: '已完成', color: 'success' },
  success: { label: '已完成', color: 'success' },
  failed: { label: '失败', color: 'error' },
  canceled: { label: '已取消', color: 'default' },
  cancelled: { label: '已取消', color: 'default' },
};

export function taskStateLabel(state?: string | null) {
  if (!state) return '-';
  return taskStateMap[state]?.label || state;
}

export function taskStateColor(state?: string | null) {
  if (!state) return 'default';
  return taskStateMap[state]?.color || 'default';
}

export function canCancelTask(task?: Pick<API.TaskRead, 'state'> | null) {
  return ['queued', 'pending', 'downloading', 'running'].includes(
    task?.state || '',
  );
}

export function canRetryTask(task?: Pick<API.TaskRead, 'state'> | null) {
  return ['failed', 'canceled', 'cancelled'].includes(task?.state || '');
}

export function canExportPdf(task?: Pick<API.TaskRead, 'state'> | null) {
  return ['completed', 'success'].includes(task?.state || '');
}

export function formatBytes(value?: number | null) {
  if (value === null || value === undefined) return '-';
  if (value === 0) return '0 B';

  const units = ['B', 'KB', 'MB', 'GB', 'TB'];
  const index = Math.min(
    Math.floor(Math.log(value) / Math.log(1024)),
    units.length - 1,
  );
  const size = value / 1024 ** index;
  return `${Number(size.toFixed(size >= 10 || Number.isInteger(size) ? 0 : 1))} ${units[index]}`;
}

export function taskTitle(task?: Pick<API.TaskRead, 'title' | 'id'> | null) {
  return task?.title || task?.id || '-';
}
