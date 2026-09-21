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

`--from-snapshot --check` 使用已提交的冻结快照重新生成并检查客户端漂移，不连接运行中的 API，供 CI 使用；它验证客户端与冻结契约一致，不代表与服务端最新提交同步。`--snapshot-only` 只更新冻结快照；`--check` 在干净工作区生成后检查契约与客户端漂移。生成器继续固定为 OpenAPI Generator `7.22.0` 的稳定 `dart-dio` 模板，使用 Homebrew 环境中的 Java 与 Maven 在本机解析固定版本 JAR，输出到 `packages/video_server_api/`，不依赖 Docker 服务。

允许的端点和查询参数集中声明在 `openapi_config.dart`。生成入口会验证 operationId、传递依赖 schema 和 `NativeBearerAuth`，包括经服务端管理员鉴权的 App 管理操作，排除 Web Cookie 契约；禁止手工修改生成目录或维护平行 DTO。

注册 API 要求先发送邮箱验证码。集成测试仅在隔离 API＋本地 SMTP 捕获器上运行，并通过 `--dart-define=REGISTRATION_TEST_INBOX_URL=http://127.0.0.1:<捕获器端口>/code` 读取测试邮件；生产 API 不提供验证码读取接口，不允许固定验证码或跳过验证。

业务一致性契约包含 48 个路径、56 个操作：历史搜索/状态、用户搜索/身份/启用状态、分页、资料更新、平台与 AI 配置管理、平台运行诊断、DOCX 导出。`exportAnalysisReport` 与缩略图一样按 binary 响应生成，调用不得退回手写 Dio 或携带 Bearer 的外部浏览器链接。

可选 query 中的 null 代表不发送条件；冻结器去除 nullable 标量的 null 分支，生成客户端据此省略未传参数，避免产生 `role=&is_active=`。测试覆盖空条件、false 与 retry_wait 的实际编码。

共享业务接口的 `{code, message, data}` 包装作为真实契约进入生成包，业务层只允许在 Repository 解包并校验 `data`，不得在页面或手写 Dio 逻辑中绕过。原生认证接口仍按 OpenAPI 的直接响应生成。

服务端 OpenAPI 3.1 的 `ErrorResponse.data` 使用 null-only schema；`dart-dio` 7.22 的 BuiltValue 模板无法为它生成具体 Dart 类型。冻结器仅将这种独立 null-only 字段规范为 nullable string 以满足代码生成，`anyOf`/`oneOf` 中的 null 分支保持不变。该兼容处理不改变线上响应，也不允许应用层读取该字段承载业务数据。
