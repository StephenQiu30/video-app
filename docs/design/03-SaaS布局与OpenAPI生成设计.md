---
layer: design
doc_no: "DESIGN-003"
audience:
  - PM
  - Dev
  - QA
feature_area: saas-layout-openapi
purpose: "定义 video-web 解析下载优先的 SaaS 顶部布局、响应式页面、异常机制与 OpenAPI 生成 API 方案。"
canonical_path: "docs/design/03-SaaS布局与OpenAPI生成设计.md"
status: draft
version: "0.1.0"
owner: "StephenQiu30"
inputs:
  - "AGENTS.md"
  - "video-server Swagger/OpenAPI 契约"
  - "docs/design/02-首屏解析器-AI-PDF重设计.md"
outputs:
  - "SaaS 顶部布局与页面功能设计"
  - "异常状态与错误处理边界"
  - "OpenAPI 生成 API client 设计"
triggers:
  - "前端主布局重构"
  - "任务页、报告入口或账号页改造"
  - "后端接口契约变更"
downstream:
  - "docs/plans/07-SaaS布局与OpenAPI生成任务拆分.md"
  - "docs/acceptance/02-任务与合并请求映射.md"
---

# SaaS 顶部布局与 OpenAPI API 生成设计

## 1. 背景

`video-web` 已完成解析、任务、AI 摘要和 PDF 报告的 MVP 闭环，但当前页面仍偏 MVP 验证台：顶部导航薄、页面缺少统一标题区、任务列表密度不足、异常状态分散，API 类型仍主要由 `src/lib/api.ts` 手写维护。下一阶段目标是把前端提升为克制、可信、响应式的成熟 SaaS 平台，同时不脱离“万能视频下载器”的核心使用路径。

本设计参考 Ant Design Pro 的 TopNav、PageContainer、ProTable 信息密度和账号区布局范式，但保留当前 React + TypeScript + RadixUI 技术栈，不引入 Umi、Ant Design 或 Pro Components。

## 2. 目标

- 以“解析下载优先”为主线，保持最短路径：粘贴链接 -> 解析 -> 选格式 -> 创建任务 -> 看进度 -> 下载文件 / 导出报告。
- 使用蓝白色主题，形成统一的顶部 SaaS 布局、页面标题区、内容容器和响应式规则。
- 顶部导航采用 4 个入口：解析、任务、报告、账号。
- 报告入口不做独立空报告中心，而是跳转到已完成任务筛选。
- 新增账号页，展示当前账号、任务额度、并发额度、文件大小、存储额度和文件保留时间。
- 建立统一异常状态机制：404、401、403、网络错误、空状态、模块错误。
- 基于后端 Swagger/OpenAPI 文档生成前端 API 文件，减少手写 DTO 漂移。
- Vite 本地调试使用默认地址 `http://localhost:5173/`。

## 3. 非目标

- 不引入 Ant Design、Umi、Pro Components 或新路由框架。
- 不做复杂营销首页、仪表盘大屏、计费订阅、团队协作或通知中心。
- 不做独立报告中心；报告入口仅作为任务筛选快捷入口。
- 不在本阶段重写所有业务逻辑为 hooks 框架；只围绕本次页面和 API 契约做必要拆分。
- 不手写复杂 Table 抽象、主题 DSL 或过度通用组件。

## 4. 路由与导航

| 路由 | 名称 | 鉴权 | 说明 |
| --- | --- | --- | --- |
| `/` | 解析 | 否 | 默认入口，首屏解析器和解析结果 |
| `/tasks` | 任务 | 是 | 任务列表、状态筛选、任务管理 |
| `/tasks?state=SUCCEEDED` | 报告 | 是 | 顶部“报告”入口跳转目标，复用任务页已完成筛选 |
| `/tasks/:taskId` | 任务详情 | 是 | 状态、事件、操作、下载、PDF 导出 |
| `/account` | 账号 | 是 | 用户资料与额度 |
| `/auth` | 登录 | 否 | 登录入口与 token 回跳 |
| `/workbench` | 兼容重定向 | 是 | 重定向到 `/tasks`，保留旧链接可用性 |
| `*` | 404 | 否 | 未知路由展示 NotFoundPage |

顶部布局：

- 左侧：产品名“万能视频下载器”和简短副标题。
- 中间：解析、任务、报告、账号。
- 右侧：未登录显示“登录”，已登录显示用户名称或邮箱缩写、退出入口。
- 移动端：导航可横向滚动或折叠为紧凑入口，优先保证“解析”和“任务”可见。

## 5. 页面功能设计

### 5.1 解析页 `/`

核心功能是链接解析和创建任务。

