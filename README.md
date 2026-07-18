# video-web

`video-web` 是“授权视频下载与 AI 知识化工作台”的 Web 客户端。用户可以粘贴自己有权处理的视频链接，查看来源真实提供的清晰度，并在后续阶段完成下载、AI 摘要、思维导图和 PDF 导出。

## 当前阶段

项目正在从全新设计基线开始实施。现行事实链位于 `docs/`：

1. Design：体验方向、前端架构和 API/无障碍契约。
2. PRD：Web MVP 用户故事、状态、非目标与验收指标。
3. Plan：按依赖顺序拆分的单一闭环实施计划。
4. Acceptance：实现前冻结的验收方法和实现后补充的证据。

当前首个 Web 切片是：

```text
邮箱注册/验证 -> 登录 -> PostgreSQL 会话恢复 -> 安全退出/找回 -> 受保护工作台外壳
```

该切片等待 `video-server` 提交 accepted 认证 OpenAPI；链接探测、实际下载、AI 内容区、思维导图和 PDF 随后依次实现。

## 体验原则

- 不承诺绕过 DRM、登录、付费墙、下载禁用或平台限制。
- 不伪造分辨率、进度、完成状态或尚未实现的功能。
- Web 不保存密码或签发身份 token；只通过同源 BFF 使用 Server 的 HttpOnly 会话/CSRF Cookie。
- 服务端资源是任务事实来源，页面刷新不能丢失已创建任务。
- 思维导图必须同时提供语义化文字大纲，核心流程满足 WCAG 2.2 AA。
- Git 历史仅用于追溯，不构成现行需求或架构依据。

## 仓库入口

- `AGENTS.md`：Codex 长期工程规范。
- `AGENTS.local.md`：Web 产品边界与当前实施门禁。
- `WORKFLOW.md`：Codex 编排与交付流程。
- `docs/README.md`：执行文档索引和状态。
- `.codex/`：项目级 Codex Subagent 与 Skill。

工程运行和验证命令将在 Plan 000 的 TDD 基线落地后补充。
