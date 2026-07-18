# video-web 执行文档

本仓库以 `Design → PRD → Plan → Acceptance → Implementation` 为唯一产品事实链。用户最新明确顺序覆盖重置期的旧模板顺序；Implementation 只能执行状态为 `ready` 的 Plan，并逐项回填对应 Acceptance。

## 当前产品

产品定义为“授权视频下载与 AI 知识化工作台”。Web 只负责可信入口、任务工作台和内容编辑；下载、媒体处理、AI、PDF 与大文件交付由 `video-server` 承担。

## 文档索引

### Design

| 文档 | 状态 | 责任 |
| --- | --- | --- |
| [001 体验设计](design/001-授权视频工作台体验设计.md) | accepted | 旅程、信息架构、视觉与合规交互 |
| [002 前端架构](design/002-前端技术与状态架构设计.md) | accepted | 技术、RSC、状态、性能与测试 |
| [003 消费契约](design/003-API消费与无障碍契约设计.md) | accepted | API、错误、恢复、响应式与无障碍 |

### PRD

| 文档 | 状态 | 责任 |
| --- | --- | --- |
| [001 Web MVP](prd/001-授权视频下载与AI知识化Web-MVP.md) | accepted | P0 需求、指标、页面与非目标 |

### Plan

| 文档 | 状态 | 责任 |
| --- | --- | --- |
| [001 链接探测](plans/001-链接探测与清晰度目录计划.md) | review / waiting | 等待 server OpenAPI；授权链接、Probe、错误和 Variant |
| [002 下载任务](plans/002-下载任务与资产交付计划.md) | backlog | 进度、恢复、取消和资产下载 |
| [003 AI 文档](plans/003-AI知识文档与思维导图计划.md) | backlog | AI 同意、摘要、证据与思维导图 |
| [004 PDF/历史](plans/004-PDF历史与数据生命周期计划.md) | backlog | 编辑、PDF、历史、重签和删除 |

### Acceptance

| 文档 | 文档状态 | 结果 |
| --- | --- | --- |
| [000 Web MVP 总览](acceptance/000-Web-MVP验收总览.md) | accepted | pending |
| [001 链接探测](acceptance/001-链接探测与清晰度目录验收.md) | accepted | pending |

## 状态规则

- Design/PRD：`draft → review → accepted → superseded`。
- Plan：`draft → review → ready → in_progress → done`，未来工作保持 `backlog`。
- Acceptance 文档状态：`draft → accepted`；执行结果：`pending → passed/failed/blocked`。
- 缺少输入、批准状态或可执行验收时，Plan 不得进入 `ready`。
- 文档只保存稳定契约和证据，不创建 `.planning`、日记或重复流程目录。

`TEMPLATE.md` 提供通用结构，不代表产品决策。