- PageHeader：标题“万能视频解析下载器”，描述当前支持公开分享链接解析。
- ParserPanel：视频链接输入框、解析按钮、登录提示。
- ParseResultPanel：封面、标题、平台、合规提示、格式列表、创建任务按钮。
- CapabilityStrip：只展示真实能力，多平台解析、格式选择、任务队列、PDF 报告。
- 未登录点击解析时保存 `sessionStorage.video_web_pending_url` 并跳转 `/auth`。
- 登录回跳后恢复 pending URL，继续停留在解析页。

### 5.2 任务页 `/tasks`

核心功能是任务管理。

- PageHeader：标题“下载任务”，右侧提供“新建解析”按钮。
- TaskFilters：全部、进行中、已完成、失败。
- 桌面端：列表/表格型任务行，字段为标题、状态、进度、格式、更新时间、操作。
- 移动端：任务卡片，展示标题、状态、进度、格式、更新时间和详情入口。
- 列表操作保持克制，只保留“详情”；下载和 PDF 导出进入详情页执行。
- 空态：没有任务时引导返回解析页。

### 5.3 报告入口

顶部“报告”不是独立页面，而是跳转 `/tasks?state=SUCCEEDED`。

- 任务页读取 query 参数并选中“已完成”筛选。
- 已完成任务在列表中提示“报告可导出”。
- 如果没有已完成任务，显示“暂无可导出的报告”，并引导返回解析页。

### 5.4 任务详情 `/tasks/:taskId`

核心功能是任务状态与操作。

- 状态摘要：标题、状态、进度、格式、更新时间。
- 操作区：返回任务、取消、重试、获取下载链接、导出 PDF 报告。
- AI 摘要区：存在 `ai_summary` 或 `ai_mindmap` 时展示；不存在时显示轻量空态。
- 事件流：保留日志列表，不做复杂时间线。
- PDF 导出：只在任务完成后启用，请求后端 `/api/tasks/{task_id}/pdf` 并使用 blob URL 下载或打开。

### 5.5 账号页 `/account`

只展示基础资料和额度，不做完整设置中心。

- AccountSummary：邮箱、显示名、头像、账号状态。
- QuotaList：每日任务额度、并发额度、最大文件大小、存储额度、文件保留时间。
- 未登录访问时跳转 `/auth`。
- 已登录可退出，退出后清理 token 并回到解析页。

## 6. 布局与视觉规范

设计目标是“干净、有层级、可扫视”。

| Token | 值 | 用途 |
| --- | --- | --- |
| Primary | `#1677ff` | 主按钮、链接、关键状态 |
| Primary hover | `#4096ff` | 悬停与轻强调 |
| Text | `#101828` | 主文本 |
| Muted | `#475467` | 辅助文本 |
| Border | `#d0d7e2` | 边框 |
| Page bg | `#f5f8fc` | 页面背景 |
| Surface | `#ffffff` | 内容区 |
| Success | `#16a34a` | 成功状态 |
| Warning | `#f59e0b` | 等待/警告 |
| Error | `#dc2626` | 错误状态 |

布局约束：

- 顶部导航高度控制在 56-60px。
- 桌面内容区 `max-width: 1180px`，移动端左右 16px。
- 页面使用 PageContainer：标题区、操作区、内容区。
- 页面本身不套一个大卡片；卡片只用于独立模块或任务卡片。
- 卡片圆角 8px，按钮和输入框满足 44px 触控目标。
- 不使用大面积紫色渐变、装饰性 blob、复杂插画或营销大屏。
- 动效控制在 150-300ms，并尊重 `prefers-reduced-motion`。

## 7. 组件化边界

只做服务当前需求的组件，不做过度抽象。

```text
src/components/layout/
  AppLayout.tsx
  PageContainer.tsx
  PageHeader.tsx

src/components/states/
  EmptyState.tsx
  ErrorState.tsx
  LoadingState.tsx
  NotFoundPage.tsx
  ForbiddenState.tsx

src/features/parser/
  ParserPanel.tsx
  ParseResultPanel.tsx

src/features/tasks/
  TaskFilters.tsx
  TaskList.tsx
  TaskMobileCard.tsx
  TaskStatusBadge.tsx

src/features/account/
  AccountSummary.tsx
  QuotaList.tsx

src/services/
  generated/
  request.ts
  api.ts
```

拆分原则：

- 页面负责路由和数据编排。
- feature 组件负责单一业务展示和交互。
- `components/layout` 只处理布局，不理解任务业务。
- `components/states` 只处理状态反馈，不发请求。
- `services/generated` 自动生成，禁止手改。
- `services/api.ts` 面向页面提供稳定业务函数，避免页面直接依赖生成方法名。

## 8. 异常处理机制

