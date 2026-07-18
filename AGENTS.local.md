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

1. 当前唯一候选是 `docs/plans/001-链接探测与清晰度目录计划.md`，但必须等待 `video-server` Plan 001 完成并提交 accepted OpenAPI 后才能进入 `ready`。
2. Web Plan 001 仅覆盖链接输入、探测状态、真实媒体信息、清晰度选择和刷新恢复；不得用手写 fixture 绕过服务端契约依赖。
3. 实际下载、AI 内容区、思维导图和 PDF 分属后续 Plan；当前只能展示诚实的后续能力说明。

## Codex 资产

1. Subagent 位于 `.codex/agents/`。
2. Skill 位于 `.codex/skills/`。
3. 编排规则位于 `WORKFLOW.md`。
4. 验证命令必须随 Plan 001 实现进入仓库，并回填到对应 Acceptance。
