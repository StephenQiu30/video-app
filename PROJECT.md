# FrameFetch App 项目说明

核对日期：2026-09-18。本文仅适用于 `video-app` 独立仓库，记录当前技术选型和文件结构。协作与交付规则以 [AGENTS.md](AGENTS.md) 为准，产品与验收事实见 [docs/README.md](docs/README.md)，精确依赖版本以 `pubspec.yaml` 和 `pubspec.lock` 为准。

## 1. 项目职责

本项目是面向自托管 FrameFetch 服务端的 Flutter 客户端，支持 iOS 与 Android，提供原生认证、媒体链接检查、文件上传、任务管理、媒体播放和分析结果展示。

`video-server` 是独立项目，负责 API、Web、Provider、媒体执行、存储和 AI 分析。本仓库通过接口契约与其协作，不复制服务端实现，也不制定服务端工程规范。

## 2. 技术选型

| 层次 | 当前选型 | 用途 |
| --- | --- | --- |
| 框架 | Flutter 3.44.7、Dart 3.12.2 | iOS / Android 共用业务实现，版本为仓库工具链基线 |
| 状态与装配 | Riverpod | 状态管理和依赖注入 |
| 路由 | go_router | 声明式路由、深链接与认证重定向 |
| 网络与契约 | Dio、OpenAPI Generator `dart-dio` | 从 App 专用契约快照生成客户端 |
| 凭据存储 | flutter_secure_storage | 系统安全存储；Access Token 保留在内存 |
| 播放 | media_kit / libmpv | 原生媒体播放 |
| 文件与偏好 | file_selector、文件保存/分享插件、shared_preferences | 用户选择文件、导出及非敏感偏好 |
| 界面与语言 | Material 3、ARB | 主题、可访问性和中英本地化 |
| 验证 | flutter_test、integration_test、Flutter analyze | 单元、Widget 与设备流程验证 |

依赖依据：[pubspec.yaml](pubspec.yaml)。App 不在设备上运行下载提取器、转码器或 AI 模型；这些能力由服务端执行。

## 3. 目录结构

以下为主要源码与工具入口，省略依赖、缓存、构建产物和签名材料。

```text
video-app/
├── AGENTS.md                       本仓库协作与交付规范
├── PROJECT.md                      技术选型与目录说明
├── README.md                       产品与运行入口
├── design.md                       App 视觉规范
├── pubspec.yaml / pubspec.lock     依赖清单与锁文件
├── analysis_options.yaml           Dart 静态分析配置
├── android/                        Android 原生工程
├── ios/                            iOS 原生工程
├── assets/                         应用资源
├── lib/
│   ├── app/                        启动、依赖装配、路由与生命周期
│   ├── core/                       配置、网络、安全存储、主题和错误模型
│   ├── features/                   按业务能力组织的模块
│   ├── l10n/                       ARB 与生成的本地化代码
│   └── shared/                     跨功能稳定复用的组件与模型
├── contracts/openapi/              App 专用 OpenAPI 契约快照
├── packages/video_server_api/      生成的 Dart API 客户端
├── tool/                           质量检查与可复现工具入口
│   └── openapi/                    OpenAPI 生成配置与工具
├── test/                           单元与 Widget 测试
├── integration_test/               模拟器、设备及集成流程测试
└── docs/                           设计、需求、计划、验收与契约说明
```

功能模块在 `lib/features/<name>/` 内按实际职责组织 application、data、domain、presentation 等目录；功能之间不读取彼此内部实现。页面不直接散落网络请求、Token 刷新或错误映射，跨功能复用内容仅在形成稳定需求后放入 `shared/`。

## 4. 接口与运行边界

- REST 客户端从经评审的 App 专用 OpenAPI 快照生成，上游来源为服务端 `/openapi.json`，不手工修改生成代码或维护平行 DTO。
- Access Token 仅驻留内存，Refresh Credential 使用系统安全存储，不复用浏览器 Cookie 或 WebView 登录。
- 当前活动任务与分析通过受控轮询收敛状态；WebSocket Token 更新仍以项目验收记录为准。
- 文件通过系统选择器由用户显式选择；上传、下载和播放使用服务端授权的接口及短期地址。
- App 不保存或维护 YouTube、抖音等 Provider 会话，不运行 yt-dlp、FFmpeg 或 AI 推理。
- `VIDEO_SERVER_BASE_URL` 用于指定服务端地址；真机需要可访问的地址，生产构建使用有效 HTTPS。
- 当前支持 iOS / Android，不启用 Flutter Web。iOS 的媒体原生依赖使用 CocoaPods，`pubspec.yaml` 中关闭 Swift Package Manager。

## 5. 验证与文档维护

质量入口包括 `dart run tool/check.dart`、`flutter analyze`、单元与 Widget 测试、`integration_test` 及 Android/iOS 构建。按改动范围验证设备生命周期、认证、上传、播放和文件保存等流程；Mock 与服务端测试不能替代 App 自身的真实设备证据。

功能资料按 Design → PRD → Plan → Acceptance 维护。新增平台、原生能力或依赖先遵循本仓库规范；签名、凭据、本地环境及构建产物不进入 Git。

详细入口：[运行说明](README.md)、[文档索引](docs/README.md)、[契约边界](docs/contracts/README.md)、[OpenAPI 工具](tool/openapi/README.md)。
