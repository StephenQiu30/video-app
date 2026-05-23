---
layer: plans
doc_no: "PLAN-008"
audience:
  - PM
  - Dev
  - QA
  - Ops
feature_area: ant-design-pro-admin-system
purpose: "拆分 Ant Design Pro 官方脚手架重建 video-web 用户工作台与管理后台一体化系统的小粒度 issues、PR 分组和审查门禁。"
canonical_path: "docs/plans/08-ant-design-pro-admin-system-issues.md"
status: draft
version: "0.1.0"
owner: "StephenQiu30"
inputs:
  - "docs/design/04-ant-design-pro-admin-system.md"
  - "video-server OpenAPI 契约"
  - "Ant Design Pro 官方脚手架文档"
outputs:
  - "M4 Ant Design Pro 重建 issue 拆分"
  - "M4 feature PR 分组"
  - "任务审查清单"
triggers:
  - "开始 M4 Ant Design Pro 一体化后台重建"
downstream:
  - "GitHub Issues"
  - "docs/acceptance/02-issue-pr-映射.md"
---

# M4 Ant Design Pro 一体化后台任务拆分与审查

## 1. 审查结论

本轮任务可以执行，但必须按以下边界执行：

1. 使用 Ant Design Pro 官方脚手架新建项目基线，不在当前 Vite/Radix 页面上继续改造。
2. 旧 `src/`、旧 Vite 入口、自研 layout、自研 UI 组件、旧页面测试和旧视觉样式全部删除，不做兼容迁移。
3. 保留完整产品功能：登录、OAuth 回跳、解析下载、任务列表、任务详情、下载链接、PDF 报告、账号额度、管理员页面、OpenAPI 生成、E2E 验收。
4. 页面全面重新设计为成熟后台管理系统，风格遵循 Ant Design Pro 和蓝白主题，不受现有页面影响。
5. 多使用 Ant Design Pro / ProComponents 的现成组件，少写自研 UI，避免过度设计。
6. 每个 issue 必须小而可验收，每个 feature 一个 PR，PR 必须关联 issue。
7. 继续遵循 Red -> Green -> Refactor；脚手架与纯文档可不强制红灯，但 PR 中必须说明原因。

## 2. 官方脚手架执行约束

官方脚手架基线必须来自 Ant Design Pro 官方仓库或官方推荐创建方式。执行时允许在仓库外创建临时目录，但临时目录不得提交。

建议执行方式：

```bash
git clone --depth 1 https://github.com/ant-design/ant-design-pro.git /tmp/video-web-ant-design-pro
cd /tmp/video-web-ant-design-pro
npm install
npm run simple
npm install
```

随后将精简后的官方基线迁入 `video-web` 仓库，并保留项目长期资产：

- `AGENTS.md`
- `docs/`
- `docs/openapi/video-server.openapi.json`
- Docker / 部署相关文件中仍然有效的生产部署边界
- GitHub workflow 中仍然有效的 CI 入口

不得保留：

- Vite 启动入口和配置。
- Radix UI 依赖。
- 当前 `src/components/ui` 自研组件。
- 当前 `src/components/layout` 自研 layout。
- 当前 `src/pages` 页面实现。
- 当前旧页面测试作为长期测试文件。

## 3. Milestone

| 仓库 | Milestone | 目标 |
| --- | --- | --- |
| `video-web` | `M4 Ant Design Pro 一体化后台重建` | 使用 Ant Design Pro 官方脚手架重建用户工作台与管理后台，完整保留业务功能并通过自动化验收 |

## 4. PR 分组

| PR 组 | 范围 | 目标 | 依赖 |
| --- | --- | --- | --- |
| PR-A | #75, #76, #77, #78 | 官方脚手架基线与旧代码删除 | 建立 Ant Design Pro 官方基线、删除 Vite/Radix/旧页面、跑通启动与基础测试 | 无 |
| PR-B | #79, #80, #81, #82 | 登录、权限、请求与 OpenAPI | 接入 JWT、OAuth 回跳、`/api/auth/me`、权限菜单、官方 OpenAPI 生成 | PR-A |
| PR-C | #83, #84, #85, #86, #87 | 用户工作台主链路 | 解析下载、任务列表、任务详情、PDF 报告、账号中心 | PR-B |
| PR-D | #88, #89, #90, #91 | 管理后台页面 | 用户管理、任务监控、系统状态、平台能力 | PR-B |
| PR-E | #92, #93, #94 | E2E、运行文档与浏览器验收 | Playwright、运行文档、Docker/部署说明、真实浏览器验证 | PR-C, PR-D |

