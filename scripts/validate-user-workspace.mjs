import fs from 'node:fs';
import path from 'node:path';

const root = process.cwd();
const exists = (file) => fs.existsSync(path.join(root, file));
const read = (file) => fs.readFileSync(path.join(root, file), 'utf8');
const failures = [];

const routes = read('config/routes.ts');
if (!routes.includes('/tasks/:taskId')) {
  failures.push('missing task detail route /tasks/:taskId');
}

const parserPage = read('src/pages/Parser/index.tsx');
for (const expectedText of [
  'parseVideoApiParsePost',
  'createTaskApiTasksPost',
  'format_id',
]) {
  if (!parserPage.includes(expectedText)) {
    failures.push(`parser page missing ${expectedText}`);
  }
}

const tasksPage = read('src/pages/Tasks/index.tsx');
for (const expectedText of [
  'listTasksApiTasksGet',
  'ProTable',
  'state',
  '全部',
  '排队中',
  '下载中',
  '已完成',
  '失败',
]) {
  if (!tasksPage.includes(expectedText)) {
    failures.push(`tasks page missing ${expectedText}`);
  }
}
if (tasksPage.includes('示例任务')) {
  failures.push('tasks page still uses demo task data');
}

if (!exists('src/pages/TaskDetail/index.tsx')) {
  failures.push('missing task detail page');
} else {
  const detailPage = read('src/pages/TaskDetail/index.tsx');
  for (const expectedText of [
    'getTaskApiTasksTaskIdGet',
    'getTaskEventsApiTasksTaskIdEventsGet',
    'cancelDownloadTaskApiTasksTaskIdCancelPost',
    'retryDownloadTaskApiTasksTaskIdRetryPost',
    'getDownloadLinkApiTasksTaskIdDownloadLinkGet',
    'exportTaskPdfApiTasksTaskIdPdfGet',
    'canExportPdf',
  ]) {
    if (!detailPage.includes(expectedText)) {
      failures.push(`task detail page missing ${expectedText}`);
    }
  }
}

const accountPage = read('src/pages/Account/index.tsx');
for (const expectedText of [
  'useModel',
  'daily_task_quota',
  'concurrent_task_quota',
  'max_file_size_bytes',
  'storage_quota_bytes',
  'file_retention_hours',
]) {
  if (!accountPage.includes(expectedText)) {
    failures.push(`account page missing ${expectedText}`);
  }
}

if (failures.length > 0) {
  console.error(failures.join('\n'));
  process.exit(1);
}

console.log('User workspace validation passed.');
