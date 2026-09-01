# 018 Markdown 报告预览设计

## 目标

App 的视频视觉分析与视频转文章结果共用真实 Markdown 渲染组件，不再把报告源文本作为普通字符串展示。

## 组件选择

- 使用维护中的 `flutter_markdown_plus`，由第三方组件负责 GitHub Flavored Markdown 的解析与 Widget 构建。
- App 仅提供与现有无边框主题一致的 `MarkdownStyleSheet`，不维护自制 Markdown 解析器。
- 报告组件嵌入详情页既有滚动容器，因此使用非滚动的 `MarkdownBody`；文本保持可选择。

## 视觉规则

- 标题层级沿用 App `TextTheme`，避免报告标题重新放大页面层级。
- 正文、列表、引用、代码块、分隔线和表格自动适配明暗主题。
- 引用与代码块只使用轻量底色和左侧分隔，不新增卡片边框。
- 视频视觉分析与视频文章报告复用同一个 `AnalysisReportPreview`。