| 场景 | 行为 |
| --- | --- |
| 404 未知路由 | 展示 NotFoundPage，提供返回解析页和任务页 |
| 401 未登录/登录失效 | 清理 token，跳转 `/auth`；pending URL 仍可恢复 |
| 403 无权限 | 展示 ForbiddenState，提供返回任务页 |
| 422 输入错误 | 展示在表单附近，文案优先使用后端 `error.message` |
| 429 限流 | 展示“请求太频繁，请稍后再试” |
| 5xx/网络错误 | 展示 ErrorState，提供重试 |
| 空任务 | EmptyState 引导去解析页 |
| 空报告 | EmptyState 提示暂无可导出的报告 |
| 空 AI 摘要 | 轻量提示 AI 摘要暂不可用 |

API 错误统一通过 `normalizeApiError(error)` 转换为 `{ code, message, details }`。页面和组件只消费规范化错误，不直接解析 axios 原始结构。

## 9. OpenAPI 生成 API 文件

后端 FastAPI 作为接口契约来源：

- Swagger UI：`http://localhost:8000/docs`
- ReDoc：`http://localhost:8000/redoc`
- OpenAPI JSON：`http://localhost:8000/openapi.json`

前端生成流程：

```text
video-server /openapi.json
        ↓
npm run api:generate
        ↓
src/services/generated/
        ↓
src/services/request.ts
        ↓
src/services/api.ts
        ↓
pages/features
```

建议使用 Vite 友好的 OpenAPI codegen，例如 `@hey-api/openapi-ts`。它只用于生成 TypeScript client，不改变项目框架。

脚本建议：

- `npm run api:generate`：从 `VITE_OPENAPI_URL` 或默认 `http://localhost:8000/openapi.json` 生成 API client。
- `npm run api:check`：CI 中校验生成文件是否与 OpenAPI schema 同步。

验收边界：

- 本地后端启动后 `/docs` 和 `/openapi.json` 可访问。
- 生成文件放在 `src/services/generated/`。
- 生成文件禁止手改。
- 页面不新增散落 axios 请求。
- 手写 `src/lib/api.ts` 逐步迁移到 `src/services/api.ts`，不要求一次删除所有旧入口。

## 10. 测试策略

所有实现继续遵循 Red -> Green -> Refactor。

组件/单元测试：

- 顶部导航四入口和 active 状态。
- `/workbench` 重定向 `/tasks`。
- 报告入口跳转 `/tasks?state=SUCCEEDED` 并选中已完成。
- 账号页展示资料和额度。
- 401 清 token 并跳转登录。
- 404 页面展示返回操作。
- 任务页桌面列表核心字段和移动卡片核心字段。
- OpenAPI generated API 外层业务封装和错误归一化。

E2E：

- 首页解析到任务详情。
- 未登录 pending URL 恢复。
- 报告入口筛选已完成任务。
- 未知路径展示 404。

验证命令：

- `npm test`
- `npm run build`
- `npm run test:e2e`
- `npm run api:generate`
- `npm run api:check`

本地启动：

- `npm run dev`
- `http://localhost:5173/`

## 11. 任务拆分建议

本设计拆成 4 个 feature PR：

1. SaaS Layout Shell：顶部布局、路由命名、PageContainer、404。
2. Tasks/Reports/Account：任务页响应式、报告入口、账号额度页。
3. Error States：统一异常组件、401/403/429/5xx 错误处理。
4. OpenAPI Generated API：后端 OpenAPI 契约检查、前端生成 API、业务封装迁移基线。

每个 PR 必须有对应小 issue、红绿测试证据和 code review 检查项。

## 12. 风险与边界

- OpenAPI 生成可能产生较长方法名，页面不得直接依赖生成命名，应通过业务封装隔离。
- FastAPI OpenAPI schema 中部分 response model 若缺失，会影响生成质量，需要后端 issue 配合修正。
- `/tasks` 替代 `/workbench` 需要兼容旧路由，不能破坏已有链接。
- 报告入口复用任务筛选，不能虚构独立报告中心。
- 账号页只能展示后端已有字段，不做前端虚拟额度。
- 本阶段不做主题编辑器、复杂仪表盘、团队管理、计费订阅。

## 13. 自审记录

- Placeholder scan：无 TBD/TODO 占位。
- Consistency：路由、导航、报告入口和任务拆分保持一致。
- Scope：聚焦前端 SaaS 布局、异常机制和 API 契约生成，不进入无后端支撑的商业化模块。
- Ambiguity：明确保留 RadixUI，不引入 antd/Umi；明确 Vite 默认 5173；明确报告入口不是独立报告中心。

## 14. 变更记录

| 日期 | 作者 | 版本 | 变更说明 |
| --- | --- | --- | --- |
| 2026-05-23 | StephenQiu30 | 0.1.0 | 初始化 SaaS 顶部布局、异常机制与 OpenAPI API 生成设计 |
