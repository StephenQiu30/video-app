# Design QA — Product Design 方案一

## 2026-08-30 009 顶部主题、状态性能与下载详情

- iOS Simulator evidence: `/Users/stephenqiu/Desktop/StephenQiu/Video/video-app/qa-output/009-navbar-status-detail/provider-status.png`
- viewport and state: iPhone 17 Pro, iOS 26.5, zh-CN, light appearance, authenticated provider status with 24 real records

No actionable P0, P1, P2, or P3 visual difference remains.

- The global appearance action now sits in the borderless top navbar beside the retained wordmark. Its 44×44 target, Lucide moon/sun states and localized semantics remain available on every authenticated primary page and download detail.
- The account page no longer duplicates appearance controls; account identity and sign-out retain their existing reading order.
- Provider status is prefetched after authentication and cached for the session. The first status-tab inspection exposed the complete 24-item result immediately instead of an empty canvas or blocking spinner.
- History rows are now explicit accessible buttons with a restrained chevron. The detail route preserves the continuous canvas, typography, hairline separators, native back affordance and Web-sourced task information.
- Real history and detail contain user media titles, so no screenshot containing those titles is retained. Runtime Semantics and authenticated API responses provide the functional evidence.

final result: passed

## 2026-08-30 媒体体验与移动管理中心

- iPhone 17 Pro / iOS 26.5 使用真实登录会话显示 5 条下载记录和私有封面，MP4/H264 原生播放与短时文件获取入口均可用。
- 媒体操作区采用无边框 52px 主次按钮，不再在封面叠加重复圆形播放键；WebM/AV1 在 iOS 显示明确降级说明和完整宽度的原文件入口。
- 管理中心真实返回下载分析、38 个持久文件、14 位用户、平台目录和 AI 活动线路；普通用户 Widget 深链接门禁 fail closed。
- Agent Browser 覆盖桌面与 390×844 登录/注册、下载与管理员受保护路由、axe 和 Web Vitals；0 个可复现问题、0 个 WCAG 2 A/AA violation，FCP/LCP 620ms、CLS 0。
- 为避免泄露用户内容，App 播放画面、用户媒体标题、账户信息和短时 URL 未写入仓库证据；公开 Web 证据见 `qa-output/010-media-admin/report.md`。

final result: passed

## 2026-08-30 007 无边框导航与认证门禁

- selected visual truth: `/Users/stephenqiu/Desktop/StephenQiu/Video/video-app/docs/design/references/007-borderless-navigation-selected.png`
- iOS Simulator evidence: `/Users/stephenqiu/Desktop/StephenQiu/Video/video-app/qa-output/007-borderless-auth/home-390x844.png`
- normalized same-canvas comparison: `/Users/stephenqiu/Desktop/StephenQiu/Video/video-app/qa-output/007-borderless-auth/comparison.png`
- viewport and state: iPhone 17e, 390 × 844 logical points, zh-CN, light appearance, authenticated home, empty URL, first content source and first bottom destination selected

### Comparison findings

No actionable P0, P1, P2, or P3 visual difference remains.

- The implementation preserves the selected composition: single top wordmark, large two-line editorial heading, muted body copy, three borderless source triggers, filled input, black primary action, legal guidance, and a five-item bottom TabBar.
- The bottom TabBar has no border, top divider, pill, card, dot, or short selected marker. Selection is expressed only by black Lucide icon/text and semibold label; inactive destinations are neutral gray.
- The source-tab underline remains intentionally scoped to the selected content source and is not reused in the bottom TabBar.
- Lucide replaces the generated mock icons because it is shadcn/ui's default icon language and `lucide_icons_flutter 3.1.17` is compatible with the local Flutter 3.44 toolchain.
- Native status and home-indicator safe areas are expected runtime chrome and are not recreated as app content.
- Reference and implementation were normalized to 390 × 844 and combined into one comparison image before judgment.

### Interaction and accessibility

- Signed-out launch exposes only login/register; protected content is absent. Stored secure credentials restore into the main app, and logout returns to login.
- Five bottom destinations expose localized labels, `SemanticsRole.tab`, and selected state; Chinese and English accessibility-text tests pass without overflow.
- Source switching, URL validation, retained home input, appearance switching, registration, real iOS session entry, and logout are covered by automated tests.
- Agent Browser service-side regression covered desktop and 390×844 auth boundaries, login, home, invalid input, history, documents, upload dialog, provider status, profile, logout, and protected-route redirect with zero reproducible issues.

final result: passed

