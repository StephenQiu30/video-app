# MVP Issue-PR 矩阵（video-web）

用于记录前端仓库与后端分离后的验收闭环（1~36 号 issue 已覆盖）。

## PR 提交顺序（一次一 feature）

| 顺序 | PR | Base -> Head | 类型 | 关闭/关联 Issue | 说明 |
|---|---|---|---|---|---|
| 1 | https://github.com/StephenQiu30/video-web/pull/39 | web-pr-base-empty -> web-pr-01-docs-rebase | docs | #1, #2, #7, #8, #9, #10, #11, #12 | 项目基建与文档治理（AGENTS、README、env、docs 目录分层） |
| 2 | https://github.com/StephenQiu30/video-web/pull/40 | web-pr-01-docs-rebase -> web-pr-02-tests-rebase | test | #20, #21, #22, #23 | Vitest + E2E 登录链路测试设施（红绿测试开篇） |
| 3 | https://github.com/StephenQiu30/video-web/pull/41 | web-pr-02-tests-rebase -> web-pr-03-impl-rebase | impl/docs | #3, #4, #5, #6, #13, #14, #15, #16, #17, #18, #19, #24, #25, #26, #27, #28, #29, #30, #31, #32, #33, #34, #35, #36 | 核心页面实现 + 全链路单测 + E2E + CI 门禁补齐 + superpowers 审核流程与 issue-PR 映射归档 |
| 4 | 待创建 | main -> feat/m4-ant-design-pro-scaffold | scaffold/chore/test | #75, #76, #77, #78 | M4 PR-A：Ant Design Pro 官方脚手架基线、删除旧前端实现、精简示例、启动与基础测试门禁 |
| 5 | 待创建 | main -> feat/m4-auth-access-openapi | auth/api-contract | #79, #80, #81, #82 | M4 PR-B：登录、OAuth 回跳、权限菜单、请求层与官方 OpenAPI 生成 |
| 6 | 待创建 | main -> feat/m4-user-workspace | feature | #83, #84, #85, #86, #87 | M4 PR-C：解析下载、任务列表、任务详情、PDF 报告和账号中心 |
| 7 | 待创建 | main -> feat/m4-admin-console | admin/feature | #88, #89, #90, #91 | M4 PR-D：用户管理、任务监控、系统状态和平台能力 |
| 8 | 待创建 | main -> feat/m4-e2e-ops-browser-qa | e2e/docs/ops | #92, #93, #94 | M4 PR-E：E2E、运行文档、Docker/部署说明和真实浏览器验收 |

## 执行约束

1. PR 合并顺序不允许跳变，避免测试分支与实现基线失配。
2. 每个阶段完成后补充对应验收命令输出。
