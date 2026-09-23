# FrameFetch App 项目规范

核对日期：2026-09-21。本文仅适用于 `video-app` 独立仓库，是后续目录、命名、技术栈与 UI 迁移的基线。协作与交付规则以 [AGENTS.md](AGENTS.md) 为准，产品与验收事实见 [docs/README.md](docs/README.md)，精确依赖版本以 `pubspec.yaml` 和 `pubspec.lock` 为准。

本规范参考 Flutter 官方的 [App architecture guide](https://docs.flutter.dev/app-architecture/guide)、[Architecture recommendations](https://docs.flutter.dev/app-architecture/recommendations)、[Architecture case study](https://docs.flutter.dev/app-architecture/case-study)、Dart 官方的 [Effective Dart: Style](https://dart.dev/effective-dart/style) 与 [Package layout conventions](https://dart.dev/tools/pub/package-layout)。官方建议允许按项目规模调整；本项目固定采用下述 feature-first 混合结构，不直接照搬示例目录。官方文档当前对应的 Flutter 版本高于本项目工具链基线，架构调研不构成 SDK 升级授权。

## 1. 项目职责与需求边界

本项目是面向自托管 FrameFetch 服务端的 Flutter 客户端，只支持 iOS 与 Android，提供原生认证、媒体链接检查、文件上传、任务管理、媒体播放和分析结果展示。

`video-server` 是独立项目，负责 API、Web、Provider、媒体执行、存储和 AI 分析。本仓库通过 OpenAPI 契约与其协作，不复制服务端实现，也不制定服务端工程规范。

以下边界固定，变更前必须先更新 Design / PRD / Plan 与本文：

- 不启用 Flutter Web，不以 WebView 复用前端页面。
- 不在设备上运行 yt-dlp、FFmpeg、下载提取器或 AI 模型。
- 不在 App 中保存或维护第三方 Provider 会话。
- 文件必须由用户通过系统选择器显式选择；下载、播放和导出使用服务端授权接口。
- Access Token 只驻留内存，Refresh Credential 使用系统安全存储；不复用浏览器 Cookie。
- REST 客户端只从经评审的 App 专用 OpenAPI 快照生成，不手工维护平行 DTO，不修改生成代码。
- App 与 Web 必须共享产品语义、设计 Token、组件状态和交互规则；Flutter 不复用 Radix 的 DOM 实现。

## 2. 固定技术栈

| 层次 | 固定选型 | 项目约束 |
| --- | --- | --- |
| 工具链 | Flutter 3.44.7、Dart 3.12.2、JDK 21、Xcode 27 | 仓库基线；Android JVM target 17，iOS 最低支持 16.0 |
| 状态与装配 | Riverpod 3 | 状态管理和依赖注入；不并存 Bloc、GetX、Provider 等第二套方案 |
| 路由 | go_router | 声明式路由、深链接与认证重定向；页面不得自行维护平行导航状态 |
| 网络与契约 | Dio、OpenAPI Generator `dart-dio` | 生成客户端是唯一服务端 REST 契约入口 |
| 凭据存储 | flutter_secure_storage | 只保存 Refresh Credential 等必须持久化的敏感信息 |
| UI 组件 | shadcn_ui 0.57.x | App 可见业务组件统一使用 shadcn_ui 语义及项目封装 |
| 图标 | Phosphor Icons 3.x | 统一线性图标语言；不在同一语义中混用 Material/Cupertino 图标 |
| 设计系统 | `lib/core/theme/` 语义 Token | 对齐 Web shadcn 主题的颜色、圆角、间距、字体和状态，不在业务页面散落常量 |
| 播放 | media_kit / libmpv | 原生媒体播放；原生库由 CocoaPods 管理 |
| 文件与偏好 | file_selector、保存/分享插件、shared_preferences | 系统文件交互与非敏感偏好 |
| 本地化 | Flutter ARB | 所有面向用户的新增文本必须进入 ARB |
| 验证 | flutter_test、integration_test、Flutter analyze | 单元、Widget、视觉回归与设备流程验证 |

`pubspec.yaml` 中 `uses-material-design: true` 或 Flutter SDK 对 Material 的底层依赖，不代表允许继续新增 Material 风格业务组件。若 shadcn_ui 缺少组件，应先在 `shared/presentation/` 建立由统一 Token 驱动的 App 级封装；不得在 feature 页面直接拼装另一套视觉系统。

未经架构记录和评审，不新增第二套状态管理、路由、网络、设计系统、图标库、序列化模型或本地数据库。依赖升级与技术栈替换必须是独立变更，不能夹带在页面迁移中。

## 3. 架构原则

项目采用单向数据流，并把 Flutter 官方的 View / ViewModel / Repository / Service 职责映射为本项目术语：

```text
用户事件
  -> presentation: Screen / View / 组件
  -> application: Controller / Provider / State
  -> data: Repository -> Service / 生成的 API 客户端
  -> application 产出新的不可变状态
  -> presentation 渲染

domain: 仅在规则复杂或被多个 Controller 复用时参与上述流程
```

- `presentation` 只负责布局、渲染、路由触发、简单显隐与动画；不直接发网络请求、刷新 Token 或映射服务端错误。
- `application` 是 Flutter 官方 ViewModel 职责在 Riverpod 下的实现，持有页面状态、命令和业务流程编排。项目统一称 `Controller`，不得为同一职责再引入 `ViewModel`。
- `data` 负责外部数据访问。Repository 是数据事实入口并处理缓存、刷新、重试和错误转换；Service 只封装无状态的外部系统调用。
- Repository 对外暴露 `<Noun>Repository` 抽象，由 `<Noun>ApiRepository` 等实现承接具体数据源；既有未抽象实现按 feature 迁移时收敛。
- `domain` 是可选层，只容纳与 Flutter、网络和持久化无关的业务模型、值对象、规则及被多个 Controller 复用的 Use Case。简单透传逻辑不得为了“分层完整”创建 Use Case。
- 状态向 UI 单向流动，用户事件通过 Controller 命令返回。页面不得同时维护一份与 Provider 重复的长期业务状态。
- Repository 不读取另一个 Repository 的内部实现；跨数据源编排放在 Controller 或必要的 Use Case。
- 外部边界使用可替换的抽象并通过 Riverpod 注入，测试不得依赖真实网络或全局单例。

## 4. 标准目录结构

以下结构是新文件的唯一目标位置。既有文件按 feature 分批迁移，不进行无验收价值的一次性全仓搬移。

```text
video-app/
├── AGENTS.md                       协作与交付规范
├── PROJECT.md                      本技术与工程规范
├── README.md                       产品、安装与运行入口
├── design.md                       App 视觉规范
├── pubspec.yaml / pubspec.lock     依赖声明与锁文件
├── analysis_options.yaml           Dart 静态分析配置
├── android/                        Android 原生工程
├── ios/                            iOS 原生工程
├── assets/                         字体、图像等静态资源
├── contracts/openapi/              App 专用 OpenAPI 契约快照
├── packages/video_server_api/      自动生成的 Dart API 客户端
├── lib/
│   ├── app/                        Composition Root、根路由、根页面和生命周期
│   │   ├── presentation/
│   │   └── router/
│   ├── core/                       无业务语义的跨功能基础设施
│   │   ├── config/
│   │   ├── network/
│   │   ├── routing/
│   │   ├── security/
│   │   └── theme/                  shadcn 语义 Token 与 AppTheme
│   ├── features/
│   │   └── <feature>/
│   │       ├── presentation/       Screen、View、局部组件和纯展示映射
│   │       ├── application/        Controller、Provider、不可变 State 和流程编排
│   │       ├── domain/             可选：业务模型、值对象、规则、Use Case
│   │       └── data/               Repository、Service、Gateway 和数据映射
│   ├── l10n/                       ARB 与生成的本地化代码
│   └── shared/
│       └── presentation/           已被多个 feature 稳定复用的 App 级 UI
├── test/                           路径尽量镜像 lib/ 的单元与 Widget 测试
├── integration_test/               模拟器/真机端到端用户流程
├── tool/                           仓库质量与可复现工具入口
│   └── openapi/                    OpenAPI 生成配置与工具
└── docs/                           Design、PRD、Plan、Acceptance 与契约说明
```

目录职责规则：

- `app/` 只做全局装配；具体业务不得进入根 App 或根 Router。
- `core/` 只容纳配置、网络、安全、路由和主题等基础设施，不建立 `helpers/`、`utils/` 或 `common/` 杂物目录。
- `features/<feature>/` 是业务边界。一个 feature 不得导入另一个 feature 的 `presentation/`、`application/` 或 `data/` 内部文件。
- `domain/` 可缺省；空目录不提交。当前 feature 没有复杂或复用规则时，保持 application + data + presentation 即可。
- `shared/` 不是临时中转站。只有两个及以上 feature 已稳定复用且不携带某一 feature 语义的内容，才允许迁入。
- 不再新增含义模糊的 `shared/widgets/`。共享 UI 统一进入 `shared/presentation/`；既有偏差在相关 feature 迁移时处理。
- 自动生成内容只放在明确的生成目录或使用 `.g.dart` 等生成后缀，禁止手工编辑。

## 5. Dart 与文件命名规范

基础规则遵循 Effective Dart：

- 目录、Dart 文件、包名使用 `lowercase_with_underscores`。
- 类型、扩展和枚举使用 `UpperCamelCase`。
- 变量、参数、方法、Provider 和常量使用 `lowerCamelCase`；常量不使用全大写下划线。
- 缩写按单词处理：`ApiClient`、`HttpClient`、`UrlParser`、`UserId`，不写 `APIClient`、`HTTPClient`、`URLParser`、`UserID`。
- 布尔值使用 `is`、`has`、`can`、`should` 等可读前缀。
- 不使用匈牙利命名，不显式声明无必要的 `library` 名称。
- 避免 `Manager`、`Helper`、`Utils`、`Common`、`Base` 等不能表达职责的名称。

项目后缀固定如下：

| 职责 | 文件名 | Dart 类型/标识符 |
| --- | --- | --- |
| 路由页面 | `<feature>_screen.dart` | `<Feature>Screen` |
| 页面内可复用视图 | `<noun>_view.dart` / `<noun>_section.dart` | `<Noun>View` / `<Noun>Section` |
| Riverpod 流程与状态拥有者 | `<feature>_controller.dart` | `<Feature>Controller` |
| 不可变 UI 状态 | `<feature>_state.dart` | `<Feature>State` |
| Provider 声明 | `<feature>_provider.dart` | `<feature>Provider`；集合文件可用 `<feature>_providers.dart` |
| 数据事实入口 | `<noun>_repository.dart` | `<Noun>Repository` |
| API Repository 实现 | `<noun>_api_repository.dart` | `<Noun>ApiRepository` |
| 无状态外部适配 | `<source>_service.dart` | `<Source>Service` |
| 平台/凭据边界 | `<noun>_gateway.dart` | `<Noun>Gateway`；只用于明确的端口语义 |
| 领域值对象/模型 | `<noun>.dart` | `<Noun>` |
| 可选领域用例 | `<verb>_<noun>_use_case.dart` | `<Verb><Noun>UseCase` |
| 单元/Widget 测试 | 与源文件镜像的 `*_test.dart` | 测试描述使用可观察行为 |
| 集成流程测试 | `<journey>_flow_test.dart` | 一个文件覆盖一条核心用户旅程 |
| 测试替身 | `<noun>_fake.dart`；同边界多个替身用 `<noun>_fakes.dart` | `Fake<Noun>` |

补充规则：

- 一个文件聚焦一个主要公开概念；超过约 200 行时优先按职责拆分，不按行数机械拆分。
- 路由目的地使用 `Screen`，Screen 内可组合区域使用 `View` 或有业务含义的名词；不得统一命名为 `Page`、`Widget1`、`Content`。
- Controller 同时承载 Flutter 官方 ViewModel 的状态与命令职责；禁止同一 feature 混用 `Bloc`、`Notifier`、`Controller`、`ViewModel` 表示同一种角色。
- ARB key 使用 `lowerCamelCase` 并体现语义，不把英文原文直接当 key。
- 测试 Key 的字符串值使用稳定的 `feature-element[-id]` 小写连字符格式，不依赖展示文案。
- `lib/` 跨目录引用使用 `package:framegrab/...`；同一小目录内可用相对引用。禁止导入其他包的 `lib/src/`。
- import 顺序为 Dart SDK、Flutter/第三方包、本项目包；各组内按字母排序并由格式化工具维护。
- 不为 feature 建立 barrel export；显式导入真实文件，避免隐藏跨层依赖。

## 6. shadcn_ui 同步契约

“与前端完全统一”在本项目中表示视觉语义和交互状态一致，而不是在 Flutter 中复制 Radix 的 Web 实现。

- Web shadcn 主题变量是视觉输入，Flutter 在 `core/theme/` 维护 `background`、`foreground`、`card`、`popover`、`primary`、`secondary`、`muted`、`accent`、`destructive`、`border`、`input`、`ring` 与圆角等语义映射。
- 页面只消费语义 Token 与 App 级组件，不直接使用十六进制颜色、临时间距或自行计算深浅色。
- Button、Input、Select、Dialog、Sheet、Tabs、Card、Table/List、Alert、Toast 等状态必须覆盖默认、按下/悬停（适用时）、聚焦、禁用、加载、错误和深浅色。
- 组件缺口先补共享封装和对应 Widget/视觉测试，再用于 feature 页面；不得用 Material/Cupertino 外观临时占位后长期保留。
- 图标只使用 Phosphor 语义映射；平台规定必须使用系统控件的场景作为明确例外记录。
- 页面标题、正文、指标、空状态、错误状态与动作区默认左对齐；只有底部导航标签、单纯图标按钮等控件内容可居中。
- Web 新增面向用户的页面或内容章节时，App 必须同步更新路由/入口、信息层级、ARB 文案和 Widget 内容契约；若因平台边界不实现，必须在 Design/Acceptance 明确记录。
- 每次 Web Token 或核心组件变更，都要同时更新 App 映射、组件预览/视觉基线和 Design/Acceptance 记录。

## 7. 接口与运行边界

- OpenAPI 上游来源为服务端 `/openapi.json`。契约变更先更新快照，再生成 `packages/video_server_api/`，最后调整 Repository 适配。
- 共享业务接口统一采用 `{code, message, data}` 响应包装；生成客户端保留 `ApiResponse*` 类型，Repository 是唯一解包和必填 `data` 校验边界。原生认证接口若在 OpenAPI 中声明为直接响应，禁止套用共享包装假设。
- 页面不得把反序列化、权限、认证或限流失败统一描述为网络中断；错误响应优先读取 `message`，仅为旧契约兼容读取 `detail`。
- 当前活动任务与分析通过受控轮询收敛状态；WebSocket Token 更新仍以项目验收记录为准。
- `VIDEO_SERVER_BASE_URL` 指定服务端地址；真机必须使用设备可访问的地址，生产构建必须使用有效 HTTPS。
- iOS 最低支持 16.0，使用 Xcode 27 构建；媒体原生依赖使用 CocoaPods，`pubspec.yaml` 中关闭 Swift Package Manager。
- 生成客户端、Mock 与服务端测试不能替代 App Repository、Widget 和真实设备验证。

## 8. 后续变更门禁

在本规范评审确认前，暂停扩大 UI 组件迁移和业务页面改写。后续按以下顺序执行：

1. 先列出现有目录、文件和组件到目标结构的迁移清单，不直接批量移动。
2. 以一个 feature 为最小迁移批次，同时处理目录、命名、依赖方向、shadcn_ui 组件和测试。
3. 每个批次保持可编译、可回滚，不让新旧状态管理或两套视觉系统继续扩散。
4. 新文件立即遵守本文；旧文件只在对应 feature 被迁移或修改时收敛，避免纯重命名造成大范围冲突。
5. 每批至少执行格式化、`flutter analyze`、相关单元/Widget 测试；涉及核心旅程、平台能力或视觉变化时补充 integration_test、模拟器/真机和截图证据。
6. 当前工作区中已存在的迁移改动不因“代码已写入”自动视为通过，仍需按 Design → PRD → Plan → Acceptance 和本文逐项复核。

质量入口包括 `dart run tool/check.dart`、`flutter analyze`、单元与 Widget 测试、`integration_test` 及 Android/iOS 构建。签名、凭据、本地环境和构建产物不得进入 Git。

详细入口：[运行说明](README.md)、[文档索引](docs/README.md)、[契约边界](docs/contracts/README.md)、[OpenAPI 工具](tool/openapi/README.md)。
