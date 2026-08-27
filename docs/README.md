# 帧取 App 文档索引

本目录只描述 Flutter 原生客户端。`video-server` 的 Web 页面、后端架构、Provider、队列、对象存储和 AI Worker 文档不在本仓库复制，以免形成两个事实来源。

交付顺序固定为 `Design → PRD → Plan → Acceptance`：

| 编号 | 主题 | Design | PRD | Plan | Acceptance |
| --- | --- | --- | --- | --- | --- |
| 001 | Flutter 跨端客户端基座 | [Accepted](design/001-Flutter跨端客户端架构设计.md) | [Accepted](prd/001-帧取移动App基础体验需求.md) | [Complete（选型/骨架）](plans/001-Flutter客户端基座计划.md) | [Passed（选型/骨架）](acceptance/001-Flutter客户端基座验收.md) |
| 002 | Web 对齐的 App 首页表现层 | [Accepted](design/002-Web对齐的App首页表现层设计.md) | [Accepted](prd/002-Web对齐的App首页表现层需求.md) | [Complete](plans/002-Web对齐的App首页表现层计划.md) | [Passed](acceptance/002-Web对齐的App首页表现层验收.md) |
| 003 | 方案一视觉深化与 Web 普通用户功能对齐 | [Accepted](design/003-方案一视觉深化与Web普通用户功能对齐设计.md) | [Accepted](prd/003-方案一视觉深化与Web普通用户功能对齐需求.md) | [Presentation Complete / E2E Blocked](plans/003-方案一视觉深化与Web普通用户功能对齐计划.md) | [Presentation Passed / E2E Blocked](acceptance/003-方案一视觉深化与Web普通用户功能对齐验收.md) |
| 004 | Server 当前普通用户页面同步 | [Accepted](design/004-Server当前普通用户页面同步设计.md) | [Accepted](prd/004-Server当前普通用户页面同步需求.md) | [Presentation Complete / E2E Blocked](plans/004-Server当前普通用户页面同步计划.md) | [Presentation Passed / E2E Blocked](acceptance/004-Server当前普通用户页面同步验收.md) |

Flutter 方向、iOS/Android 首期定位、工程基线以及不重复建设 Web 平台已由用户确认。视觉方向采用已选方案一：保留 Web 的品牌、排版、语义色和信息层级，同时使用 Flutter 原生布局、底部导航、安全区与辅助功能语义。普通用户功能范围以 Web 的解析、格式、下载、历史、AI 分析、平台状态、登录注册和账户为基准；真实业务接入仍受原生会话契约阻塞，不得用浏览器 Cookie 方案绕过。

当前页面信息架构以 `video-server` `8bb2e91` 的普通用户能力为基线：首页同时承载链接、本地视频与剧本文档入口，一级导航包含首页、下载记录、剧本文档、平台状态与我的。接口边界与 `video-server` 前置条件见 [`contracts/README.md`](contracts/README.md)。
