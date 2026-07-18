# video-web

`video-web` 是待重新设计的 Web 仓库。

## 当前状态

- 现有产品设计、PRD、Plan 和 Acceptance 已清除。
- 当前没有已确认的用户体验、页面范围、技术选型、API 消费或状态模型。
- 当前没有应用源码、依赖、测试、schema、fixture 或业务运行配置。
- 仓库只保留项目治理文件与文档分类骨架。

## 重新设计门禁

后续工作固定遵循：

`Design → PRD → Plan → Acceptance`

下一轮必须先在 Design 中确认产品目标、用户旅程、页面与状态边界、前后端职责、技术架构、安全、可访问性与风险。Design accepted 前不创建 PRD、Plan 或业务实现。

## 项目规范

本仓库按 [stephen-codex](https://github.com/StephenQiu30/stephen-codex) 当前 `main` 整理：

- `AGENTS.md`：长期协作、交付与 Git 规则。
- `AGENTS.local.md`：本仓库边界与重新设计门禁。
- `WORKFLOW.md`：Symphony/Linear 编排契约。
- `.codex/`：Agent 角色与核心流程。
- `docs/`：正式文档分类骨架。
- `.github/`：PR 模板与基础 CI。

文档入口见 [`docs/README.md`](docs/README.md)。当前不提供安装、运行或部署命令。
