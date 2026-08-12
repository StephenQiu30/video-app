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
  String get foundationEyebrow => '移动客户端 / 技术基座';

  @override
  String get foundationTitle => '把视频，\n带回本地。';

  @override
  String get foundationDescription =>
      '面向 iOS 与 Android 的 Flutter 工程骨架已建立。当前只固化技术选型与视觉基线，尚未进入业务实现。';

  @override
  String get platformLabel => '目标平台';

  @override
  String get platformValue => 'Android API 24+ / iOS 13+';

  @override
  String get technologySelectionLabel => '选型范围';

  @override
  String get technologySelectionValue => '架构、路由、状态、网络、契约与安全存储';

  @override
  String get contractBoundaryLabel => '实现状态';

  @override
  String get contractBoundaryValue => '业务页面、原生会话与服务 API 尚未实现';

  @override
  String get foundationFootnote =>
      '该页面仅用于验证 Flutter 工程、路由、本地化和来自 Web 端的视觉 token，不代表任何业务能力已完成。';
}
