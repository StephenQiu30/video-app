# shadcn 全量迁移验收

状态：In Progress。静态、主题、单元/Widget、Android 构建与 iOS 原生集成门禁已通过；完整多尺寸人工视觉验收仍待完成。

- 静态扫描：业务页面无 Material 按钮、输入、选择、开关、SnackBar、AlertDialog 或 Material 弹层。
- 功能：保留现有认证、导入、历史、文档、分析及管理测试的业务断言。
- 主题：Web 语义色与 App 生成色板匹配，亮暗主题和组件变体统一。
- 平台：Flutter analyze、测试、Android debug 与 iOS simulator 构建。
- 界面：模拟器核对公开、认证、列表和弹层，390pt/宽屏及大字体不溢出。
- 真实 Provider、服务器下载及 AI 结果不由纯 UI 测试代替证明。

## 2026-09-21 实现证据

- `node tool/sync_design_tokens.mjs --check`：通过，当前 Flutter 色板与 Web `globals.css` 源哈希一致。
- Material 可见控件边界测试：通过；覆盖按钮、输入、选择、Chip、开关、弹层、反馈、进度及导航控件。
- `dart format --output=none --set-exit-if-changed lib test integration_test tool`：通过。
- `flutter analyze`：通过，无问题。
- `flutter test`：通过，211 项测试全部成功。
- `flutter build apk --debug`：通过，产物为 `build/app/outputs/flutter-apk/app-debug.apk`。
- Provider 状态筛选已由 Material `ChoiceChip` 收敛为 44pt `ShadTabs`；格式选择仅使用 `ShadRadioGroup` 的交互，不再叠加原生点击控件。
- Xcode 27 / iOS 16 定向构建：通过；iPhone 17 Pro 模拟器已显示公开首页。
- `flutter test integration_test/shadcn_ui_test.dart -d 462F7C29-43EE-4AB6-BAE6-81908860CBCA`：通过，3/3 场景覆盖公开页、认证、历史确认/取消与键盘 Sheet 保存。

## 尚未完成

- 尚未完成 390pt、宽屏和大字体的全量人工视觉复核；原生集成测试不替代全部页面逐像素核对。
- 真实 Provider、服务端下载、AI 结果及生产鉴权链路仍不在本轮纯 UI 证据范围内。
