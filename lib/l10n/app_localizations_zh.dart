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
  String get downloadHistoryDescription => '继续查看、获取或分析已创建的任务。';

  @override
  String get downloadRowActionsHint => '向左轻扫可查看任务操作。';

  @override
  String get screenplayDocumentsDescription => '查看导入状态、解析信息和剧本正文。';

  @override
  String get documentRowActionsHint => '向左轻扫可管理剧本文档。';

  @override
  String get providerStatusDescription => '查看各平台当前是否可用，以及需要的访问方式。';

  @override
  String get loadingData => '正在读取真实数据…';

  @override
  String get loadFailedTitle => '暂时无法读取数据';

  @override
  String get loadFailedDescription => '请检查网络连接后重试。已有数据不会被占位内容替代。';

  @override
  String get retryAction => '重新加载';

  @override
  String get refreshAction => '刷新';

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
  String get downloadHistoryEmptyTitle => '还没有下载记录';

  @override
  String get downloadHistoryEmptyDescription => '从首页解析链接或导入本地视频后，下载任务会显示在这里。';

  @override
  String get createDownloadFromHomeAction => '去首页创建任务';

  @override
  String get downloadStatusQueued => '排队中';

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
  String get documentEmptyTitle => '还没有剧本文档';

  @override
  String get documentEmptyDescription => '从首页上传剧本文档后，可在这里查看解析状态与正文。';

  @override
  String get goToScreenplayUploadAction => '去首页上传剧本';

  @override
  String get documentStatusUploading => '等待上传';

  @override
  String get documentStatusVerifying => '正在解析';

  @override
  String get documentStatusReady => '可以核对';

  @override
  String get documentStatusFailed => '解析失败';

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
  String get accountDescription => '查看当前账户，管理登录状态。';

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
  String get publicHomeEyebrow => 'FrameFetch · Open Source';

  @override
  String get publicHomeTitle => '把素材，\n带回本地。';

  @override
  String get publicHomeDescription =>
      '开源、自托管地完成公开视频解析、本地视频与剧本文档导入、制品管理和 AI 分析。数据与运行边界由你掌控。';

  @override
  String get publicRegisterAction => '创建本地账户';

  @override
  String get publicSourceAction => '查看源代码';

  @override
  String get publicWorkflowTitle => '一套可审计的完整链路';

  @override
  String get publicWorkflowInspectTitle => '解析';

  @override
  String get publicWorkflowInspectDescription => '识别公开媒体或文章中的候选视频';

  @override
  String get publicWorkflowSelectTitle => '选择';

  @override
  String get publicWorkflowSelectDescription => '确认目标与格式，避免隐式下载';

  @override
  String get publicWorkflowExecuteTitle => '执行';

  @override
  String get publicWorkflowExecuteDescription => '由隔离 Worker 处理下载、导入和分析';

  @override
  String get publicWorkflowDeliverTitle => '交付';

  @override
  String get publicWorkflowDeliverDescription => '通过授权短时入口预览或获取制品';

  @override
  String get publicCapabilitiesEyebrow => 'Product capabilities';

  @override
  String get publicHomeCapabilitiesTitle => '从公开媒体到可验证制品';

  @override
  String get publicHomeCapabilitiesDescription =>
      'Web 控制面、API 与 Worker 共享同一套权限、任务和制品模型，适合个人本地使用，也便于团队自托管。';

  @override
  String get publicVideoEyebrow => '01 · MEDIA';

  @override
  String get publicVideoTitle => '公开视频工作流';

  @override
  String get publicVideoDescription => '解析有权处理的公开链接，选择真实可用格式，并跟踪下载与最终制品。';

  @override
  String get publicDocumentEyebrow => '02 · SCREENPLAY';

  @override
  String get publicDocumentTitle => '剧本与文档处理';

  @override
  String get publicDocumentDescription => '导入获授权的剧本文档，在同一工作区完成规范化、分析与处理记录。';

  @override
  String get publicAnalysisEyebrow => '03 · ANALYSIS';

  @override
  String get publicAnalysisTitle => '结构化 AI 视频分析';

  @override
  String get publicAnalysisDescription => '围绕场景、分镜、高光和内容资产生成结构化结果与运行证据。';

  @override
  String get publicTrustEyebrow => 'Built for self-hosting';

  @override
  String get publicTrustTitle => '开源，不交出数据控制权';

  @override
  String get publicTrustDescription =>
      'FastAPI、Next.js、PostgreSQL、RabbitMQ、MinIO、FFmpeg 与 yt-dlp 组成可独立部署的工作流。MIT 许可证允许你免费检查、修改和自托管。';

  @override
  String get publicSafeguardSession => '浏览器会话采用 HttpOnly Cookie；原生客户端使用可轮换令牌。';

  @override
  String get publicSafeguardWorkers => '下载、导入与 AI 分析通过独立队列和 Worker 执行。';

  @override
  String get publicSafeguardArtifacts => '短时制品入口、所有者隔离与授权边界贯穿完整链路。';

  @override
  String get publicSafeguardAuthorization => '公开视频并不等于可自由使用，请仅处理已获授权的内容。';

  @override
  String get publicStartEyebrow => 'Start locally';

  @override
  String get publicStartTitle => '在自己的基础设施上运行 FrameFetch';

  @override
  String get publicStartDescription =>
      '从仓库的 Quick Start、架构文档和安全边界开始，按需启用媒体解析、剧本工作流与 AI 服务。';

  @override
  String get publicDeploymentAction => '阅读部署说明';

  @override
  String get publicExternalLinkError => '暂时无法打开外部链接';

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
  String get linkIntakeSupport => '支持粘贴公开链接或分享文案；文章包含多个视频时，请选择要处理的内容。';

  @override
  String get videoIntakeTitle => '导入本地视频';

  @override
  String get videoIntakeDescription =>
      '选择你拥有或已获授权的 MP4 视频，服务端完成隔离校验后进入下载记录与 AI 分析。';

  @override
  String get selectVideoFile => '选择视频文件';

  @override
  String get screenplayIntakeTitle => '导入剧本文档';

  @override
  String get screenplayIntakeDescription =>
      '选择 DOCX、PDF、TXT、Markdown 或 Fountain 文件，服务端会生成可分析和改写的规范化预览。';

  @override
  String get selectScreenplayFile => '选择剧本文件';

  @override
  String get choosingUploadFile => '正在选择文件…';

  @override
  String get hashingUploadFile => '正在校验文件…';

  @override
  String get creatingUpload => '正在创建上传任务…';

  @override
  String get uploadingFile => '正在上传…';

  @override
  String get completingUpload => '正在完成上传…';

  @override
  String get emptyUploadFileError => '请选择包含内容的文件。';

  @override
  String get invalidVideoFileError => '当前只支持上传 MP4 视频。';

  @override
  String get invalidDocumentFileError =>
      '支持 DOCX、PDF、TXT、Markdown 和 Fountain 剧本。';

  @override
  String get documentTooLargeError => '剧本文档不能超过 50 MB。';

  @override
  String get inaccessibleFileError => '无法读取所选文件，请重新选择。';

  @override
  String get fileUploadFailed => '文件上传失败，请检查网络后重试。';

  @override
  String get mediaUrlHint => '粘贴公开链接或整段分享文案';

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
  String get publicInputRequired => '请输入公开链接或完整分享文案。';

  @override
  String get operationFailed => '操作未完成，请稍后重试。';

  @override
  String get deletionBlockedByAnalysis => '资源正在被分析使用，请先结束相关分析后再删除。';

  @override
  String get inspectionResultTitle => '解析结果';

  @override
  String get formatSelectionTitle => '选择下载格式';

  @override
  String get formatSelectionDescription => '格式来自本次真实解析结果，创建后可在下载记录查看进度。';

  @override
  String get createDownloadAction => '创建下载任务';

  @override
  String get creatingDownload => '正在创建…';

  @override
  String get sourceCandidatesTitle => '选择文章中的视频';

  @override
  String get sourceCandidatesDescription => '该文章包含多个媒体来源，请明确选择要处理的视频。';

  @override
  String get sourceCandidatesEmpty => '文章中没有发现可处理的视频。';

  @override
  String get candidateUnavailable => '当前来源不可处理';

  @override
  String get mediaUnavailableTitle => '当前媒体不可下载';

  @override
  String get mediaUnavailableDescription => '服务端未批准创建下载任务。请根据提示更换公开链接或处理方式。';

  @override
  String get noFormatsAvailable => '解析成功，但没有可创建任务的下载格式。';

  @override
  String imageGalleryFormatDetails(Object count) {
    return '$count 张原图 · ZIP';
  }

  @override
  String videoCollectionFormatDetails(Object count) {
    return '$count 个视频 · ZIP';
  }

  @override
  String get inspectionFailedError => '媒体平台未返回有效解析结果，请确认这是受支持的公开单视频链接。';

  @override
  String get inspectionTimeoutError => '媒体解析超时，请稍后重新提交。';

  @override
  String get providerTemporaryError => '媒体平台当前无法完成验证，请稍后重试。';

  @override
  String get providerSessionError => '该平台当前需要服务端授权会话，暂时无法解析此内容。';

  @override
  String get providerRegionError => '该媒体在当前服务区域不可用。';

  @override
  String get providerRestrictedError => '该媒体为私有或受访问权限限制，无法处理。';

  @override
  String get providerDrmError => '该媒体受 DRM 保护，不属于本服务支持范围。';

  @override
  String get providerLinkError => '分享链接已失效或无法定位视频，请复制新的公开分享链接。';

  @override
  String get providerUnsupportedError => '当前链接不包含受支持的单个公开视频。';

  @override
  String get durationLimitError => '该媒体时长超过服务允许的上限。';

  @override
  String get articleRestrictedError => '文章需要验证、关注或付费，无法安全读取媒体来源。';

  @override
  String get articleDiscoveryError => '无法读取文章中的媒体来源，请确认文章公开且链接有效。';

  @override
  String get legalMediaStatus => '请仅提交你有权处理的公开链接';

  @override
  String get privacyStatus => '请勿提交包含账号或访问凭据的链接';

  @override
  String get mediaCoverPending => '封面生成中';

  @override
  String get mediaCoverUnavailable => '暂无封面';

  @override
  String get mediaCoverLabel => '视频封面';

  @override
  String get watchVideoAction => '观看';

  @override
  String get getFileAction => '获取文件';

  @override
  String get playbackFailed => '暂时无法播放视频，请重新获取播放地址。';

  @override
  String get downloadOpenFailed => '无法打开系统下载，请稍后重试。';

  @override
  String get aiAnalysisTitle => 'AI 智能分析';

  @override
  String get aiAnalysisDescription => '由 AI 观察视频画面，生成连续分镜、视觉高光、资产目录，或将视频整理成文章。';

  @override
  String get analysisSkillLabel => '分析 Skill';

  @override
  String get analysisOutputLanguageLabel => '输出语言';

  @override
  String get simplifiedChineseLabel => '简体中文';

  @override
  String get englishLabel => 'English';

  @override
  String get analysisPromptLabel => '分析重点';

  @override
  String get analysisPromptDescription => '可修改或清空分析重点；工具权限、安全边界与结果结构不可修改。';

  @override
  String get restoreDefaultPrompt => '恢复默认值';

  @override
  String get startAnalysisAction => '开始 AI 分析';

  @override
  String get startingAnalysis => '正在创建分析…';

  @override
  String get analysisSkillsEmpty => '当前没有可用的视频分析 Skill，请检查 AI 服务配置后重试。';

  @override
  String get analysisLoadFailed => '暂时无法读取 AI 分析服务。';

  @override
  String get analysisStatusQueued => '等待分析';

  @override
  String get analysisStatusRunning => '正在分析';

  @override
  String get analysisStatusRetryWait => '等待重试';

  @override
  String get analysisStatusSucceeded => '分析已完成';

  @override
  String get analysisStatusFailed => '分析失败';

  @override
  String get analysisStatusCancelled => '分析已取消';

  @override
  String get analysisStagePreparing => '准备输入';

  @override
  String get analysisStageAnalyzing => '执行 AI 分析';

  @override
  String get analysisStageValidating => '校验结构化结果';

  @override
  String get analysisStagePublishing => '发布分析报告';

  @override
  String get analysisStagePending => '等待调度';

  @override
  String analysisRunSummary(int run, int attempt) {
    return '第 $run 次执行 · 本次第 $attempt 个技术尝试';
  }

  @override
  String analysisProgressSemantics(int progress) {
    return '分析进度 $progress%';
  }

  @override
  String get refreshAnalysisAction => '刷新分析';

  @override
  String get cancelAnalysisAction => '取消分析';

  @override
  String get cancelAnalysisTitle => '取消当前分析任务？';

  @override
  String get cancelAnalysisDescription => '确认后将停止当前分析。你之后仍可重新发起分析任务。';

  @override
  String get continueAnalysisAction => '继续分析';

  @override
  String get confirmCancelAnalysis => '确认取消分析';

  @override
  String get retryAnalysisAction => '重试分析';

  @override
  String get retryingAnalysis => '正在重试…';

  @override
  String get deleteAnalysisAction => '删除分析';

  @override
  String get deletingAnalysis => '正在删除…';

  @override
  String get deleteAnalysisTitle => '删除这次分析？';

  @override
  String get deleteAnalysisDescription => '分析结果与报告将被清理，此操作无法撤销。下载文件不会受到影响。';

  @override
  String get confirmDeleteAnalysis => '确认删除';

  @override
  String get analysisOperationFailed => 'AI 分析操作未完成，请稍后重试。';

  @override
  String get analysisExecutionFailed => 'AI 分析执行失败，请稍后重试。';

  @override
  String get analysisServiceUnavailable => 'AI 分析服务暂时不可用，请检查本机分析服务后重试。';

  @override
  String get analysisAuthenticationRequired => 'AI 分析服务尚未登录，请完成服务登录后重试。';

  @override
  String get analysisTimeoutError => 'AI 分析超时，请稍后重试。';

  @override
  String get analysisInvalidResult => 'AI 返回结果未通过结构与证据校验，请重新分析。';

  @override
  String get analysisResourceLimit => '视频超出当前分析资源限制，请使用更短或更小的视频。';

  @override
  String get analysisInputUnavailable => '用于分析的视频文件已不可用，请重新创建下载任务。';

  @override
  String get analysisUsageLimited => 'AI 服务当前额度不足或受到限流，请稍后重试。';

  @override
  String get analysisWorkerLost => '分析执行服务连接中断，请确认本机服务正常后重试。';

  @override
  String get shotCountLabel => '分镜';

  @override
  String get visualAssetCountLabel => '视觉资产';

  @override
  String get visualSummaryTitle => '视觉摘要';

  @override
  String get productionAdviceTitle => '制作建议';

  @override
  String get analysisResultSectionLabel => '结果分类';

  @override
  String get analysisScenesTab => '场景';

  @override
  String get analysisShotsTab => '分镜';

  @override
  String get analysisHighlightsTab => '高光';

  @override
  String get analysisAssetsTab => '资产';

  @override
  String get analysisReportTab => '报告预览';

  @override
  String get openAnalysisReportAction => '打开报告预览';

  @override
  String get analysisReportLoading => '正在准备报告预览…';

  @override
  String get downloadAnalysisReportAction => '下载 Markdown';

  @override
  String get exportAnalysisReportAction => '导出报告';

  @override
  String get analysisReportDownloaded => '报告已保存到你选择的位置。';

  @override
  String get analysisReportDownloadFailed => '无法保存报告，请稍后重试。';

  @override
  String get analysisReportExportFailed => '无法导出报告，请稍后重试。';

  @override
  String get analysisEmptySection => '当前分类没有识别结果。';

  @override
  String loadMoreAnalysisResults(int count) {
    return '加载更多（剩余 $count 项）';
  }

  @override
  String get highlightScoreLabel => '评分';

  @override
  String get articleKeyPointsTitle => '核心观点';

  @override
  String get articleClosingTitle => '结语';

  @override
  String get articleLimitationsTitle => '事实说明';

  @override
  String get articleEvidenceLabel => '画面证据';

  @override
  String get assetTypePerson => '人物';

  @override
  String get assetTypeLocation => '地点';

  @override
  String get assetTypeObject => '物体';

  @override
  String get assetTypeProduct => '产品';

  @override
  String get assetTypeLogo => '标志';

  @override
  String get assetTypeOnScreenText => '画面文字';

  @override
  String get adminCenterTitle => '管理中心';

  @override
  String get adminCenterDescription => '查看全局运行数据，并处理高频管理事项。';

  @override
  String get adminAnalyticsTitle => '下载分析';

  @override
  String get adminAnalyticsDescription => '按 UTC 自然日查看全局下载量、成功率与来源分布。';

  @override
  String get adminFilesTitle => '文件管理';

  @override
  String get adminFilesDescription => '查看持久文件，并清理超过保留周期的资源。';

  @override
  String get adminUsersTitle => '用户管理';

  @override
  String get adminUsersDescription => '查看用户，并调整角色与账号可用状态。';

  @override
  String get adminProvidersTitle => '平台目录';

  @override
  String get adminProvidersDescription => '查看平台运行状态并控制用户侧可见性。';

  @override
  String get adminAiProvidersTitle => 'AI 服务';

  @override
  String get adminAiProvidersDescription => '查看分析线路配置并切换当前活动线路。';

  @override
  String adminDays(int days) {
    return '$days 天';
  }

  @override
  String get adminSuccessRate => '成功率';

  @override
  String get adminDownloadedBytes => '下载量';

  @override
  String get adminSourceBreakdown => '来源分布';

  @override
  String get adminCleanupTitle => '清理过期文件';

  @override
  String get adminCleanupDescription => '选择保留周期。服务端将清理更早且符合规则的持久资源。';

  @override
  String adminCleanupDays(int days) {
    return '清理 $days 天前的文件';
  }

  @override
  String get adminCleanupAction => '清理文件';

  @override
  String adminCleanupComplete(int count, String size) {
    return '已清理 $count 项资源，释放 $size。';
  }

  @override
  String adminFileCount(int count) {
    return '共 $count 项持久文件';
  }

  @override
  String get adminFilesEmpty => '暂无持久文件';

  @override
  String get adminFilesEmptyDescription => '当前没有需要管理员处理的持久文件。';

  @override
  String adminUserCount(int count) {
    return '共 $count 位用户';
  }

  @override
  String get adminRoleLabel => '角色';

  @override
  String get adminRoleUser => '普通用户';

  @override
  String get adminRoleAdmin => '管理员';

  @override
  String get adminAccountActive => '允许登录和访问服务';

  @override
  String get adminAccountEnabled => '已启用';

  @override
  String get adminAccountDisabled => '已停用';

  @override
  String get adminCurrentUser => '当前账户';

  @override
  String get saveAction => '保存';

  @override
  String get editAction => '编辑';

  @override
  String get adminSystemRegistered => '系统已注册';

  @override
  String get adminSystemMissing => '系统未注册';

  @override
  String get adminAgentAvailable => '本机分析 Agent 可用。';

  @override
  String get adminAgentUnavailable => '本机分析 Agent 当前不可用。';

  @override
  String get adminCredentialReady => '凭据已配置';

  @override
  String get adminCredentialMissing => '凭据未配置';

  @override
  String get adminActiveLine => '当前线路';

  @override
  String get adminActivateAction => '设为当前';

  @override
  String get adminActionFailed => '管理操作未完成，请刷新后重试。';

  @override
  String get cancelDownloadAction => '取消任务';

  @override
  String get retryDownloadAction => '重新下载';

  @override
  String get deleteDownloadAction => '删除任务';

  @override
  String get deleteDownloadTitle => '删除任务与文件？';

  @override
  String get deleteDownloadDescription =>
      '下载记录、视频文件、本地上传源文件和私有封面将永久删除。此操作不可撤销。';

  @override
  String get deleteDownloadActiveDescription =>
      '当前任务会先被取消。下载记录、视频文件、本地上传源文件和私有封面将永久删除。此操作不可撤销。';

  @override
  String get keepDownloadAction => '保留任务';

  @override
  String get deleteDocumentAction => '删除文档';

  @override
  String get deleteDocumentTitle => '删除剧本文档？';

  @override
  String get deleteDocumentDescription =>
      '原始文件、规范化剧本和当前文档记录将永久删除。正在使用该文档的分析需先结束。此操作不可撤销。';

  @override
  String get keepDocumentAction => '保留文档';

  @override
  String get confirmDeleteAction => '确认删除';
}
