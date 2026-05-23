import fs from 'node:fs';
import path from 'node:path';

const root = process.cwd();
const failures = [];

function read(relativePath) {
  return fs.readFileSync(path.join(root, relativePath), 'utf8');
}

function hasFile(relativePath) {
  return fs.existsSync(path.join(root, relativePath));
}

const routes = read('config/routes.ts');
const app = read('src/app.tsx');
const parser = read('src/pages/Parser/index.tsx');
const access = read('src/access.ts');

function routeBlock(routePath) {
  const pathIndex = routes.indexOf(`path: '${routePath}'`);
  if (pathIndex === -1) return '';

  const nextPathIndex = routes.indexOf('\n  {\n    path:', pathIndex + 1);
  return routes.slice(pathIndex, nextPathIndex === -1 ? routes.length : nextPathIndex);
}

function expectRouteAccess(routePath, accessName) {
  const block = routeBlock(routePath);
  if (!block) {
    failures.push(`missing route ${routePath}`);
    return;
  }
  if (!block.includes(`access: '${accessName}'`)) {
    failures.push(`${routePath} must declare access: '${accessName}'`);
  }
}

const parserRoute = routeBlock('/parser');
if (!parserRoute) {
  failures.push('missing public /parser route');
} else if (/access\s*:/.test(parserRoute)) {
  failures.push('/parser must stay public and must not declare access');
}

for (const routePath of ['/tasks', '/tasks/:taskId', '/account']) {
  expectRouteAccess(routePath, 'canAuthenticated');
}
expectRouteAccess('/admin', 'canAdmin');

if (!/canAuthenticated\s*:/.test(access)) {
  failures.push('src/access.ts must expose canAuthenticated');
}

const hasLegacyGlobalLoginRedirect =
  /onPageChange\s*:\s*\(\)\s*=>\s*{[\s\S]*const\s+isPublicPath\s*=[\s\S]*if\s*\(\s*!initialState\?\.currentUser\s*&&\s*!isPublicPath\s*\)\s*{[\s\S]*history\.replace\(\s*`\$\{loginPath\}\?redirect=\$\{encodeURIComponent\(/.test(
    app,
  );
if (hasLegacyGlobalLoginRedirect) {
  failures.push('legacy global unauthenticated redirect to /user/login must be removed');
}

const authModalExists =
  hasFile('src/components/AuthModal.tsx') ||
  hasFile('src/components/AuthModal/index.tsx');
if (!authModalExists) {
  failures.push('AuthModal component must exist under src/components');
}

if (!/AuthModal/.test(parser)) {
  failures.push('Parser page must render AuthModal');
}

if (failures.length > 0) {
  console.error('Public parser auth modal validation failed:');
  for (const failure of failures) {
    console.error(`- ${failure}`);
  }
  process.exit(1);
}

console.log('Public parser auth modal validation passed.');
