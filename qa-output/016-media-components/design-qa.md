# 016 媒体组件与上传体验 Design QA

> 既有 001–015 设计验收记录已完整归档至 qa-output/design-qa-history-through-015.md。

## 对照目标

- 视觉事实：用户提供的三张 iPhone 17 Pro / iOS 26.5 问题截图。
  - `/var/folders/r5/lm_1_1hd321dzlfq0lctjdnw0000gn/T/codex-clipboard-8b32b8bd-20d3-47a1-9741-c73d62dc775f.png`
  - `/var/folders/r5/lm_1_1hd321dzlfq0lctjdnw0000gn/T/codex-clipboard-65ccc0fb-2dd1-404d-870e-f647d68608a8.png`
  - `/var/folders/r5/lm_1_1hd321dzlfq0lctjdnw0000gn/T/codex-clipboard-07a7c2a9-78c8-49bc-94b7-4d02d3a75b71.png`
- 实现截图：`qa-output/016-media-components/` 下的 iPhone 17 Pro Simulator 开发构建截图。
- 视口：iPhone 17 Pro，逻辑尺寸 402×874，设备像素比 3，原生截图 1206×2622。
- 状态：深色主题；同一 WebM/AV1 任务降级页、同一超长标题 MP4/H264 任务详情、展开的 Material 3 结果选择菜单，以及本地视频上传入口。

## 密度与裁切归一化

- 来源原图为 892×1902，包含 Simulator 窗框；比较时裁出屏内区域 789×1742。
- 实现原图为 1206×2622；比较时横向裁至 1188×2622，再缩放为 789×1742。
- 同屏对照：
  - `qa-output/016-media-components/comparison-unsupported-codec.png`
  - `qa-output/016-media-components/comparison-dropdown.png`
  - `qa-output/016-media-components/comparison-long-title.png`
- 下拉框来源是分析创建态，实现截图是分析结果态；二者不是同一业务内容，只比较共享选择组件的弹层边界、选中态与锚定关系。组件本身另有 Widget 属性测试覆盖创建态。

## Findings

没有剩余 P0、P1 或 P2 问题。

- 字体与层级：详情标题从不受限的展示字号改为三行 `headlineMedium`，超长标题不再占据大部分首屏；完整标题继续作为标题语义提供给读屏。WebM/AV1 短标题也获得更平衡的层级。
- 间距与布局：标题、元数据、媒体区和操作区恢复清晰的纵向节奏；本地上传入口在 402px 宽度内无溢出，44px 以上主操作可触达。
- 色彩与 Token：继续使用现有 Material 3 深色语义色，没有引入新的孤立色值；成功状态、次级文字和填充按钮对比稳定。
- 图片质量：封面继续由真实鉴权资源提供，裁切、宽高比和清晰度未回退；没有使用占位图、自绘 SVG 或代码图形替代素材。
- 文案与内容：不支持编码仍明确说明原因并保留获取原文件；上传入口明确 MP4、授权边界和服务端隔离校验。
- 组件与交互：选择菜单由 Material 3 `DropdownMenu` 锚定到字段，最大高度受控且保留选中态；MP4/H264 实际签发地址后进入 Chewie 控制层并自动播放，WebM/AV1 不暴露虚假播放操作。
- 可访问性与响应式：标题语义不随视觉省略丢失；选择器和上传入口具有可读标签；Widget 测试覆盖 390px 基线、菜单高度、长标题省略与完整语义。

## 聚焦对照

- WebM/AV1：来源与实现为同一任务和同一降级状态；实现只调整标题比例，封面、说明、获取文件和状态信息保持一致。
- 超长标题：来源标题约占首屏半页以上；实现稳定限制为三行，使媒体预览和操作进入首屏，同时保留完整语义名称。
- 下拉弹层：来源旧菜单表现为无明确字段边界的大面积列表；实现为锚定字段的 Material 3 菜单，五项结果完整展示，更多项在 304 逻辑像素内滚动。
- 播放器：`implementation-player-controls.png` 记录同一 MP4/H264 任务在真实短时 URL 上播放；中央播放状态来自 Chewie，Flutter 开发控制台无异常。

## 比较历史

1. 初始问题证据：标题无行数限制、旧下拉列表挤占操作区、MP4 只有静态观看入口。
2. 修复：详情标题改为三行紧凑层级；统一共享 `DropdownMenu`；MP4/H264 接入 Chewie；WebM/VP9/AV1 保留准确降级；首页接入真实系统文件上传入口。
3. 后验截图：三组同屏对照均未发现可执行的 P0/P1/P2 视觉问题，开发构建真实播放、菜单展开和上传入口交互正常。

## Primary interactions checked

- 切换到本地视频上传入口。
- 从历史列表打开超长标题详情。
- 点击“观看”并在真实 MP4/H264 媒体上进入播放状态、显示播放控制。
- 展开并关闭共享 Material 3 选择菜单。
- 返回历史并打开 WebM/AV1 条目，确认只显示降级说明与获取文件。
- Flutter 开发控制台未出现异常或框架错误。

## Follow-up polish

无阻断项。可选 P3：后续在真实大字体设备上补充一张展开菜单截图，作为辅助功能视觉档案。

final result: passed
