# Security Policy

## 产品边界

帧取 App 只作为 `video-server` 的受控原生客户端，处理用户有权下载和分析的内容。App 不在设备上实现平台 extractor、DRM 绕过、客户端签名逆向、密钥提取或任意媒体命令。

## 客户端控制

- 只连接用户明确配置且通过 TLS 校验的服务端；生产环境禁止明文 HTTP 和任意证书信任。
- Access Token 仅驻留内存；可轮换的 Refresh Credential 仅保存在 iOS Keychain 或 Android Keystore 支持的安全存储中。
- 不通过 WebView、剪贴板、日志、崩溃报告或分析 SDK 传递 Token、Cookie、完整 URL query、预签名 URL 或用户媒体。
- 外部链接、深链接和服务端地址必须经过 scheme、host、端口和重定向校验，拒绝私网探测与开放跳转。
- 文件下载必须校验任务归属、大小上限、可用空间和服务端提供的完整性信息；失败或取消时清理临时文件。
- 发布签名、证书、Provisioning Profile、商店 API Key 和环境配置不得进入仓库。

## 报告漏洞

请使用 GitHub 私有安全报告渠道提交复现条件、影响范围和最小 PoC，不要在公开 Issue 中披露凭据、用户内容或可利用细节。

## 发布门禁

认证、深链接、网络、文件、日志、存储、WebSocket 或平台权限变化必须包含滥用/失败测试，并通过 `AGENTS.md` 与对应 Acceptance 规定的全部门禁。
