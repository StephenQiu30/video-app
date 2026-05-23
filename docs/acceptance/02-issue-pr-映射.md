# MVP Issue-PR 矩阵（video-web）

用于记录前端仓库与后端分离后的验收闭环（1~36 号 issue 已覆盖）。

## PR 提交顺序（一次一 feature）

| 顺序 | PR | Base -> Head | 类型 | 关闭/关联 Issue | 说明 |
|---|---|---|---|---|---|
| 1 | https://github.com/StephenQiu30/video-web/pull/39 | web-pr-base-empty -> web-pr-01-docs-rebase | docs | #1, #2, #7, #8, #9, #10, #11, #12 | 项目基建与文档治理（AGENTS、README、env、docs 目录分层） |
| 2 | https://github.com/StephenQiu30/video-web/pull/40 | web-pr-01-docs-rebase -> web-pr-02-tests-rebase | test | #20, #21, #22, #23 | Vitest + E2E 登录链路测试设施（红绿测试开篇） |
| 3 | https://github.com/StephenQiu30/video-web/pull/41 | web-pr-02-tests-rebase -> web-pr-03-impl-rebase | impl/docs | #3, #4, #5, #6, #13, #14, #15, #16, #17, #18, #19, #24, #25, #26, #27, #28, #29, #30, #31, #32, #33, #34, #35, #36 | 核心页面实现 + 全链路单测 + E2E + CI 门禁补齐 + superpowers 审核流程与 issue-PR 映射归档 |

## 执行约束

1. PR 合并顺序不允许跳变，避免测试分支与实现基线失配。
2. 每个阶段完成后补充对应验收命令输出。
