---
layer: operations
doc_no: "OPS-001"
audience:
  - Dev
  - QA
purpose: "给出 video-web 的本地运行、联调与快速排障步骤。"
canonical_path: "docs/operations/01-runbook.md"
status: draft
version: "1.0.0"
owner: "StephenQiu30"
inputs:
  - "项目 README 与后端启动状态"
outputs:
  - "本地联调 check list"
triggers:
  - "首次联调"
  - "端口/接口异常"
downstream:
  - "docs/acceptance/01-mvp-acceptance-gates.md"
---

# video-web 联调运行手册

## 1. 初始化

```bash
npm install
cp .env.example .env
```

## 2. 启动前端

```bash
npm run dev
```

默认访问 `http://localhost:5173`，后端要求 `VITE_API_BASE_URL` 可用（默认 `http://localhost:8000`）。

## 3. 问题排查

- 401：检查 `/api/auth/github/callback` 回跳 token 是否写入 `localStorage`.
- 空列表：检查 `/api/tasks` 鉴权头与 `token` 是否有效。
- 无法下载：确认任务状态已 `SUCCEEDED`，再调用 `/tasks/:id/download-link`。

## 4. 证据命令

```bash
npm run lint
npm run test
npm run build
npm run test:e2e
```
