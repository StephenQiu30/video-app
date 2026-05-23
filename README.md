# 视频下载器前端（video-web）

本仓库承接 API-First 视频下载器的前端交付，采用独立仓库 + React + TypeScript + React Router + TanStack Query 组织。

## 一句话说明

先在落地页完成链接解析，再通过授权后进入工作台进行任务管理，最后展示任务详情与下载链接。

## 仓库结构

- `src/`：前端源码
- `public/`：静态资源
- `docs/`：架构/计划/验收/运行文档
- `tests/`：Playwright E2E 与单元测试入口
- `package.json`：依赖与脚本

## 运行方式

```bash
npm install
cp .env.example .env
npm run dev
```

默认访问 `http://localhost:5173`，后端默认 `http://localhost:8000/api`。

## 主要脚本

- `npm run dev`：启动开发服务
- `npm run build`：类型校验 + 打包
- `npm run lint`：ESLint
- `npm run test`：Vitest 单元测试
- `npm run test:e2e`：Playwright E2E（要求 `video-server` 可达）

## 关键约定

- 路由：`/`（落地页）`/auth`（登录/回跳处理）`/workbench`（任务列表）`/tasks/:taskId`（任务详情）
- API 基址：`VITE_API_BASE_URL`，接口统一挂载在 `/api/*`
- 鉴权：`localStorage.video_web_access_token`
- 测试优先：新行为要先有可重放的失败测试，再进入实现

## 文档入口

- `docs/plans/`：执行计划与任务拆分
- `docs/design/`：前后端交互与页面结构
- `docs/acceptance/`：验收点与测试记录
- `docs/operations/`：启动/联调/发布说明
