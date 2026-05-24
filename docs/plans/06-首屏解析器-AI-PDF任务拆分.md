---
layer: plans
doc_no: "PLAN-006"
audience:
  - PM
  - Dev
  - QA
feature_area: conversion-parser-ai-pdf
purpose: "将首屏解析器、能力证明、工作台、任务详情、AI 与 PDF 体验拆分为小 issue，并明确目标 PR 分组。"
canonical_path: "docs/plans/06-首屏解析器-AI-PDF任务拆分.md"
status: draft
version: "0.1.0"
owner: "StephenQiu30"
inputs:
  - "docs/design/02-首屏解析器-AI-PDF重设计.md"
outputs:
  - "GitHub issue 拆分建议"
  - "Milestone 与 PR 分组"
triggers:
  - "准备执行 video-web 产品化重构"
downstream:
  - "GitHub issues"
  - "Feature PR"
---

# 首屏解析器与能力证明任务拆分

## 1. 背景

本计划承接 `docs/design/02-首屏解析器-AI-PDF重设计.md`，用于把前端产品化重构拆成小 issue，并按功能 PR 聚合交付。

## 2. 目标

- 所有任务以小 issue 形式进入 GitHub。
- 每个 issue 包含 TDD 要求、验收标准和目标 PR 分组。
- 前端实现与后端 AI/PDF 依赖明确分离。
- PR 按完整 feature 聚合，而不是每改一次就开一个 PR。

## 3. 非目标

- 不在本计划直接实现后端 WeasyPrint 或 DashScope provider。
- 不拆游客真实解析能力。
- 不引入新的大型 UI 框架。

## 4. Milestone

建议 milestone：`M2 首屏解析器与 AI/PDF 能力证明`

## 5. PR 分组

| PR | 范围 | 关闭 Issues |
| --- | --- | --- |
| PR-A | 首屏解析器与登录转化链路 | FE-1, FE-2, FE-3 |
| PR-B | 工作台、详情页、AI/PDF 能力入口 | FE-4, FE-5, FE-6 |
| PR-C | 视觉系统、E2E、验收文档与回归 | FE-7, FE-8 |

## 6. Issue 拆分

### FE-1 首屏解析器信息架构与基础组件

标题：`[P1][frontend][ui] 首屏解析器信息架构与基础组件`

标签：`priority:P1`, `type:frontend`, `type:ui`, `workflow:tdd`, `agent:ready`, `epic:conversion-parser`

验收标准：

- 首页首屏展示链接输入、解析按钮、平台标签和能力证明入口。
- 首屏不再只是普通 Card 表单。
- 保留蓝白简约视觉方向。
- 单元测试覆盖首屏主要文案、输入框和解析按钮。

### FE-2 未登录解析转化与 pending URL 恢复

标题：`[P1][frontend][auth] 未登录解析转化与 pending URL 恢复`

标签：`priority:P1`, `type:frontend`, `type:auth`, `type:core`, `workflow:tdd`, `agent:ready`, `epic:conversion-parser`

验收标准：

- 未登录输入 URL 后点击解析会保存 pending URL。
- 跳转 `/auth` 登录。
- 登录成功后回到首页并恢复 pending URL。
- 不调用未授权的 `/api/parse`。
- 单元测试和 E2E 覆盖该链路。

### FE-3 已登录解析结果与任务创建体验

标题：`[P1][frontend][core] 已登录解析结果与任务创建体验`

标签：`priority:P1`, `type:frontend`, `type:core`, `type:data`, `workflow:tdd`, `agent:ready`, `epic:conversion-parser`

验收标准：

- 已登录点击解析调用 `/api/parse`。
- 展示标题、封面、平台、合规提示和格式列表。
- 可选择格式并创建任务。
- 创建成功后跳转 `/tasks/:taskId`。
- API 错误优先展示统一失败响应中的 `error.message`。

### FE-4 工作台产品化与任务状态增强

标题：`[P1][frontend][tasks] 工作台产品化与任务状态增强`

标签：`priority:P1`, `type:frontend`, `type:ui`, `type:core`, `workflow:tdd`, `agent:ready`, `epic:task-experience`

验收标准：

- `/workbench` 视觉与首页统一。
- 展示任务统计、状态筛选、任务列表和最近动作。
- 状态 badge、进度和失败原因可读。
- 空态引导回首页解析。
- 单元测试覆盖列表、空态、错误态和状态筛选。

