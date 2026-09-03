import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/features/landing/domain/public_home_links.dart';
import 'package:framegrab/l10n/app_localizations_zh.dart';

void main() {
  test('matches the Web public project introduction content baseline', () {
    final l10n = AppLocalizationsZh();

    expect(l10n.publicHomeEyebrow, 'FrameFetch · Open Source');
    expect(l10n.publicHomeTitle, '把素材，\n带回本地。');
    expect(
      l10n.publicHomeDescription,
      '开源、自托管地完成公开视频解析、本地视频与剧本文档导入、制品管理和 AI 分析。数据与运行边界由你掌控。',
    );
    expect(l10n.publicWorkflowTitle, '一套可审计的完整链路');
    expect(
      [
        (
          l10n.publicWorkflowInspectTitle,
          l10n.publicWorkflowInspectDescription,
        ),
        (l10n.publicWorkflowSelectTitle, l10n.publicWorkflowSelectDescription),
        (
          l10n.publicWorkflowExecuteTitle,
          l10n.publicWorkflowExecuteDescription,
        ),
        (
          l10n.publicWorkflowDeliverTitle,
          l10n.publicWorkflowDeliverDescription,
        ),
      ],
      [
        ('解析', '识别公开媒体或文章中的候选视频'),
        ('选择', '确认目标与格式，避免隐式下载'),
        ('执行', '由隔离 Worker 处理下载、导入和分析'),
        ('交付', '通过授权短时入口预览或获取制品'),
      ],
    );
    expect(l10n.publicHomeCapabilitiesTitle, '从公开媒体到可验证制品');
    expect(
      l10n.publicHomeCapabilitiesDescription,
      'Web 控制面、API 与 Worker 共享同一套权限、任务和制品模型，适合个人本地使用，也便于团队自托管。',
    );
    expect(
      [
        (l10n.publicVideoTitle, l10n.publicVideoDescription),
        (l10n.publicDocumentTitle, l10n.publicDocumentDescription),
        (l10n.publicAnalysisTitle, l10n.publicAnalysisDescription),
      ],
      [
        ('公开视频工作流', '解析有权处理的公开链接，选择真实可用格式，并跟踪下载与最终制品。'),
        ('剧本与文档处理', '导入获授权的剧本文档，在同一工作区完成规范化、分析与处理记录。'),
        ('结构化 AI 视频分析', '围绕场景、分镜、高光和内容资产生成结构化结果与运行证据。'),
      ],
    );
    expect(l10n.publicTrustTitle, '开源，不交出数据控制权');
    expect(
      l10n.publicTrustDescription,
      'FastAPI、Next.js、PostgreSQL、RabbitMQ、MinIO、FFmpeg 与 yt-dlp 组成可独立部署的工作流。MIT 许可证允许你免费检查、修改和自托管。',
    );
    expect(
      [
        l10n.publicSafeguardSession,
        l10n.publicSafeguardWorkers,
        l10n.publicSafeguardArtifacts,
        l10n.publicSafeguardAuthorization,
      ],
      [
        '浏览器会话采用 HttpOnly Cookie；原生客户端使用可轮换令牌。',
        '下载、导入与 AI 分析通过独立队列和 Worker 执行。',
        '短时制品入口、所有者隔离与授权边界贯穿完整链路。',
        '公开视频并不等于可自由使用，请仅处理已获授权的内容。',
      ],
    );
    expect(l10n.publicStartTitle, '在自己的基础设施上运行 FrameFetch');
    expect(
      l10n.publicStartDescription,
      '从仓库的 Quick Start、架构文档和安全边界开始，按需启用媒体解析、剧本工作流与 AI 服务。',
    );
  });

  test('uses the Web repository as the shared project source', () {
    expect(
      PublicHomeLinks.repository.toString(),
      'https://github.com/StephenQiu30/video-server',
    );
    expect(
      PublicHomeLinks.quickStart.toString(),
      'https://github.com/StephenQiu30/video-server/blob/main/README.md#%E5%BF%AB%E9%80%9F%E5%BC%80%E5%A7%8B',
    );
  });
}
