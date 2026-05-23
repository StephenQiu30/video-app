# video-web MVP Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox syntax for tracking.

**Goal:** 建立可运行的视频下载器前端 MVP：落地页解析、登录态管理、工作台任务列表与任务详情，覆盖 TDD 与 E2E 主链路。

**Architecture:** 前端作为独立仓库运行，统一通过 `/api/*` 与 `video-server` 对接；路由层负责访问控制，服务层统一在 `src/lib/api.ts`，页面层只做状态和交互编排。

**Tech Stack:** React 19 + TypeScript + React Router + TanStack Query + Vitest + Playwright + CSS + Axios + Vite。

---

### Task 1: 建立文档与上下文索引

- **Files:**
  - Create: `docs/README.md`, `docs/plans/README.md`, `docs/design/README.md`, `docs/acceptance/README.md`, `docs/operations/README.md`, `docs/superpowers/plans/2026-05-23-video-web-mvp-react-ts-radix.md`

- [ ] **Step 1: 写验收可追踪的文档骨架**
  - [ ] 完成 `docs/` 下目录与 README。
  - [ ] 写明每类文档用途与更新边界。
  - [ ] 记录提交与命名规范（m1 前缀起始）。

### Task 2: 实现页面骨架与鉴权守卫（最小可运行）

- **Files:**
  - Create: `src/pages/HomePage.tsx`, `src/pages/AuthPage.tsx`, `src/pages/WorkbenchPage.tsx`, `src/pages/TaskDetailPage.tsx`
  - Modify: `src/App.tsx`, `src/App.css`, `src/index.css`

- [ ] **Step 1: 写 failing 测试（路由与鉴权）**
  - 先编写 `src/App.test.tsx`，覆盖未登录访问 `/workbench` 重定向。

- [ ] **Step 2: 运行测试确认失败**
  - `npm run test -- src/App.test.tsx`

- [ ] **Step 3: 实现最小页面与鉴权重定向**
  - 实现四个页面及公共布局，满足测试路径。

- [ ] **Step 4: 运行测试确认通过**
  - `npm run test -- src/App.test.tsx`

### Task 3: 解析与任务创建主链路

- **Files:**
  - Modify: `src/pages/HomePage.tsx`, `src/lib/api.ts`, `src/App.tsx`
  - Modify: `src/contexts/auth.tsx`

- [ ] **Step 1: 写 failing 测试（解析→创建）**
  - `src/pages/HomePage.test.tsx`：未登录不可提交、可解析可选 format。

- [ ] **Step 2: 运行测试并确认失败**
  - `npm run test -- src/pages/HomePage.test.tsx`

- [ ] **Step 3: 实现最小业务逻辑**
  - parse + createTask + 路由跳转

- [ ] **Step 4: 运行测试通过**
  - `npm run test -- src/pages/HomePage.test.tsx`

### Task 4: 工作台与任务详情

- **Files:**
  - Modify: `src/pages/WorkbenchPage.tsx`, `src/pages/TaskDetailPage.tsx`

- [ ] **Step 1: 写 failing 测试**
  - `src/pages/WorkbenchPage.test.tsx` 验证空状态与按钮状态。
  - `src/pages/TaskDetailPage.test.tsx` 验证取消/重试/下载入口状态。

- [ ] **Step 2: 跑红灯测试**
  - `npm run test -- src/pages/WorkbenchPage.test.tsx`
  - `npm run test -- src/pages/TaskDetailPage.test.tsx`

- [ ] **Step 3: 补最小实现**
  - 列表、详情、事件、取消、重试、下载链路。

- [ ] **Step 4: 跑绿灯测试**
  - `npm run test -- src/pages/WorkbenchPage.test.tsx`
  - `npm run test -- src/pages/TaskDetailPage.test.tsx`

### Task 5: E2E + 验收

- **Files:**
  - Create: `tests/e2e/auth-to-workbench.spec.ts`, `playwright.config.ts`, `tests/e2e/playwright.config.ts`（如需）
  - Modify: `package.json`

- [ ] **Step 1: 写 failing E2E**
  - 用 Playwright 验证无 token 的路由守卫与 token 注入后可达。

- [ ] **Step 2: 运行测试确认预期失败**
  - `npm run test:e2e -- tests/e2e/auth-to-workbench.spec.ts`

- [ ] **Step 3: 实现最小可测路由行为**
  - 完成 `AuthPage` token 写入、`Workbench` 可渲染、任务详情基本信息。

- [ ] **Step 4: 运行并通过**
  - `npm run test:e2e -- tests/e2e/auth-to-workbench.spec.ts`

### Task 6: 文档与复盘

- **Files:**
  - Modify: `docs/plans/05-mvp-task-micro-breakdown.md`, `docs/acceptance/01-mvp-e2e.md`

- [ ] **Step 1: 整理执行记录**
  - 写入每个 Epic/Task 的状态。

- [ ] **Step 2: 记录验证证据**
  - 贴上 lint/test/e2e 命令输出和残留风险。
