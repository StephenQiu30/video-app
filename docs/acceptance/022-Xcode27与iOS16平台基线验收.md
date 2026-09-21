# Xcode 27 与 iOS 16 平台基线验收

状态：Passed with known Flutter CLI limitation。日期：2026-09-21。

- [x] Runner 的 Debug/Profile/Release deployment target 均为 iOS 16.0。
- [x] Podfile 与生成的 Pods target 均为 iOS 16.0。
- [x] Xcode 27 在 iPhone 17 Pro 目标上完成 iOS Simulator 无签名构建。
- [x] iPhone 17 Pro 模拟器成功显示 App 首屏。
- [x] `integration_test/shadcn_ui_test.dart` 在 iPhone 17 Pro 模拟器通过 3/3 场景。
- [x] Flutter analyze、完整测试和 Android debug 构建保持通过。
- [x] 验收结论明确区分模拟器 UI 证据与真实服务/真机证据。

## 构建与运行证据

- 工具链：Xcode 27.0（Build 27A266a）、Flutter 3.44.7、Dart 3.12.2。
- `pod install`：成功；Runner 与 66 个生成的 Pods 构建配置均为 iOS 16.0。
- 定向构建：`xcodebuild` 使用 iPhone 17 Pro（OS 27.0，UDID `462F7C29-43EE-4AB6-BAE6-81908860CBCA`）与 `arm64-apple-ios16.0-simulator` 完成，退出码 0。
- 项目启动：`flutter run` 完成 Xcode 构建、文件同步和 Dart VM Service 建立；结束调试附着后 App 仍在目标模拟器前台显示 shadcn 页面。
- 原生集成：公开首页、登录/已登录首页、历史确认/取消、键盘 Sheet 保存共 3 个场景全部通过。
- 回归：`flutter analyze` 无问题，`flutter test` 211 项全部通过，Android debug APK、设计 token 校验和 Dart 格式门禁均通过。

## 已知边界

- Flutter 3.44.7 的通用 `flutter build ios --simulator` 路径在 Xcode 27 下对已同时包含 `arm64 x86_64` 的 Flutter.framework 产生架构误判；指定 iPhone 17 Pro 的 Xcode 构建、`flutter run` 与集成测试均通过。后续升级 Flutter 后应复测并移除此记录。
- 模拟器首屏和组件集成测试不等于 iOS 真机、签名归档、App Store 制品或真实 Provider/服务端链路验收。
