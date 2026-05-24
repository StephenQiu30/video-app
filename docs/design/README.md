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
- 当前前端采用 Ant Design Pro / Umi Max，页面请求优先使用 OpenAPI 生成服务。
- `03-SaaS布局与OpenAPI生成设计.md` 定义 M3 SaaS 顶部布局、异常状态和 OpenAPI API 生成方案。
- `04-AntDesignPro一体化后台设计.md` 定义 Ant Design Pro 官方脚手架迁移后的用户工作台与管理后台一体化方案。
