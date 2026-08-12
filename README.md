# 帧取 App

本仓库是“帧取”的 Flutter 原生客户端仓库。服务端和浏览器 Web 平台已经由 [`video-server`](https://github.com/StephenQiu30/video-server) 统一实现；本仓库不再建设第二套 Web 平台。

当前仓库只保存 Flutter App 的规范与空目录骨架，没有业务源码、`pubspec.yaml`、Android/iOS 工程或可运行产物。开始实现前，需要先完成并确认 [`Design → PRD → Plan → Acceptance`](docs/README.md) 链路。

## 产品定位

- 首期平台：iOS 与 Android。
- 客户端技术：Flutter / Dart，共享业务与界面代码。
- 服务能力：通过 `video-server` 的 HTTPS REST/OpenAPI 与 WebSocket 契约访问解析、下载、历史、文件获取和 AI 分析能力。
- 明确排除：Flutter Web、内嵌 Web 平台、App 内运行 yt-dlp/FFmpeg、客户端 Provider 凭据、DRM 绕过和管理后台。
- 后续可能：macOS/Windows 桌面端，但必须另立 Design 与验收，不进入首期范围。

## 工具链基线

当前开发机已验证：

- Flutter 3.44.7 stable
- Dart 3.12.2

正式建立工程时应在 CI 与贡献文档中固定一致版本。应用仓库必须提交 `pubspec.lock`，不维护第二套包管理或并行客户端工程。

## 目录骨架

```text
assets/                       图片、图标和字体
integration_test/             真机/模拟器端到端测试
lib/
├── app/                      启动、路由和应用级装配
├── core/                     配置、网络、路由、安全和主题基础设施
├── features/                 按用户能力组织的纵向模块
│   ├── account/
│   ├── analysis/
│   ├── auth/
│   ├── download/
│   ├── history/
│   └── providers/
└── shared/                   真正跨功能复用的模型与组件
test/                         单元与 Widget 测试
tool/                         受版本控制的生成和校验入口
docs/                         App 专属 Design、PRD、Plan、Acceptance 与契约说明
```

目录目前只用 `.gitkeep` 保留结构，不表示对应能力已经实现。Android 与 iOS 平台工程应在基座计划获批后由 `flutter create --platforms=android,ios` 生成，不手工拼装。

## 当前阻塞

`video-server` 现有浏览器鉴权以 HttpOnly Cookie 为中心。原生 App 在实现登录前，需要服务端先冻结可安全轮换、可撤销且使用系统安全存储的原生会话契约；详见 [`docs/contracts/README.md`](docs/contracts/README.md)。
