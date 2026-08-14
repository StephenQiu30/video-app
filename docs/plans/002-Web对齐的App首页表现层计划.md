# 002 Web 对齐的 App 首页表现层计划

- 状态：Complete
- 日期：2026-08-13
- 前置：Design/PRD Accepted，Acceptance Defined

## 1. 实现

1. [x] 固定 Web 首页组件、`globals.css` 与 390px 证据作为表现层基准。
2. [x] 扩展 Flutter 语义 token、主题控制器与同源品牌 SVG。
3. [x] 实现 80px Header、四目的地底部菜单栏、编辑式 Hero、输入和页脚状态。
4. [x] 实现与 Web 一致的单 URL 归一化及明确的契约未接入状态。
5. [x] 保持真实解析意图为可注入空依赖，不接入 Cookie 或网络。

## 2. 验证

1. [x] 生成本地化与类型安全路由代码。
2. [x] 覆盖 URL 规则、页面初始态、校验失败、契约阻塞、意图注入和主题切换。
3. [x] 运行 format、analyze、test、Android debug 与 iOS simulator build。
4. [x] 在 iPhone 17 Pro 模拟器检查浅色、深色、底部菜单与错误状态。
