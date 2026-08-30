# OpenAPI 生成入口

本入口参考 `@umijs/openapi` 的工作方式：配置声明 Swagger 来源和允许进入 App 的 operation，单一 Dart 命令负责拉取、校验、裁剪、冻结并生成客户端。

默认读取正在运行的 `video-server`：

```bash
dart run tool/openapi.dart
```

命令从 `http://127.0.0.1:8111/openapi.json` 读取 Swagger/OpenAPI，生成经过评审的 App 专用快照：

```text
contracts/openapi/video-server.openapi.json
```

临时使用其他契约地址时，不修改代码：

```bash
OPENAPI_SCHEMA_URL=https://api.example.com/openapi.json dart run tool/openapi.dart
```

`--snapshot-only` 只更新冻结快照；`--check` 在干净工作区生成后检查契约与客户端漂移。生成器继续固定为 OpenAPI Generator `7.22.0` 的稳定 `dart-dio` 模板，输出到 `packages/video_server_api/`。

允许的端点和查询参数集中声明在 `openapi_config.dart`。生成入口会验证 operationId、传递依赖 schema 和 `NativeBearerAuth`，排除管理端与 Web Cookie 契约；禁止手工修改生成目录或维护平行 DTO。
