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

# video-web 文档中心

## 目录说明

- `docs/plans/`：任务拆分、里程碑、执行顺序
- `docs/design/`：前端架构、状态管理、交互组件约定
- `docs/acceptance/`：验收标准、测试结果、残留风险
- `docs/operations/`：联调、启动、发布、故障处理
- `docs/openapi/`：OpenAPI 契约快照与生成说明

目录统一使用英文领域名，Markdown 文档统一使用中文文件名；机器消费的契约文件可保留英文命名。

每个长期目录内保留 `README.md` 作为标准入口文件名，说明该目录放什么/不放什么。

## 重点设计文档

- [design/04-AntDesignPro一体化后台设计.md](design/04-AntDesignPro一体化后台设计.md)：Ant Design Pro 官方脚手架迁移后的用户工作台与管理后台一体化方案。
