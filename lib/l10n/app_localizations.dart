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
  /// **'查看当前账户的下载任务、处理进度、失败原因与文件状态。'**
  String get downloadHistoryDescription;

  /// No description provided for @screenplayDocumentsDescription.
  ///
  /// In zh, this message translates to:
  /// **'查看剧本文档的导入状态、提取规模、规范化预览，以及分析与改写结果。'**
  String get screenplayDocumentsDescription;

  /// No description provided for @providerStatusDescription.
  ///
  /// In zh, this message translates to:
  /// **'查看平台接入、访问模式、最近状态检查、真实下载证据与完整分析证据，不展示账号、Cookie、出口或探针地址。'**
  String get providerStatusDescription;

  /// No description provided for @loadingData.
  ///
  /// In zh, this message translates to:
  /// **'正在读取真实数据…'**
  String get loadingData;

  /// No description provided for @loadFailedTitle.
  ///
  /// In zh, this message translates to:
  /// **'暂时无法读取数据'**
  String get loadFailedTitle;

  /// No description provided for @loadFailedDescription.
  ///
  /// In zh, this message translates to:
  /// **'请检查网络连接后重试。已有数据不会被占位内容替代。'**
  String get loadFailedDescription;

  /// No description provided for @retryAction.
  ///
  /// In zh, this message translates to:
  /// **'重新加载'**
  String get retryAction;

  /// No description provided for @refreshAction.
  ///
  /// In zh, this message translates to:
  /// **'刷新数据'**
  String get refreshAction;

  /// No description provided for @totalLabel.
  ///
  /// In zh, this message translates to:
  /// **'全部'**
  String get totalLabel;

  /// No description provided for @availableLabel.
  ///
  /// In zh, this message translates to:
  /// **'可用'**
  String get availableLabel;

  /// No description provided for @succeededLabel.
  ///
  /// In zh, this message translates to:
  /// **'已完成'**
  String get succeededLabel;

  /// No description provided for @activeLabel.
  ///
  /// In zh, this message translates to:
  /// **'进行中'**
  String get activeLabel;

  /// No description provided for @failedLabel.
  ///
  /// In zh, this message translates to:
  /// **'失败'**
  String get failedLabel;

  /// No description provided for @yesLabel.
  ///
  /// In zh, this message translates to:
  /// **'是'**
  String get yesLabel;

  /// No description provided for @noLabel.
  ///
  /// In zh, this message translates to:
  /// **'否'**
  String get noLabel;

  /// No description provided for @downloadHistoryEmptyTitle.
  ///
  /// In zh, this message translates to:
  /// **'暂无下载记录'**
  String get downloadHistoryEmptyTitle;

  /// No description provided for @downloadHistoryEmptyDescription.
  ///
  /// In zh, this message translates to:
  /// **'你创建或导入的任务会显示在这里。当前结果来自你的真实账户。'**
  String get downloadHistoryEmptyDescription;

  /// No description provided for @downloadStatusQueued.
  ///
  /// In zh, this message translates to:
  /// **'等待中'**
  String get downloadStatusQueued;

  /// No description provided for @downloadStatusRunning.
  ///
  /// In zh, this message translates to:
  /// **'下载中'**
  String get downloadStatusRunning;

  /// No description provided for @downloadStatusRetryWait.
  ///
  /// In zh, this message translates to:
  /// **'等待重试'**
  String get downloadStatusRetryWait;

  /// No description provided for @downloadStatusSucceeded.
  ///
  /// In zh, this message translates to:
  /// **'已完成'**
  String get downloadStatusSucceeded;

  /// No description provided for @downloadStatusFailed.
  ///
  /// In zh, this message translates to:
  /// **'失败'**
  String get downloadStatusFailed;

  /// No description provided for @downloadStatusCancelled.
  ///
  /// In zh, this message translates to:
  /// **'已取消'**
  String get downloadStatusCancelled;

  /// No description provided for @downloadStatusUnknown.
  ///
  /// In zh, this message translates to:
  /// **'状态未知'**
  String get downloadStatusUnknown;

  /// No description provided for @progressLabel.
  ///
  /// In zh, this message translates to:
  /// **'进度'**
  String get progressLabel;

  /// No description provided for @updatedAtLabel.
  ///
  /// In zh, this message translates to:
  /// **'更新于'**
  String get updatedAtLabel;

  /// No description provided for @showingFirstPage.
  ///
  /// In zh, this message translates to:
  /// **'当前显示最近 20 条'**
  String get showingFirstPage;

  /// No description provided for @failureCancelled.
  ///
  /// In zh, this message translates to:
  /// **'任务已取消'**
  String get failureCancelled;

  /// No description provided for @failureTimeout.
  ///
  /// In zh, this message translates to:
  /// **'处理超时'**
  String get failureTimeout;

  /// No description provided for @failureProviderAccess.
  ///
  /// In zh, this message translates to:
  /// **'平台需要授权或限制访问'**
  String get failureProviderAccess;

  /// No description provided for @failureProviderTemporary.
  ///
  /// In zh, this message translates to:
  /// **'平台暂时不可用'**
  String get failureProviderTemporary;

  /// No description provided for @failureStorage.
  ///
  /// In zh, this message translates to:
  /// **'存储暂时不可用'**
  String get failureStorage;

  /// No description provided for @failureGeneric.
  ///
  /// In zh, this message translates to:
  /// **'处理未完成'**
  String get failureGeneric;

  /// No description provided for @documentEmptyTitle.
  ///
  /// In zh, this message translates to:
  /// **'暂无剧本文档'**
  String get documentEmptyTitle;

  /// No description provided for @documentEmptyDescription.
  ///
  /// In zh, this message translates to:
  /// **'你导入的剧本文档会显示在这里。当前结果来自你的真实账户。'**
  String get documentEmptyDescription;

  /// No description provided for @documentStatusUploading.
  ///
  /// In zh, this message translates to:
  /// **'上传中'**
  String get documentStatusUploading;

  /// No description provided for @documentStatusVerifying.
  ///
  /// In zh, this message translates to:
  /// **'校验中'**
  String get documentStatusVerifying;

  /// No description provided for @documentStatusReady.
  ///
  /// In zh, this message translates to:
  /// **'可用'**
  String get documentStatusReady;

  /// No description provided for @documentStatusFailed.
  ///
  /// In zh, this message translates to:
  /// **'失败'**
  String get documentStatusFailed;

  /// No description provided for @documentStatusCancelled.
  ///
  /// In zh, this message translates to:
  /// **'已取消'**
  String get documentStatusCancelled;

  /// No description provided for @documentStatusExpired.
  ///
  /// In zh, this message translates to:
  /// **'已过期'**
  String get documentStatusExpired;

  /// No description provided for @documentStatusUnknown.
  ///
  /// In zh, this message translates to:
  /// **'状态未知'**
  String get documentStatusUnknown;

  /// No description provided for @fileSizeLabel.
  ///
  /// In zh, this message translates to:
  /// **'文件大小'**
  String get fileSizeLabel;

  /// No description provided for @sceneCountLabel.
  ///
  /// In zh, this message translates to:
  /// **'场景'**
  String get sceneCountLabel;

  /// No description provided for @characterCountLabel.
  ///
  /// In zh, this message translates to:
  /// **'角色'**
  String get characterCountLabel;

  /// No description provided for @languageLabel.
  ///
  /// In zh, this message translates to:
  /// **'语言'**
  String get languageLabel;

  /// No description provided for @providerEmptyTitle.
  ///
  /// In zh, this message translates to:
  /// **'暂无平台状态'**
  String get providerEmptyTitle;

  /// No description provided for @providerEmptyDescription.
  ///
  /// In zh, this message translates to:
  /// **'服务端当前没有公开的平台能力记录，请稍后刷新。'**
  String get providerEmptyDescription;

  /// No description provided for @downloadAvailableLabel.
  ///
  /// In zh, this message translates to:
  /// **'下载可用'**
  String get downloadAvailableLabel;

  /// No description provided for @capabilitiesLabel.
  ///
  /// In zh, this message translates to:
  /// **'能力'**
  String get capabilitiesLabel;

  /// No description provided for @accessModesLabel.
  ///
  /// In zh, this message translates to:
  /// **'访问方式'**
  String get accessModesLabel;

  /// No description provided for @lastVerifiedLabel.
  ///
  /// In zh, this message translates to:
  /// **'最近验证'**
  String get lastVerifiedLabel;

  /// No description provided for @userActionLabel.
  ///
  /// In zh, this message translates to:
  /// **'建议操作'**
  String get userActionLabel;

  /// No description provided for @providerStatusUnknown.
  ///
  /// In zh, this message translates to:
  /// **'待验证'**
  String get providerStatusUnknown;

  /// No description provided for @providerStatusVerified.
  ///
  /// In zh, this message translates to:
  /// **'已验证'**
  String get providerStatusVerified;

  /// No description provided for @providerStatusDegraded.
  ///
  /// In zh, this message translates to:
  /// **'能力受限'**
  String get providerStatusDegraded;

  /// No description provided for @providerStatusAccessRequired.
  ///
  /// In zh, this message translates to:
  /// **'需要访问授权'**
  String get providerStatusAccessRequired;

  /// No description provided for @providerStatusRateLimited.
  ///
  /// In zh, this message translates to:
  /// **'受到限流'**
  String get providerStatusRateLimited;

  /// No description provided for @providerStatusBlocked.
  ///
  /// In zh, this message translates to:
  /// **'当前受阻'**
  String get providerStatusBlocked;

  /// No description provided for @providerStatusDisabled.
  ///
  /// In zh, this message translates to:
  /// **'已停用'**
  String get providerStatusDisabled;

  /// No description provided for @providerStatusUnsupported.
  ///
  /// In zh, this message translates to:
  /// **'不支持'**
  String get providerStatusUnsupported;

  /// No description provided for @capabilitySingleVideo.
  ///
  /// In zh, this message translates to:
  /// **'单视频'**
  String get capabilitySingleVideo;

  /// No description provided for @capabilityShortVideo.
  ///
  /// In zh, this message translates to:
  /// **'短视频'**
  String get capabilityShortVideo;

  /// No description provided for @capabilityClipOrVod.
  ///
  /// In zh, this message translates to:
  /// **'片段或点播'**
  String get capabilityClipOrVod;

  /// No description provided for @capabilityAudioVideoSplit.
  ///
  /// In zh, this message translates to:
  /// **'音视频分离'**
  String get capabilityAudioVideoSplit;

  /// No description provided for @capabilitySubtitles.
  ///
  /// In zh, this message translates to:
  /// **'字幕'**
  String get capabilitySubtitles;

  /// No description provided for @capabilityImageOrCarousel.
  ///
  /// In zh, this message translates to:
  /// **'图片或图集'**
  String get capabilityImageOrCarousel;

  /// No description provided for @capabilityLive.
  ///
  /// In zh, this message translates to:
  /// **'直播'**
  String get capabilityLive;

  /// No description provided for @capabilityPlaylist.
  ///
  /// In zh, this message translates to:
  /// **'播放列表'**
  String get capabilityPlaylist;

  /// No description provided for @accessModeAnonymous.
  ///
  /// In zh, this message translates to:
  /// **'匿名访问'**
  String get accessModeAnonymous;

  /// No description provided for @accessModeOperatorManaged.
  ///
  /// In zh, this message translates to:
  /// **'服务端托管'**
  String get accessModeOperatorManaged;

  /// No description provided for @notYetVerified.
  ///
  /// In zh, this message translates to:
  /// **'尚未验证'**
  String get notYetVerified;

  /// No description provided for @accountDescription.
  ///
  /// In zh, this message translates to:
  /// **'管理个人资料与登录状态。'**
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

  /// No description provided for @switchToDarkTheme.
  ///
  /// In zh, this message translates to:
  /// **'切换到深色主题'**
  String get switchToDarkTheme;

  /// No description provided for @switchToLightTheme.
  ///
  /// In zh, this message translates to:
  /// **'切换到浅色主题'**
  String get switchToLightTheme;

  /// No description provided for @downloadDetailNavigation.
  ///
  /// In zh, this message translates to:
  /// **'任务详情'**
  String get downloadDetailNavigation;

  /// No description provided for @downloadDetailDescription.
  ///
  /// In zh, this message translates to:
  /// **'查看任务当前执行状态、文件可用性与处理信息。'**
  String get downloadDetailDescription;

  /// No description provided for @sourceLabel.
  ///
  /// In zh, this message translates to:
  /// **'来源'**
  String get sourceLabel;

  /// No description provided for @formatLabel.
  ///
  /// In zh, this message translates to:
  /// **'格式'**
  String get formatLabel;

  /// No description provided for @stageLabel.
  ///
  /// In zh, this message translates to:
  /// **'执行阶段'**
  String get stageLabel;

  /// No description provided for @attemptLabel.
  ///
  /// In zh, this message translates to:
  /// **'执行次数'**
  String get attemptLabel;

  /// No description provided for @fileAvailabilityLabel.
  ///
  /// In zh, this message translates to:
  /// **'文件状态'**
  String get fileAvailabilityLabel;

  /// No description provided for @createdAtLabel.
  ///
  /// In zh, this message translates to:
  /// **'创建时间'**
  String get createdAtLabel;

  /// No description provided for @finishedAtLabel.
  ///
  /// In zh, this message translates to:
  /// **'完成时间'**
  String get finishedAtLabel;

  /// No description provided for @durationLabel.
  ///
  /// In zh, this message translates to:
  /// **'媒体时长'**
  String get durationLabel;

  /// No description provided for @fileAvailable.
  ///
  /// In zh, this message translates to:
  /// **'文件可获取'**
  String get fileAvailable;

  /// No description provided for @fileCleared.
  ///
  /// In zh, this message translates to:
  /// **'文件已清理'**
  String get fileCleared;

  /// No description provided for @downloadStageRevalidating.
  ///
  /// In zh, this message translates to:
  /// **'重新校验'**
  String get downloadStageRevalidating;

  /// No description provided for @downloadStageDownloading.
  ///
  /// In zh, this message translates to:
  /// **'正在下载'**
  String get downloadStageDownloading;

  /// No description provided for @downloadStageRemuxing.
  ///
  /// In zh, this message translates to:
  /// **'封装处理中'**
  String get downloadStageRemuxing;

  /// No description provided for @downloadStageVerifying.
  ///
  /// In zh, this message translates to:
  /// **'正在验证'**
  String get downloadStageVerifying;

  /// No description provided for @downloadStageUploading.
  ///
  /// In zh, this message translates to:
  /// **'正在保存'**
  String get downloadStageUploading;

  /// No description provided for @downloadStageUnknown.
  ///
  /// In zh, this message translates to:
  /// **'阶段未知'**
  String get downloadStageUnknown;

  /// No description provided for @formatUnavailable.
  ///
  /// In zh, this message translates to:
  /// **'格式信息暂不可用'**
  String get formatUnavailable;

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
