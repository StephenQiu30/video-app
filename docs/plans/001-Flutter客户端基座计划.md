# 001 Flutter 客户端基座计划

- 状态：Draft
- 日期：2026-08-12
- 阻塞：Design/PRD 尚未完整确认；原生鉴权契约尚未在 `video-server` 冻结

## 1. Phase 0：冻结前置决策

1. 确认 Design、PRD 与 Acceptance。
2. 在 `video-server` 完成原生认证、刷新、撤销和 WebSocket 鉴权设计。
3. 冻结 Android/iOS 最低版本、组织 ID、应用 ID、显示名称与商店标识。
4. 固定 Flutter/Dart、Java/Gradle、Xcode/CocoaPods 与 CI 版本。

退出条件：Design accepted、PRD accepted、Plan Ready、Acceptance Defined，服务端鉴权契约可生成。

## 2. Phase 1：工程基座

1. 先写结构与配置门禁测试。
2. 运行统一 `flutter create --platforms=android,ios` 命令。
3. 建立 `lib/app`、`core`、`features`、`shared` 与测试目录。
4. 配置 format、analyze、test、Android debug build 和 iOS simulator build CI。
5. 固定 `pubspec.lock`，加入许可证与依赖审计。

映射：DAC-001、DAC-002、DAC-010、DAC-012；AC-001、AC-012。

## 3. Phase 2：契约、网络与会话

1. 先写 OpenAPI 生成漂移、错误映射和会话单飞刷新测试。
2. 建立 `dart-dio` 生成入口与只读生成目录。
3. 实现统一 Dio、超时、取消、幂等键和 Problem Details 映射。
4. 实现内存 Access Token 与安全存储 Refresh Credential。
5. 覆盖登录、恢复、退出、撤销、401 并发和 WebSocket 重建。

映射：DAC-003、DAC-004、DAC-005、DAC-009；AC-002、AC-009、AC-010。

## 4. Phase 3：下载闭环

1. 先写输入校验、解析状态、格式选择和创建幂等测试。
2. 实现首页、媒体摘要、真实格式选择和下载详情。
3. 实现 WebSocket + 查询收敛、生命周期与弱网恢复。
4. 实现历史查询和任务恢复。

映射：DAC-006、DAC-007；AC-003、AC-004、AC-005、AC-007。

## 5. Phase 4：文件与 AI 结果

1. 先写授权过期、空间不足、取消和清理测试。
2. 实现文件下载、进度、完整性、保存与分享。
3. 实现 AI 分析创建、状态、失败恢复和结果阅读。

映射：DAC-008、DAC-009；AC-006、AC-008。

## 6. Phase 5：体验与发布门禁

1. 覆盖主题、文字缩放、Semantics、系统返回与 reduced motion。
2. 在 Android/iOS 真机或模拟器执行完整 E2E。
3. 执行日志脱敏、依赖、权限、网络安全和签名检查。
4. 记录实际命令、退出码、设备/系统版本与证据。

映射：DAC-010、DAC-011、DAC-012；AC-010、AC-011、AC-012。

## 7. 计划验证命令

```bash
flutter pub get
dart format --output=none --set-exit-if-changed .
flutter analyze
flutter test
flutter test integration_test
flutter build apk --debug
flutter build ios --simulator --no-codesign
```

真实服务、Android 和 iOS 证据缺一不可；在当前文档未获批前不执行实现阶段。
