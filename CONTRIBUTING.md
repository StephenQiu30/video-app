# Contributing

`video-web` 按 `Design -> PRD -> Plan -> Acceptance -> Implementation` 推进。

## 贡献门禁

1. 先阅读 `AGENTS.md`、`AGENTS.local.md`、`WORKFLOW.md` 和 `docs/README.md`。
2. 需求必须映射到已接受 PRD 的 Requirement ID，不能在实现中引入隐性范围。
3. 只有 `status: ready` 的 Plan 可以实施，每次只推进一个依赖就绪的 Plan。
4. Acceptance 必须先冻结验收项，再通过失败测试驱动最小实现。
5. 完成时逐项附上测试、截图、响应或运行证据；未验证项保持 `failed` 或 `blocked`。

## 当前允许的实现

首个候选是 Plan 001：链接输入、探测状态、视频信息、清晰度目录、错误恢复和刷新恢复。它只有在 `video-server` Plan 001 完成、accepted OpenAPI 已提交且本 Plan 进入 `ready` 后才允许实现。

以下能力必须等待对应 Plan 就绪：

- 实际下载任务、进度和资产交付。
- AI 转录、总结和思维导图。
- PDF 导出、历史库和数据生命周期交互。
- DRM、登录态、付费墙、地区限制或下载禁用绕过始终不在范围内。

## 工程要求

1. 遵循 `AGENTS.md` 的提交类型、TDD 顺序、文件体量和 PR 门禁。
2. 组件必须覆盖加载、空、失败和恢复状态；禁止用假数据冒充后端能力。
3. 交互必须支持键盘、可见焦点、减少动画和移动端布局。
4. 不引入 `.planning`、临时状态文件、兼容旧实现的双轨结构或未清理生成物。
