# 红果短剧 Provider 接入调研

- 日期：2026-08-12
- 结论：红果不适合实现为匿名公网 extractor；可行开源路线是用户设备 Edge Agent 在本地受权会话内产出标准媒体制品，再交给现有分析链路。该路径尚未实现，当前保持 `unsupported`

## 1. GitHub 候选核验

截至调研日期，GitHub 候选主要分为四类：

1. [`zhangbaio/hongguo`](https://github.com/zhangbaio/hongguo) 针对官方 `com.phoenix.read` App，通过 Android/模拟器中的客户端签名环境取得剧集与媒体信息，下载 CENC 密文并在本地转换为可播 MP4。它验证了“设备会话→剧集解析→本地制品”的技术链路，但仓库没有 LICENSE，不能直接拷贝或作为生产依赖。
2. [`Erlmo/shortplay`](https://github.com/Erlmo/shortplay) 以 CENC 解密播放器说明官方媒体的受保护形态，但核心实现和许可证不完整，不能作为服务端 Provider 依赖。
3. [`zhangbaio/hongguo-downloader`](https://github.com/zhangbaio/hongguo-downloader) 调用第三方付费解析 API，并以 Key 和机器码控制访问；服务来源、稳定性、权益和许可证均不满足仓库门禁。
4. [`wangduoyu001/hongguo-drama-downloader`](https://github.com/wangduoyu001/hongguo-drama-downloader) 抓取 `hongguoapp.cn` 苹果 CMS 页面并提取 M3U8，实际目标是第三方影视聚合站，不是红果官方 App。

`yt-dlp/yt-dlp` 当前没有红果或 `com.phoenix.read` extractor、Issue 或 PR。`KeepThinking007/HongGuoData` 使用 Phone Agent 采集榜单和互动指标，可作为元数据研究参考，但不交付视频媒体。

## 2. 产品决策

仓库不再把所有 DRM 内容永久排除，而是区分三类访问模式：

- 匿名 Provider：继续只处理公开、非 DRM、用户有权下载的 HTTP(S) 内容。
- 官方授权 Provider：可以处理平台保护内容，但必须获得官方 API/SDK、合作授权、明确的下载/分析权益和可审计的授权样本，并通过独立安全设计、Provider canary 与验收。
- 用户设备 Edge Agent：在用户控制的 Android 设备/模拟器和已授权红果会话中处理设备协议与受保护媒体，只向服务端上传标准媒体制品与脱敏元数据。

删除“非 DRM”这一全局硬边界，不等于把设备登录态和密钥带入中心服务。设备协议、签名和媒体转换都必须留在 Edge Agent 的单任务工作区中，任务完成后销毁临时参数。不得修改平台权益、将用户 URL 发给公共解析 API，或把影视聚合镜像冒充成红果官方来源。

## 3. 推荐接入顺序

### 3.1 用户原始媒体导入

首期允许用户上传其拥有下载和分析权利的红果原始视频文件。服务端对完整文件执行大小、时长、容器、音视频轨、SHA-256 和恶意输入边界校验，生成与下载任务相同可信度的媒体 Artifact，再复用现有 RabbitMQ、完整视频 Agent、报告与 MinIO 链路。

上传来源应显示为“红果原始媒体导入”，不能宣称系统从红果分享链接完成下载。批量整剧首期按单集产生独立 Artifact 和分析任务，跨集汇总另立需求。

### 3.2 用户设备 Edge Agent

开源项目证明红果的关键不是 yt-dlp extractor，而是一个与官方 App 共置的设备端采集器。首期按以下边界独立实现，不拷贝无许可证仓库的源码：

1. `Session Adapter` 只在本地调用已登录 App 会话，服务端看不到 Cookie、Token、设备参数和签名中间值。
2. `Catalog Adapter` 将剧集、分集、标题、封面、时长和质量规格映射为稳定 manifest；每集一个独立任务。
3. `Media Adapter` 在设备本地完成短时媒体获取和受保护媒体转换，不上传密文链接、许可响应、签名材料或内容密钥。
4. `Artifact Packager` 执行 ffprobe、容器/音视频轨、时长、大小和 SHA-256 校验，再通过一次性上传会话提交 MP4 与脱敏 manifest。
5. 服务端重新计算 SHA-256 并执行 ffprobe，通过后生成 MinIO Artifact，后续复用 RabbitMQ、完整视频 Agent、报告和 WebSocket 链路。

当前 `ProviderAccessMode` 只有 `anonymous/operator_managed`；实施时应新增 `user_device`，并将它路由到设备任务协议，不得降级到普通 Media Runner。

### 3.3 官方授权 Provider

取得官方合作资料后新增独立 `hongguo-authorized-v1` Adapter：

1. 只接受官方声明的入口和媒体域名，重定向后重新执行 URL admission。
2. 通过版本化、只读 Secret 调用官方 API/SDK，不接收普通 API 请求中的 Cookie、Token 或设备参数。
3. inspect 必须返回作品、剧集、授权主体、可下载权益、DRM/保护方式和短时格式；权益未知时 fail closed。
4. 下载前按原作品与剧集重新解析，不持久化短时 CDN URL、许可证响应或内容密钥。
5. 官方接口只有播放权而没有下载/分析权时返回 `provider_content_restricted`，不能因为技术上可播放就生成 Artifact。
6. Provider Runner 与数据库、RabbitMQ、MinIO 和 AI 凭据隔离；下载结果继续经过 FFmpeg/ffprobe、大小、时长和 SHA-256 校验。

官方授权 Adapter 不应伪装成 yt-dlp Cookie extractor。当前 `ProviderSessionStore` 只处理 Netscape Cookie 文件，需要先扩展为带 `credential_kind` 的 Provider Secret 抽象，并为官方权益证明建立独立、可测试的校验端口。

## 4. 发布门禁

红果从 `unsupported` 提升前必须同时具备：

1. 对应接入路径的权益证明：官方 Provider 需要 API/SDK 与合作授权；Edge Agent 需要用户内容权利声明、自有设备绑定与明确授权样本。
2. 至少一个项目自有或明确授权剧集的 metadata、完整媒体和 analysis 三阶段证据。
3. DRM、无下载权、会员权益、过期授权、错误剧集、短链跳转和 schema 变化负例。
4. 下载前 re-inspect、完整文件 ffprobe/SHA-256、MinIO Artifact、RabbitMQ、Agent、报告与 WebSocket E2E。
5. 许可证、代码来源证明、SBOM、Secret scan、日志脱敏、单 Provider 隔离和设备撤销/轮换演练。
6. Edge Agent 安装包签名、每安装独立密钥、一次性上传 URL、本地工作区清理，以及“不上传平台会话/密钥”的流量验收。

在这些条件完成前，API 和前端不得将红果标记为 `verified`，也不得以第三方解析站的成功结果替代官方 Provider 证据。

## 5. 实施前置输入

代码实施需要至少一种输入：

- 红果官方创作者/合作 API 或 SDK 文档，以及明确包含下载和自动化分析权利的授权；或
- 用户拥有权利的原始视频样本，用于先实现媒体上传与分析入口；或
- 一台用户控制的 Android 设备/模拟器、已登录红果 App 和明确授权的单集测试样本，用于实现并验收 Edge Agent。

没有上述输入时只能完成控制面和 fail-closed 骨架，无法形成真实可用的红果下载能力。
