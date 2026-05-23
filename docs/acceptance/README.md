---
layer: acceptance
doc_no: "ACPT"
audience:
  - QA
  - Dev
purpose: "记录前端验收门禁、测试证据和风险。"
canonical_path: "docs/acceptance/README.md"
status: draft
version: "0.1.0"
owner: "StephenQiu30"
inputs:
  - "测试脚本和执行反馈"
outputs:
  - "可追溯验收记录"
triggers:
  - "关键任务完成"
  - "回归测试执行"
downstream:
  - "docs/operations"
---

# acceptance 说明

- 每次实现关键行为前需先有失败测试，再补绿。
- 验收文件需包含执行命令与时间戳，未通过项需列明根因与下一步动作。
