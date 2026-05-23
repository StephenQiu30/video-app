import fs from 'node:fs';
import path from 'node:path';

const root = process.cwd();
const readJson = (file) => JSON.parse(fs.readFileSync(path.join(root, file), 'utf8'));
const exists = (file) => fs.existsSync(path.join(root, file));

const packageJson = readJson('package.json');
const allDeps = {
  ...(packageJson.dependencies ?? {}),
  ...(packageJson.devDependencies ?? {}),
};

const failures = [];

const requireDependency = (name) => {
  if (!allDeps[name]) failures.push(`missing dependency: ${name}`);
};

const rejectDependency = (name) => {
  if (allDeps[name]) failures.push(`legacy dependency still present: ${name}`);
};

requireDependency('@umijs/max');
requireDependency('@ant-design/pro-components');
requireDependency('antd');
rejectDependency('vite');
rejectDependency('@vitejs/plugin-react');

for (const dependencyName of Object.keys(allDeps)) {
  if (dependencyName.startsWith('@radix-ui/')) {
    failures.push(`legacy Radix dependency still present: ${dependencyName}`);
  }
}

if (exists('vite.config.ts')) failures.push('legacy vite.config.ts still exists');
if (exists('index.html')) failures.push('legacy Vite index.html still exists');
if (exists('src/components/ui')) failures.push('legacy src/components/ui still exists');
if (exists('src/components/layout')) failures.push('legacy src/components/layout still exists');
if (!exists('config/config.ts')) failures.push('missing Ant Design Pro config/config.ts');
if (!exists('config/routes.ts')) failures.push('missing Ant Design Pro config/routes.ts');

if (exists('config/routes.ts')) {
  const routesText = fs.readFileSync(path.join(root, 'config/routes.ts'), 'utf8');
  for (const routeLabel of ['解析下载', '下载任务', '账号中心', '用户管理', '任务监控', '系统状态', '平台能力']) {
    if (!routesText.includes(routeLabel)) failures.push(`missing business menu route: ${routeLabel}`);
  }
  for (const demoLabel of ['欢迎', '查询表格', '二级管理页']) {
    if (routesText.includes(demoLabel)) failures.push(`demo menu route still present: ${demoLabel}`);
  }
}

if (failures.length > 0) {
  console.error(failures.join('\n'));
  process.exit(1);
}

console.log('Ant Design Pro scaffold validation passed.');