## 4.1 GitHub issue 编号映射

| Issue | 任务 | PR 组 |
| --- | --- | --- |
| #75 | `[P0][frontend][scaffold] 使用 Ant Design Pro 官方脚手架新建项目基线` | PR-A |
| #76 | `[P0][frontend][cleanup] 精简官方示例页与无关 mock` | PR-A |
| #77 | `[P0][frontend][theme] 建立蓝白后台主题与基础布局` | PR-A |
| #78 | `[P0][frontend][test] 建立 Ant Design Pro 测试与 CI 门禁` | PR-A |
| #79 | `[P0][frontend][auth] 登录页与 JWT 登录主链路` | PR-B |
| #80 | `[P0][frontend][auth] OAuth 回跳与 currentUser 初始化` | PR-B |
| #81 | `[P0][frontend][access] 用户菜单与管理员菜单权限控制` | PR-B |
| #82 | `[P0][frontend][api] 使用官方 OpenAPI 工作流生成 API client` | PR-B |
| #83 | `[P1][frontend][parser] 解析下载页重设计` | PR-C |
| #84 | `[P1][frontend][tasks] 下载任务 ProTable 列表` | PR-C |
| #85 | `[P1][frontend][task-detail] 任务详情与操作区` | PR-C |
| #86 | `[P1][frontend][pdf] PDF 报告入口与下载体验` | PR-C |
| #87 | `[P1][frontend][account] 账号中心与额度展示` | PR-C |
| #88 | `[P1][frontend][admin] 用户管理页面` | PR-D |
| #89 | `[P1][frontend][admin] 任务监控页面` | PR-D |
| #90 | `[P1][frontend][admin] 系统状态页面` | PR-D |
| #91 | `[P1][frontend][admin] 平台能力页面` | PR-D |
| #92 | `[P1][frontend][e2e] 用户工作台与管理员后台 E2E` | PR-E |
| #93 | `[P1][frontend][ops] 运行文档与 Docker 部署说明更新` | PR-E |
| #94 | `[P1][frontend][browser-qa] 前后端真实启动与浏览器验收` | PR-E |

## 5. Issue 拆分

### M4-W1 `[P0][frontend][scaffold] 使用 Ant Design Pro 官方脚手架新建项目基线`

- Epic：`epic:ant-design-pro-rebuild`
- 优先级：`priority:p0`
- 类型：`type:frontend`, `type:scaffold`, `type:chore`
- PR 组：PR-A
- 产出：
  - 官方 Ant Design Pro 脚手架基线。
  - 删除 Vite 入口、Vite 配置、Radix 依赖和旧自研页面代码。
  - `package.json` 替换为 Ant Design Pro 官方脚手架脚本。
- 验收：
  - `npm install` 成功。
  - `npm start` 或官方等价命令可启动。
  - 构建产物不再依赖 `vite`、`@vitejs/plugin-react`、`@radix-ui/*`。
  - 旧 `src/pages`、旧 `src/components/ui`、旧 `src/components/layout` 不参与构建。

### M4-W2 `[P0][frontend][cleanup] 精简官方示例页与无关 mock`

- Epic：`epic:ant-design-pro-rebuild`
- 优先级：`priority:p0`
- 类型：`type:frontend`, `type:chore`
- PR 组：PR-A
- 产出：
  - 删除官方示例业务页面、演示图表、示例 mock、无关菜单。
  - 保留登录、layout、request、access、openapi、测试和构建能力。
- 验收：
  - 菜单只出现本项目业务入口。
  - 项目内无 Ant Design Pro 示例业务文案。
  - 首页不展示官方欢迎页或示例 dashboard。

### M4-W3 `[P0][frontend][theme] 建立蓝白后台主题与基础布局`

