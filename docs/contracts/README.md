# App 与 video-server 契约边界

## 唯一来源

- REST：评审后从 `video-server /openapi.json` 导出的 App 专用冻结快照。
- 实时状态：`video-server` 版本化 WebSocket 事件 schema。
- 文件：服务端授权的短期下载 URL 与完整性元数据。

本仓库不手写 FastAPI 平行 DTO，也不把服务端实现文档当作 App 验收证据。`dart run tool/openapi.dart` 直接读取 `video-server /openapi.json`，按声明式白名单冻结到 `contracts/openapi/video-server.openapi.json`，再使用 OpenAPI Generator 7.22.0 `dart-dio` 生成到 `packages/video_server_api/`，并由 CI 验证无漂移。

## 已冻结的原生契约

`video-server` 已冻结 `/api/app/v1/auth/*` 以及四个登录后只读业务操作。本仓库快照位于 `contracts/openapi/video-server.openapi.json`，包含注册、登录、当前用户、Refresh Rotation、退出，以及下载历史、下载任务详情、剧本文档列表和平台状态。Flutter 通过生成包 `video_server_api` 接入：

1. Access Token 只在内存中使用；Refresh Credential 只写入系统安全存储。
2. App 启动使用 Refresh Rotation 恢复会话；旧 Refresh Credential 不可重放。
3. 受保护 REST 使用 `Authorization: Bearer`；App 不抓取 Web Cookie，不使用 WebView 或 localStorage。
4. 退出先请求撤销服务端 Session，再无条件清理本地 Credential。
5. Web HttpOnly Cookie 契约继续独立存在，不进入 App 专用 OpenAPI。
6. `GET /api/downloads/history`、`GET /api/downloads/{job_id}`、`GET /api/documents` 与 `GET /api/providers` 复用同一 Bearer 会话，只返回当前用户或公开能力范围的数据。

## 仍待冻结的业务契约

认证、三个只读列表和下载任务详情已经解除阻塞；媒体检查、创建下载、文件上传、详情动作、短期文件授权和 WebSocket Token 更新仍须逐项冻结后才能接入。对应操作继续 fail closed，不显示模拟远程结果。

开发环境通过 `VIDEO_SERVER_BASE_URL` 注入服务地址；iOS 模拟器可使用 `http://127.0.0.1:8000`，Android 模拟器使用 `http://10.0.2.2:8000`。生产构建必须传入部署环境的 HTTPS 地址。
