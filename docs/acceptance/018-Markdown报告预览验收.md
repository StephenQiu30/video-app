# 018 Markdown 报告预览验收

- [x] 报告由第三方 `flutter_markdown_plus` 解析，不包含自制 Markdown 解析逻辑。
- [x] 视频视觉分析与视频文章结果复用 `AnalysisReportPreview`。
- [x] 标题、强调、列表、引用、代码块、分隔线和 GFM 表格拥有主题化样式。
- [x] 报告文本可选择，组件可嵌入详情页既有滚动容器。
- [x] `flutter analyze` 通过。
- [x] 报告 Widget 测试与完整 `flutter test` 通过。

## 2026-09-01 验收证据

- `flutter analyze`：无问题。
- `flutter test test/widget/features/analysis/analysis_report_preview_test.dart`：2 个报告渲染测试通过。
- `flutter test`：75 个单元与 Widget 测试全部通过。
- 测试覆盖 Markdown 标题、强调、列表、GFM 表格以及明暗主题；原始 `#` 和表格分隔字符串不会作为正文出现。
