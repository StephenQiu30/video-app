---
layer: design
doc_no: "DESIGN-004"
audience:
  - PM
  - Dev
  - QA
  - Ops
feature_area: ant-design-pro-admin-system
purpose: "定义 video-web 基于 Ant Design Pro 官方技术栈重建用户工作台与管理后台一体化系统的方案。"
canonical_path: "docs/design/04-ant-design-pro-admin-system.md"
status: draft
version: "0.1.0"
owner: "StephenQiu30"
inputs:
  - "AGENTS.md"
  - "docs/design/03-saas-layout-api-generated-redesign.md"
  - "video-server OpenAPI 契约"
  - "Ant Design Pro 官方脚手架与 ProComponents 文档"
outputs:
  - "Ant Design Pro 一体化后台架构设计"
  - "页面、权限、菜单、API 生成和旧代码清理边界"
triggers:
  - "前端主框架重建"
  - "后台管理系统重构"
  - "用户工作台与管理员后台合并"
downstream:
  - "docs/plans/08-ant-design-pro-admin-system-issues.md"
  - "docs/acceptance/02-issue-pr-映射.md"
---

# Ant Design Pro 一体化后台系统设计

## 1. 背景

当前 `video-web` 已经具备解析下载、任务列表、账号信息、异常状态和 OpenAPI API 生成能力，但页面观感仍偏自研 MVP，后台系统的稳定感、信息密度和权限菜单能力不足。用户已确认下一阶段不继续修补当前 Vite 布局，也不兼容旧页面实现，而是采用 Ant Design Pro 官方默认技术栈，重建一个“用户工作台 + 管理后台一体化”的成熟后台系统。

本设计覆盖框架重建、页面结构、权限菜单、API 生成、测试门禁、旧代码清理和 PR 拆分。目标是用官方脚手架建立干净基线，再按 feature 重新实现业务能力，不保留旧页面代码、旧自研组件、无关演示页和中间产物。

## 2. 目标

1. 使用 Ant Design Pro 官方脚手架作为新前端基线，接受 Umi Max、Ant Design、ProComponents 和官方默认启动方式。
2. 建立用户工作台与管理员后台一体化系统：
   - 普通用户可解析视频、创建下载任务、查看任务、下载文件和导出 PDF。
   - 管理员额外可访问用户管理、任务监控、系统状态和平台能力页面。
3. 精简官方脚手架，只保留项目需要的布局、登录、权限、菜单、请求、OpenAPI、测试和构建能力。
4. 继续通过后端 `video-server` OpenAPI 契约生成前端 API client，避免手写 DTO 漂移。
5. 使用蓝白色主题，减少装饰，界面风格接近成熟 SaaS 后台，而不是营销落地页。
6. 删除旧 Vite 页面、Radix UI 组件、自研 layout、自研视觉样式和旧路由兼容逻辑，避免新系统被旧界面影响。
7. 每个实现阶段继续遵循 Red -> Green -> Refactor 和 feature PR 分组。

## 3. 非目标

- 不继续要求 Vite 默认端口 `5173`；本阶段接受 Ant Design Pro 官方默认开发方式和端口。
- 不兼容旧页面结构、旧组件 API、旧 CSS token、旧 `/workbench` 工作台入口或旧页面测试实现。
- 不把官方示例页、示例 mock、演示图表和无关国际化内容带入正式项目。
- 不在首轮实现计费、团队协作、消息通知、复杂审计日志或复杂配置中心。
- 不重写后端接口；前端以现有 OpenAPI 契约和必要后端后续 issue 为边界。
- 不做炫技大屏、过度动效、复杂渐变或装饰性插画。

## 4. 技术选型

