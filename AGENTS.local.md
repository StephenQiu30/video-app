# AGENTS.local.md

本文件记录 `video-web` 的前端局部边界，与 `AGENTS.md` 的通用 Codex 规范配合使用。

## 产品边界

1. 本仓库实现“授权视频下载与 AI 知识化工作台”的 Web 体验。
2. “万能”指统一入口、能力探测和可扩展来源适配，不对受限来源承诺可下载。
3. 页面必须清晰展示支持范围、权利确认、来源限制、数据处理和删除方式。
4. 当前 Design、PRD、Plan 与 Acceptance 是新版本事实来源；不得从 Git 历史恢复旧产品实现或兼容层。

## 执行门禁

1. 新工作按 `Design -> PRD -> Plan -> Acceptance -> Implementation` 建立事实链。
2. 只有状态为 `ready` 的 Plan 可以进入实现；每次只推进一个依赖就绪的 Plan。
3. Acceptance 必须在实现前冻结方法和证据要求，实现后逐项记录 `passed`、`failed` 或 `blocked`。
4. Implementation 遵循 `AGENTS.md` 的 SDD、TDD、RAG 与验证要求，不得用假数据把未实现能力伪装为可用。

## 当前实施范围

1. 当前首个候选是 `docs/plans/000-邮箱登录与会话外壳计划.md`，但必须等待 `video-server` 冻结并提交 accepted 认证 OpenAPI 后才能进入 `ready`。
2. Web Plan 000 只实现邮箱注册、验证、登录、退出、密码重置、会话恢复、跨站请求伪造（CSRF）门禁和受保护路由；Web 不签发、解析或持久化服务端会话秘密。
3. `docs/plans/001-链接探测与清晰度目录计划.md` 保持 `review`，只有 Web Plan 000 `done`、其 Acceptance 全部 passed，且 Server 认证与来源解析 OpenAPI 均 accepted 后才能进入 `ready`。
4. Web Plan 001 仅覆盖链接输入、探测状态、真实媒体信息、清晰度选择和刷新恢复；不得用手写 fixture 绕过服务端契约依赖。
5. 实际下载、AI 内容区、思维导图和 PDF 分属后续 Plan；当前只能展示诚实的后续能力说明。

## 身份边界

1. 浏览器通过同源 Backend for Frontend（BFF）消费 Server 的 PostgreSQL DatabaseStrategy 会话；安装令牌和浏览器持有的 Bearer token 不属于现行设计。
2. Server 必须使用 `__Host-video_session` Cookie，保持 `HttpOnly`、`Secure`、`SameSite=Lax`、`Path=/` 和无 `Domain`；BFF 不把 Cookie 值转换为 JSON、页面属性或客户端状态。
3. 不安全方法同时通过精确 Origin、Fetch Metadata 与 Server 签名的 double-submit CSRF header 校验；Web 只在内存中保存 header 值，不写入 URL 或 Web Storage。
4. 验证和重置链接的一次性 token 只能位于 URL fragment；页面读取后必须先用 `history.replaceState` 清除 fragment，再 POST 交换。禁止 query string、浏览器历史残留、日志、分析、持久客户端存储或第三方请求。

## Codex 资产

1. Subagent 位于 `.codex/agents/`。
2. Skill 位于 `.codex/skills/`。
3. 编排规则位于 `WORKFLOW.md`。
4. 验证命令必须随 Plan 001 实现进入仓库，并回填到对应 Acceptance。
