---
layer: design
doc_no: "DESIGN-005"
audience:
  - PM
  - Dev
  - QA
feature_area: public-parser-auth-modal
purpose: "定义 video-web 从全局强登录调整为公开解析页 + 登录 Modal 拦截动作的产品与技术边界。"
canonical_path: "docs/design/05-公开解析页与登录Modal设计.md"
status: draft
version: "0.1.0"
owner: "StephenQiu30"
inputs:
  - "当前 Ant Design Pro 一体化后台实现"
  - "video-server OpenAPI 鉴权契约"
  - "用户确认的方案 A：公开页面 + 登录 Modal 拦截动作"
outputs:
  - "公开页面与轻登录交互设计"
  - "前端鉴权边界调整方案"
triggers:
  - "希望未登录用户也能看到系统页面与输入框"
  - "希望减少独立登录页带来的后台系统强登录感"
downstream:
  - "后续实现计划"
  - "E2E 验收用例"
---

# 公开解析页与登录 Modal 设计

## 1. 背景

当前 video-web 的前端鉴权采用“后台系统强登录”思路：除 `/user/login` 和 `/auth` 外，用户未登录访问任意页面都会跳转登录页。这与万能视频下载器的工具型产品心智存在偏差。用户希望未登录时也能看到系统、看到解析输入框，并在需要真正调用受保护接口时再轻量登录。

后端现状是 `/api/parse`、`/api/tasks`、任务详情、下载链接、PDF 与管理员接口均要求登录。基于该契约，本轮不设计匿名任务，也不设计 guest token。未登录用户只能浏览页面和填写输入，不允许直接解析或创建任务。

## 2. 目标

1. `/parser` 作为公开工具页对未登录用户可见。
2. 未登录用户可以看到顶部布局、解析输入框、能力说明、格式/任务/PDF 等能力提示。
3. 未登录用户点击“解析链接”时不调用 `/api/parse`，而是打开登录 Modal。
4. 登录成功后自动继续执行用户刚才的解析动作。
5. 登录后用户继续使用现有 `/api/parse`、`/api/tasks`、任务详情和账号中心能力。
6. 管理后台仍只对管理员开放。
7. 登录 UI 使用 Ant Design / ProComponents，不做独立大面积自研页面设计。

## 3. 非目标

- 不新增匿名任务、guest token、访客配额或任务归属迁移。
- 不修改后端鉴权契约。
- 不删除 `/user/login` 路由；它保留为兜底入口和 OAuth 异常回退入口。
- 不重做首页营销页，不增加复杂动效或额外宣传版块。
- 不实现注册流程改造；登录 Modal 首轮只承载已有邮箱密码登录与既有 OAuth 提示。

## 4. 用户体验

### 4.1 未登录访问 `/parser`

页面正常展示 Ant Design Pro 顶部布局和解析页内容。右上角显示“登录”入口，而不是用户头像。解析输入框可以填写，但提交时进入登录 Modal。

用户点击“解析链接”后：

1. 前端保存当前表单中的 URL 作为 pending action。
2. 打开登录 Modal。
3. 用户完成邮箱密码登录。
4. 前端刷新 `currentUser`。
5. Modal 关闭。
6. 自动继续调用 `/api/parse`。
7. 展示解析结果。

### 4.2 登录后继续主链路

登录用户点击“解析链接”直接调用 `/api/parse`。解析成功后可选择格式并点击“创建下载任务”。创建任务成功后跳转 `/tasks/:taskId`。

### 4.3 受保护页面

- `/tasks`、`/tasks/:taskId`、`/account` 需要登录。
- 未登录访问这些页面时，可以跳转 `/parser` 并打开登录 Modal，或展示轻量无权限提示后引导登录。首轮推荐跳转 `/parser` 并打开 Modal，以保持入口集中。
- `/admin/*` 继续要求 `currentUser.is_admin === true`。未登录时先登录；登录后非管理员展示 403。

## 5. 技术设计

### 5.1 鉴权边界

取消全局“所有页面未登录即跳转 `/user/login`”的策略，改为显式路由权限：

