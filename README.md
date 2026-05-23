# 视频下载器前端（video-web）

本仓库承接 API-First 视频下载器的前端交付，采用独立仓库 + Ant Design Pro + Umi Max + React + TypeScript 组织。

## 一句话说明

登录后在一体化后台中完成链接解析、下载任务管理、账号额度查看和管理员运维。

## 仓库结构

- `src/`：前端源码
- `public/`：静态资源
- `docs/`：架构/计划/验收/运行文档
- `config/`：Ant Design Pro / Umi Max 配置、路由和代理
- `tests/`：Jest 测试入口；E2E 将在 M4 PR-E 重新接入
- `e2e/`：Playwright 端到端测试
- `package.json`：依赖与脚本

## 运行方式

### 本机调试（推荐）

```bash
npm install
cp .env.example .env
npm run dev
```

默认访问 `http://localhost:5173`，后端默认 `http://localhost:8000`。
如需切换后端地址，设置 `UMI_APP_API_BASE_URL` 后重新启动前端。

### Docker 部署

Docker 只作为部署方式使用，本机调试不需要 Docker：

```bash
cp .env.example .env
npm run docker:up
```

默认访问 `http://localhost:3000`。如需修改容器暴露端口：

```bash
WEB_HTTP_PORT=8080 npm run docker:up
```

## 主要脚本

- `npm run dev`：启动 Umi Max 开发服务
- `npm run build`：生产构建
- `npm run lint`：Biome + TypeScript 类型检查
- `npm run test`：Jest + Ant Design Pro 脚手架基线校验
- `npm run test:e2e`：Playwright 端到端测试，使用稳定 API mock 覆盖登录、解析、任务和管理后台权限
- `npm run docker:up`：构建并后台启动 Nginx 静态站点容器
- `npm run docker:logs`：查看 Docker 部署容器日志
- `npm run docker:down`：停止 Docker 部署容器

## 关键约定

- 路由：`/parser`（解析下载）`/tasks`（下载任务）`/account`（账号中心）`/admin/*`（管理后台）
- API 基址：`UMI_APP_API_BASE_URL`，接口统一挂载在 `/api/*`
- 鉴权：`localStorage.video_web_access_token`
- 测试优先：新行为要先有可重放的失败测试，再进入实现

## 文档入口

- `docs/plans/`：执行计划与任务拆分
- `docs/design/`：前后端交互与页面结构
- `docs/acceptance/`：验收点与测试记录
- `docs/operations/`：启动/联调/发布说明
