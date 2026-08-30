# 011 账户退出布局与应用图标复核报告

- 设备：iPhone 17 Pro Simulator，iOS 26.5
- App：`com.stephenqiu.framegrab`，显示名“帧取”
- 结果：Passed

## 自动化

- `dart run tool/check.dart`：通过，37 项 App 测试通过。
- `flutter build apk --debug`：通过。
- `flutter build ios --simulator --no-codesign`：通过。
- 原生品牌测试：iOS AppIcon 全尺寸、无 Alpha、Android 三类 launcher 与 Bundle 身份均通过。

## 视觉

- Widget 顺序断言和 iPhone 17 Pro 可访问性树均确认：管理中心位于退出登录之前，退出为页面末尾的左对齐危险操作。账户页截图因包含真实账户信息而不进入仓库。
- `ios-home.png`：“帧取”显示蓝色“播放 + 下载”图标。
- 同屏默认网格图标属于 `com.stephenqiu.then`（“于是”）及其 UITest Runner，不属于“帧取”。
