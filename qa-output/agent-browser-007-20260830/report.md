# Dogfood Report: 帧取 Web 服务侧回归

| Field | Value |
|-------|-------|
| **Date** | 2026-08-30 |
| **App URL** | `http://127.0.0.1:8101` |
| **Session** | `framegrab-007-qa` |
| **Scope** | 未登录门禁、登录、首页、五个一级页面、输入校验、移动视口、控制台错误 |

## Summary

| Severity | Count |
|----------|-------|
| Critical | 0 |
| High | 0 |
| Medium | 0 |
| Low | 0 |
| **Total** | **0** |

## Issues

本轮未发现可复现问题。

## Coverage

- 未登录访问 `/` 与 `/history` 均重定向登录，并保留目标路径。
- 使用真实普通用户登录后验证首页、下载记录、剧本文档、上传对话框、平台状态、个人资料与退出登录。
- 首页验证无效 URL 反馈，平台状态验证加载态与已加载列表。
- 390×844 视口验证首页、移动导航、退出登录与受保护路由。
- 每个主要状态均保存标注截图并检查浏览器 `errors` 与 `console`；没有 JavaScript 异常或失败请求。

## Evidence

- `screenshots/01-auth-entry.png`：桌面未登录门禁。
- `screenshots/02-home-authenticated.png`：真实登录后的首页。
- `screenshots/03-home-invalid-url.png`：URL 校验反馈。
- `screenshots/04-history.png` 至 `11-profile.png`：一级页面与账户覆盖。
- `screenshots/12-mobile-home.png` 至 `15-protected-route-redirect.png`：390×844 移动覆盖。
