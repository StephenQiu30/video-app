# Contributing

感谢你愿意改进 `video-web`。

## 当前边界

仓库目前只保存规范和证据，不包含可执行 Web 实现。产品与技术事实以 [`docs/README.md`](docs/README.md) 的索引为入口；后端实现、OpenAPI 契约、统一镜像和基础设施由相邻 `video-server` 维护。

功能交付固定遵循 `Design → PRD → Plan → Acceptance`。开始实现前，先确认 Design 与 PRD 没有冲突，更新映射全部标准的 Plan，并在对应 Acceptance 中冻结本仓库的验证命令和证据要求。来源仓库已有的通过记录不能替代 `video-web` 的独立测试、构建、浏览器和集成证据。

后续前端使用 Next.js App Router、React、TypeScript strict、Radix UI、shadcn/ui 与 Tailwind CSS；具体目录、OpenAPI、静态导出、视觉、可访问性和安全规则以 [`AGENTS.md`](AGENTS.md) 为准。不得恢复旧 Umi、Ant Design、Less、旧路由兼容层或独立生产前端容器。

## 文档变更

- 上游事实变化时按 Design、PRD、Plan、Acceptance 的顺序同步下游，避免只修一处造成冲突。
- 保持内部链接可解析；调研、运维说明和视觉证据只作为规范的支持材料，不替代正式验收标准。
- 不在仓库中保存临时计划、工作日志、缓存、构建产物、Secret 或本机绝对路径生成物。

## 提交规范

每个可独立验证、可安全回滚的小任务对应一个提交。提交信息使用中文 Conventional Commits：

```text
<type>(<scope>): <中文描述>
```

作用域可省略；常用类型包括 `feat`、`fix`、`refactor`、`docs`、`test`、`build`、`ci`、`chore` 和 `style`。标题不超过 72 个字符，末尾不加标点。提交前只暂存当前任务文件并检查 `git status --short`；只有用户明确要求时才推送或创建 PR。
