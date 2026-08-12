# 001 Flutter 客户端基座计划

- 状态：Complete（选型/骨架）
- 日期：2026-08-12
- 阻塞：Phase 2 及以后仍等待 `video-server` 原生鉴权与 WebSocket 契约冻结

## 1. Phase 0：冻结前置决策

1. [x] 确认 Phase 1 Design、PRD 与 Acceptance。
2. [ ] 在 `video-server` 完成原生认证、刷新、撤销和 WebSocket 鉴权设计。
3. [x] 冻结 Android API 24、iOS 13、`com.stephenqiu.framegrab` 与显示名称“帧取”。
4. [x] 固定 Flutter 3.44.7、Dart 3.12.2、JDK 21、JVM target 17、Xcode 26.6 与 CI 版本。

Phase 1 退出条件已经满足；Phase 2 入口仍要求服务端鉴权契约可生成。

## 2. Phase 1：工程基座

1. [x] 建立路由、主题、本地化和 Widget 门禁测试，不接入业务 API。
2. [x] 运行统一生成命令：

   ```bash
   flutter create --platforms=android,ios \
     --org com.stephenqiu \
     --project-name framegrab \
     --description "帧取 iOS 与 Android 客户端" \
     --android-language kotlin \
     --empty .
   ```

3. [x] 建立 `lib/app`、`core`、`features`、`shared`、l10n 与测试目录。
4. [x] 配置 format、analyze、test、Android debug build 和 iOS simulator build CI。
5. [x] 固定 `pubspec.lock`、GitHub Actions SHA 与 Dependabot 更新入口。
6. [x] 用非业务占位页验证 Web 视觉 token 到 Material 3 的映射，不实现登录、下载或 AI 流程。

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
flutter gen-l10n
dart run build_runner build
dart format --output=none --set-exit-if-changed .
flutter analyze
flutter test
flutter test integration_test
flutter build apk --debug
flutter build ios --simulator --no-codesign
```

Phase 1 以本地和 CI 工程证据独立判定；真实服务、Android 和 iOS 业务证据缺一不可，但只在对应服务契约与功能实现完成后执行。
