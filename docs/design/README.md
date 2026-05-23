---
layer: design
doc_no: "DESIGN"
audience:
  - Dev
  - PM
purpose: "定义前端架构、页面模块和与 video-server 的接口约束。"
canonical_path: "docs/design/README.md"
status: draft
version: "0.1.0"
owner: "StephenQiu30"
inputs:
  - "video-server API 契约"
  - "页面交互需求"
outputs:
  - "页面流、状态流、数据模型决策"
triggers:
  - "接口字段变更"
  - "核心页面重构"
downstream:
  - "docs/acceptance"
---

# design 说明

- 仅存放架构与设计决策文档。
- 约定前端从 `src/lib/api.ts` 与 `@tanstack/react-query` 统一发起 API。