| 层级 | 选择 | 说明 |
| --- | --- | --- |
| 应用框架 | Umi Max | 使用 Ant Design Pro 官方默认应用框架 |
| UI 体系 | Ant Design 5 | 基础组件、表单、反馈和主题能力 |
| 高级组件 | ProComponents | `ProLayout`、`PageContainer`、`ProTable`、`ProForm`、`ProCard` |
| 语言 | TypeScript | 保持严格类型边界 |
| API 生成 | Ant Design Pro openapi 工作流 | 使用官方脚手架约定的 OpenAPI 生成方式 |
| 请求层 | Umi request / request interceptor | 统一 token、401、错误提示和响应封装 |
| 测试 | 脚手架默认测试 + Playwright | 以脚手架默认能力为准，保留 E2E 验证 |
| 样式 | Ant Design token + 少量全局样式 | 蓝白主题，避免自研大量 CSS |

## 5. 信息架构

系统采用一个应用、两类角色、同一套登录体系。

### 5.1 普通用户菜单

| 路由 | 菜单 | 目标 |
| --- | --- | --- |
| `/` 或 `/parser` | 解析下载 | 粘贴链接、解析视频、选择格式、创建任务 |
| `/tasks` | 下载任务 | 任务列表、状态筛选、进度查看、详情入口 |
| `/tasks/:taskId` | 任务详情 | 下载链接、取消、重试、PDF 报告、事件日志 |
| `/account` | 账号中心 | 用户资料、额度、并发、存储、文件保留时间 |

### 5.2 管理员菜单

| 路由 | 菜单 | 目标 |
| --- | --- | --- |
| `/admin/users` | 用户管理 | 用户列表、启用/禁用、额度查看和后续调整入口 |
| `/admin/tasks` | 任务监控 | 全局任务状态、失败任务、队列和下载异常查看 |
| `/admin/system` | 系统状态 | `/health`、`/ready`、OpenAPI、Redis、存储、媒体工具状态 |
| `/admin/platforms` | 平台能力 | B站、抖音、快手等平台支持状态与限制说明 |

### 5.3 路由边界

- `/auth` 保留 OAuth token 回跳处理。
- 未登录访问受保护页面跳转登录页。
- 非管理员访问 `/admin/*` 展示 403 页面。
- `/workbench` 不再作为兼容入口保留；旧链接访问时进入 404 或统一跳转到登录后首页，具体行为以 Ant Design Pro 路由实现为准。

## 6. 页面设计

### 6.1 登录页

登录页使用 Ant Design Pro 登录模板的克制版本：

- 支持邮箱密码登录。
- 支持 GitHub OAuth 登录入口。
- OAuth 回跳读取 `token` 后写入本地认证状态。
- 登录成功后优先跳转 pending URL，其次跳转 `/parser`。
- 登录失败展示统一错误提示，不暴露后端内部异常。

### 6.2 解析下载页

解析页是普通用户的主工作台，首屏即解析：

- `PageContainer` 标题为“解析下载”。
- `ProForm` 承载 URL 输入、解析按钮和登录提示。
- 解析结果用 `ProCard` 展示封面、标题、平台、合规提示和格式选择。
- 创建任务成功后跳转任务详情或展示“查看任务”操作。
- 未登录点击解析时保存 pending URL 并跳转登录页。

### 6.3 下载任务页

任务页用 `ProTable` 承载核心列表：

- 支持状态筛选：全部、排队中、下载中、已完成、失败。
- 列字段：标题、平台/格式、状态、进度、更新时间、操作。
- 操作保留：详情、重试、取消；下载和 PDF 在详情页完成。
- 移动端使用 ProTable 自适应与必要的列隐藏，不改成卡片瀑布流。

### 6.4 任务详情页

任务详情使用 `PageContainer + ProCard`：

- 基础信息：标题、来源、格式、状态、进度、文件大小、过期时间。
- 操作区：取消、重试、获取下载链接、导出 PDF。
- AI 区：存在摘要或思维导图时展示；无内容时显示轻量空状态。
- 事件区：任务状态事件列表，保留排障信息。

### 6.5 账号中心

账号中心展示当前用户资料和额度：

- 用户基础资料：邮箱、显示名、头像、账号状态。
- 配额信息：每日任务额度、并发额度、最大文件大小、存储额度、保留时间。
- 退出登录清理 token 并返回解析页。

### 6.6 管理员页面

