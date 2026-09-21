# Xcode 27 与 iOS 16 平台基线计划

状态：Complete。

1. [x] 将 Runner、Podfile 和全部 Pod target 的 deployment target 固定为 iOS 16.0。
2. [x] 将 AGENTS、PROJECT 与 001 平台基线更新为 Xcode 27 / iOS 16.0。
3. [x] 重新执行 `flutter pub get` 与 `pod install`。
4. [x] 运行静态检查、完整测试、Android debug 与定向 iOS Simulator 构建。
5. [x] 在 iPhone 17 Pro 模拟器运行 021 shadcn 原生集成测试并记录结果。
