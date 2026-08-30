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
  String get openNavigation => '打开导航菜单';

  @override
  String get navigationDescription => '访问素材导入、下载记录、剧本文档、平台状态与账户设置。';

  @override
  String get homeNavigation => '首页';

  @override
  String get downloadHistoryNavigation => '下载记录';

  @override
  String get historyTab => '历史';

  @override
  String get screenplayDocumentsNavigation => '剧本文档';

  @override
  String get documentsTab => '文档';

  @override
  String get providerStatusNavigation => '平台状态';

  @override
  String get statusTab => '状态';

  @override
  String get accountNavigation => '我的';

  @override
  String get downloadHistoryDescription => '查看当前账户的下载任务、处理进度、失败原因与文件状态。';

  @override
  String get screenplayDocumentsDescription =>
      '查看剧本文档的导入状态、提取规模、规范化预览，以及分析与改写结果。';

  @override
  String get providerStatusDescription =>
      '查看平台接入、访问模式、最近状态检查、真实下载证据与完整分析证据，不展示账号、Cookie、出口或探针地址。';

  @override
  String get loadingData => '正在读取真实数据…';

  @override
  String get loadFailedTitle => '暂时无法读取数据';

  @override
  String get loadFailedDescription => '请检查网络连接后重试。已有数据不会被占位内容替代。';

  @override
  String get retryAction => '重新加载';

  @override
  String get refreshAction => '刷新数据';

  @override
  String get totalLabel => '全部';

  @override
  String get availableLabel => '可用';

  @override
  String get succeededLabel => '已完成';

  @override
  String get activeLabel => '进行中';

  @override
  String get failedLabel => '失败';

  @override
  String get yesLabel => '是';

  @override
  String get noLabel => '否';

  @override
  String get downloadHistoryEmptyTitle => '暂无下载记录';

  @override
  String get downloadHistoryEmptyDescription => '你创建或导入的任务会显示在这里。当前结果来自你的真实账户。';

  @override
  String get downloadStatusQueued => '等待中';

  @override
  String get downloadStatusRunning => '下载中';

  @override
  String get downloadStatusRetryWait => '等待重试';

  @override
  String get downloadStatusSucceeded => '已完成';

  @override
  String get downloadStatusFailed => '失败';

  @override
  String get downloadStatusCancelled => '已取消';

  @override
  String get downloadStatusUnknown => '状态未知';

  @override
  String get progressLabel => '进度';

  @override
  String get updatedAtLabel => '更新于';

  @override
  String get showingFirstPage => '当前显示最近 20 条';

  @override
  String get failureCancelled => '任务已取消';

  @override
  String get failureTimeout => '处理超时';

  @override
  String get failureProviderAccess => '平台需要授权或限制访问';

  @override
  String get failureProviderTemporary => '平台暂时不可用';

  @override
  String get failureStorage => '存储暂时不可用';

  @override
  String get failureGeneric => '处理未完成';

  @override
  String get documentEmptyTitle => '暂无剧本文档';

  @override
  String get documentEmptyDescription => '你导入的剧本文档会显示在这里。当前结果来自你的真实账户。';

  @override
  String get documentStatusUploading => '上传中';

  @override
  String get documentStatusVerifying => '校验中';

  @override
  String get documentStatusReady => '可用';

  @override
  String get documentStatusFailed => '失败';

  @override
  String get documentStatusCancelled => '已取消';

  @override
  String get documentStatusExpired => '已过期';

  @override
  String get documentStatusUnknown => '状态未知';

  @override
  String get fileSizeLabel => '文件大小';

  @override
  String get sceneCountLabel => '场景';

  @override
  String get characterCountLabel => '角色';

  @override
  String get languageLabel => '语言';

  @override
  String get providerEmptyTitle => '暂无平台状态';

  @override
  String get providerEmptyDescription => '服务端当前没有公开的平台能力记录，请稍后刷新。';

  @override
  String get downloadAvailableLabel => '下载可用';

  @override
  String get capabilitiesLabel => '能力';

  @override
  String get accessModesLabel => '访问方式';

  @override
  String get lastVerifiedLabel => '最近验证';

  @override
  String get userActionLabel => '建议操作';

  @override
  String get providerStatusUnknown => '待验证';

  @override
  String get providerStatusVerified => '已验证';

  @override
  String get providerStatusDegraded => '能力受限';

  @override
  String get providerStatusAccessRequired => '需要访问授权';

  @override
  String get providerStatusRateLimited => '受到限流';

  @override
  String get providerStatusBlocked => '当前受阻';

  @override
  String get providerStatusDisabled => '已停用';

  @override
  String get providerStatusUnsupported => '不支持';

  @override
  String get capabilitySingleVideo => '单视频';

  @override
  String get capabilityShortVideo => '短视频';

  @override
  String get capabilityClipOrVod => '片段或点播';

  @override
  String get capabilityAudioVideoSplit => '音视频分离';

  @override
  String get capabilitySubtitles => '字幕';

  @override
  String get capabilityImageOrCarousel => '图片或图集';

  @override
  String get capabilityLive => '直播';

  @override
  String get capabilityPlaylist => '播放列表';

  @override
  String get accessModeAnonymous => '匿名访问';

  @override
  String get accessModeOperatorManaged => '服务端托管';

  @override
  String get notYetVerified => '尚未验证';

  @override
  String get accountDescription => '管理个人资料与登录状态。';

  @override
  String get appearanceSection => '外观';

  @override
  String get accountSection => '账户';

  @override
  String get darkThemeLabel => '深色外观';

  @override
  String get themeToggleDescription => '在深色与浅色主题间切换';

  @override
  String get switchToDarkTheme => '切换到深色主题';

  @override
  String get switchToLightTheme => '切换到浅色主题';

  @override
  String get downloadDetailNavigation => '任务详情';

  @override
  String get downloadDetailDescription => '查看任务当前执行状态、文件可用性与处理信息。';

  @override
  String get sourceLabel => '来源';

  @override
  String get formatLabel => '格式';

  @override
  String get stageLabel => '执行阶段';

  @override
  String get attemptLabel => '执行次数';

  @override
  String get fileAvailabilityLabel => '文件状态';

  @override
  String get createdAtLabel => '创建时间';

  @override
  String get finishedAtLabel => '完成时间';

  @override
  String get durationLabel => '媒体时长';

  @override
  String get fileAvailable => '文件可获取';

  @override
  String get fileCleared => '文件已清理';

  @override
  String get downloadStageRevalidating => '重新校验';

  @override
  String get downloadStageDownloading => '正在下载';

  @override
  String get downloadStageRemuxing => '封装处理中';

  @override
  String get downloadStageVerifying => '正在验证';

  @override
  String get downloadStageUploading => '正在保存';

  @override
  String get downloadStageUnknown => '阶段未知';

  @override
  String get formatUnavailable => '格式信息暂不可用';

  @override
  String get loginAction => '登录';

  @override
  String get registerAction => '注册';

  @override
  String get welcomeBack => '欢迎回来';

  @override
  String get loginDescription => '使用你的帧取账户继续管理下载、文档与分析。';

  @override
  String get createAccountTitle => '创建你的帧取账户';

  @override
  String get registerDescription => '注册后可在设备间恢复会话，并安全访问你的任务。';

  @override
  String get emailLabel => '邮箱';

  @override
  String get usernameLabel => '用户名';

  @override
  String get passwordLabel => '密码';

  @override
  String get confirmPasswordLabel => '确认密码';

  @override
  String get showPassword => '显示密码';

  @override
  String get hidePassword => '隐藏密码';

  @override
  String get loginSubmit => '登录';

  @override
  String get loginSubmitting => '正在登录…';

  @override
  String get registerSubmit => '创建账户';

  @override
  String get registerSubmitting => '正在创建…';

  @override
  String get goRegister => '创建账户';

  @override
  String get goLogin => '返回登录';

  @override
  String get noAccountPrompt => '还没有账户？';

  @override
  String get hasAccountPrompt => '已经有账户？';

  @override
  String get invalidEmail => '请输入有效的邮箱地址。';

  @override
  String get invalidUsername => '用户名需要 2–32 个字符。';

  @override
  String get invalidPassword => '密码至少需要 8 个字符。';

  @override
  String get passwordMismatch => '两次输入的密码不一致。';

  @override
  String get invalidCredentialsError => '邮箱或密码不正确。';

  @override
  String get emailRegisteredError => '这个邮箱已经注册，请直接登录。';

  @override
  String get usernameRegisteredError => '这个用户名已经被使用。';

  @override
  String get unauthenticatedError => '登录状态已失效，请重新登录。';

  @override
  String get rateLimitedError => '操作过于频繁，请稍后再试。';

  @override
  String get serviceUnavailableError => '暂时无法连接服务，请检查网络后重试。';

  @override
  String get unknownAuthError => '操作未完成，请稍后重试。';

  @override
  String get sessionRestoring => '正在恢复登录状态…';

  @override
  String get signedOutTitle => '登录后继续';

  @override
  String get signedOutDescription => '登录或注册后可查看账户资料，并访问与身份关联的任务。';

  @override
  String get signedInAs => '当前账户';

  @override
  String get logoutAction => '退出登录';

  @override
  String get loggingOut => '正在退出…';

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
  String get nativeContractPending =>
      '页面表现层与原生登录已经就绪；媒体检查与下载契约尚未冻结，暂不能提交真实解析请求。';

  @override
  String get nativeUploadContractPending =>
      '页面结构与原生登录已经就绪；上传与文件授权契约尚未冻结，暂不能选择或提交真实文件。';

  @override
  String get operationFailed => '操作未完成，请稍后重试。';

  @override
  String get legalMediaStatus => '请仅提交你有权处理的公开链接';

  @override
  String get privacyStatus => '请勿提交包含账号或访问凭据的链接';
}
