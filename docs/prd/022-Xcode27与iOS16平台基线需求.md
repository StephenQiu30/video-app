# Xcode 27 与 iOS 16 平台基线需求

状态：Accepted。关联设计：022-Xcode27与iOS16平台基线设计。

1. 当前代码必须能使用 Xcode 27 构建并启动 iOS 模拟器版本。
2. 新版本 App 的最低支持系统为 iOS 16.0，不再承诺 iOS 13/14/15 兼容。
3. Android、Flutter/Dart、Bundle ID、用户数据和业务流程不得因平台升级发生变化。
4. CocoaPods 中第三方 target 必须统一满足 Xcode 27 与当前原生插件的最低部署版本要求。
5. 平台升级结果必须通过源码配置、构建日志和模拟器启动共同证明。
