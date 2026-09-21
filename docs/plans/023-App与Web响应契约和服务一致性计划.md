# App 与 Web 响应契约和服务一致性计划

状态：Completed。

1. [x] 检查 App 截图、服务健康状态、实时 OpenAPI、冻结契约和 Web `/history` 成功态。
2. [x] 确认根因是共享业务响应包装变更，以及 App 错误展示把契约失败误报为网络错误。
3. [x] 从当前服务 OpenAPI 更新 App 冻结快照并重新生成 `video_server_api`。
4. [x] 按 feature 更新 Repository，对 `ApiResponse*` 的 `data` 做必填校验，同时保留原生认证直接响应。
5. [x] 更新错误响应解析和页面错误语义，补充契约包装、缺失 data、message 及失败分类测试。
6. [x] 执行格式化、生成可复现检查、`flutter analyze`、全量 `flutter test` 和 Android debug 构建。
7. [x] 在 iPhone 17 Pro 模拟器连接当前服务验证下载历史成功态，复用既有认证且不创建或修改服务端数据。
8. [x] 更新 Acceptance，记录 App/Web 差异、证据范围、剩余真机与真实下载边界。
