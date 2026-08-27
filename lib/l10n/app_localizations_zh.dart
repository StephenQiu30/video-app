// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => '帧取';

  @override
  String get homeLinkLabel => '帧取首页';

  @override
  String get openNavigation => '打开导航菜单';

  @override
  String get navigationDescription => '访问素材导入、下载记录、剧本文档、平台状态与账户设置。';

  @override
  String get homeNavigation => '首页';

  @override
  String get downloadHistoryNavigation => '下载记录';

  @override
  String get screenplayDocumentsNavigation => '剧本文档';

  @override
  String get providerStatusNavigation => '平台状态';

  @override
  String get accountNavigation => '我的';

  @override
  String get downloadHistoryDescription =>
      '搜索、筛选并恢复下载任务，查看进度、失败原因、完成后视频预览、文件状态与 AI 分析入口。';

  @override
  String get downloadHistoryPendingTitle => '下载记录尚未开放';

  @override
  String get downloadHistoryPendingDescription =>
      '原生认证、任务查询与短期文件授权契约冻结后，这里将展示真实任务、视频预览和分析状态。';

  @override
  String get screenplayDocumentsDescription =>
      '查看剧本文档的导入状态、提取规模、规范化预览，以及分析与改写结果。';

  @override
  String get screenplayDocumentsPendingTitle => '剧本文档尚未开放';

  @override
  String get screenplayDocumentsPendingDescription =>
      '原生上传、文档查询与文件授权契约冻结后，这里将展示真实剧本文档和处理结果。';

  @override
  String get providerStatusDescription =>
      '查看平台接入、访问模式、最近状态检查、真实下载证据与完整分析证据，不展示账号、Cookie、出口或探针地址。';

  @override
  String get providerStatusPendingTitle => '平台状态尚未开放';

  @override
  String get providerStatusPendingDescription =>
      '原生会话契约冻结后，这里将读取服务端返回的真实平台能力，不显示模拟数据。';

  @override
  String get accountDescription => '管理个人资料、登录状态和应用外观。';

  @override
  String get appearanceSection => '外观';

  @override
  String get accountSection => '账户';

  @override
  String get darkThemeLabel => '深色外观';

  @override
  String get themeToggleDescription => '在深色与浅色主题间切换';

  @override
  String get nativeContractPendingShort => '登录、账户资料与退出将在原生会话契约冻结后开放。';

  @override
  String get downloadHomeTitle => '把素材，\n带回本地。';

  @override
  String get downloadHomeDescription => '解析公开视频链接，或导入你有权处理的本地视频与剧本文档。';

  @override
  String get linkIntakeMode => '链接解析';

  @override
  String get videoIntakeMode => '本地视频';

  @override
  String get screenplayIntakeMode => '剧本文档';

  @override
  String get linkIntakeSupport => '支持公开视频、微信视频号单作品和微信公众号文章链接；文章发现多个视频后必须明确选择。';

  @override
  String get videoIntakeTitle => '导入本地视频';

  @override
  String get videoIntakeDescription =>
      '选择你拥有或已获授权的明文视频文件，服务端完成隔离校验后进入下载记录与 AI 分析。';

  @override
  String get selectVideoFile => '选择视频文件';

  @override
  String get screenplayIntakeTitle => '导入剧本文档';

  @override
  String get screenplayIntakeDescription =>
      '选择 TXT、DOCX 或 PDF 剧本，服务端将提取规范化预览并支持分析与改写。';

  @override
  String get selectScreenplayFile => '选择剧本文件';

  @override
  String get mediaUrlHint => '粘贴公开的视频或文章链接';

  @override
  String get mediaUrlLabel => '公开内容地址';

  @override
  String get clearMediaUrl => '清空链接';

  @override
  String get inspectMedia => '解析媒体';

  @override
  String get inspectingMedia => '解析中…';

  @override
  String get mediaUrlError => '请输入有效的公开 HTTP(S) 视频地址。';

  @override
  String get nativeContractPending => '页面表现层已经就绪；原生认证与服务契约尚未冻结，暂不能提交真实解析请求。';

  @override
  String get nativeUploadContractPending =>
      '页面结构已与服务端同步；原生上传、会话与文件授权契约尚未冻结，暂不能选择或提交真实文件。';

  @override
  String get operationFailed => '操作未完成，请稍后重试。';

  @override
  String get legalMediaStatus => '请仅提交你有权处理的公开链接';

  @override
  String get privacyStatus => '请勿提交包含账号或访问凭据的链接';
}
