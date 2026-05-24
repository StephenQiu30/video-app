---
layer: design
doc_no: "DESIGN-002"
audience:
  - PM
  - Dev
  - QA
  - Ops
feature_area: conversion-parser-ai-pdf
purpose: "定义 video-web 首屏解析器、能力证明、AI 摘要与 PDF 报告入口的前端重构设计。"
canonical_path: "docs/design/02-首屏解析器-AI-PDF重设计.md"
status: draft
version: "0.1.0"
owner: "StephenQiu30"
inputs:
  - "video-server API 契约"
  - "docs/design/01-前端运行架构设计.md"
  - "AGENTS.md"
outputs:
  - "首屏解析器与能力证明设计"
  - "任务工作台与详情页体验边界"
  - "AI 与 PDF 跨仓依赖边界"
triggers:
  - "首页、工作台或任务详情页重构"
  - "AI 摘要、思维导图或 PDF 报告能力接入"
downstream:
  - "docs/plans/06-首屏解析器-AI-PDF任务拆分.md"
  - "docs/acceptance/01-MVP验收门禁.md"
---

# 首屏解析器与能力证明重构设计

## 1. 背景

`video-web` 当前已经具备 React + TypeScript + RadixUI primitives + TanStack Query 的 MVP 闭环：登录、解析、创建任务、任务列表、详情、取消、重试和下载链接。现阶段的问题不是缺少入口，而是产品表达偏线性：页面更像功能验证台，还没有把“万能视频下载器”的服务能力、信任感、AI 摘要和 PDF 报告形成统一的转化体验。

本设计采用“首屏解析器 + 能力证明”方案：让首页第一视觉就是可操作解析器，同时通过蓝白简约的能力模块证明平台支持、格式选择、任务队列、AI 摘要和 PDF 报告能力。

## 2. 目标

- 首页 `/` 首屏提供链接输入、解析按钮、登录后解析提示和能力预览。
- 未登录用户可以输入链接，但点击解析时进入 `/auth`，登录后恢复 pending URL。
- 已登录用户直接调用 `/api/parse`，展示真实解析结果、格式选择，并可创建任务进入详情页。
- 工作台作为产品内容的一部分自然出现，不做明显割裂的“官网 / 后台”风格。
- 任务详情页增强 AI 摘要、思维导图、事件流、下载链接和 PDF 报告入口。
- API 错误展示适配后端统一失败响应，同时保持现有成功响应兼容。
- 视觉系统保持蓝白简约、可信、克制，减少多余装饰。

## 3. 非目标

- 不在前端直接调用大模型或暴露 API Key。
- 不在浏览器生成正式 PDF，正式报告由后端 `/api/tasks/{task_id}/pdf` 生成。
- 不在本阶段实现游客真实解析；真实解析仍要求登录。
- 不承诺 RSS、批量下载、浏览器嗅探或本地客户端能力，除非后端已经提供。
- 不在本阶段替换路由体系或引入新的大型 UI 框架。

## 4. 核心内容

### 4.1 信息架构

| 页面 | 角色 | 核心模块 |
| --- | --- | --- |
| `/` | 转化首页 + 首屏解析器 | 链接输入、解析按钮、平台标签、能力证明、解析结果、三步流程、FAQ |
| `/auth` | 登录回跳 | GitHub 登录、token 回写、pending URL 恢复 |
| `/workbench` | 任务管理 | 任务统计、筛选、状态列表、最近动作、进入详情 |
| `/tasks/:taskId` | 任务详情 | 进度、事件流、取消、重试、下载链接、AI 摘要、PDF 导出 |

首页是主产品面，不再只是营销页；工作台和详情页是同一服务体验的深层页面。

### 4.2 首页首屏行为

未登录：

1. 用户在首页输入视频链接。
2. 点击“解析视频”。
3. 前端保存 pending URL 到 `sessionStorage.video_web_pending_url`。
4. 跳转 `/auth`。
5. 登录成功后回到 `/`，恢复输入框内容并提示继续解析。

已登录：

1. 用户输入链接并点击解析。
2. 调用 `POST /api/parse`。
3. 显示标题、封面、平台、合规提示、格式列表。
4. 用户选择格式并创建任务。
5. 创建成功后跳转 `/tasks/:taskId`。

### 4.3 能力证明模块

首页能力证明只展示后端已经具备或本轮明确拆分的能力：

- 支持平台：国内短视频、B 站、YouTube 等主流平台，以能力矩阵形式表达。
- 格式选择：分辨率、文件大小、格式标签、推荐规格。
- 任务队列：排队、下载中、成功、失败、取消、重试。
- AI 摘要：展示 `ai_summary`、`ai_mindmap`、`ai_status` 的产品入口。
- PDF 报告：展示“导出分析报告”能力，说明报告由后端生成。

