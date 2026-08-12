# App 与 video-server 契约边界

## 唯一来源

- REST：评审后从 `video-server /openapi.json` 导出的 App 专用冻结快照。
- 实时状态：`video-server` 版本化 WebSocket 事件 schema。
- 文件：服务端授权的短期下载 URL 与完整性元数据。

本仓库不手写 FastAPI 平行 DTO，也不把服务端实现文档当作 App 验收证据。移动端快照只在契约冻结时进入 `contracts/openapi/video-server.openapi.json`，使用 `./tool/openapi/generate.sh` 与 OpenAPI Generator 7.22.0 `dart-dio` 生成到 `packages/video_server_api/`，并由 CI 验证无漂移。

## 原生客户端前置契约

当前浏览器 Web 使用 HttpOnly Cookie 会话。Flutter 原生客户端开始认证实现前，`video-server` 必须通过独立 Design/PRD/Acceptance 冻结以下能力：

1. 原生登录、刷新、退出和撤销的稳定 OpenAPI 契约。
2. 短期 Access Token 与可轮换 Refresh Credential 的明确生命周期。
3. `Authorization: Bearer` 或同等原生安全机制；不得要求 App 抓取 WebView Cookie。
4. Refresh 重放检测、单设备撤销、全局退出、用户禁用和密码修改后的失效规则。
5. CORS 不是原生安全边界；服务端继续独立执行身份、角色、资源归属和限流校验。
6. WebSocket 认证、重连与 Token 更新机制。
7. API 版本兼容窗口与最低支持 App 版本响应。

在这些条件通过前，App 的认证、受保护页面和真实端到端验收状态必须为 `blocked`。

## 仍可先行的工作

- Flutter 工程与目录基座。
- 主题、路由壳层、错误模型和无凭据健康检查。
- OpenAPI 生成配置与“缺少移动契约时 fail closed”的入口。
- 不接触真实用户会话的 Widget 与可访问性测试。
