# video-web

`video-web` 当前是“帧取”Web 前端的规范与目录基线仓库，暂不包含应用源码、测试实现、依赖、构建配置、容器配置或 CI 实现。

本次整理移除了原有 Umi/React 实现，并把相邻 `video-server` 中的当前产品、设计、计划、验收、调研、运维和视觉 QA 文档同步到本仓库。来源仓库中的历史实现证据仅用于说明规范背景，不能视为本仓库的验收结果。

## 当前内容

- [`docs/README.md`](docs/README.md)：Design、PRD、Plan、Acceptance 及其支持材料的完整索引。
- [`AGENTS.md`](AGENTS.md)：后续 Next.js Web 实现必须遵循的技术、交互、安全和验证约束。
- [`CONTRIBUTING.md`](CONTRIBUTING.md)：文档维护与后续实现的交付规则。
- [`SECURITY.md`](SECURITY.md)：产品安全边界和漏洞报告要求。
- [`design-qa.md`](design-qa.md)：来源前端的视觉回归基线与证据。

仓库同时保留后续 Next.js 实现所需的空目录骨架：

```text
public/images/
scripts/
src/
├── app/
├── components/ui/
├── hooks/
├── lib/
├── services/video/
├── types/
└── utils/
tests/
├── fixtures/
├── helpers/
└── unit/
```

这些目录只包含 `.gitkeep`，用于保留结构，不表示对应模块已经实现。

## 当前状态

仓库没有可运行应用，因此不存在安装、启动、测试或构建命令。开始实现前必须先基于现有 `Design → PRD → Plan → Acceptance` 链路明确本仓库范围和独立验收证据，再建立 Next.js App Router 基座；不得直接恢复 Git 历史中的旧 Umi、Ant Design 或旧路由实现。

服务端 API、OpenAPI 契约、统一生产镜像和运行基础设施仍由相邻 `video-server` 维护，本仓库不复制后端实现或部署拓扑。
