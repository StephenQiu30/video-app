# Contributing

感谢你愿意改进“帧取 App”。

## 当前边界

本仓库是 Flutter iOS/Android 客户端，不再建设 Web 平台。API 与浏览器 Web 由 [`video-server`](https://github.com/StephenQiu30/video-server) 维护；管理后台、Provider 执行、媒体解析、AI Worker 和对象存储不进入 App。

Phase 1 工程基座已经建立。每个后续能力仍必须完成 `Design → PRD → Plan → Acceptance`；原生鉴权契约未冻结前不得接入浏览器 Cookie、WebView 登录或伪造业务 E2E。详细规则见 [`AGENTS.md`](AGENTS.md)。

## 实现原则

- 一套 Flutter/Dart 业务代码覆盖 Android 与 iOS，不建立平行原生页面。
- 优先使用 Flutter 官方能力和已接受的统一依赖，不重复引入状态、路由、网络或序列化方案。
- 核心逻辑遵循 Red → Green → Refactor；平台能力同时覆盖 Dart 测试与真机/模拟器验证。
- OpenAPI 生成代码禁止手工修改；接口变化先在 `video-server` 冻结契约。
- 不提交 Secret、Token、Cookie、用户媒体、签名材料、构建产物或临时文件。

## 本地门禁

```bash
flutter pub get
./tool/check.sh
flutter build apk --debug
flutter build ios --simulator --no-codesign
```

修改 `@TypedGoRoute` 后运行 `dart run build_runner build` 并提交生成结果；修改 ARB 后运行 `flutter gen-l10n`。生成文件只能通过对应工具更新。

## 提交规范

提交信息使用中文 Conventional Commits：

```text
<type>(<scope>): <中文描述>
```

常用类型包括 `feat`、`fix`、`refactor`、`docs`、`test`、`build`、`ci`、`chore` 和 `style`。标题不超过 72 个字符，末尾不加标点。只有用户明确要求时才推送或创建 PR。
