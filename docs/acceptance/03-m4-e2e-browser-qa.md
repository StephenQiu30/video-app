---
layer: acceptance
doc_no: "ACCEPT-003"
audience:
  - Dev
  - QA
  - Ops
feature_area: ant-design-pro-admin-system
purpose: "记录 M4 PR-E 的 E2E 与本机浏览器验收结论。"
canonical_path: "docs/acceptance/03-m4-e2e-browser-qa.md"
status: draft
version: "1.0.0"
owner: "StephenQiu30"
inputs:
  - "Issue #92"
  - "Issue #93"
  - "Issue #94"
outputs:
  - "E2E 验收结果"
  - "本机前后端启动验收结果"
triggers:
  - "M4 PR-E 合并前验收"
downstream:
  - "GitHub PR"
---

# M4 E2E 与浏览器验收记录

## 1. 自动化 E2E

命令：

```bash
npm run test:e2e
```

结果：

- Chromium 4 条用例通过。
- 覆盖邮箱密码登录、解析链接、创建任务、任务列表、任务详情、管理员页面、普通用户访问管理后台 403。
- E2E 使用 Playwright `page.route` 提供稳定 API mock，不依赖线上服务和外部平台。

## 2. 本机前端浏览器验收

命令：

```bash
npm run dev
agent-browser open http://127.0.0.1:5173/user/login
agent-browser wait --load networkidle
agent-browser snapshot -i
agent-browser get url
agent-browser get title
```

结果：

- 前端 dev server 监听 `http://localhost:5173`。
- agent-browser 打开登录页成功。
- 当前 URL 为 `http://127.0.0.1:5173/user/login`。
- 页面标题为 `万能视频下载器`。
- 快照可见邮箱输入框、密码输入框和登录按钮。

## 3. 本机后端健康检查

命令：

```bash
cd ../video-server
npm run start
curl -sS http://127.0.0.1:8000/health
curl -sS http://127.0.0.1:8000/ready
```

结果：

- `/health` 返回 `{"status":"ok","app":"Stephen Video Downloader"}`。
- `/ready` 返回 `degraded`，其中数据库、Redis、媒体工具和下载工作目录检查通过。
- 本机未启动对象存储 endpoint，且未启动下载 worker，因此 `storage` 与 `queue` 为降级项。

## 4. 剩余风险

- 真实账号登录、真实解析下载和真实对象存储链路依赖后端本机数据、Worker 与存储服务，本 PR 使用稳定 mock 覆盖前端主流程。
- 若需要完整真实链路，应按后端 runbook 启动 API、Worker、Redis、对象存储后再执行手工样例。
