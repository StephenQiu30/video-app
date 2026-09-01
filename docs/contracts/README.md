# App 与 video-server 契约边界

## 唯一来源

- REST：评审后从 `video-server /openapi.json` 导出的 App 专用冻结快照。
- 实时状态：`video-server` 版本化 WebSocket 事件 schema。
- 文件：服务端授权的短期下载 URL 与完整性元数据。

本仓库不手写 FastAPI 平行 DTO，也不把服务端实现文档当作 App 验收证据。`dart run tool/openapi.dart` 直接读取 `video-server /openapi.json`，按声明式白名单冻结到 `contracts/openapi/video-server.openapi.json`，再使用 OpenAPI Generator 7.22.0 `dart-dio` 生成到 `packages/video_server_api/`，并由 CI 验证无漂移。

## 已冻结的原生契约

`video-server` 已冻结 44 个 App 操作。本仓库快照位于 `contracts/openapi/video-server.openapi.json`，包含原生认证、来源发现、媒体解析、下载创建、视频与剧本文档上传和删除、下载历史与详情、私有封面、短时下载地址、取消/重试、视频 AI 分析、剧本文档、平台状态，以及下载分析、文件、用户、平台目录和 AI 线路的管理员操作。Flutter 通过生成包 `video_server_api` 接入：

1. Access Token 只在内存中使用；Refresh Credential 只写入系统安全存储。
2. App 启动使用 Refresh Rotation 恢复会话；旧 Refresh Credential 不可重放。
3. 受保护 REST 使用 `Authorization: Bearer`；App 不抓取 Web Cookie，不使用 WebView 或 localStorage。
4. 退出先请求撤销服务端 Session，再无条件清理本地 Credential。
5. Web HttpOnly Cookie 契约继续独立存在，不进入 App 专用 OpenAPI。
6. 普通用户与管理员操作复用同一 Bearer 会话；服务端继续负责资源所有权和角色授权，App 路由门禁只作为第一层体验约束。
7. 私有封面使用生成客户端读取内存字节；短时下载地址只按操作即时签发，不写入日志或持久化状态。
8. 管理员用户列表的移动子契约只保留实际使用的分页参数，避免生成器把未传可选筛选项编码为空字符串。
9. 用户删除下载或剧本文档只通过生成 DELETE 操作提交；App 不推断 owner 或对象键，服务端完成归属校验、活动任务协调与私有对象清理。

## 当前业务契约状态

认证、登录后只读数据、来源发现、媒体检查、创建下载、视频与剧本文档上传和删除、详情封面、短期文件授权、取消/重试、视频 AI 分析和移动管理中心已经解除阻塞；WebSocket Token 更新、分析报告原生文件导出和剧本文档 AI 分析仍须逐项冻结后才能接入。对应未冻结操作继续 fail closed，不显示模拟远程结果。

开发环境直接连接本机启动的 `video-server` 及 Homebrew 管理的 PostgreSQL、Redis、RabbitMQ 等依赖，不使用 Docker 或 Compose 服务。服务地址通过 `VIDEO_SERVER_BASE_URL` 注入；默认值是 iOS 模拟器可访问的 `http://127.0.0.1:8111`，Android 模拟器构建时传入 `http://10.0.2.2:8111`。生产构建必须传入部署环境的 HTTPS 地址。
