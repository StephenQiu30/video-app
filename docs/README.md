# 帧取 App 文档索引

本目录只描述 Flutter 原生客户端。`video-server` 的 Web 页面、后端架构、Provider、队列、对象存储和 AI Worker 文档不在本仓库复制，以免形成两个事实来源。

交付顺序固定为 `Design → PRD → Plan → Acceptance`：

| 编号 | 主题 | Design | PRD | Plan | Acceptance |
| --- | --- | --- | --- | --- | --- |
| 001 | Flutter 跨端客户端基座 | [Proposed](design/001-Flutter跨端客户端架构设计.md) | [Draft](prd/001-帧取移动App基础体验需求.md) | [Draft](plans/001-Flutter客户端基座计划.md) | [Draft](acceptance/001-Flutter客户端基座验收.md) |

Flutter 方向、iOS/Android 首期定位以及不重复建设 Web 平台已由用户确认。完整 Design Acceptance Criteria、产品范围、实施拆分和验收证据仍需在实现前确认，因此当前不得创建业务代码。

接口边界与 `video-server` 前置条件见 [`contracts/README.md`](contracts/README.md)。
