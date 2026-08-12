# OpenAPI 生成入口

`video-server` 的移动端原生认证契约冻结后，将经过评审的 App 专用 OpenAPI 快照放到：

```text
contracts/openapi/video-server.openapi.json
```

然后执行：

```bash
./tool/openapi/generate.sh
```

生成器固定为 OpenAPI Generator `7.22.0` 的稳定 `dart-dio` 模板，输出到 `packages/video_server_api/`。快照必须排除管理端接口，并包含原生登录、刷新、撤销、Bearer 鉴权以及 WebSocket 事件 schema；当前浏览器 Cookie 契约不能作为移动端生成输入。
