# shadcn 全量迁移设计

状态：Accepted。2026-09-21 用户明确选择全量迁移到 `shadcn_ui`，取代此前 Material 3 视觉方案。

## 设计基线

唯一视觉参照是 `video-server/frontend` 当前 `radix-nova`、neutral 主题及组件源码。App 使用 `shadcn_ui 0.57.0`，保留 Flutter 3.44.7 / Dart 3.12.2。按钮、表单、选择器、提示、弹层、徽标和进度全部使用 Shad 组件；Flutter 的布局、导航、文本编辑和平台服务仍承担底层能力。

主题使用 Web 的语义色、10pt 基础圆角、Geist 排版与统一间距。OKLCH 在生成时转换到 sRGB，透明颜色保留 alpha。语义色同时驱动 ShadTheme 和仅供播放器/路由等底层使用的 Material 兼容主题，不允许第二套手写色板。

Shad 不提供的 Spinner、分页和导航使用其按钮、进度及主题组合，缺口明确记录。保留最小 44pt 触控区域、SafeArea、文字缩放、iOS 返回和平台文件交互。完全统一指可控的主题、组件变体与层级一致；系统字体栅格化、系统分享界面不属于组件库可控制范围。

## 范围

公开首页、认证、链接/文件导入、下载历史与详情、文档、分析、平台状态、账户及移动管理中心。Riverpod、go_router、OpenAPI、原生会话与媒体链路保持现有边界。

## 交互

持续错误使用 ShadAlert；操作反馈使用 ShadSonner；字段校验使用 ShadInputFormField；确认使用 ShadDialog；编辑面板使用 ShadSheet。所有页面直接使用组件公开 API，业务辅助组件仅组合 Shad 组件。
