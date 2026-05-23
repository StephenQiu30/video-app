# MVP Issue-PR 矩阵（video-web）

用于记录前端仓库与后端分离后的验收闭环。

## PR 提交顺序

| 顺序 | PR | Base -> Head | 类型 | 关闭/关联 Issue | 说明 |
|---|---|---|---|---|---|
| 1 | https://github.com/StephenQiu30/video-web/pull/39 | web-pr-base-empty -> web-pr-01-docs-rebase | docs | #7, #8, #10, #11, #12 | 文档与仓库治理（AGENTS/README/docs） |
| 2 | https://github.com/StephenQiu30/video-web/pull/40 | web-pr-01-docs-rebase -> web-pr-02-tests-rebase | test | #20, #21, #22, #23 | 鉴权与解析链路测试基础设施 |
| 3 | https://github.com/StephenQiu30/video-web/pull/41 | web-pr-02-tests-rebase -> web-pr-03-impl-rebase | impl | #3, #4, #5, #6, #13, #14, #15, #16, #17, #18, #19 | 前端核心链路（落地页/登录/工作台/详情） |

## 执行约束

1. PR 合并顺序不允许跳变，避免测试分支与实现基线失配。
2. 每个阶段完成后补充对应验收命令输出。