- historical source visual truth: `/Users/stephenqiu/.codex/generated_images/019ff8eb-3d7c-7923-a485-802f867474b7/exec-3bb8cb62-c30f-419e-9124-0b8d3a9c012e.png`
- current design truth: `docs/design/003-方案一视觉深化与Web普通用户功能对齐设计.md` and `docs/design/004-Server当前普通用户页面同步设计.md`
- current implementation evidence: `/Users/stephenqiu/.codex/visualizations/2026/08/30/01a051e5-0089-7012-8914-2deb208a8ee7/flutter-dynamic-type-fix/02-accessibility-medium-fixed.png`
- current default-dark evidence: `/Users/stephenqiu/.codex/visualizations/2026/08/30/01a051e5-0089-7012-8914-2deb208a8ee7/flutter-dynamic-type-fix/07-default-dark.png`
- viewport: iPhone 17e, 390 × 844 logical points, iOS 26.5
- state: zh-CN, light appearance, empty URL, first bottom destination selected
- source pixels: 853 × 1844; normalized to 390 × 844 for comparison
- implementation pixels: 1170 × 2532 at 3× density; normalized to 390 × 844

## Findings

No actionable P0, P1, or P2 differences remain.

- [P3] Native device chrome is present only in the implementation.
  - Location: top and bottom system safe areas.
  - Evidence: the generated source omits a status bar while the iOS capture includes the real status bar and home safe area.
  - Classification: expected mobile-runtime difference; device chrome must not be recreated as app content.
- [P3] Empty-field clear affordance differs intentionally.
  - Location: URL input trailing edge.
  - Evidence: the source shows a close icon while the field contains placeholder text; the implementation only exposes clear after real input exists.
  - Classification: functional correction that preserves the Web behavior.
- [P3] Native Material Symbols replace the mock/Web icon family.
  - Location: input, actions, trust rows, and bottom navigation.
  - Evidence: icon meaning, size, and alignment match; stroke details differ from the generated reference.
  - Classification: intentional platform adaptation requested for the Flutter app.
- [P3] The selected source image contained a numbered eyebrow; the current implementation does not.
  - Location: above the home hero and secondary page titles.
  - Evidence: the numbered label added no task or navigation meaning and conflicted with the later repository-level `design.md` review.
  - Classification: intentional cross-platform correction applied to both App and Web.

## Required Fidelity Surfaces

- Fonts and typography: system Chinese sans fallback is optically consistent; the centralized 64/52/40px editorial scale, medium weight, tight tracking, two-line wrap and body hierarchy match the Web intent. No clipping or truncation at the mobile baseline.
- Spacing and layout rhythm: 16px gutter, 80px app bar, hero spacing, 64px input/action height, 6px radius, trust separator, and persistent navigation preserve the source/Web rhythm. Real system safe areas account for the vertical offset.
- Colors and visual tokens: `#FAFAFA`, `#0A0A0A`, `#F1F1F1`, muted foreground, black primary action, green success, and hairline borders match the Web semantic tokens. No gradient, glass, heavy shadow, or decorative card drift.
- Image quality and asset fidelity: the supplied brand SVG is rendered directly and remains sharp at 3× density. The reference contains no other product imagery.
- Copy and content: brand, title, task description, URL hint, CTA, authorization/credential guidance, and five destination labels are complete and coherent; broad “安全解析” and “隐私保护” claims are absent.
- Icons: all visible controls use real Material Symbols with consistent 18–22px optical size and semantic labels.
- Accessibility and behavior: page title, description and secondary state headings are separate nodes in the Simulator accessibility tree; the URL field, CTA, live error region, five selected-state destinations and theme switch remain exposed. Widget tests cover validation, intent injection, intake switching, navigation, state preservation, heading boundaries and appearance switching.

## Full-view comparison evidence

The original generated visual remains historical option-selection context. Current acceptance uses the 390 × 844 simulator captures above and the 003/004 design documents; the retired 2026-08-13 `qa-output` paths are no longer treated as current evidence.

Focused crops were not required: all type, icons, controls, borders, and labels are legible in the 1:1 full-view comparison. The original 3× capture was also inspected for asset sharpness and antialiasing.

## Interaction and state checks

- Switched among all five bottom destinations; home input state remained mounted through `IndexedStack`.
- Checked download history and provider contract states without mock remote data.
- Switched light/dark appearance and verified the native switch state.
- Submitted invalid input and verified field treatment plus live error feedback.
- Ran 16 automated tests with no runtime exception.

## Comparison history

- Pass 1: no actionable P0/P1/P2 difference found. The three P3 differences above were classified as intentional native/runtime behavior, so no visual fix loop was required.
- Pass 2: the `design.md` audit removed numbered eyebrows, repeated contract cards and unsupported trust copy. Fresh captures confirm the home remains visually balanced and the history/account pages now use a continuous canvas. Simulator AX inspection confirms headings and body descriptions are no longer merged.

