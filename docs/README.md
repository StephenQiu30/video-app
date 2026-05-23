---
layer: operations
doc_no: "DOCS-ROOT"
audience:
  - PM
  - Dev
  - QA
purpose: "定义 video-web 文档目录、更新边界与长期维护方式。"
canonical_path: "docs/README.md"
status: draft
version: "0.1.0"
owner: "StephenQiu30"
inputs:
  - "issue 清单与执行需求"
outputs:
  - "按类型归档的文档索引"
triggers:
  - "新里程碑前置、执行计划变更、验收更新"
downstream:
  - "docs/plans"
  - "docs/design"
  - "docs/acceptance"
  - "docs/operations"
---

# video-web Docs 根目录

## 目录说明

- `docs/plans/`：任务拆分、里程碑、执行顺序
- `docs/design/`：前端架构、状态管理、交互组件约定
- `docs/03-架构设计/`：架构文档入口（对齐阶段编号）
- `docs/acceptance/`：验收标准、测试结果、残留风险
- `docs/04-执行计划/`：执行计划文档入口（对齐阶段编号）
- `docs/operations/`：联调、启动、发布、故障处理
- `docs/05-测试验收/`：测试验收文档入口（对齐阶段编号）

每个目录内必须附带 `README.md`，说明该目录放什么/不放什么。

## 重点设计文档

- [design/04-ant-design-pro-admin-system.md](design/04-ant-design-pro-admin-system.md)：Ant Design Pro 官方脚手架迁移后的用户工作台与管理后台一体化方案。
