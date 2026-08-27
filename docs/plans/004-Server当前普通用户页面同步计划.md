# 004 Server 当前普通用户页面同步计划

- 状态：Presentation Complete / E2E Blocked
- 日期：2026-08-27

## Phase A：页面与导航

1. [x] 将首页标题和说明更新为当前素材导入心智。
2. [x] 增加链接、本地视频和剧本文档三种入口及状态保持。
3. [x] 将底部导航升级为五个 Server 普通用户目的地。
4. [x] 增加剧本文档独立页面，并更新历史与平台能力说明。

## Phase B：本地化与验证

1. [x] 同步中英文 ARB 与生成的本地化代码。
2. [x] 补充 390×844 Widget 测试、入口切换、导航和状态保持测试。
3. [x] 运行格式、静态分析、测试、Android Debug 与 iOS Simulator 构建门禁。

## Phase C：真实业务接入

1. [ ] 冻结原生会话、App OpenAPI、WebSocket 与文件授权契约。
2. [ ] 生成 dart-dio 客户端并接入真实 repository。
3. [ ] 完成公众号发现、视频号解析、上传、预览、文档和平台状态 Android/iOS E2E。

Phase C 继续被原生契约阻塞；本次不得使用 Web Cookie 或模拟远程数据绕过。
