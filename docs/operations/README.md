---
layer: operations
doc_no: "OPS"
audience:
  - Dev
  - QA
purpose: "规范本地运行、联调、调试和故障恢复流程。"
canonical_path: "docs/operations/README.md"
status: draft
version: "0.1.0"
owner: "StephenQiu30"
inputs:
  - "运行环境与后端联调状态"
outputs:
  - "Runbook 与联调 check list"
triggers:
  - "联调失败"
  - "本地环境漂移"
downstream:
  - "docs/acceptance"
---

# operations 说明

- 记录前端本地运行与联调步骤。
- 优先确保 dev server 与 video-server API 可达，问题先以 `operations` 文档更新，不在临时聊天中流失。
- OpenAPI 生成与校验流程见 [02-接口生成说明.md](./02-接口生成说明.md)。
