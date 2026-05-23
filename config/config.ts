import { join } from 'node:path';
import { defineConfig } from '@umijs/max';
import defaultSettings from './defaultSettings';
import proxy from './proxy';
import routes from './routes';

const { UMI_ENV = 'dev' } = process.env;

const commitHash =
  process.env.COMMIT_HASH ||
  (() => {
    try {
      return require('node:child_process')
        .execSync('git rev-parse HEAD', {
          stdio: ['ignore', 'pipe', 'ignore'],
          encoding: 'utf-8',
        })
        .trim();
    } catch {
      return '';
    }
  })();

export default defineConfig({
  alias: {
    '@root': join(__dirname, '..'),
  },
  antd: {
    appConfig: {},
    configProvider: {
      variant: 'filled',
      theme: {
        token: {
          colorPrimary: '#1677ff',
          colorInfo: '#1677ff',
          colorBgLayout: '#f5f8fc',
          colorText: '#101828',
          colorTextSecondary: '#475467',
          borderRadius: 8,
          fontFamily:
            '-apple-system, BlinkMacSystemFont, "Segoe UI", "PingFang SC", "Hiragino Sans GB", "Microsoft YaHei", sans-serif',
        },
      },
    },
  },
  access: {},
  define: {
    'process.env.CI': process.env.CI,
    'process.env.COMMIT_HASH': commitHash,
    __APP_VERSION__: require('./../package.json').version,
  },
  exportStatic: {},
  esbuildMinifyIIFE: true,
  fastRefresh: true,
  hash: true,
  headScripts: [{ src: '/scripts/loading.js', async: true }],
  ignoreMomentLocale: true,
  initialState: {},
  layout: {
    locale: false,
    ...defaultSettings,
  },
  manifest: {},
  mock: false,
  model: {},
  openAPI: [
    {
      requestLibPath: "import { request } from '@umijs/max'",
      schemaPath: join(__dirname, '../docs/openapi/video-server.openapi.json'),
      mock: false,
      projectName: 'video',
    },
  ],
  plugins: ['@umijs/max-plugin-openapi'],
  proxy: proxy[UMI_ENV as keyof typeof proxy],
  publicPath: '/',
  reactQuery: false,
  request: {},
  routes,
  title: '万能视频下载器',
});