管理员页面首轮只做上线级可用的只读或轻操作管理，不做复杂配置：

- 用户管理：`ProTable` 列出用户，支持搜索邮箱、查看角色与状态。
- 任务监控：`ProTable` 列出全局任务，支持状态筛选和失败原因查看。
- 系统状态：展示 health/ready 检查项，失败项清晰标红。
- 平台能力：展示平台名称、分类、支持能力、合规说明和当前限制。

## 7. 权限与状态

认证状态由 `access_token` 驱动：

1. 登录成功后保存 token。
2. 请求拦截器为 API 请求追加 `Authorization: Bearer <token>`。
3. 应用启动时请求 `/api/auth/me` 获取当前用户。
4. `is_admin` 控制管理员菜单和 `/admin/*` 路由访问。
5. 401 统一清理 token 并跳转登录页。
6. 403 展示无权限页面，不自动退出登录。

本地存储 key 由新 Ant Design Pro 应用重新定义。旧 token 和旧本地状态不作为兼容目标；如果存在旧状态导致异常，新系统应清理并重新登录。

## 8. API 与 OpenAPI

后端契约来源为 `video-server`：

- Swagger UI：`http://localhost:8000/docs`
- OpenAPI JSON：`http://localhost:8000/openapi.json`
- 仓库导出脚本：`video-server/scripts/export_openapi.py`

前端重建原则：

1. 优先使用 Ant Design Pro 官方 openapi 生成工作流。
2. 生成文件放入 `src/services/generated` 或脚手架约定的 `src/services/<api>` 目录。
3. 生成文件禁止手工修改。
4. 页面通过业务 service 或 model 调用 API，不在页面散落 fetch/axios。
5. 不保留旧 `@hey-api/openapi-ts` 生成链路作为常规路径；如官方生成工具遇到阻塞，需要先修正后端契约或单独提交技术决策，不在实现中做双生成体系。

首轮需要覆盖的接口：

- `POST /api/auth/login`
- `GET /api/auth/me`
- `POST /api/parse`
- `POST /api/tasks`
- `GET /api/tasks`
- `GET /api/tasks/{task_id}`
- `POST /api/tasks/{task_id}/cancel`
- `POST /api/tasks/{task_id}/retry`
- `GET /api/tasks/{task_id}/download-link`
- `GET /api/tasks/{task_id}/pdf`
- `GET /health`
- `GET /ready`
- `GET /api/admin/metrics`

## 9. 工程重建策略

重建采用“官方脚手架基线 -> 删除旧前端实现 -> 精简官方示例 -> 重新实现业务 -> 管理增强”的顺序。后续实现不得以现有 Vite 页面为视觉或结构参考，也不在旧 Vite 项目上继续堆布局。

### 9.1 保留资产

- `AGENTS.md`
- `docs/`
- `docs/openapi/video-server.openapi.json`
- Docker 与运行文档中的部署边界
- 后端 OpenAPI 契约和已确认的产品功能边界

### 9.2 替换资产

- `src/` 以 Ant Design Pro 脚手架为新基线重建，旧 `src/` 页面和组件全部删除。
- `vite.config.ts`、Vite 入口、Radix UI 依赖、自研 UI 组件、自研 layout 和旧 CSS 全部移除。
- 旧 `AppLayout`、`PageContainer`、自研卡片、按钮、状态组件、页面测试和视觉样式不迁移、不适配、不作为参考。
- 旧 `package.json` 脚本按 Ant Design Pro 官方脚手架重建，避免保留 Vite 时代的启动、构建和测试假象。

### 9.3 精简规则

删除官方脚手架中的：

- 示例业务页面。
- 示例 mock 数据。
- 无关图表与演示数据。
- 不使用的国际化文案。
- 与本项目无关的区块和菜单。

保留官方脚手架中的：

- 应用配置。
- 登录与权限模式。
- `ProLayout`。
- 请求与错误处理模式。
- OpenAPI 生成能力。
- 测试、lint、build 基础脚本。

## 10. 测试策略

继续遵循 Red -> Green -> Refactor。

### 10.1 单元与组件测试