- 公开路由：`/`、`/parser`、`/auth`、`/user/login`。
- 登录路由：`/tasks`、`/tasks/:taskId`、`/account`。
- 管理员路由：`/admin/*`。

`getInitialState` 保持现有逻辑：存在 token 时请求 `/api/auth/me`，失败则清理 token。不存在 token 时也返回 layout settings，使公开页面能够渲染。

### 5.2 登录 Modal

新增一个轻量组件，例如 `src/components/AuthModal`：

- 使用 `Modal` 包裹 ProComponents `LoginForm`。
- 字段复用当前登录页：邮箱、密码。
- 登录成功后调用 `loginWithPassword`，再调用 `fetchCurrentUser`，通过 `setInitialState` 更新用户。
- 暴露 `openAuthModal({ reason, onSuccess })` 或页面级 state 控制。

首轮推荐页面级控制，避免引入全局状态过早复杂化：

- `/parser` 自己维护 `authOpen` 与 `pendingUrl`。
- 顶部右侧登录入口可通过 `UserAvatar` 或一个独立 `LoginAction` 打开 Modal。
- 后续若多个页面都需要登录弹窗，再抽到全局 model。

### 5.3 解析页动作拦截

`ParserPage` 的 `onFinish` 调整为：

1. 如果 `currentUser` 不存在，保存 URL，打开登录 Modal，返回。
2. 如果 `currentUser` 存在，执行 `runParse(url)`。
3. 登录 Modal 成功回调中，读取 pending URL 并执行 `runParse(pendingUrl)`。

创建任务动作仍要求登录。若未来允许“已解析但登录态过期”，点击创建任务时也应触发同一个登录 Modal，登录成功后继续创建任务。

### 5.4 401 处理

请求拦截器仍附加 token。响应 401 时不再默认跳转 `/user/login`，而是：

- 清理 token。
- 在公开页面显示登录 Modal 或错误提示。
- 在受保护页面跳转 `/parser` 并提示重新登录。

这个策略避免用户在公开页面被整页打断。

## 6. 错误处理

- 登录失败：Modal 内展示“登录失败，请检查邮箱和密码”。
- token 过期：清理 token，提示“登录状态已过期，请重新登录”。
- 解析失败：登录成功但 `/api/parse` 返回业务错误时，使用现有后端错误信息或通用提示。
- 非管理员访问：保留 403，不自动退出登录。

## 7. 测试策略

### 7.1 单元与脚本校验

- 校验 `/parser` 不再被全局未登录跳转拦截。
- 校验 `/tasks`、`/account`、`/admin/*` 仍有明确权限约束。
- 校验登录 Modal 使用 ProComponents 登录表单，而不是新增独立自研登录页主流程。

### 7.2 E2E

新增或调整 Playwright 用例：

1. 未登录访问 `/parser` 可见解析输入框。
2. 未登录点击“解析链接”打开登录 Modal，且不会调用 `/api/parse`。
3. 登录 Modal 登录成功后继续解析并展示结果。
4. 登录后创建任务并进入任务详情。
5. 未登录访问 `/tasks` 被引导登录。
6. 非管理员登录访问 `/admin/users` 显示 403。

## 8. 风险与边界

- 后端仍要求登录，因此未登录用户不能真实解析视频。这是当前选择的安全边界。
- `/user/login` 仍需保留，避免 OAuth 回跳或深链场景无兜底入口。
- 如果后续希望未登录也能真实解析，需要另起后端设计：公开解析限流、IP/设备频控、防滥用和合规提示。
- 登录 Modal 的全局化不要过早抽象；先从 `/parser` 主链路落地，减少复杂度。

## 9. 验收标准

1. 未登录打开 `/parser` 不跳转 `/user/login`。
2. 未登录能看到解析输入框和能力说明。
3. 未登录提交解析时弹出登录 Modal。
4. 登录成功后继续执行刚才的解析动作。
5. `/tasks`、`/account`、`/admin/*` 不对未登录用户直接暴露数据。
6. E2E 覆盖公开解析页、登录 Modal 和管理员权限边界。