### 4.4 AI 能力边界

前端仅展示 AI 能力结果，不直接接入模型。后端建议采用阿里云百炼 / DashScope Qwen provider：

- `AI_PROVIDER=dashscope`
- `DASHSCOPE_API_KEY=__REPLACE_WITH_YOUR_DASHSCOPE_API_KEY__`
- `DASHSCOPE_BASE_URL=https://dashscope.aliyuncs.com/compatible-mode/v1`
- `DASHSCOPE_MODEL=qwen-plus`

前端状态展示：

| `ai_status` | 前端状态 |
| --- | --- |
| `null` 或 `skipped` | AI 摘要未启用 |
| `processing` | 智能分析中 |
| `completed` | 展示摘要、思维导图和导出报告 |
| `failed` | 展示失败原因，但主任务仍可下载 |

### 4.5 PDF 报告入口

任务详情页新增报告区域：

- 成功任务显示“导出分析报告”按钮。
- 未完成任务显示“任务完成后可导出报告”。
- AI 摘要缺失时显示“可导出基础任务报告，AI 摘要暂不可用”。
- 点击后请求 `GET /api/tasks/{task_id}/pdf`，由浏览器下载 PDF。
- 错误使用统一错误提示，不暴露后端堆栈。

后端报告增强建议拆到 `video-server`：使用 WeasyPrint + Jinja2 HTML 模板生成更美观的中文报告，并保留现有 `fpdf2` 作为过渡或 fallback。

### 4.6 视觉系统

设计风格：蓝白简约、现代 AI 工具风、低装饰、高可读性。

| Token | 值 | 用途 |
| --- | --- | --- |
| Primary | `#2563EB` | 主按钮、链接、关键状态 |
| Secondary | `#3B82F6` | hover、次级强调 |
| Background | `#F8FAFC` | 页面背景 |
| Surface | `#FFFFFF` | 表单、列表、内容区域 |
| Text | `#0F172A` | 主文本 |
| Muted | `#475569` | 辅助文本 |
| Border | `#DBEAFE` | 浅蓝边框 |

约束：

- 不使用大面积紫色渐变、装饰性 blob 和复杂背景。
- 卡片只用于独立模块，不做卡片套卡片。
- 按钮、输入框和主要点击区满足 44px 触控目标。
- 所有交互有 `focus-visible` 状态。
- 动效控制在 150-300ms，并尊重 `prefers-reduced-motion`。

### 4.7 前端模块边界

建议拆分：

- `src/features/parser/`：首屏解析表单、解析结果、格式选择。
- `src/features/tasks/`：任务列表、任务状态、任务动作、事件流。
- `src/features/reports/`：PDF 报告入口和下载状态。
- `src/features/ai/`：AI 摘要、思维导图展示、AI 状态提示。
- `src/components/layout/`：导航、页面 Shell、页脚。
- `src/lib/api.ts`：继续作为唯一 API client 边界。

## 5. 关联文档

### 5.1 输入文档

1. `docs/design/01-前端运行架构设计.md`
2. `AGENTS.md`
3. `video-server` API 契约

### 5.2 输出文档

1. `docs/plans/06-首屏解析器-AI-PDF任务拆分.md`

### 5.3 下游文档

1. `docs/acceptance/01-MVP验收门禁.md`
2. `docs/operations/01-联调运行手册.md`

## 6. 验收门禁

- 未登录解析会保存 pending URL 并跳转登录。
- 登录成功后恢复 pending URL。
- 已登录解析结果展示真实字段：标题、封面、平台、格式、合规提示。
- 创建任务后跳转详情页。
- 任务详情页提供下载、取消、重试、AI 摘要和 PDF 报告入口。
- API 失败响应能展示后端 `error.message`。
- `npm run lint`、`npm run test`、`npm run build`、`npm run test:e2e` 通过。

## 7. 风险与边界

- AI 与 PDF 美观增强需要后端配合，前端 PR 不直接实现后端模板引擎。
- 后端如果尚未完成统一失败响应，前端需要兼容旧错误结构。
- 游客真实解析不在本阶段实现，否则会扩大后端安全和限流范围。
- 首页不能虚标未实现能力，RSS、批量队列、浏览器嗅探等只可作为后续路线，不进入当前主文案。

## 8. 待确认问题

- PDF 报告后端增强是否单独在 `video-server` 建 milestone。
- AI 默认模型是否采用 `qwen-plus`，生产是否允许通过环境变量切换。

## 9. 变更记录

| 日期 | 作者 | 版本 | 变更说明 |
| --- | --- | --- | --- |
| 2026-05-23 | StephenQiu30 | 0.1.0 | 初始化首屏解析器、能力证明、AI 与 PDF 设计 |
