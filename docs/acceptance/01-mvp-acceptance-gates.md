---
layer: acceptance
doc_no: "ACPT-001"
audience:
  - QA
  - Dev
purpose: "定义 video-web MVP 验收门禁和测试证据挂载方式。"
canonical_path: "docs/acceptance/01-mvp-acceptance-gates.md"
status: draft
version: "1.0.0"
owner: "StephenQiu30"
inputs:
  - "docs/plans/05-mvp-task-micro-breakdown.md"
outputs:
  - "验收通过/阻塞证据"
triggers:
  - "阶段任务完成后"
  - "PR 合入前"
downstream:
  - "docs/operations/01-runbook.md"
---

# MVP 验收门禁

## 功能门禁

- 未登录访问 `/workbench` 与 `/tasks/:id` 必须重定向到 `/auth`。
- `/auth` 能写入 `token` 并回跳 `/workbench`。
- 落地页可解析 URL，返回 format 列表并可创建下载任务。
- 任务详情页可展示事件列表、取消、重试、下载按钮。

## 测试门禁

- `npm run test` 必须通过（至少包含 auth 守卫、解析表单、任务列表/详情关键行为）。
- `npm run test:e2e` 至少包含登录路由、解析/创建到详情链路。
- `npm run lint` 与 `npm run build` 无阻塞错误。

## 证据记录

- 每个阶段完成后在 issue 与本文件追加对应命令、时间和失败/通过摘要。

### 2026-05-23 阶段一（TDD + 登录链路）

- 时间：2026-05-23 11:24:16
- 命令与结果：
  - `npm run test` ✅ 通过（4/4）
  - `npm run lint` ✅ 通过
  - `npm run build` ✅ 通过
  - `npm run test:e2e` ✅ 通过（2/2）
- 覆盖范围：
  - 未登录访问 `/workbench` 的重定向鉴权
  - 鉴权回跳页 `/auth` 展示与 `token` 回跳
  - 主页解析表单成功链路与任务创建参数
  - E2E 登录链路（无 token 重定向 + token 回跳）
