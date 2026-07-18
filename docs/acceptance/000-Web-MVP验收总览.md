---
layer: Acceptance
status: accepted
result: pending
version: "2.0.0"
canonical_path: docs/acceptance/000-Web-MVP验收总览.md
purpose: "冻结 Web MVP 的全链路体验、契约与无障碍验收"
inputs:
  - "docs/prd/001-授权视频下载与AI知识化Web-MVP.md"
  - "docs/acceptance/002-邮箱登录与会话外壳验收.md"
outputs: []
---

# Web MVP 验收总览

## 1. 规则

每项只允许 `passed`、`failed` 或 `blocked`，并附测试输出、截图、trace、API 请求、生成类型 diff 或人工键盘记录。跨站请求伪造（CSRF）与 Backend for Frontend（BFF）在本验收中使用对应缩写。自动无障碍扫描不能替代人工验收。

## 2. 验收矩阵

| ID | 预期 | 方法 | 当前结果 |
| --- | --- | --- | --- |
| `WEB-AC-POL-001` | 权利确认、政策阻断和替代路径准确 | 组件/E2E | pending |
| `WEB-AC-AUTH-001` | 邮箱注册、验证、登录、退出和密码重置符合 accepted Server 契约 | 契约/组件/E2E | pending |
| `WEB-AC-SESSION-001` | PostgreSQL DatabaseStrategy 会话恢复、撤销、过期、退出和跨主体缓存隔离正确 | Cookie trace/E2E | pending |
| `WEB-AC-CSRF-001` | 签名 double-submit CSRF 与同源负向矩阵全部阻断 | 请求矩阵/E2E | pending |
| `WEB-AC-ID-001` | 无安装令牌、Bearer 或独立 session token；production/loopback profile 互斥且 BFF 不向 JavaScript 暴露当前 HttpOnly 会话 Cookie | bundle/network/日志扫描 | pending |
| `WEB-AC-SRC-001` | 合法链接创建并恢复同一 Probe | MSW/E2E | pending |
| `WEB-AC-SRC-002` | 规格字段准确且可键盘选择 | 契约/键盘 | pending |
| `WEB-AC-SRC-003` | 客户端无真实媒体 URL | bundle/存储扫描 | pending |
| `WEB-AC-ERR-001` | 所有稳定错误码有可操作体验 | 参数化组件测试 | pending |
| `WEB-AC-DL-001` | 下载进度、取消、重试和刷新恢复正确 | E2E/断网 | pending |
| `WEB-AC-ASSET-001` | 大文件不经 Next 且过期可重签 | 网络 trace | pending |
| `WEB-AC-AI-001` | AI 同意独立，结果与证据可读 | E2E/内容审查 | pending |
| `WEB-AC-MAP-001` | 画布与大纲一致且可键盘访问 | 组件/键盘 | pending |
| `WEB-AC-PDF-001` | PDF 可选择文本且内容版本一致 | 下载/文本抽取 | pending |
| `WEB-AC-PRI-001` | 私有、保留期和删除体验符合契约 | E2E/时钟 | pending |
| `WEB-AC-STATE-001` | SSE 重复、乱序、断线和部分成功可恢复 | reducer/E2E | pending |
| `WEB-AC-A11Y-001` | WCAG 2.2 AA 目标与完整键盘路径 | axe/人工 | pending |
| `WEB-AC-CONTRACT-001` | OpenAPI 生成类型无漂移 | CI diff | pending |
| `WEB-AC-PERF-001` | 解析 p95 与入口 Core Web Vitals 达标 | 固定样本/实测 | pending |

## 3. 视口与浏览器

- 375、768、1440 px，另执行 200% 缩放。
- Chromium、Firefox、WebKit。
- 正常、慢网、断网、事件断线和签名链接过期。
- 长标题、多语言、未知规格和完整错误矩阵。

人工无障碍记录必须列出当前 Plan 涉及的 WCAG 2.2 A/AA success criteria，逐项写 `passed` 或 `not-applicable + 理由`；axe 只作为补充，不能替代键盘、焦点、缩放、状态消息和屏幕阅读器抽查。

## 4. 性能

入口页 p75：LCP ≤2.5s、INP ≤200ms、CLS ≤0.1。Plan 001 用细化 Acceptance 固定的 Lighthouse user flow（20 次、移动视口、4× CPU、1.6 Mbps/150 ms RTT、冷导航）取 nearest-rank p75，并保留原始 JSON；未来 production RUM 另行验收。React Flow、编辑器和 PDF 面板不进入入口首屏 bundle。

## 5. 当前状态

产品尚未实现，全部为 `pending`。Plan 000 的认证细化验收见 `002-邮箱登录与会话外壳验收.md`；Plan 001 必须等待该文档全部 passed 后，才执行 `001-链接探测与清晰度目录验收.md`。

## 6. 变更记录

| 版本 | 日期 | 变更说明 |
| --- | --- | --- |
| 2.0.0 | 2026-07-18 | 独立复审通过；增加邮箱 UUID、Server 数据库会话、CSRF 和跨主体缓存验收，移除 installation 基线 |
| 1.0.0 | 2026-07-18 | 独立复审通过，冻结 Web MVP 验收；执行结果仍 pending |
| 0.3.0 | 2026-07-18 | 冻结 Plan 001 浏览器性能与 CWV lab profile |
| 0.2.0 | 2026-07-18 | 补充本地主体、性能与逐项 WCAG 人工验收规则 |
| 0.1.0 | 2026-07-18 | 初始化全链路 Web 验收矩阵 |
