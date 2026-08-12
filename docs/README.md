# 帧取 App 文档索引

本目录只描述 Flutter 原生客户端。`video-server` 的 Web 页面、后端架构、Provider、队列、对象存储和 AI Worker 文档不在本仓库复制，以免形成两个事实来源。

交付顺序固定为 `Design → PRD → Plan → Acceptance`：

| 编号 | 主题 | Design | PRD | Plan | Acceptance |
| --- | --- | --- | --- | --- | --- |
| 001 | Flutter 跨端客户端基座 | [Accepted](design/001-Flutter跨端客户端架构设计.md) | [Accepted](prd/001-帧取移动App基础体验需求.md) | [Complete（选型/骨架）](plans/001-Flutter客户端基座计划.md) | [Passed（选型/骨架）](acceptance/001-Flutter客户端基座验收.md) |

Flutter 方向、iOS/Android 首期定位、工程基线以及不重复建设 Web 平台已由用户确认。当前阶段只完成技术选型、`flutter create` 骨架和构建门禁，不进入业务实现。后续认证与业务接入仍受原生会话契约阻塞，不得用浏览器 Cookie 方案绕过。

接口边界与 `video-server` 前置条件见 [`contracts/README.md`](contracts/README.md)。
