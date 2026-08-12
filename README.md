# 帧取 App

本仓库是“帧取”的 Flutter 原生客户端，首期使用一套 Dart 代码交付 iOS 与 Android。服务端和浏览器 Web 平台由 [`video-server`](https://github.com/StephenQiu30/video-server) 统一实现，本仓库不建设 Flutter Web、第二套管理后台或客户端媒体执行器。

## 当前状态

Flutter 技术选型与可构建工程骨架已经建立：

- Flutter 3.44.7 stable / Dart 3.12.2。
- Android API 24+、iOS 13+，Application ID 与 Bundle ID 均为 `com.stephenqiu.framegrab`。
- Material 3 深浅主题、中文/英文本地化与类型安全路由骨架。
- Riverpod、go_router、Dio、OpenAPI Generator 与 flutter_secure_storage 的职责、版本和安全边界已冻结，但尚未实现业务会话或 API 调用。
- 单元测试、Widget 测试以及 Android/iOS 构建 CI。

当前 UI 只是非业务占位和视觉 token 验证，不宣称下载业务已接通。后续实现以 `video-server/frontend/src/app/globals.css` 的语义色、6px 圆角和内容优先层级为视觉来源，再适配移动端导航、触控和系统语义。`video-server` 仍使用浏览器 HttpOnly Cookie；原生契约冻结前不进入业务实现，详见 [`docs/contracts/README.md`](docs/contracts/README.md)。

## 本地开发

检查环境并安装依赖：

```bash
flutter doctor -v
flutter pub get
./tool/check.sh
```

iOS 或 Android 模拟器运行当前非业务占位页：

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