- Epic：`epic:admin-design-system`
- 优先级：`priority:p0`
- 类型：`type:frontend`, `type:ui`
- PR 组：PR-A
- 产出：
  - Ant Design `ConfigProvider` / Umi theme token。
  - `ProLayout` 产品名、logo、顶部/侧边布局策略。
  - 简约蓝白主题，不使用装饰性大渐变。
- 验收：
  - 主题主色为蓝色系。
  - 页面背景、内容区、表格、按钮使用 Ant Design token。
  - 不新增大面积自研 CSS 或复杂装饰。

### M4-W4 `[P0][frontend][test] 建立 Ant Design Pro 测试与 CI 门禁`

- Epic：`epic:quality-gates`
- 优先级：`priority:p0`
- 类型：`type:test`, `type:ci`, `type:frontend`
- PR 组：PR-A
- 产出：
  - `npm run lint`、`npm test`、`npm run build` 可用。
  - CI 对齐新脚手架命令。
- 验收：
  - GitHub Actions 运行新命令。
  - 旧 Vite/Vitest 专属测试配置不作为门禁残留。
  - PR-A 合并前 CI 通过。

### M4-W5 `[P0][frontend][auth] 登录页与 JWT 登录主链路`

- Epic：`epic:auth-access`
- 优先级：`priority:p0`
- 类型：`type:frontend`, `type:auth`, `type:test`
- PR 组：PR-B
- 产出：
  - Ant Design Pro 登录页。
  - 邮箱密码登录对接 `POST /api/auth/login`。
  - token 保存、退出登录、登录失败提示。
- 验收：
  - 登录成功后进入 `/parser`。
  - 登录失败展示用户可读错误。
  - 单测覆盖 token 保存和退出清理。

### M4-W6 `[P0][frontend][auth] OAuth 回跳与 currentUser 初始化`

- Epic：`epic:auth-access`
- 优先级：`priority:p0`
- 类型：`type:frontend`, `type:auth`, `type:data`
- PR 组：PR-B
- 产出：
  - `/auth?token=...` 回跳处理。
  - `GET /api/auth/me` 初始化 currentUser。
  - 401 清理 token 并跳转登录。
- 验收：
  - OAuth token 可写入认证状态。
  - 401 不白屏。
  - currentUser 中 `is_admin` 可被权限系统读取。

### M4-W7 `[P0][frontend][access] 用户菜单与管理员菜单权限控制`

- Epic：`epic:auth-access`
- 优先级：`priority:p0`
- 类型：`type:frontend`, `type:auth`, `type:ui`
- PR 组：PR-B
- 产出：
  - 普通用户菜单：解析下载、下载任务、账号中心。
  - 管理员菜单：用户管理、任务监控、系统状态、平台能力。
  - `/admin/*` 权限控制。
- 验收：
  - 普通用户看不到管理员菜单。
  - 管理员可以看到管理员菜单。
  - 普通用户访问 `/admin/users` 显示 403。

### M4-W8 `[P0][frontend][api] 使用官方 OpenAPI 工作流生成 API client`

- Epic：`epic:api-contract`
- 优先级：`priority:p0`
- 类型：`type:frontend`, `type:api-contract`, `type:data`
- PR 组：PR-B
- 产出：
  - Ant Design Pro 官方 openapi 配置。
  - 基于 `docs/openapi/video-server.openapi.json` 或后端 `/openapi.json` 生成服务文件。
  - 删除旧 `@hey-api/openapi-ts` 生成链路。
- 验收：
  - `npm run openapi` 或项目定义的官方生成命令可重复执行。
  - 生成文件禁止手改。
  - 页面请求不直接散落 fetch。

### M4-W9 `[P1][frontend][parser] 解析下载页重设计`

- Epic：`epic:user-workspace`
- 优先级：`priority:p1`
- 类型：`type:frontend`, `type:feature`, `type:ui`
- PR 组：PR-C
- 产出：
  - `/parser` 解析下载页。
  - `ProForm` 链接输入。
  - `ProCard` 解析结果、封面、平台、格式选择。
- 验收：
  - 登录后可解析公开链接。
  - 未登录访问受保护操作跳转登录。
  - 页面不使用旧首页布局。

### M4-W10 `[P1][frontend][tasks] 下载任务 ProTable 列表`

