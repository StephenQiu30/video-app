# Design QA — Product Design 方案一

- source visual truth: `/Users/stephenqiu/.codex/generated_images/019ff8eb-3d7c-7923-a485-802f867474b7/exec-3bb8cb62-c30f-419e-9124-0b8d3a9c012e.png`
- current design guideline: `/Users/stephenqiu/Desktop/StephenQiu/Video/design.md`
- implementation screenshot: `/Users/stephenqiu/Desktop/StephenQiu/Video/video-app/qa-output/design-md-fix-20260813/app-home-light.png`
- historical option-selection comparison: `/Users/stephenqiu/Desktop/StephenQiu/Video/video-app/qa-output/product-design-scheme-1-20260813/comparison-final.png`
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

The historical 780 × 844 comparison remains option-selection evidence. The post-audit home, history and account captures were inspected independently against `design.md`; they retain the same brand, hero, form, token and persistent-navigation system while removing decoration and card shells.

Focused crops were not required: all type, icons, controls, borders, and labels are legible in the 1:1 full-view comparison. The original 3× capture was also inspected for asset sharpness and antialiasing.

## Interaction and state checks

- Switched among all five bottom destinations; home input state remained mounted through `IndexedStack`.
- Checked download history and provider contract states without mock remote data.
- Switched light/dark appearance and verified the native switch state.
- Submitted invalid input and verified field treatment plus live error feedback.
- Ran 14 automated tests with no runtime exception.

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
- `./tool/check.sh`、14 项测试、Android Debug APK 和 iOS Simulator 构建通过。
- 真实远程数据仍受原生会话、App OpenAPI、WebSocket 与文件授权契约阻塞，页面继续 fail closed，不展示模拟业务结果。

final result: presentation passed / E2E blocked

## 2026-08-13 `design.md` audit remediation

- Home evidence: `/Users/stephenqiu/Desktop/StephenQiu/Video/video-app/qa-output/design-md-fix-20260813/app-home-light.png`.
- History evidence: `/Users/stephenqiu/Desktop/StephenQiu/Video/video-app/qa-output/design-md-fix-20260813/app-history-light.png`.
- Account evidence: `/Users/stephenqiu/Desktop/StephenQiu/Video/video-app/qa-output/design-md-fix-20260813/app-account-light.png`.
- The home hero now begins directly with the H1; no decorative `01 / 02 / 03 / 04` labels remain.
- History and provider blocked states use a hairline separator and plain content instead of a filled card and decorative icon. Account contract copy uses the same continuous-canvas treatment.
- The accessibility tree exposes “下载记录” and “下载记录尚未开放” as separate headings, with both descriptions as independent text nodes. Account reading order is “我的” → description → “外观” → switch → “账户” → contract note.
- Theme type roles and the 8/12/16/20/24/32/40 spacing scale are centralized; system fonts remain an intentional native-platform difference from Web Geist.

final result: passed
