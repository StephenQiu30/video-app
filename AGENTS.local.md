# AGENTS.local.md

本文件记录 `video-web` 的局部协作规则，与 `AGENTS.md` 中的长期规范配合使用。

## 仓库边界

1. 本仓库只承载 React + TypeScript 前端，不实现后端 API、Worker、数据库迁移或对象存储逻辑。
2. 后端联调只通过 `UMI_APP_API_BASE_URL` 指向 `video-server`，不要在前端仓库复制后端配置。
3. 前端正式文档放入 `docs/` 对应分类目录，临时任务进度和一次性排查记录放在 issue、PR 或测试输出中。

## 常用验证

1. `npm run lint`
2. `npm run test`
3. `npm run build`
4. `npm run test:e2e`（M4 PR-E 恢复真实 Playwright 前为占位命令）

## 提交边界

1. UI、测试、文档和配置变更应按职责拆分提交。
2. 功能 PR 优先按 `test:`、`impl:`、`refactor:`、`chore:` 顺序组织。
3. `dist/`、`coverage/`、`playwright-report/`、`test-results/`、日志和本地缓存不提交。