### FE-5 任务详情页 AI 摘要与事件流增强

标题：`[P1][frontend][ai] 任务详情页 AI 摘要与事件流增强`

标签：`priority:P1`, `type:frontend`, `type:ui`, `type:ai`, `workflow:tdd`, `agent:ready`, `epic:task-experience`

验收标准：

- `/tasks/:taskId` 展示 AI 状态、摘要和思维导图入口。
- `skipped/processing/completed/failed` 均有清晰展示。
- 事件流按时间展示且不遮挡主要操作。
- AI 失败不影响下载按钮可用性。
- 单元测试覆盖 AI 状态和事件流。

### FE-6 PDF 报告导出入口与错误体验

标题：`[P1][frontend][report] PDF 报告导出入口与错误体验`

标签：`priority:P1`, `type:frontend`, `type:ui`, `type:data`, `workflow:tdd`, `agent:ready`, `epic:task-experience`

验收标准：

- 任务详情页新增“导出分析报告”入口。
- 成功任务可请求 `/api/tasks/{taskId}/pdf`。
- 未完成任务说明导出条件。
- AI 摘要缺失时说明可导出基础报告。
- PDF 请求失败时展示统一错误提示。

### FE-7 蓝白视觉系统与响应式整理

标题：`[P1][frontend][ui] 蓝白视觉系统与响应式整理`

标签：`priority:P1`, `type:frontend`, `type:ui`, `workflow:tdd`, `agent:ready`, `epic:visual-system`

验收标准：

- 建立蓝白设计 tokens。
- 首页、工作台、详情页视觉一致。
- 375px、768px、1024px、1440px 无水平滚动。
- 主要交互满足 44px 触控目标和 focus-visible。
- 不使用 emoji 作为 UI 图标。

### FE-8 E2E 回归与验收文档更新

标题：`[P1][frontend][e2e] 首屏解析器与 AI/PDF 能力 E2E 回归`

标签：`priority:P1`, `type:frontend`, `type:e2e`, `type:test`, `workflow:e2e`, `workflow:tdd`, `agent:ready`, `epic:visual-system`

验收标准：

- E2E 覆盖未登录解析转化。
- E2E 覆盖登录后解析、创建任务、进入详情。
- E2E 覆盖 PDF 报告入口可见和失败提示。
- 更新 `docs/acceptance/01-MVP验收门禁.md`。
- `npm run lint`、`npm run test`、`npm run build`、`npm run test:e2e` 通过。

## 7. 跨仓后端候选 Issue

以下不在 `video-web` issue 中实现，但 PR-B/PR-C 验收会依赖这些后端能力成熟：

1. `video-server`：阿里云百炼 DashScope Qwen provider。
2. `video-server`：WeasyPrint + Jinja2 PDF 报告模板增强。
3. `video-server`：统一失败响应上线后，前端 API client 去除旧结构 fallback。

## 8. TDD 执行顺序

1. `test:m2-01` 首屏解析器渲染与按钮行为测试。
2. `impl:m2-01` 首屏解析器基础实现。
3. `test:m2-02` 未登录 pending URL 和登录恢复测试。
4. `impl:m2-02` 登录转化链路实现。
5. `test:m2-03` 解析结果、格式选择、任务创建测试。
6. `impl:m2-03` 解析结果与创建体验实现。
7. `test:m2-04` 工作台、详情、AI/PDF 入口测试。
8. `impl:m2-04` 工作台与详情页增强。
9. `test:m2-05` E2E 回归测试。
10. `impl:m2-05` 视觉整理、响应式与验收文档。

## 9. 风险与边界

- 不能在前端 issue 中实现后端 AI/PDF 引擎。
- 首屏能力证明不能虚标 RSS、批量下载和浏览器嗅探。
- 统一失败响应仍需兼容后端旧错误格式。
- PDF 下载的浏览器行为需要在 Playwright 中用 route mock 验证，不依赖真实 PDF 生成。

## 10. 变更记录

| 日期 | 作者 | 版本 | 变更说明 |
| --- | --- | --- | --- |
| 2026-05-23 | StephenQiu30 | 0.1.0 | 初始化首屏解析器与 AI/PDF 能力 issue 拆分 |