- Epic：`epic:user-workspace`
- 优先级：`priority:p1`
- 类型：`type:frontend`, `type:feature`, `type:ui`
- PR 组：PR-C
- 产出：
  - `/tasks` 任务列表。
  - `ProTable` 状态筛选、进度、更新时间、操作列。
- 验收：
  - 支持全部、排队中、下载中、已完成、失败筛选。
  - 列表操作克制，仅保留必要操作。
  - 移动端不出现横向不可用布局。

### M4-W11 `[P1][frontend][task-detail] 任务详情与操作区`

- Epic：`epic:user-workspace`
- 优先级：`priority:p1`
- 类型：`type:frontend`, `type:feature`
- PR 组：PR-C
- 产出：
  - `/tasks/:taskId`。
  - 任务状态、进度、事件日志。
  - 取消、重试、获取下载链接。
- 验收：
  - 任务详情可加载。
  - 任务失败时展示失败原因。
  - 操作按钮按任务状态启用/禁用。

### M4-W12 `[P1][frontend][pdf] PDF 报告入口与下载体验`

- Epic：`epic:user-workspace`
- 优先级：`priority:p1`
- 类型：`type:frontend`, `type:feature`, `type:report`
- PR 组：PR-C
- 产出：
  - 完成任务的 PDF 导出按钮。
  - 调用 `GET /api/tasks/{task_id}/pdf`。
  - Blob 下载或新窗口打开策略。
- 验收：
  - 未完成任务不允许导出 PDF。
  - 完成任务可触发 PDF 请求。
  - 错误时展示 Ant Design message/notification。

### M4-W13 `[P1][frontend][account] 账号中心与额度展示`

- Epic：`epic:user-workspace`
- 优先级：`priority:p1`
- 类型：`type:frontend`, `type:feature`, `type:auth`
- PR 组：PR-C
- 产出：
  - `/account` 账号中心。
  - 用户信息卡片。
  - 额度与限制描述列表。
- 验收：
  - 展示邮箱、显示名、账号状态。
  - 展示每日任务额度、并发额度、最大文件大小、存储额度、保留时间。

### M4-W14 `[P1][frontend][admin] 用户管理页面`

- Epic：`epic:admin-console`
- 优先级：`priority:p1`
- 类型：`type:frontend`, `type:admin`, `type:ui`
- PR 组：PR-D
- 产出：
  - `/admin/users`。
  - 用户表格、邮箱搜索、状态展示。
- 验收：
  - 管理员可访问。
  - 普通用户不可访问。
  - 接口缺口明确记录，不用假数据冒充真实管理能力。

### M4-W15 `[P1][frontend][admin] 任务监控页面`

- Epic：`epic:admin-console`
- 优先级：`priority:p1`
- 类型：`type:frontend`, `type:admin`, `type:ui`
- PR 组：PR-D
- 产出：
  - `/admin/tasks`。
  - 全局任务状态、失败原因、队列相关信息。
- 验收：
  - 管理员可按状态查看任务。
  - 缺少后端接口时拆后端 issue，不在前端硬编码假任务。

### M4-W16 `[P1][frontend][admin] 系统状态页面`

- Epic：`epic:admin-console`
- 优先级：`priority:p1`
- 类型：`type:frontend`, `type:admin`, `type:ops`
- PR 组：PR-D
- 产出：
  - `/admin/system`。
  - `/health`、`/ready` 检查展示。
  - OpenAPI 契约状态展示。
- 验收：
  - 健康项成功/失败状态清晰。
  - 失败项显示可读 message。

### M4-W17 `[P1][frontend][admin] 平台能力页面`

- Epic：`epic:admin-console`
- 优先级：`priority:p1`
- 类型：`type:frontend`, `type:admin`, `type:platform`
- PR 组：PR-D
- 产出：
  - `/admin/platforms`。
  - B站、抖音、快手等平台能力展示。
  - 合规限制说明。
- 验收：
  - 只展示真实支持能力。
  - 不承诺 DRM、付费墙、Cookie 绕过能力。

### M4-W18 `[P1][frontend][e2e] 用户工作台与管理员后台 E2E`

