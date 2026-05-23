import fs from 'node:fs';
import path from 'node:path';

const root = process.cwd();
const exists = (file) => fs.existsSync(path.join(root, file));
const read = (file) => fs.readFileSync(path.join(root, file), 'utf8');
const readJson = (file) => JSON.parse(read(file));

const failures = [];
const schema = readJson('docs/openapi/video-server.openapi.json');

if (!schema.paths?.['/api/auth/login']) {
  failures.push('OpenAPI schema missing /api/auth/login');
}

if (!schema.paths?.['/api/auth/me']) {
  failures.push('OpenAPI schema missing /api/auth/me');
}

if (!exists('src/services/video/loginUser.ts')) {
  failures.push('generated official OpenAPI service missing loginUser.ts');
}

if (!exists('src/services/video/getCurrentUser.ts')) {
  failures.push('generated official OpenAPI service missing getCurrentUser.ts');
}

const routes = read('config/routes.ts');
for (const expectedRoute of ['/user/login', '/auth', '/admin/users']) {
  if (!routes.includes(expectedRoute)) {
    failures.push(`route missing ${expectedRoute}`);
  }
}

if (!routes.includes("access: 'canAdmin'")) {
  failures.push('admin routes must be guarded by canAdmin');
}

const defaultSettings = read('config/defaultSettings.ts');
if (!defaultSettings.includes("layout: 'top'")) {
  failures.push('ProLayout must use top navigation layout');
}
if (!defaultSettings.includes("contentWidth: 'Fluid'")) {
  failures.push('ProLayout must use fluid content width');
}
if (defaultSettings.includes('fixSiderbar: true')) {
  failures.push('top fluid layout must not keep a fixed sidebar');
}

const appRuntimeExists = exists('src/app.tsx');
if (!appRuntimeExists) {
  failures.push('missing Umi runtime src/app.tsx for auth bootstrap');
} else {
  const appRuntime = read('src/app.tsx');
  for (const expectedText of [
    'fetchCurrentUser',
    'TOKEN_STORAGE_KEY',
    'video_web_access_token',
    '/user/login',
  ]) {
    if (!appRuntime.includes(expectedText)) {
      failures.push(`src/app.tsx missing ${expectedText}`);
    }
  }
}

if (failures.length > 0) {
  console.error(failures.join('\n'));
  process.exit(1);
}

console.log('Auth/OpenAPI/access validation passed.');
