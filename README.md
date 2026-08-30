# 帧取 App

本仓库是“帧取”的 Flutter 原生客户端，首期使用一套 Dart 代码交付 iOS 与 Android。服务端和浏览器 Web 平台由 [`video-server`](https://github.com/StephenQiu30/video-server) 统一实现，本仓库不建设 Flutter Web、第二套管理后台或客户端媒体执行器。

## 当前状态

Flutter 技术选型、可构建工程骨架和与当前 Server 对齐的 App 表现层已经建立：

- Flutter 3.44.7 stable / Dart 3.12.2。
- Android API 24+、iOS 13+，Application ID 与 Bundle ID 均为 `com.stephenqiu.framegrab`。
- Material 3 深浅主题、中文/英文本地化、类型安全路由与五目的地底部菜单。
- 首页复用 Web 同源品牌 SVG、语义色、6px 圆角和编辑式标题，并对齐 Server 当前的链接、本地视频与剧本文档三种素材入口。
- Riverpod、go_router、Dio、OpenAPI Generator 与 flutter_secure_storage 的职责、版本和安全边界已冻结；原生登录、会话恢复和登录门禁已经接入真实服务。
- 单元测试、Widget 测试以及 Android/iOS 构建 CI。

当前首页、本地 URL 校验、素材入口切换，以及首页、下载记录、剧本文档、平台状态和我的五个一级页面已经实现。登录后的历史、下载详情、文档与平台状态使用原生 Bearer 会话读取真实服务数据，覆盖加载、空、错误重试和刷新；平台状态在登录后预取并按会话缓存。主题切换位于顶部导航，“我的”只承载真实账户与退出流程。尚未冻结的媒体创建、上传和文件操作继续 fail closed。契约生成方式见 [`docs/contracts/README.md`](docs/contracts/README.md)。

## 本地开发

检查环境并安装依赖：

```bash
flutter doctor -v
flutter pub get
dart run tool/check.dart
```

iOS 或 Android 模拟器运行当前表现层：

```bash
flutter run
```

## 工程结构

```text
android/                      Android Kotlin 壳层
ios/                          iOS Swift 壳层
lib/
├── app/                      应用装配与类型安全路由
├── core/                     配置、网络、安全存储与主题
├── features/                 按用户能力组织的纵向模块
├── l10n/                     ARB 与生成的本地化代码
└── shared/                   两个以上功能稳定复用的组件或模型
test/                         单元与 Widget 测试
integration_test/             后续真机/模拟器关键流程
tool/                         质量门禁与 OpenAPI 生成入口
docs/                         Design、PRD、Plan、Acceptance 与契约边界
```

## 核心边界

- App 只负责原生交互、会话、生命周期、状态展示和授权文件落地。
- 解析、下载、Provider、AI、对象存储和任务事实全部留在 `video-server`。
- REST 客户端必须从冻结的 App 专用 OpenAPI 快照生成，不维护手写平行 DTO。
- Access Token 只驻留内存；未来的 Refresh Credential 只进入 Keychain/Keystore。
- 不记录完整媒体 URL、Token、预签名 URL、用户媒体或 AI 原始响应。
