# 010 媒体体验与移动管理中心验收报告

| 字段 | 结果 |
| --- | --- |
| 日期 | 2026-08-30 |
| App | iPhone 17 Pro / iOS 26.5 / `http://127.0.0.1:8111` |
| Web | `http://127.0.0.1:8101` |
| Agent Browser Session | `framegrab-web-qa-b70c359e1a5d` |
| 范围 | 私有封面、播放/文件获取、历史详情、管理员数据、Web 认证边界与移动响应式 |

## 结论

本轮没有遗留可复现的 Critical、High、Medium 或 Low 问题。App 使用真实管理员账户和服务端数据完成端到端只读验收；Web 使用隔离 Agent Browser 会话验证登录/注册、受保护路由、移动响应式、无障碍、控制台和 Web Vitals。隔离浏览器未读取或复用 App 凭据，因此 Web 的登录后数据页由 App 真实 API 验收与同源生成契约覆盖。

| 严重度 | 数量 |
| --- | ---: |
| Critical | 0 |
| High | 0 |
| Medium | 0 |
| Low | 0 |
| 总计 | 0 |

## App 真实数据验收

- 历史记录显示 5 条真实任务和 4 张可见私有封面；详情封面由 Bearer 请求读取，认证信息未进入 URL。
- MP4/H264 记录可在原生播放器内播放；实际画面与进度均正常。
- “观看 / 获取文件”使用统一 52px 高的无边框操作区；主操作为高对比按钮，次操作为轻量底色按钮，不再重复叠加圆形播放键。
- iOS 对 WebM/AV1 显示明确的不可预览说明并保留“获取文件”，避免等待原生播放器失败。
- “获取文件”成功打开系统浏览器的短时下载入口；短时 URL 未写入报告、日志或持久化状态。
- 当前账户为管理员；管理中心真实返回 41 条下载分析、1.0 GB 下载量、38 个持久文件、14 位用户、平台目录和当前 AI 线路。
- 文件清理、角色/启停、平台可见性和 AI 线路切换仅检查界面、生成契约和成功后失效重读逻辑，未在真实环境触发副作用。

## Agent Browser Web 回归

- 登录与注册页面在桌面和 390×844 视口均无溢出；认证视觉、内容层级和 App 采用同一品牌语义。
- 未登录访问 `/downloads` 与 `/admin/users` 均保留目标地址并重定向登录页。
- 登录页和注册页 axe WCAG 2 A/AA：0 violation、0 incomplete。
- 登录页 FCP 620ms、LCP 620ms、CLS 0、Hydration 26.6ms；未发现 4xx/5xx、JavaScript 异常或 CORS 错误。
- 开发模式控制台仅包含 React DevTools、HMR 与 Fast Refresh 信息。

## Web 证据

- [桌面登录页](screenshots/web-home.png)
- [桌面注册页](screenshots/web-register.png)
- [移动注册页](screenshots/web-register-mobile.png)
- [移动管理员路由登录门禁](screenshots/web-admin-redirect-mobile.png)

用户媒体标题、App 登录资料、播放画面与短时 URL 均未保存为仓库证据。
