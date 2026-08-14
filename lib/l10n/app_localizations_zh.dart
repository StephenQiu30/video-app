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
  String get navigationDescription => '访问视频解析、下载任务与应用外观。';

  @override
  String get videoInspectionNavigation => '视频解析';

  @override
  String get downloadHistoryNavigation => '下载记录';

  @override
  String get providerStatusNavigation => '平台状态';

  @override
  String get accountNavigation => '我的';

  @override
  String get downloadHistoryDescription => '搜索、筛选并恢复当前账户的下载任务，查看进度、失败原因与文件状态。';

  @override
  String get downloadHistoryPendingTitle => '下载记录尚未开放';

  @override
  String get downloadHistoryPendingDescription =>
      '原生认证与下载查询契约冻结后，这里将展示当前账户的真实任务与恢复状态。';

  @override
  String get providerStatusDescription =>
      '查看服务端公开的能力、访问模式与最近验证状态，不展示账号、Cookie 或探针信息。';

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
  String get downloadHomeTitle => '把视频，\n带回本地。';

  @override
  String get downloadHomeDescription =>
      '粘贴你有权处理的公开视频链接，读取媒体信息，选择画质并创建可追踪的下载任务。';

  @override
  String get mediaUrlHint => '粘贴公开的视频链接';

  @override
  String get mediaUrlLabel => '公开视频地址';

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
  String get operationFailed => '操作未完成，请稍后重试。';

  @override
  String get legalMediaStatus => '请仅提交你有权处理的公开链接';

  @override
  String get privacyStatus => '请勿提交包含账号或访问凭据的链接';
}
