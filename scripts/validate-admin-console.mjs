import fs from 'node:fs';
import path from 'node:path';

const root = process.cwd();

const read = (file) => fs.readFileSync(path.join(root, file), 'utf8');

const files = {
  users: 'src/pages/AdminUsers/index.tsx',
  tasks: 'src/pages/AdminTasks/index.tsx',
  system: 'src/pages/AdminSystem/index.tsx',
  platforms: 'src/pages/AdminPlatforms/index.tsx',
  services: 'src/services/admin-console.ts',
};

const forbiddenByFile = {
  [files.users]: ['admin@example.com', 'dataSource={['],
  [files.tasks]: ['value={0}', '队列深度'],
  [files.system]: ['待接入', "const checks = ['"],
  [files.platforms]: ['规划接入'],
};

const requiredByFile = {
  [files.users]: [
    'listUsersApiAdminUsersGet',
    'ProTable<API.UserRead>',
    'userStatusLabel',
    'userRoleLabel',
  ],
  [files.tasks]: [
    'getMetricsApiAdminMetricsGet',
    'listTasksApiTasksGet',
    'failure_reason',
  ],
  [files.system]: ['healthHealthGet', 'readyReadyGet', 'buildHealthRows'],
  [files.platforms]: ['platformCapabilityRows', 'compliance'],
  [files.services]: [
    'buildHealthRows',
    'platformCapabilityRows',
    '不绕过 DRM',
  ],
};

const failures = [];

for (const file of Object.values(files)) {
  if (!fs.existsSync(path.join(root, file))) {
    failures.push(`${file} is missing`);
  }
}

for (const [file, forbidden] of Object.entries(forbiddenByFile)) {
  const source = read(file);
  for (const pattern of forbidden) {
    if (source.includes(pattern)) {
      failures.push(`${file} still contains placeholder "${pattern}"`);
    }
  }
}

for (const [file, required] of Object.entries(requiredByFile)) {
  const source = read(file);
  for (const pattern of required) {
    if (!source.includes(pattern)) {
      failures.push(`${file} is missing "${pattern}"`);
    }
  }
}

if (failures.length > 0) {
  console.error('Admin console validation failed:');
  for (const failure of failures) {
    console.error(`- ${failure}`);
  }
  process.exit(1);
}

console.log('Admin console validation passed.');
