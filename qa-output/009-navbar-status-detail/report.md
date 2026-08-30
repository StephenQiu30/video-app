# 009 顶部主题、状态性能与下载详情 QA

- 日期：2026-08-30
- 主设备：iPhone 17 Pro Simulator，iOS 26.5
- 隔离集成设备：临时 iPhone 17 Pro Simulator，测试后已删除
- 服务：`video-server` `http://127.0.0.1:8111`

## 性能证据

- 新 QA 账户直接请求 `GET /api/providers` 两次分别约为 2.012 秒和 2.007 秒；`GET /api/downloads/history` 两次约为 0.013 秒和 0.012 秒。
- App 登录后立即预取平台状态，并在会话内复用同一个 Riverpod Future；真实主模拟器进入状态 Tab 时直接显示 24 项结果，没有重新出现整页加载状态。
- 自动化 UI 读取从点击到完整状态树约 946ms，其中包含 Computer Use 的固定页面捕获等待；内容树首次返回即包含 24 项汇总与真实平台行。
- Widget 测试验证预取发生在进入状态 Tab 前，首页—状态多次往返只调用 Repository 一次。

## 功能与视觉

- 顶部品牌右侧显示 44×44 主题按钮，浅色时语义为“切换到深色主题”，深色时为“切换到浅色主题”。
- “我的”页面只保留账户和退出登录，不再重复显示外观开关。
- 真实下载历史行暴露 button 语义并可进入下载详情；详情再次请求 `GET /api/downloads/{job_id}`。
- 真实详情成功展示状态、100% 进度、来源、Web 同源格式、执行次数、文件可用性、媒体时长与三类时间；返回和详情页主题切换正常。
- 真实历史与详情包含用户媒体标题，因此不保存对应截图；只保留不含用户数据的 `provider-status.png`。

## 自动化结果

- `dart run tool/check.dart`：通过，32 项 App 测试。
- `packages/video_server_api dart test`：通过，120 项生成客户端测试。
- 隔离 iPhone 17 Pro `flutter test integration_test`：通过。
- `flutter build apk --debug`：通过。
- `flutter build ios --simulator --no-codesign`：通过。

最终结论：Passed。
