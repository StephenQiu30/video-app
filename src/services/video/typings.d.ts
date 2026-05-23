declare namespace API {
  type AdminMetricsResponse = {
    /** Active Tasks */
    active_tasks: number;
    /** Total Users */
    total_users: number;
    /** Total Storage Bytes */
    total_storage_bytes: number;
    /** Queue Depth */
    queue_depth: number;
  };

  type cancelDownloadTaskApiTasksTaskIdCancelPostParams = {
    task_id: string;
  };

  type DownloadLinkResponse = {
    /** Url */
    url: string;
    /** Expires In Seconds */
    expires_in_seconds: number;
  };

  type exportTaskPdfApiTasksTaskIdPdfGetParams = {
    task_id: string;
  };

  type getDownloadLinkApiTasksTaskIdDownloadLinkGetParams = {
    task_id: string;
  };

  type getTaskApiTasksTaskIdGetParams = {
    task_id: string;
  };

  type getTaskEventsApiTasksTaskIdEventsGetParams = {
    task_id: string;
  };

  type getUserApiAdminUsersUserIdGetParams = {
    user_id: number;
  };

  type githubCallbackApiAuthGithubCallbackGetParams = {
    code: string;
  };

  type HealthResponse = {
    /** Status */
    status: string;
    /** App */
    app: string;
  };

  type HTTPValidationError = {
    /** Detail */
    detail?: ValidationError[];
  };

  type listTasksApiTasksGetParams = {
    state?: string | null;
    limit?: number | null;
  };

  type listUsersApiAdminUsersGetParams = {
    limit?: number;
    offset?: number;
  };

  type ParseRequest = {
    /** Url */
    url: string;
  };

  type ParseResponse = {
    /** Url */
    url: string;
    /** Title */
    title?: string | null;
    /** Cover Url */
    cover_url?: string | null;
    /** Duration Seconds */
    duration_seconds?: number | null;
    /** Source Site */
    source_site?: string | null;
    /** Platform Id */
    platform_id?: string | null;
    /** Platform Category */
    platform_category?: string | null;
    /** Compliance Note */
    compliance_note?: string | null;
    /** Extractor */
    extractor?: string | null;
    /** Formats */
    formats: VideoFormat[];
  };

  type ReadinessCheck = {
    /** Ok */
    ok: boolean;
    /** Message */
    message?: string | null;
    /** Name */
    name?: string | null;
    /** Queued Jobs */
    queued_jobs?: number | null;
    /** Workers */
    workers?: number | null;
    /** Path */
    path?: string | null;
    /** Ffmpeg */
    ffmpeg?: boolean | null;
    /** Ffprobe */
    ffprobe?: boolean | null;
  };

  type ReadinessResponse = {
    /** Status */
    status: "ok" | "degraded";
    /** Checks */
    checks: Record<string, any>;
  };

  type retryDownloadTaskApiTasksTaskIdRetryPostParams = {
    task_id: string;
  };

  type streamTasksApiTasksStreamGetParams = {
    limit?: number;
  };

  type TaskCreate = {
    /** Url */
    url: string;
    /** Format Id */
    format_id?: string | null;
    /** Title */
    title?: string | null;
    /** Cover Url */
    cover_url?: string | null;
    /** Duration Seconds */
    duration_seconds?: number | null;
    /** Format Label */
    format_label?: string | null;
  };

  type TaskEventRead = {
    /** Id */
    id: number;
    /** Task Id */
    task_id: string;
    /** State */
    state: string;
    /** Message */
    message?: string | null;
    /** Created At */
    created_at: string;
  };

  type TaskRead = {
    /** Id */
    id: string;
    /** Source Url */
    source_url: string;
    /** Title */
    title?: string | null;
    /** Cover Url */
    cover_url?: string | null;
    /** Duration Seconds */
    duration_seconds?: number | null;
    /** Format Id */
    format_id?: string | null;
    /** Format Label */
    format_label?: string | null;
    /** Retry Of Task Id */
    retry_of_task_id?: string | null;
    /** Attempt No */
    attempt_no?: number;
    /** Is Latest Attempt */
    is_latest_attempt?: boolean;
    /** State */
    state: string;
    /** Progress */
    progress: number;
    /** Failure Code */
    failure_code?: string | null;
    /** Failure Reason */
    failure_reason?: string | null;
    /** Output Filename */
    output_filename?: string | null;
    /** Object Size */
    object_size?: number | null;
    /** Expires At */
    expires_at?: string | null;
    /** Created At */
    created_at: string;
    /** Updated At */
    updated_at: string;
    /** Ai Summary */
    ai_summary?: string | null;
    /** Ai Mindmap */
    ai_mindmap?: string | null;
    /** Ai Status */
    ai_status?: string | null;
    /** Ai Error */
    ai_error?: string | null;
  };

  type Token = {
    /** Access Token */
    access_token: string;
    /** Token Type */
    token_type: string;
  };

  type updateUserApiAdminUsersUserIdPatchParams = {
    user_id: number;
  };

  type UserCreate = {
    /** Email */
    email: string;
    /** Password */
    password: string;
    /** Display Name */
    display_name?: string | null;
    /** Invite Code */
    invite_code?: string | null;
  };

  type UserLogin = {
    /** Email */
    email: string;
    /** Password */
    password: string;
  };

  type UserRead = {
    /** Id */
    id: number;
    /** Email */
    email: string;
    /** Github Id */
    github_id?: string | null;
    /** Avatar Url */
    avatar_url?: string | null;
    /** Display Name */
    display_name?: string | null;
    /** Is Active */
    is_active: boolean;
    /** Is Admin */
    is_admin: boolean;
    /** Daily Task Quota */
    daily_task_quota: number;
    /** Concurrent Task Quota */
    concurrent_task_quota: number;
    /** Max File Size Bytes */
    max_file_size_bytes: number;
    /** File Retention Hours */
    file_retention_hours: number;
    /** Storage Quota Bytes */
    storage_quota_bytes: number;
    /** Created At */
    created_at: string;
  };

  type UserUpdate = {
    /** Display Name */
    display_name?: string | null;
    /** Password */
    password?: string | null;
    /** Daily Task Quota */
    daily_task_quota?: number | null;
    /** Concurrent Task Quota */
    concurrent_task_quota?: number | null;
    /** Max File Size Bytes */
    max_file_size_bytes?: number | null;
    /** File Retention Hours */
    file_retention_hours?: number | null;
    /** Storage Quota Bytes */
    storage_quota_bytes?: number | null;
    /** Is Active */
    is_active?: boolean | null;
  };

  type ValidationError = {
    /** Location */
    loc: (string | number)[];
    /** Message */
    msg: string;
    /** Error Type */
    type: string;
    /** Input */
    input?: any;
    /** Context */
    ctx?: Record<string, any>;
  };

  type VideoFormat = {
    /** Format Id */
    format_id: string;
    /** Label */
    label: string;
    /** Ext */
    ext?: string | null;
    /** Resolution */
    resolution?: string | null;
    /** Filesize */
    filesize?: number | null;
    /** Quality Label */
    quality_label?: string | null;
    /** Height */
    height?: number | null;
    /** Width */
    width?: number | null;
    /** Kind */
    kind?: "recommended" | "video" | "raw";
    /** Available */
    available?: boolean;
    /** Note */
    note?: string | null;
  };
}
