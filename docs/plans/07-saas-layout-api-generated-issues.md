---
layer: plans
doc_no: "PLAN-007"
audience:
  - PM
  - Dev
  - QA
feature_area: saas-layout-openapi
purpose: "拆分 video-web SaaS 顶部布局、响应式任务体验、异常状态和 OpenAPI 生成 API 的小粒度 GitHub issues。"
canonical_path: "docs/plans/07-saas-layout-api-generated-issues.md"
status: draft
version: "0.1.0"
owner: "StephenQiu30"
inputs:
  - "docs/design/03-saas-layout-api-generated-redesign.md"
outputs:
  - "M3 issue 拆分与 PR 分组"
triggers:
  - "开始 M3 SaaS 布局与 API 契约生成工作"
downstream:
  - "GitHub Issues"
  - "docs/acceptance/02-issue-pr-映射.md"
---

# M3 SaaS 布局与 OpenAPI API 生成任务拆分

## 1. 执行原则

- 不直接进入实现；先完成 issue、milestone、labels 和任务自审。
- 每个功能 issue 都要求 Red -> Green -> Refactor。
- 提交顺序继续遵循 `test:m3-*` -> `impl:m3-*` -> `refactor:m3-*` -> `docs:m3-*`。
- 一个完整 feature 一个 PR，不做一次修改一个 PR。
- 前端本地调试地址固定为 Vite 默认 `http://localhost:5173/`。
- 设计参考 Ant Design Pro 布局范式，但不引入 antd、Umi 或 Pro Components。
- 正式文档只写入 `docs/design`、`docs/plans`、`docs/acceptance`、`docs/operations`，不写 `docs/superpowers`。

## 2. Milestone

| 仓库 | Milestone | 目标 |
| --- | --- | --- |
| `video-web` | `M3 SaaS 顶部布局与 OpenAPI API 生成` | 完成前端 SaaS 顶部布局、响应式任务体验、异常机制和 generated API 基线 |
| `video-server` | `M3 OpenAPI 契约文档支撑` | 确认 Swagger/OpenAPI 可用、补齐前端生成 API 所需契约说明和缺口 |

## 3. PR 分组

| PR 组 | 仓库 | Issues | 说明 |
| --- | --- | --- | --- |
| PR-A | video-web | #55, #56, #57, #58 | SaaS layout shell、路由、PageContainer、404 |
| PR-B | video-web | #59, #60, #61, #62 | 任务页、报告入口、账号页、响应式 |
| PR-C | video-web | #63, #64, #65 | 异常状态、错误归一化、401/403/429/5xx |
| PR-D | video-web | #66, #67, #68, #69 | OpenAPI 生成 API、业务封装迁移、生成校验 |
| PR-E | video-server | #49, #50, #51 | Swagger/OpenAPI 契约确认、导出脚本或文档、schema 缺口检查 |

PR 顺序建议：PR-E 可与 PR-A 并行准备，但 PR-D 必须依赖 PR-E 的 OpenAPI 契约结论。

## 4. GitHub issue 映射

### 4.1 video-web

| 编号 | 标题 | PR 组 |
| --- | --- | --- |
| #55 | `[P1][frontend][layout] SaaS 顶部导航与 AppLayout 基线` | PR-A |
| #56 | `[P1][frontend][layout] PageContainer 与 PageHeader 统一页面骨架` | PR-A |
| #57 | `[P1][frontend][route] /tasks 路由替代 /workbench 并保留兼容重定向` | PR-A |
| #58 | `[P1][frontend][state] 404 NotFoundPage 与未知路由回退` | PR-A |
| #59 | `[P1][frontend][tasks] 任务页桌面列表与移动卡片响应式` | PR-B |
| #60 | `[P1][frontend][report] 顶部报告入口跳转已完成任务筛选` | PR-B |
| #61 | `[P1][frontend][account] 账号页展示用户资料与额度` | PR-B |
| #62 | `[P1][frontend][parser] 解析页适配新 PageContainer 与 SaaS 视觉节奏` | PR-B |
| #63 | `[P1][frontend][errors] Empty/Error/Loading/Forbidden 状态组件` | PR-C |
| #64 | `[P1][frontend][api-contract] normalizeApiError 与 429/5xx 文案` | PR-C |
| #65 | `[P1][frontend][auth] 401 统一清 token 并跳转登录` | PR-C |
| #66 | `[P1][frontend][api-generated] OpenAPI 生成工具与目录基线` | PR-D |
| #67 | `[P1][frontend][api-generated] request.ts 统一 baseURL/token/错误处理` | PR-D |
| #68 | `[P1][frontend][api-generated] services/api.ts 业务封装迁移基线` | PR-D |
| #69 | `[P1][frontend][ci] api:check 与生成文件同步校验` | PR-D |

