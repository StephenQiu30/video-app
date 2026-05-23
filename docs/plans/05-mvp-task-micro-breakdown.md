---
layer: plans
doc_no: "PLAN-005"
audience:
  - Dev
  - QA
  - PM
purpose: "将 MVP 前端重构拆分为可执行的小任务，明确优先级与类型，支持逐条打标签建 issue。"
canonical_path: "docs/plans/05-mvp-task-micro-breakdown.md"
status: draft
version: "1.0.0"
owner: "StephenQiu30"
inputs:
  - "Superpowers 执行任务池"
  - "已存在 issue #1-28"
outputs:
  - "可创建 issue 的微任务清单"
triggers:
  - "新一轮执行开始"
  - "出现未覆盖功能风险"
downstream:
  - "docs/acceptance/01-mvp-acceptance-gates.md"
  - "docs/design/01-frontend-runtime-design.md"
---

# MVP 前端任务微拆分（video-web）

## Epic 分层

- F1：项目初始化与基础设施（优先级 P0，类型 repo）
- F2：工程/文档标准化（优先级 P0，类型 docs）
- F3：产品页面（优先级 P0/P1，类型 core/ui/auth）
- F4：测试与验收（优先级 P0，类型 test/review）

## 微任务列表

### F1（项目初始化）

| Task ID | 标题 | 优先级 | 类型 | 说明 |
| --- | --- | --- | --- | --- |
| F1-S1 | 建立 App 入口 providers（QueryClient、Router、Auth）单测 | P0 | repo | `src/main.tsx`、`src/contexts/auth.tsx` |
| F1-S2 | 补齐 `page` 路由文件占位并拆分为 4 个页面 | P0 | frontend | `src/pages/*` 与 `src/App.tsx` |
| F1-S3 | 落地页样式系统与 token 入口文案 | P0 | ui | `src/App.css`、`src/index.css` |

### F2（标准化）

| Task ID | 标题 | 优先级 | 类型 | 说明 |
| --- | --- | --- | --- | --- |
| F2-S1 | 建立 docs 目录与更新 README/AGENTS | P0 | docs | 文档规范与目录入口 |
| F2-S2 | 建立 `.env.example` 与运行说明 | P0 | devops | `VITE_API_BASE_URL`、轮询参数 |
| F2-S3 | API 客户端方法按后端契约补齐字段映射 | P0 | api | `TaskRead` 与 `TaskEventRead` 对齐 |

### F3（产品页面）

| Task ID | 标题 | 优先级 | 类型 | 说明 |
| --- | --- | --- | --- | --- |
| F3-S1 | Auth 页面实现 token 落盘与回跳 | P0 | auth | `/auth?token=` 回跳接收 |
| F3-S2 | Home 解析+创建任务链路：URL、format、错误态 | P0 | core | `parse` + `createTask` |
| F3-S3 | Workbench 任务列表+状态过滤+失败重试入口 | P0 | core | 列表/分页/重试 |
| F3-S4 | Task 详情：事件流、取消、重试、下载链接获取 | P0 | core | `cancel/retry/download-link` |
| F3-S5 | 错误码统一映射与 toast/alert 提示 | P1 | ui | API 错误统一展示 |

### F4（测试与验收）

| Task ID | 标题 | 优先级 | 类型 | 说明 |
| --- | --- | --- | --- | --- |
| F4-S1 | 路由鉴权单测：未登录重定向到 /auth | P0 | test | `src/App.test.tsx` |
| F4-S2 | 表单+任务详情组件单测 | P0 | test | `pages/*` 行为覆盖 |
| F4-S3 | Playwright 登录链路 E2E（/auth + /workbench） | P0 | e2e | 验证真实浏览器路由 |
| F4-S4 | Playwright 解析→创建→详情链路 E2E | P0 | e2e | 点击到可点击下载区 |
| F4-S5 | Superpowers 审核与 Review 门禁 issue 执行 | P0 | code-review | 任务闭环 |
