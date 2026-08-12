# 帧取 App 协作规范

本仓库负责 Flutter 原生客户端。`video-server` 负责 API、Web 平台、异步任务、Provider、对象存储和 AI Worker；默认只读，不在本仓库复制或修改服务端实现。

当前仓库只有规范与空目录骨架。Design/PRD 未确认、Plan 未 Ready、Acceptance 未 Defined 前，不得创建业务实现或生成 Android/iOS 工程。

## 唯一事实与交付链

- 产品与技术事实以 `docs/` 为准，入口为 `docs/README.md`。
- 交付固定遵循 `Design → PRD → Plan → Acceptance`。
- 上游变化先更新全部受影响的下游文档；来源服务端的历史证据不能替代 App 独立证据。
- 不从已删除的 Umi/Next.js 实现恢复页面、路由、依赖或视觉方案。
- 不保存临时计划、工作日志、缓存、构建产物、签名材料或本地环境文件。

## 平台与工具链

- 首期只支持 Android 与 iOS；禁止启用 Flutter Web。
- macOS、Windows、Linux、车机或电视端必须先建立独立 Design 和 Acceptance。
- 使用 Flutter stable 与 Dart；初始基线为 Flutter 3.44.7、Dart 3.12.2。
- 应用提交 `pubspec.lock`，依赖通过 `flutter pub` 管理，不引入第二套包管理或并行原生业务实现。
- Android/iOS 工程必须由统一的 `flutter create --platforms=android,ios` 命令生成，并记录组织 ID、应用 ID、最低系统版本和生成命令。

## 目录边界

- `lib/app/`：启动、应用级依赖装配、路由入口和生命周期。
- `lib/core/`：配置、网络、路由、安全存储、主题和跨功能错误模型。
- `lib/features/<name>/`：按能力组织页面、状态、领域模型与 repository；功能之间不互相读取内部实现。
- `lib/shared/`：至少两个功能稳定复用的无业务组件或模型，不作为杂物目录。
- `test/`：与 `lib/` 职责对应的单元和 Widget 测试；`integration_test/`：真机/模拟器关键流程。
- `tool/`：OpenAPI 生成、格式检查等可复现入口；生成客户端放在明确的生成目录，禁止手工修改。
- 单个长期源码文件原则上不超过 200 行，超过时按真实职责拆分。

## 推荐技术决策

以下依赖必须在 Design/Plan 获批后写入 `pubspec.yaml`：

- Riverpod：单向状态和依赖装配。
- go_router：声明式路由、深链接和认证重定向。
- Dio：统一 HTTPS、超时、取消、重试和拦截器。
- OpenAPI Generator 的 `dart-dio`：从 `video-server` OpenAPI 生成请求与模型。
- flutter_secure_storage：仅保存获批的原生 Refresh Credential；Access Token 只留内存。

不要同时引入 Bloc/GetX/Provider、第二套路由器、第二个 HTTP 客户端或手写平行 DTO。

## API 与状态

- `video-server /openapi.json` 是 REST 唯一契约；WebSocket 事件需要版本化 schema。
- 页面不得散落 Dio 调用、状态码映射或 Token 刷新逻辑。
- 自动重试只用于明确幂等且可安全重放的请求；创建任务使用服务端支持的幂等键。
- App 前后台切换、网络断开和 WebSocket 重连后，必须以服务端查询结果重新收敛状态。
- 文件只通过服务端授权的短期 URL 获取；下载进度、取消、失败和存储不足必须可恢复。

## 原生鉴权与安全

- 不复用浏览器 localStorage、WebView Cookie 抓取或明文持久化。
- Access Token 只在内存中存在；Refresh Credential 只能进入 Keychain/Keystore 支持的安全存储。
- 刷新请求必须单飞，失败后清除会话并回到登录；禁止无限重试。
- App 不接收 Provider Cookie、平台账号密钥、任意 yt-dlp 参数、Shell 输入或私网 URL。
- 日志、崩溃报告和分析事件不得包含完整媒体 URL query、Token、用户媒体、预签名 URL 或 AI 原始响应。
- 发布签名、证书、Provisioning Profile 和商店凭据不得进入 Git。

## 体验与可访问性

- 设计遵循 Material 3，并为 iOS 提供符合系统习惯的导航、返回和权限反馈。
- 页面必须覆盖初始、加载、成功、空、校验失败、请求失败、离线、禁用、重试和会话过期状态。
- 支持系统深浅主题、文字缩放、屏幕阅读器、动态字体和 reduced motion。
- 触控目标、对比度、焦点顺序和语义标签满足 WCAG 2.2 AA 对应要求。
- 首期不做分享扩展、后台常驻下载、推送通知或离线媒体库，除非先更新 Design。

## 测试与验证

核心逻辑使用 TDD；缺少自动化条件时必须在实现前定义最接近的可执行验收。工程建立后至少运行：

```bash
flutter pub get
dart format --output=none --set-exit-if-changed .
flutter analyze
flutter test
flutter test integration_test
flutter build apk --debug
flutter build ios --simulator --no-codesign
```

涉及真实鉴权、WebSocket、文件下载、深链接、权限或生命周期时，Mock 不能替代与 `video-server` 的真实集成证据。缺少环境、凭据、设备或证据时结论只能是 `blocked`。

## Git 与交付

- 提交使用中文 Conventional Commits，每个提交职责单一。
- 不强推、不改写远端、不静默提交无关改动。
- 只有用户明确要求时才提交、推送、创建 PR、改仓库设置或发布商店制品。
- 交付说明包含改动、验证、Acceptance 结论、残余风险、分支、提交、推送与工作区状态。