### 4.2 video-server

| 编号 | 标题 | PR 组 |
| --- | --- | --- |
| #49 | `[P1][backend][api-contract] Swagger/OpenAPI 本地契约验收` | PR-E |
| #50 | `[P1][backend][api-contract] OpenAPI response model 缺口检查` | PR-E |
| #51 | `[P1][backend][docs] OpenAPI 导出与前端生成协作说明` | PR-E |

## 5. video-web issues

### M3-W1 #55 `[P1][frontend][layout] SaaS 顶部导航与 AppLayout 基线`

- Epic：`epic:saas-layout`
- 类型：`type:frontend`, `type:ui`, `type:architecture`
- Workflow：`workflow:tdd`, `workflow:review`
- 产出：
  - `AppLayout` 组件。
  - 顶部导航：解析、任务、报告、账号。
  - 登录态账号区。
- 验收：
  - 导航 active 状态测试通过。
  - 未登录/已登录账号区测试通过。
  - 不引入 antd/Umi。

### M3-W2 #56 `[P1][frontend][layout] PageContainer 与 PageHeader 统一页面骨架`

- Epic：`epic:saas-layout`
- 类型：`type:frontend`, `type:ui`
- Workflow：`workflow:tdd`
- 产出：
  - `PageContainer`。
  - `PageHeader`。
  - 解析、任务、详情、账号页统一标题区。
- 验收：
  - 页面标题、描述、右侧操作测试覆盖。
  - 页面不再使用单个大卡片承载整页。

### M3-W3 #57 `[P1][frontend][route] /tasks 路由替代 /workbench 并保留兼容重定向`

- Epic：`epic:saas-layout`
- 类型：`type:frontend`, `type:core`
- Workflow：`workflow:tdd`, `workflow:e2e`
- 产出：
  - `/tasks` 任务页。
  - `/workbench` 重定向到 `/tasks`。
  - 旧 E2E 路径更新。
- 验收：
  - `/workbench` 兼容重定向测试通过。
  - 未登录访问 `/tasks` 仍跳转 `/auth`。

### M3-W4 #58 `[P1][frontend][state] 404 NotFoundPage 与未知路由回退`

- Epic：`epic:error-states`
- 类型：`type:frontend`, `type:ui`
- Workflow：`workflow:tdd`, `workflow:e2e`
- 产出：
  - `NotFoundPage`。
  - 未知路由展示返回解析页和任务页。
- 验收：
  - 单测覆盖未知路由。
  - E2E 覆盖 `/unknown-path`。

### M3-W5 #59 `[P1][frontend][tasks] 任务页桌面列表与移动卡片响应式`

- Epic：`epic:task-experience`
- 类型：`type:frontend`, `type:ui`, `type:core`
- Workflow：`workflow:tdd`
- 产出：
  - `TaskList`。
  - `TaskMobileCard`。
  - 桌面列表、移动卡片 CSS。
- 验收：
  - 核心字段：标题、状态、进度、格式、更新时间、详情入口。
  - 不在列表中堆叠下载/PDF 复杂操作。

### M3-W6 #60 `[P1][frontend][report] 顶部报告入口跳转已完成任务筛选`

- Epic：`epic:task-experience`
- 类型：`type:frontend`, `type:report`, `type:core`
- Workflow：`workflow:tdd`, `workflow:e2e`
- 产出：
  - 顶部“报告”链接跳转 `/tasks?state=SUCCEEDED`。
  - 任务页读取 query 并选中已完成筛选。
- 验收：
  - 已完成筛选 E2E 通过。
  - 空报告状态文案为“暂无可导出的报告”。

