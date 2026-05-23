# AGENTS.md（video-web）

## 目标与边界
- video-web 仅作为**独立前端仓库**运行，不承载 API 路由、后台任务执行和静态托管职责。
- 前端与后端通过 `VITE_API_BASE_URL` 与 `/api/*` 路径通信；跨仓联调只在运行文档中定义端口与鉴权配置。
- 功能以 MVP 为主：落地页 → 授权登录 → 工作台任务列表 → 任务详情/下载。

## 开发原则
- 采用测试优先（Red → Green → Refactor）。任何可验证行为应先有失败测试，再补最小实现。
- 使用 TDD 的测试标签约定提交：`test:m1-*`、`impl:m1-*`、`docs:m1-*`、`feat:m1-*`、`chore:m1-*`（`m1` 为本轮起始编号）。
- 采用 TypeScript 严格边界思路：最小接口、清晰职责、避免一次性大文件。
- 遵循「能跑就行」到「能测」再到「好看」，优先保证交付闭环而非炫技。
- 单个文件应保持清晰、可维护；当页面、组件或测试文件持续膨胀时，按职责拆分到更小模块。
- 需求、任务和验收标准应尽量符合 SMART：具体、可衡量、可达成、相关且有阶段边界。

## Test-First PR 提交规范
- 功能 PR 先用测试定义需求、边界和验收标准，再提交最小实现。
- 提交顺序优先为：`test:` → `impl:` → `refactor:` → `chore:`。
- `test:` commit 只包含测试、fixtures、mocks、期望结果和测试辅助工具，不混入生产实现。
- `impl:` commit 只包含让测试通过的最小实现，不夹带无关功能和大范围重构。
- `refactor:` commit 必须在测试通过后进行，只清理命名、结构、重复逻辑或可读性。
- `chore:` commit 只包含配置、格式化、锁文件或生成文件等非业务变更。
- 文档、纯格式化、CI 配置修复和紧急修复可不强制 test-first，但 PR 中必须说明原因和验证方式。

## 路由与状态
- 路由约定：
  - `/` 落地页（无需鉴权）
  - `/auth` 登录页（OAuth 回跳后入参 `token`）
  - `/workbench` 工作台（必须鉴权）
  - `/tasks/:taskId` 任务详情（必须鉴权）
- 鉴权状态由 `AppProvider` 持久化 token 到 `localStorage.video_web_access_token`。
- 所有请求层统一通过 `src/lib/api.ts` 和 `query` hooks / 手工 mutations。

## TDD 与测试门禁
- 新文件应优先新增最小单元测试覆盖：鉴权守卫、解析表单、任务列表、状态按钮。
- 前端 CI 理想最小门禁：
  - `npm run lint`
  - `npm run test`
  - `npm run test:e2e`
- 每个 issue 的实现结尾必须有验收证据（至少一次命令输出和关键日志）。

## 文档规范
- `docs/` 需按长期影响分类（PRD/plan/design/acceptance/operations）。
- 临时调试与一次性记事不要写进 docs；应放测试脚本、Issue、PR 讨论和分支提交里。
- 每个正式文档文件应包含明确的目标、边界、验收标准和剩余风险。
- 新增正式文档优先复用 `docs/TEMPLATE.md` 的 frontmatter 与章节结构。

## 提交与交付
- 使用中文提交摘要，格式建议：
  - `impl:m1-xx xxx`
  - `test:m1-xx xxx`
  - `docs:m1-xx xxx`
  - `feat:m1-xx xxx`
  - `chore:m1-xx xxx`
- 交付说明按「做了什么 / 怎么验证 / 还存在哪些风险」三点输出。
- PR 描述必须覆盖 Test-first Evidence、Tests added、Commands run、Result、Agent Usage 和 Reviewer Checklist。
- PR 合并前检查 CI、冲突、目标分支最新状态，并在需要合并到主分支前保留可回滚点。