## Implementation checklist

- [x] Match option-one composition at 390 × 844.
- [x] Preserve Web semantic tokens and source logo.
- [x] Keep Flutter-native navigation, controls, system chrome, and accessibility.
- [x] Verify all current destinations and visible states.
- [x] Pass format, analyze, tests, Android debug build, and iOS simulator build.

final result: passed

## 2026-08-30 Dynamic type remediation

- Failure evidence: `/Users/stephenqiu/.codex/visualizations/2026/08/30/01a051e5-0089-7012-8914-2deb208a8ee7/flutter-ui-audit/02-home-accessibility-text.png` reproduced three selector RenderFlex overflows at 390 × 844 and `accessibility-medium`.
- Fixed home evidence: `/Users/stephenqiu/.codex/visualizations/2026/08/30/01a051e5-0089-7012-8914-2deb208a8ee7/flutter-dynamic-type-fix/02-accessibility-medium-fixed.png` shows the three intake destinations stacked at full width without clipping.
- Input-focus evidence: `/Users/stephenqiu/.codex/visualizations/2026/08/30/01a051e5-0089-7012-8914-2deb208a8ee7/flutter-dynamic-type-fix/05-accessibility-medium-input-focus.png` confirms keyboard avoidance and visible focus.
- Mode-switch evidence: `/Users/stephenqiu/.codex/visualizations/2026/08/30/01a051e5-0089-7012-8914-2deb208a8ee7/flutter-dynamic-type-fix/06-accessibility-medium-local-video.png` confirms the selected state and primary action remain reachable.
- Simulator accessibility inspection exposed all five navigation tabs with complete localized names and selected states while only the active visual label was shown.
- Widget coverage verifies full-width vertical positions, all three intake semantics, all five tab semantics and state transitions in Chinese and English. `dart run tool/check.dart` passed 16 tests; Android Debug and iOS Simulator builds passed.

final result: presentation passed / E2E blocked

## 2026-08-27 Server Web 基线问题修复回归

- Server 首页在 URL 输入变化时立即清除旧解析结果与创建任务操作，无效地址提交只显示校验错误，App 与 Web 不再存在歧义状态基线。
- 390×844 的 Server 移动导航初始焦点已从“退出登录”调整到“导航”标题；页面无横向溢出。
- Server 页面 metadata、H1、搜索与分页语义统一使用“下载记录”，与 App 现有底部导航和页面文案一致。
- Server 平台状态加载按钮保持可读对比度；首页、下载记录与平台状态 axe 复扫均为 0 violation。
- 原 3 个 Medium 与 1 个 Low 问题全部关闭，证据见 `qa-output/agent-browser-server-sync-20260827/report.md`。

final result: presentation passed / E2E blocked

## 2026-08-27 Server 当前普通用户页面同步

- 对齐基线：`video-server` `8bb2e91`。
- 首页已从单链接入口扩展为链接解析、本地视频与剧本文档三种素材入口；链接说明覆盖公开视频、微信视频号单作品和微信公众号文章多视频显式选择。
- 底部导航已更新为首页、下载记录、剧本文档、平台状态与我的五个目的地。
- 下载记录说明已覆盖完成后视频预览与 AI 分析；平台状态说明已区分检查、真实下载和完整分析证据。
- iPhone 17e 390×844 模拟器实际启动检查确认三种入口、五项导航和中文标签无横向溢出或截断。
- `dart run tool/check.dart`、14 项测试、Android Debug APK 和 iOS Simulator 构建通过。
- 真实远程数据仍受原生会话、App OpenAPI、WebSocket 与文件授权契约阻塞，页面继续 fail closed，不展示模拟业务结果。

final result: presentation passed / E2E blocked

## 2026-08-13 historical design audit remediation

- The original `qa-output/design-md-fix-20260813` captures have been retired; current visual evidence is listed at the top of this document.
- The home hero now begins directly with the H1; no decorative `01 / 02 / 03 / 04` labels remain.
- History and provider blocked states use a hairline separator and plain content instead of a filled card and decorative icon. Account contract copy uses the same continuous-canvas treatment.
- The accessibility tree exposes “下载记录” and “下载记录尚未开放” as separate headings, with both descriptions as independent text nodes. Account reading order is “我的” → description → “外观” → switch → “账户” → contract note.
- Theme type roles and the 8/12/16/20/24/32/40 spacing scale are centralized; system fonts remain an intentional native-platform difference from Web Geist.

final result: passed