### M3-W7 #61 `[P1][frontend][account] 账号页展示用户资料与额度`

- Epic：`epic:account-quota`
- 类型：`type:frontend`, `type:auth`, `type:ui`
- Workflow：`workflow:tdd`
- 产出：
  - `/account`。
  - `AccountSummary`。
  - `QuotaList`。
- 验收：
  - 展示邮箱、显示名、任务额度、并发额度、最大文件大小、存储额度、保留时间。
  - 未登录访问跳转 `/auth`。

### M3-W8 #62 `[P1][frontend][parser] 解析页适配新 PageContainer 与 SaaS 视觉节奏`

- Epic：`epic:conversion-parser`
- 类型：`type:frontend`, `type:ui`
- Workflow：`workflow:tdd`
- 产出：
  - `ParserPanel`。
  - `ParseResultPanel`。
  - 首页使用新页面骨架。
- 验收：
  - pending URL 现有测试继续通过。
  - 解析、格式选择、创建任务链路不回退。

### M3-W9 #63 `[P1][frontend][errors] Empty/Error/Loading/Forbidden 状态组件`

- Epic：`epic:error-states`
- 类型：`type:frontend`, `type:ui`
- Workflow：`workflow:tdd`
- 产出：
  - `EmptyState`。
  - `ErrorState`。
  - `LoadingState`。
  - `ForbiddenState`。
- 验收：
  - 任务空态、报告空态、详情错误态复用统一组件。

### M3-W10 #64 `[P1][frontend][api-contract] normalizeApiError 与 429/5xx 文案`

- Epic：`epic:error-states`
- 类型：`type:frontend`, `type:data`, `type:api-contract`
- Workflow：`workflow:tdd`
- 产出：
  - `normalizeApiError(error)`。
  - 422、429、5xx、网络错误文案归一化。
- 验收：
  - 单测覆盖后端统一错误 envelope。
  - 页面不直接解析 axios 原始错误。

### M3-W11 #65 `[P1][frontend][auth] 401 统一清 token 并跳转登录`

- Epic：`epic:error-states`
- 类型：`type:frontend`, `type:auth`, `type:data`
- Workflow：`workflow:tdd`, `workflow:e2e`
- 产出：
  - API 或 auth hook 统一处理 401。
  - 保留 pending URL 恢复逻辑。
- 验收：
  - 401 后 localStorage token 被清理。
  - 页面跳转 `/auth`。

### M3-W12 #66 `[P1][frontend][api-generated] OpenAPI 生成工具与目录基线`

- Epic：`epic:api-generated`
- 类型：`type:frontend`, `type:data`, `type:api-contract`, `type:devops`
- Workflow：`workflow:tdd`, `workflow:review`
- 产出：
  - `src/services/generated/`。
  - `npm run api:generate`。
  - 生成文件说明。
- 验收：
  - 可从 `http://localhost:8000/openapi.json` 生成 client。
  - generated 目录禁止手改的说明写入文档。

### M3-W13 #67 `[P1][frontend][api-generated] request.ts 统一 baseURL/token/错误处理`

- Epic：`epic:api-generated`
- 类型：`type:frontend`, `type:data`
- Workflow：`workflow:tdd`
- 产出：
  - `src/services/request.ts`。
  - token 注入。
  - 401 和错误归一化接入点。
- 验收：
  - 单测覆盖 token header。
  - 单测覆盖 401 行为。

### M3-W14 #68 `[P1][frontend][api-generated] services/api.ts 业务封装迁移基线`

- Epic：`epic:api-generated`
- 类型：`type:frontend`, `type:data`, `type:api-contract`
- Workflow：`workflow:tdd`
- 产出：
  - `src/services/api.ts`。
  - 解析、任务、详情、下载、PDF、me 的业务封装。
  - 逐步替代 `src/lib/api.ts`。
- 验收：
  - 页面不直接依赖 generated 方法名。
  - 现有 API 测试迁移或保持兼容。

### M3-W15 #69 `[P1][frontend][ci] api:check 与生成文件同步校验`

- Epic：`epic:api-generated`
- 类型：`type:frontend`, `type:ci`, `type:devops`
- Workflow：`workflow:tdd`, `workflow:review`
- 产出：
  - `npm run api:check`。
  - CI 或本地校验 generated API 未同步。
