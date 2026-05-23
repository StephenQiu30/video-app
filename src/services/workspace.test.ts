import {
  canCancelTask,
  canExportPdf,
  canRetryTask,
  formatBytes,
  taskStateLabel,
} from './workspace';

const task = (state: string, extra: Partial<API.TaskRead> = {}): API.TaskRead => ({
  id: 'task-1',
  source_url: 'https://example.com/video',
  state,
  progress: 0,
  created_at: '2026-05-23T00:00:00Z',
  updated_at: '2026-05-23T00:00:00Z',
  ...extra,
});

describe('workspace task helpers', () => {
  it('maps backend task states to user-facing labels', () => {
    expect(taskStateLabel('queued')).toBe('排队中');
    expect(taskStateLabel('downloading')).toBe('下载中');
    expect(taskStateLabel('completed')).toBe('已完成');
    expect(taskStateLabel('failed')).toBe('失败');
  });

  it('enables task actions by state', () => {
    expect(canCancelTask(task('queued'))).toBe(true);
    expect(canCancelTask(task('completed'))).toBe(false);
    expect(canRetryTask(task('failed'))).toBe(true);
    expect(canRetryTask(task('downloading'))).toBe(false);
    expect(canExportPdf(task('completed'))).toBe(true);
    expect(canExportPdf(task('failed'))).toBe(false);
  });

  it('formats file and quota sizes', () => {
    expect(formatBytes(0)).toBe('0 B');
    expect(formatBytes(1024)).toBe('1 KB');
    expect(formatBytes(2 * 1024 * 1024 * 1024)).toBe('2 GB');
    expect(formatBytes(null)).toBe('-');
  });
});
