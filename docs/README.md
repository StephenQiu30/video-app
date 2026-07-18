# video-web 执行文档

本仓库以 `Design → PRD → Plan → Acceptance → Implementation` 为唯一产品事实链。用户最新明确顺序覆盖重置期的旧模板顺序；Implementation 只能执行状态为 `ready` 的 Plan，并逐项回填对应 Acceptance。

## 当前产品

产品定义为“授权视频下载与 AI 知识化工作台”。Web 负责邮箱认证体验、可信入口、任务工作台和内容编辑；主体、会话、下载、媒体处理、AI、PDF 与大文件交付由 `video-server` 承担。浏览器使用 Server PostgreSQL DatabaseStrategy 的 `__Host-video_session` Cookie 和签名 double-submit 跨站请求伪造（CSRF）防护，不再使用安装令牌。

## 文档索引

### Design

| 文档 | 状态 | 责任 |
| --- | --- | --- |
| [001 体验设计](design/001-授权视频工作台体验设计.md) | accepted | 邮箱入口、旅程、信息架构、视觉与合规交互 |
| [002 前端架构](design/002-前端技术与状态架构设计.md) | accepted | Cookie/CSRF、RSC、状态、性能与测试 |
| [003 消费契约](design/003-API消费与无障碍契约设计.md) | accepted | 身份代理、API、错误、恢复、响应式与无障碍 |

### PRD

| 文档 | 状态 | 责任 |
| --- | --- | --- |
| [001 Web MVP](prd/001-授权视频下载与AI知识化Web-MVP.md) | accepted | 邮箱身份、P0 需求、指标、页面与非目标 |

### Plan

| 文档 | 状态 | 责任 |
| --- | --- | --- |
| [000 邮箱登录](plans/000-邮箱登录与会话外壳计划.md) | review / waiting | 等待 Server accepted 认证 OpenAPI；邮箱、Cookie、CSRF 和会话外壳 |
| [001 链接探测](plans/001-链接探测与清晰度目录计划.md) | review / waiting | 等待 Web Plan 000 与 Server accepted 认证/来源 OpenAPI；Probe、错误和 Variant |
| [002 下载任务](plans/002-下载任务与资产交付计划.md) | backlog | 进度、恢复、取消和资产下载 |
| [003 AI 文档](plans/003-AI知识文档与思维导图计划.md) | backlog | AI 同意、摘要、证据与思维导图 |
| [004 PDF/历史](plans/004-PDF历史与数据生命周期计划.md) | backlog | 编辑、PDF、历史、重签和删除 |

### Acceptance

| 文档 | 文档状态 | 结果 |
| --- | --- | --- |
| [000 Web MVP 总览](acceptance/000-Web-MVP验收总览.md) | accepted | pending |
| [001 链接探测](acceptance/001-链接探测与清晰度目录验收.md) | accepted | pending |
| [002 邮箱登录](acceptance/002-邮箱登录与会话外壳验收.md) | accepted | pending |

## 当前门禁

当前先推进 Plan 000。它必须等待 `video-server` 提交 accepted 认证 OpenAPI，冻结 `__Host-video_session`、签名 double-submit CSRF、邮箱验证、密码重置、撤销、限流和 canonical 错误后才能进入 `ready`。Plan 001 继续保持 `review`，并额外等待 Plan 000 `done` 与 Acceptance 002 全部 `passed`。

## 状态规则

- Design/PRD：`draft → review → accepted → superseded`。
- Plan：`draft → review → ready → in_progress → done`，未来工作保持 `backlog`。
- Acceptance 文档状态：`draft → accepted`；执行结果：`pending → passed/failed/blocked`。
- 缺少输入、批准状态或可执行验收时，Plan 不得进入 `ready`。
- 文档只保存稳定契约和证据，不创建 `.planning`、日记或重复流程目录。
- 文档版本遵循 SemVer：已接受 `1.x` 契约的破坏性调整升 major；未冻结 `0.x` 的破坏性调整升 minor；兼容新增升 minor；澄清和证据回填升 patch。状态与版本相互独立，变更后必须重新复审才能恢复 `accepted/ready`。

`TEMPLATE.md` 提供通用结构，不代表产品决策。