- 验收：
  - schema 与 generated 不一致时校验失败。
  - README 或 operations 文档说明联调方式。

## 6. video-server issues

### M3-S1 #49 `[P1][backend][api-contract] Swagger/OpenAPI 本地契约验收`

- Epic：`epic:openapi-contract`
- 类型：`type:backend`, `type:api-contract`, `type:docs`
- Workflow：`workflow:review`
- 产出：
  - 记录 `/docs`、`/redoc`、`/openapi.json` 的本地验收方式。
  - 若生产环境禁用 docs，需要明确本地/生产差异。
- 验收：
  - `curl http://localhost:8000/openapi.json` 可获得 JSON。
  - Swagger UI 可访问或有明确配置说明。

### M3-S2 #50 `[P1][backend][api-contract] OpenAPI response model 缺口检查`

- Epic：`epic:openapi-contract`
- 类型：`type:backend`, `type:api-contract`, `type:test`
- Workflow：`workflow:tdd`, `workflow:review`
- 产出：
  - 检查解析、任务、详情、下载、PDF、me、错误响应是否有可生成 schema。
  - 缺失 response model 的接口列出修正项。
- 验收：
  - 前端 codegen 不因关键接口缺少 schema 失败。

### M3-S3 #51 `[P1][backend][docs] OpenAPI 导出与前端生成协作说明`

- Epic：`epic:openapi-contract`
- 类型：`type:backend`, `type:docs`, `type:api-contract`
- Workflow：`workflow:review`
- 产出：
  - 后端 docs 说明如何导出 `openapi.json`。
  - 前端 `npm run api:generate` 的依赖说明。
- 验收：
  - 文档包含本地端口 `8000` 与前端默认端口 `5173`。

## 7. 任务自审

### 6.1 是否过度设计

- 未加入计费、团队、通知、复杂报告中心、复杂仪表盘。
- 报告入口复用已完成任务筛选，符合真实功能。
- 账号页只展示已有用户字段和额度，不做设置中心。

### 6.2 是否有后端依赖未说明

- OpenAPI 生成依赖后端 `/openapi.json`。
- PDF 报告依赖已有 `/api/tasks/{task_id}/pdf`。
- 账号额度依赖 `/api/auth/me` 已返回字段。
- 如果 OpenAPI schema 缺 response model，由 M3-S2 先发现并修正。

### 6.3 是否可 TDD

- 每个前端功能 issue 都有明确组件/路由/API 行为可写失败测试。
- E2E 仅覆盖关键路径：pending URL、报告筛选、404、解析到详情。
- 后端 OpenAPI issue 以契约测试和文档验收为主，不混入前端实现。

### 6.4 PR 分组是否合理

- PR-A 先改壳层，避免后续页面重复套布局。
- PR-B 再改任务/报告/账号业务页面。
- PR-C 统一异常机制，避免页面散落错误处理。
- PR-D 最后接 codegen，避免布局重构和 API 生成互相干扰。
- PR-E 可先行确认后端契约，降低 PR-D 风险。

### 6.5 风险控制

- `/workbench` 兼容重定向避免旧链接失效。
- generated API 与业务封装分层，避免页面绑定生成器命名。
- Vite 默认 5173 写入验收标准，避免启动地址漂移。

## 8. GitHub issue 标签建议

需要新增标签：

- `epic:saas-layout`
- `epic:error-states`
- `epic:account-quota`
- `epic:api-generated`
- `epic:openapi-contract`

复用已有标签：

- `priority:P1`
- `workflow:tdd`
- `workflow:e2e`
- `workflow:review`
- `type:frontend`
- `type:backend`
- `type:ui`
- `type:core`
- `type:data`
- `type:api-contract`
- `type:docs`
- `type:devops`
- `type:ci`
- `type:auth`
- `type:report`
- `agent:ready`

## 9. issue 创建后的确认项

- 所有 issue 都绑定 milestone。
- 所有 issue 至少包含 priority、type、workflow、agent:ready。
- 所有 issue 标题可独立理解，不依赖上下文。
- issue body 包含产出和验收标准。
- 不创建实现分支，不启动实现工作。