- Epic：`epic:quality-gates`
- 优先级：`priority:p1`
- 类型：`type:e2e`, `type:test`
- PR 组：PR-E
- 产出：
  - Playwright 登录、解析、任务、管理员菜单、403 覆盖。
- 验收：
  - `npm run test:e2e` 通过。
  - E2E 使用稳定 mock 或本地后端联调策略，不依赖线上服务。

### M4-W19 `[P1][frontend][ops] 运行文档与 Docker 部署说明更新`

- Epic：`epic:ops`
- 优先级：`priority:p1`
- 类型：`type:docs`, `type:ops`
- PR 组：PR-E
- 产出：
  - README 启动命令更新为 Ant Design Pro 官方命令。
  - Dockerfile / compose 如需调整，说明端口和构建方式。
- 验收：
  - 本地开发命令清晰。
  - Docker 作为部署方式仍可用。
  - 不再提 Vite 5173 作为当前调试地址。

### M4-W20 `[P1][frontend][browser-qa] 前后端真实启动与浏览器验收`

- Epic：`epic:quality-gates`
- 优先级：`priority:p1`
- 类型：`type:qa`, `type:e2e`
- PR 组：PR-E
- 产出：
  - 启动 `video-server` 与 `video-web`。
  - 使用 agent-browser 验证页面可用。
  - 记录验收结论到 PR。
- 验收：
  - 登录页可打开。
  - 登录后可看到解析下载页面。
  - 用户菜单与管理员菜单按角色显示。
  - 解析、任务列表、任务详情至少一条主链路可操作。

## 6. 任务审查清单

### 6.1 功能完整性审查

- 登录注册相关入口没有丢失。
- GitHub OAuth 回跳没有丢失。
- 解析下载主链路没有丢失。
- 任务列表、详情、取消、重试、下载链接没有丢失。
- PDF 报告入口没有丢失。
- 账号额度展示没有丢失。
- 管理员页面按角色隔离。
- OpenAPI 生成链路保留且换成官方工作流。

### 6.2 设计审查

- 页面必须是后台管理系统，不做营销首页。
- 优先使用 `ProLayout`、`PageContainer`、`ProTable`、`ProForm`、`ProCard`。
- 自研 CSS 仅用于项目 token、局部间距和必要响应式修正。
- 不使用大面积渐变、装饰插画、卡片堆叠或过度复杂 dashboard。
- 页面信息密度适合重复使用和扫视。

### 6.3 工程审查

- PR-A 必须证明官方脚手架是新基线。
- 旧 Vite/Radix/自研页面代码必须删除。
- 生成文件不手改。
- 页面不直接散落请求实现。
- 每个 feature PR 都有 issue 关联和验证证据。
- milestone 完成后才关闭。

## 7. 执行顺序

1. 创建 GitHub milestone：`M4 Ant Design Pro 一体化后台重建`。
2. 创建 M4-W1 到 M4-W20 issues，按本文件 labels 和 PR 组标记。
3. PR-A 先执行脚手架重建和旧代码删除。
4. PR-B 执行认证、权限、请求、OpenAPI。
5. PR-C 和 PR-D 可在 PR-B 后并行，但合并顺序建议 PR-C 先于 PR-D。
6. PR-E 最后执行 E2E、运行文档、浏览器验收。
7. 全部 issues 关闭后关闭 milestone。

## 8. 自审结果

- Scope：本计划只覆盖 `video-web` 前端重建，不修改后端实现。
- Scaffold：已明确必须使用 Ant Design Pro 官方脚手架新建项目基线。
- Compatibility：已明确不兼容旧页面、旧组件、旧 Vite/Radix 体系。
- Completeness：登录、OAuth、解析、任务、PDF、账号、管理员、OpenAPI、E2E 均有对应 issue。
- Design：已明确使用 ProComponents，减少自研和过度设计。
- Risk：管理员接口不足、OpenAPI 官方生成适配风险已记录。
- Execution：PR 分组为完整 feature，不按单次修改拆 PR。

## 9. 变更记录

| 日期 | 作者 | 版本 | 变更说明 |
| --- | --- | --- | --- |
| 2026-05-23 | StephenQiu30 | 0.1.0 | 初始化 M4 Ant Design Pro 重建 issue 拆分与任务审查 |
