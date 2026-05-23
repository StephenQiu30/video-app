---
layer: acceptance
doc_no: "ACPT-INDEX-05"
audience:
  - Dev
  - QA
purpose: "对齐 video-web 验收与 E2E 门禁文档入口。"
canonical_path: "docs/05-测试验收/README.md"
status: draft
version: "1.0.0"
owner: "StephenQiu30"
downstream:
  - "docs/acceptance/01-mvp-acceptance-gates.md"
---

# 05 测试验收文档入口

请统一维护以下文件：

- `docs/acceptance/01-mvp-acceptance-gates.md`

验收要求：

- Vitest 与 Playwright（现使用 `playwright`）为前端测试门禁
- 每轮提交前附带：`npm run test` / `npm run build` / `npm run lint` / `npm run test:e2e`
- 真实平台下载不直接进入前端 CI，E2E 侧以可控 mock 或稳定链路为准

