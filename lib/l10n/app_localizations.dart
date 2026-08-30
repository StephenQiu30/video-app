import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('zh'),
    Locale('en'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In zh, this message translates to:
  /// **'帧取'**
  String get appTitle;

  /// No description provided for @openNavigation.
  ///
  /// In zh, this message translates to:
  /// **'打开导航菜单'**
  String get openNavigation;

  /// No description provided for @navigationDescription.
  ///
  /// In zh, this message translates to:
  /// **'访问素材导入、下载记录、剧本文档、平台状态与账户设置。'**
  String get navigationDescription;

  /// No description provided for @homeNavigation.
  ///
  /// In zh, this message translates to:
  /// **'首页'**
  String get homeNavigation;

  /// No description provided for @downloadHistoryNavigation.
  ///
  /// In zh, this message translates to:
  /// **'下载记录'**
  String get downloadHistoryNavigation;

  /// No description provided for @historyTab.
  ///
  /// In zh, this message translates to:
  /// **'历史'**
  String get historyTab;

  /// No description provided for @screenplayDocumentsNavigation.
  ///
  /// In zh, this message translates to:
  /// **'剧本文档'**
  String get screenplayDocumentsNavigation;

  /// No description provided for @documentsTab.
  ///
  /// In zh, this message translates to:
  /// **'文档'**
  String get documentsTab;

  /// No description provided for @providerStatusNavigation.
  ///
  /// In zh, this message translates to:
  /// **'平台状态'**
  String get providerStatusNavigation;

  /// No description provided for @statusTab.
  ///
  /// In zh, this message translates to:
  /// **'状态'**
  String get statusTab;

  /// No description provided for @accountNavigation.
  ///
  /// In zh, this message translates to:
  /// **'我的'**
  String get accountNavigation;

  /// No description provided for @downloadHistoryDescription.
  ///
  /// In zh, this message translates to:
  /// **'搜索、筛选并恢复下载任务，查看进度、失败原因、完成后视频预览、文件状态与 AI 分析入口。'**
  String get downloadHistoryDescription;

  /// No description provided for @downloadHistoryPendingTitle.
  ///
  /// In zh, this message translates to:
  /// **'下载记录尚未开放'**
  String get downloadHistoryPendingTitle;

  /// No description provided for @downloadHistoryPendingDescription.
  ///
  /// In zh, this message translates to:
  /// **'任务查询与短期文件授权契约冻结后，这里将展示真实任务、视频预览和分析状态。'**
  String get downloadHistoryPendingDescription;

  /// No description provided for @screenplayDocumentsDescription.
  ///
  /// In zh, this message translates to:
  /// **'查看剧本文档的导入状态、提取规模、规范化预览，以及分析与改写结果。'**
  String get screenplayDocumentsDescription;

  /// No description provided for @screenplayDocumentsPendingTitle.
  ///
  /// In zh, this message translates to:
  /// **'剧本文档尚未开放'**
  String get screenplayDocumentsPendingTitle;

  /// No description provided for @screenplayDocumentsPendingDescription.
  ///
  /// In zh, this message translates to:
  /// **'原生上传、文档查询与文件授权契约冻结后，这里将展示真实剧本文档和处理结果。'**
  String get screenplayDocumentsPendingDescription;

  /// No description provided for @providerStatusDescription.
  ///
  /// In zh, this message translates to:
  /// **'查看平台接入、访问模式、最近状态检查、真实下载证据与完整分析证据，不展示账号、Cookie、出口或探针地址。'**
  String get providerStatusDescription;

  /// No description provided for @providerStatusPendingTitle.
  ///
  /// In zh, this message translates to:
  /// **'平台状态尚未开放'**
  String get providerStatusPendingTitle;

  /// No description provided for @providerStatusPendingDescription.
  ///
  /// In zh, this message translates to:
  /// **'平台能力查询契约冻结后，这里将读取服务端返回的真实平台状态，不显示模拟数据。'**
  String get providerStatusPendingDescription;

  /// No description provided for @accountDescription.
  ///
  /// In zh, this message translates to:
  /// **'管理个人资料、登录状态和应用外观。'**
  String get accountDescription;

  /// No description provided for @appearanceSection.
  ///
  /// In zh, this message translates to:
  /// **'外观'**
  String get appearanceSection;

  /// No description provided for @accountSection.
  ///
  /// In zh, this message translates to:
  /// **'账户'**
  String get accountSection;

  /// No description provided for @darkThemeLabel.
  ///
  /// In zh, this message translates to:
  /// **'深色外观'**
  String get darkThemeLabel;

  /// No description provided for @themeToggleDescription.
  ///
  /// In zh, this message translates to:
  /// **'在深色与浅色主题间切换'**
  String get themeToggleDescription;

  /// No description provided for @loginAction.
  ///
  /// In zh, this message translates to:
  /// **'登录'**
  String get loginAction;

  /// No description provided for @registerAction.
  ///
  /// In zh, this message translates to:
  /// **'注册'**
  String get registerAction;

  /// No description provided for @welcomeBack.
  ///
  /// In zh, this message translates to:
  /// **'欢迎回来'**
  String get welcomeBack;

  /// No description provided for @loginDescription.
  ///
  /// In zh, this message translates to:
  /// **'使用你的帧取账户继续管理下载、文档与分析。'**
  String get loginDescription;

  /// No description provided for @createAccountTitle.
  ///
  /// In zh, this message translates to:
  /// **'创建你的帧取账户'**
  String get createAccountTitle;

  /// No description provided for @registerDescription.
  ///
  /// In zh, this message translates to:
  /// **'注册后可在设备间恢复会话，并安全访问你的任务。'**
  String get registerDescription;

  /// No description provided for @emailLabel.
  ///
  /// In zh, this message translates to:
  /// **'邮箱'**
  String get emailLabel;

  /// No description provided for @usernameLabel.
  ///
  /// In zh, this message translates to:
  /// **'用户名'**
  String get usernameLabel;

  /// No description provided for @passwordLabel.
  ///
  /// In zh, this message translates to:
  /// **'密码'**
  String get passwordLabel;

  /// No description provided for @confirmPasswordLabel.
  ///
  /// In zh, this message translates to:
  /// **'确认密码'**
  String get confirmPasswordLabel;

  /// No description provided for @showPassword.
  ///
  /// In zh, this message translates to:
  /// **'显示密码'**
  String get showPassword;

  /// No description provided for @hidePassword.
  ///
  /// In zh, this message translates to:
  /// **'隐藏密码'**
  String get hidePassword;

  /// No description provided for @loginSubmit.
  ///
  /// In zh, this message translates to:
  /// **'登录'**
  String get loginSubmit;

  /// No description provided for @loginSubmitting.
  ///
  /// In zh, this message translates to:
  /// **'正在登录…'**
  String get loginSubmitting;

  /// No description provided for @registerSubmit.
  ///
  /// In zh, this message translates to:
  /// **'创建账户'**
  String get registerSubmit;

  /// No description provided for @registerSubmitting.
  ///
  /// In zh, this message translates to:
  /// **'正在创建…'**
  String get registerSubmitting;

  /// No description provided for @goRegister.
  ///
  /// In zh, this message translates to:
  /// **'创建账户'**
  String get goRegister;

  /// No description provided for @goLogin.
  ///
  /// In zh, this message translates to:
  /// **'返回登录'**
  String get goLogin;

  /// No description provided for @noAccountPrompt.
  ///
  /// In zh, this message translates to:
  /// **'还没有账户？'**
  String get noAccountPrompt;

  /// No description provided for @hasAccountPrompt.
  ///
  /// In zh, this message translates to:
  /// **'已经有账户？'**
  String get hasAccountPrompt;

  /// No description provided for @invalidEmail.
  ///
  /// In zh, this message translates to:
  /// **'请输入有效的邮箱地址。'**
  String get invalidEmail;

  /// No description provided for @invalidUsername.
  ///
  /// In zh, this message translates to:
  /// **'用户名需要 2–32 个字符。'**
  String get invalidUsername;

  /// No description provided for @invalidPassword.
  ///
  /// In zh, this message translates to:
  /// **'密码至少需要 8 个字符。'**
  String get invalidPassword;

  /// No description provided for @passwordMismatch.
  ///
  /// In zh, this message translates to:
  /// **'两次输入的密码不一致。'**
  String get passwordMismatch;

  /// No description provided for @invalidCredentialsError.
  ///
  /// In zh, this message translates to:
  /// **'邮箱或密码不正确。'**
  String get invalidCredentialsError;

  /// No description provided for @emailRegisteredError.
  ///
  /// In zh, this message translates to:
  /// **'这个邮箱已经注册，请直接登录。'**
  String get emailRegisteredError;

  /// No description provided for @usernameRegisteredError.
  ///
  /// In zh, this message translates to:
  /// **'这个用户名已经被使用。'**
  String get usernameRegisteredError;

  /// No description provided for @unauthenticatedError.
  ///
  /// In zh, this message translates to:
  /// **'登录状态已失效，请重新登录。'**
  String get unauthenticatedError;

  /// No description provided for @rateLimitedError.
  ///
  /// In zh, this message translates to:
  /// **'操作过于频繁，请稍后再试。'**
  String get rateLimitedError;

  /// No description provided for @serviceUnavailableError.
  ///
  /// In zh, this message translates to:
  /// **'暂时无法连接服务，请检查网络后重试。'**
  String get serviceUnavailableError;

  /// No description provided for @unknownAuthError.
  ///
  /// In zh, this message translates to:
  /// **'操作未完成，请稍后重试。'**
  String get unknownAuthError;

  /// No description provided for @sessionRestoring.
  ///
  /// In zh, this message translates to:
  /// **'正在恢复登录状态…'**
  String get sessionRestoring;

  /// No description provided for @signedOutTitle.
  ///
  /// In zh, this message translates to:
  /// **'登录后继续'**
  String get signedOutTitle;

  /// No description provided for @signedOutDescription.
  ///
  /// In zh, this message translates to:
  /// **'登录或注册后可查看账户资料，并访问与身份关联的任务。'**
  String get signedOutDescription;

  /// No description provided for @signedInAs.
  ///
  /// In zh, this message translates to:
  /// **'当前账户'**
  String get signedInAs;

  /// No description provided for @logoutAction.
  ///
  /// In zh, this message translates to:
  /// **'退出登录'**
  String get logoutAction;

  /// No description provided for @loggingOut.
  ///
  /// In zh, this message translates to:
  /// **'正在退出…'**
  String get loggingOut;

  /// No description provided for @downloadHomeTitle.
  ///
  /// In zh, this message translates to:
  /// **'把素材，\n带回本地。'**
  String get downloadHomeTitle;

  /// No description provided for @downloadHomeDescription.
  ///
  /// In zh, this message translates to:
  /// **'解析公开视频链接，或导入你有权处理的本地视频与剧本文档。'**
  String get downloadHomeDescription;

  /// No description provided for @linkIntakeMode.
  ///
  /// In zh, this message translates to:
  /// **'链接解析'**
  String get linkIntakeMode;

  /// No description provided for @videoIntakeMode.
  ///
  /// In zh, this message translates to:
  /// **'本地视频'**
  String get videoIntakeMode;

  /// No description provided for @screenplayIntakeMode.
  ///
  /// In zh, this message translates to:
  /// **'剧本文档'**
  String get screenplayIntakeMode;

  /// No description provided for @linkIntakeSupport.
  ///
  /// In zh, this message translates to:
  /// **'支持公开视频、微信视频号单作品和微信公众号文章链接；文章发现多个视频后必须明确选择。'**
  String get linkIntakeSupport;

  /// No description provided for @videoIntakeTitle.
  ///
  /// In zh, this message translates to:
  /// **'导入本地视频'**
  String get videoIntakeTitle;

  /// No description provided for @videoIntakeDescription.
  ///
  /// In zh, this message translates to:
  /// **'选择你拥有或已获授权的明文视频文件，服务端完成隔离校验后进入下载记录与 AI 分析。'**
  String get videoIntakeDescription;

  /// No description provided for @selectVideoFile.
  ///
  /// In zh, this message translates to:
  /// **'选择视频文件'**
  String get selectVideoFile;

  /// No description provided for @screenplayIntakeTitle.
  ///
  /// In zh, this message translates to:
  /// **'导入剧本文档'**
  String get screenplayIntakeTitle;

  /// No description provided for @screenplayIntakeDescription.
  ///
  /// In zh, this message translates to:
  /// **'选择 TXT、DOCX 或 PDF 剧本，服务端将提取规范化预览并支持分析与改写。'**
  String get screenplayIntakeDescription;

  /// No description provided for @selectScreenplayFile.
  ///
  /// In zh, this message translates to:
  /// **'选择剧本文件'**
  String get selectScreenplayFile;

  /// No description provided for @mediaUrlHint.
  ///
  /// In zh, this message translates to:
  /// **'粘贴公开的视频或文章链接'**
  String get mediaUrlHint;

  /// No description provided for @mediaUrlLabel.
  ///
  /// In zh, this message translates to:
  /// **'公开内容地址'**
  String get mediaUrlLabel;

  /// No description provided for @clearMediaUrl.
  ///
  /// In zh, this message translates to:
  /// **'清空链接'**
  String get clearMediaUrl;

  /// No description provided for @inspectMedia.
  ///
  /// In zh, this message translates to:
  /// **'解析媒体'**
  String get inspectMedia;

  /// No description provided for @inspectingMedia.
  ///
  /// In zh, this message translates to:
  /// **'解析中…'**
  String get inspectingMedia;

  /// No description provided for @mediaUrlError.
  ///
  /// In zh, this message translates to:
  /// **'请输入有效的公开 HTTP(S) 视频地址。'**
  String get mediaUrlError;

  /// No description provided for @nativeContractPending.
  ///
  /// In zh, this message translates to:
  /// **'页面表现层与原生登录已经就绪；媒体检查与下载契约尚未冻结，暂不能提交真实解析请求。'**
  String get nativeContractPending;

  /// No description provided for @nativeUploadContractPending.
  ///
  /// In zh, this message translates to:
  /// **'页面结构与原生登录已经就绪；上传与文件授权契约尚未冻结，暂不能选择或提交真实文件。'**
  String get nativeUploadContractPending;

  /// No description provided for @operationFailed.
  ///
  /// In zh, this message translates to:
  /// **'操作未完成，请稍后重试。'**
  String get operationFailed;

  /// No description provided for @legalMediaStatus.
  ///
  /// In zh, this message translates to:
  /// **'请仅提交你有权处理的公开链接'**
  String get legalMediaStatus;

  /// No description provided for @privacyStatus.
  ///
  /// In zh, this message translates to:
  /// **'请勿提交包含账号或访问凭据的链接'**
  String get privacyStatus;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
