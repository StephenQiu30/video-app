# Xcode 27 与 iOS 16 平台基线设计

状态：Accepted。日期：2026-09-21。

## 决策

- iOS 构建工具链固定为 Xcode 27，最低部署版本由 iOS 13 提升到 iOS 16.0。
- Flutter 3.44.7、Dart 3.12.2、Bundle ID、业务架构与 Android API 24 基线保持不变。
- Runner 与所有 CocoaPods target 使用相同的 iOS 16.0 deployment target。
- iOS 16.0 同时满足 Xcode 27 的构建要求和 `flutter_file_manager_ios 3.0.0` 的运行时可用性声明；不对 iOS 15 做无法完整兑现的兼容承诺。
- `media_kit` 原生依赖继续使用 CocoaPods；在相关插件完整支持 Swift Package Manager 前不启用 Flutter SPM。

## 影响

- 后续构建、测试和商店制品不再支持 iOS 13、14、15。
- 既有历史构建证据仍保留其当时的 Xcode/iOS 环境，不回写为新环境。
- 本次只调整平台兼容基线，不修改认证、网络、存储、下载或 UI 业务逻辑。

## 验收

- Xcode 27 能完成 Pod 安装、定向 iOS Simulator 构建和模拟器启动。
- Runner 与 Pods 不再包含低于 iOS 16.0 的 deployment target。
- Flutter analyze、测试和 Android debug 构建不回归。