首轮测试保护以下行为：

- 登录成功后 token 持久化。
- 401 清理 token 并跳转登录页。
- 普通用户看不到管理员菜单。
- 管理员可以看到管理员菜单。
- 解析页未登录保存 pending URL。
- 任务状态渲染为正确的 Badge/Tag。
- PDF 导出按钮仅在任务完成后可用。

### 10.2 E2E 测试

Playwright 覆盖：

1. 未登录访问 `/tasks` 跳转登录页。
2. 登录后进入解析页。
3. 解析公开链接并看到格式列表。
4. 创建任务后进入任务列表或详情。
5. 管理员账号能看到管理菜单。
6. 普通用户访问 `/admin/users` 显示 403。

### 10.3 验证命令

以脚手架最终脚本为准，目标门禁为：

```bash
npm run lint
npm test
npm run build
npm run test:e2e
```

如果脚手架默认测试命令不是 Vitest，需要在实施计划中明确替换后的命令与原因。

## 11. PR 分组建议

| PR | 范围 | 关闭 issue 类型 |
| --- | --- | --- |
| PR-1 | Ant Design Pro 官方脚手架基线、删除旧前端实现、精简示例、启动、基础测试门禁 | scaffold, chore, test |
| PR-2 | 登录、权限、请求层、OpenAPI 生成 | auth, api-contract |
| PR-3 | 用户工作台：解析、任务、详情、账号 | feature, user-workspace |
| PR-4 | 管理后台：用户管理、任务监控、系统状态、平台能力 | feature, admin |
| PR-5 | E2E、浏览器验收、文档和 Docker/运行说明修订 | e2e, docs, ops |

每个 PR 必须关联对应 issue，且一个完整 feature 一个 PR，不按单次修改拆 PR。

## 12. 验收门禁

- 本地可按 Ant Design Pro 官方命令启动。
- 页面使用 Ant Design Pro 主布局，而不是旧 Vite 自研布局。
- 旧 Vite/Radix/自研页面代码已删除，不参与构建。
- 普通用户与管理员菜单根据 `/api/auth/me` 的 `is_admin` 区分。
- 解析下载主链路可用。
- 管理员页面至少具备只读可用能力。
- OpenAPI 生成 API 文件可重复生成。
- 单测、构建、E2E 通过。
- 启动前后端后，浏览器可完成登录、解析、任务查看和管理员菜单验收。
- 文档、issue、PR、milestone 对应关系清晰。

## 13. 风险与边界

| 风险 | 影响 | 处理 |
| --- | --- | --- |
| 官方脚手架依赖较重 | 重建和 CI 时间增加 | 首轮精简示例页和无关依赖 |
| Umi 与当前 Vite 测试体系不同 | 旧测试不能直接复用 | 删除旧测试，实现 Ant Design Pro 新测试 |
| OpenAPI 官方生成工具适配后端契约失败 | API 生成延期 | 优先修正契约或提交技术决策，不保留双生成体系 |
| 管理员接口不足 | 管理页面只能部分只读 | 首轮只做已有接口能力，缺口拆后端 issue |
| 大范围重建容易混入无关改动 | review 难度上升 | 按 PR 分组和 TDD commit 顺序推进 |

## 14. 待确认问题

本设计已根据用户确认锁定以下选择：

- 用户工作台 + 管理后台一体化。
- 接受 Ant Design Pro 官方默认技术栈。
- 使用官方脚手架创建后精简。
- 不兼容旧页面代码，旧页面、旧组件和旧 Vite/Radix 体系全部删除。
- 蓝白色后台系统风格，减少额外装饰。

当前无阻塞性待确认问题。后续实施中若官方 openapi 工具与后端契约不兼容，应先提交技术取舍说明或后端契约修正，不在前端保留旧生成链路兜底。

## 15. 变更记录

| 日期 | 作者 | 版本 | 变更说明 |
| --- | --- | --- | --- |
| 2026-05-23 | StephenQiu30 | 0.1.0 | 初始化 Ant Design Pro 一体化后台系统设计 |
