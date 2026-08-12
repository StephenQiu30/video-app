# 001 Flutter 客户端基座验收

- 状态：Passed（选型/骨架）
- 日期：2026-08-12
- 当前结论：技术选型与工程骨架 passed；业务实现 not started

## 1. 当前范围

- [x] Design 与技术选型已冻结。
- [x] 使用受记录的 `flutter create` 命令生成 Android/iOS 工程。
- [x] 当前只验证工程、路由、主题、本地化和构建链。
- [x] 未实现登录、下载、任务、AI、业务 API 或 WebSocket。
- [ ] `video-server` 原生认证与 WebSocket 契约已冻结。

最后一项仅阻塞未来业务实现，不阻塞本次技术选型和工程骨架验收。

## 2. 选型与骨架

- [x] A-001：只存在 Android/iOS Flutter 工程，没有 Flutter Web 或第二套客户端。
- [x] A-002：目录、依赖方向和长期源码文件规模符合 Design。
- [x] A-003：Flutter 3.44.7 / Dart 3.12.2、Android API 24+ 与 iOS 13+ 已固定。
- [x] A-004：`pubspec.lock`、直接依赖版本/许可证、Gradle checksum 和 GitHub Actions SHA 已固定。
- [x] A-005：非业务占位页使用 Web 端语义色、6px 圆角、留白和内容层级，并适配 Material 3。
- [x] A-006：深浅主题辅助文字与页面背景对比度至少为 4.5:1。
- [x] A-007：OpenAPI 工具在缺少 App 专用冻结契约时 fail closed，不误用浏览器 Cookie 契约。
- [x] A-008：Android debug APK 与 iOS simulator app 均以最终骨架构建成功。

## 3. 未来业务验收（not started）

- [ ] B-001：OpenAPI 客户端从已冻结的 App 契约可重复生成。
- [ ] B-002：原生登录、刷新、撤销、退出和并发 401 通过真实服务验收。
- [ ] B-003：Access Token 不持久化，Refresh Credential 只进入安全存储。
- [ ] B-004：解析、格式、任务、历史、文件和 AI 分析完成真实端到端验收。
- [ ] B-005：前后台、离线、重连、深链接、可访问性和敏感日志完成真机/模拟器验收。

这些条目不属于当前选型阶段，不使用占位页、Mock 或工程构建证据代替。

## 4. 证据记录

| 证据 | 命令/环境 | 结论 |
| --- | --- | --- |
| 生成 | 文档冻结的 `flutter create --platforms=android,ios ...` | passed |
| 质量 | `./tool/check.sh` | passed；format/analyze 通过，2 tests passed |
| 契约边界 | `./tool/openapi/generate.sh` 在缺少冻结快照时运行 | passed；exit 1 并给出 fail-closed 原因 |
| iOS 构建 | Xcode 26.6，iOS 26.5 iPhone 17 Pro Simulator | passed |
| 视觉 | iPhone 17 Pro Simulator 深浅主题 + 对比度回归测试 | passed |
| Android 构建 | JDK 21 / Android Gradle Plugin 9.0.1 / API 36 | passed |

截图为本地脱敏检查证据，不提交模拟器数据或构建产物。
