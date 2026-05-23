import axios from 'axios'

import { AUTH_EXPIRED_EVENT, AUTH_KEY } from '../contexts/auth'

const API_BASE = (import.meta.env.VITE_API_BASE_URL ?? 'http://localhost:8000').replace(/\/$/, '')

export const api = axios.create({
  baseURL: `${API_BASE}/api`,
  timeout: 20000,
})

export type ApiError = {
  error: {
    code: string
    message: string
    details?: unknown
  }
}

export type NormalizedApiError = {
  code: string
  message: string
  details?: unknown
  status?: number
}

function isApiErrorEnvelope(data: unknown): data is ApiError {
  if (!data || typeof data !== 'object') return false
  const candidate = data as { error?: unknown }
  if (!candidate.error || typeof candidate.error !== 'object') return false
  const error = candidate.error as { code?: unknown; message?: unknown }
  return typeof error.code === 'string' && typeof error.message === 'string'
}

export function normalizeApiError(error: unknown): NormalizedApiError {
  if (axios.isAxiosError(error)) {
    const status = error.response?.status
    const data = error.response?.data
    if (isApiErrorEnvelope(data)) {
      return {
        code: data.error.code,
        message: data.error.message,
        details: data.error.details,
        status,
      }
    }
    if (status === 401) return { code: 'unauthorized', message: '登录已失效，请重新登录', status }
    if (status === 403) return { code: 'forbidden', message: '没有访问权限', status }
    if (status === 429) return { code: 'rate_limited', message: '请求太频繁，请稍后再试', status }
    if (status && status >= 500) return { code: 'server_error', message: '服务暂时不可用，请稍后重试', status }
    if (!error.response) return { code: 'network_error', message: '网络连接异常，请检查网络后重试' }
    return { code: 'request_error', message: error.message || '请求失败，请稍后重试', status }
  }

  if (error instanceof TypeError) {
    return { code: 'network_error', message: '网络连接异常，请检查网络后重试' }
  }

  if (error instanceof Error) {
    return { code: 'unknown_error', message: error.message || '请求失败，请稍后重试' }
  }

  return { code: 'unknown_error', message: '请求失败，请稍后重试' }
}

api.interceptors.response.use(
  (response) => response,
  (error) => {
    const normalized = normalizeApiError(error)
    if (normalized.status === 401 && typeof window !== 'undefined') {
      window.localStorage.removeItem(AUTH_KEY)
      window.dispatchEvent(new CustomEvent(AUTH_EXPIRED_EVENT, { detail: normalized }))
    }
    return Promise.reject(new Error(normalized.message))
  },
)

export type UserRead = {
  id: number
  email: string
  github_id: string | null
  avatar_url: string | null
  display_name: string | null
  is_active: boolean
  is_admin: boolean
  daily_task_quota: number
  concurrent_task_quota: number
  max_file_size_bytes: number
  file_retention_hours: number
  storage_quota_bytes: number
  created_at: string
}

export type ParseResult = {
  url: string
  title: string | null
  cover_url: string | null
  duration_seconds: number | null
  source_site: string | null
  platform_id?: string | null
  platform_category?: string | null
  extractor: string | null
  compliance_note?: string | null
  formats: Array<{
    format_id: string
    label: string
    ext: string | null
    resolution: string | null
    filesize: number | null
    quality_label: string | null
    available: boolean
    note: string | null
  }>
}

export type TaskCreate = {
  url: string
  format_id?: string
  title?: string | null
  cover_url?: string | null
  duration_seconds?: number | null
  format_label?: string | null
}

export type TaskRead = {
  id: string
  source_url: string
  title: string | null
  cover_url?: string | null
  duration_seconds?: number | null
  format_id?: string | null
  format_label?: string | null
  state: string
  progress: number
  failure_code: string | null
  failure_reason: string | null
  output_filename: string | null
  object_size: number | null
  expires_at: string | null
  created_at: string
  updated_at: string
  attempt_no: number
  is_latest_attempt: boolean
  retry_of_task_id: string | null
  ai_summary: string | null
  ai_status: string | null
  ai_error: string | null
  ai_mindmap?:
    | {
    title: string
    points: string[]
  }
    | string
    | null
}

export type TaskEventRead = {
  id: number
  task_id: string
  state: string
  message: string | null
  created_at: string
}

export type DownloadLink = {
  url: string
  expires_in_seconds: number
}

export type TaskReportLink = {
  url: string
  expires_in_seconds: number
}

const authHeaders = (token: string | null): Record<string, string> => {
  return token ? { Authorization: `Bearer ${token}` } : {}
}

const requireAuth = (token: string | null) => {
  if (!token) {
    throw new Error('未登录')
  }
}

export const getCurrentUser = async (token: string | null): Promise<UserRead> => {
  const response = await api.get<UserRead>('/auth/me', {
    headers: authHeaders(token),
  })
  return response.data
}

export const parseVideo = async (token: string | null, url: string): Promise<ParseResult> => {
  requireAuth(token)
  const response = await api.post<ParseResult>('/parse', { url }, { headers: authHeaders(token) })
  return response.data
}

export const createTask = async (token: string | null, payload: TaskCreate): Promise<TaskRead> => {
  requireAuth(token)
  const response = await api.post<TaskRead>('/tasks', payload, { headers: authHeaders(token) })
  return response.data
}

export const listTasks = async (token: string | null): Promise<TaskRead[]> => {
  requireAuth(token)
  const response = await api.get<TaskRead[]>('/tasks', { headers: authHeaders(token) })
  return response.data
}

export const getTask = async (token: string | null, taskId: string): Promise<TaskRead> => {
  requireAuth(token)
  const response = await api.get<TaskRead>(`/tasks/${taskId}`, { headers: authHeaders(token) })
  return response.data
}

export const getTaskEvents = async (token: string | null, taskId: string): Promise<TaskEventRead[]> => {
  requireAuth(token)
  const response = await api.get<TaskEventRead[]>(`/tasks/${taskId}/events`, {
    headers: authHeaders(token),
  })
  return response.data
}

export const getTaskDownloadLink = async (token: string | null, taskId: string): Promise<DownloadLink> => {
  requireAuth(token)
  const response = await api.get<DownloadLink>(`/tasks/${taskId}/download-link`, {
    headers: authHeaders(token),
  })
  return response.data
}

export const getTaskReportLink = async (token: string | null, taskId: string): Promise<TaskReportLink> => {
  requireAuth(token)
  const response = await api.get<Blob>(`/tasks/${taskId}/pdf`, {
    headers: authHeaders(token),
    responseType: 'blob',
  })
  return {
    url: URL.createObjectURL(response.data),
    expires_in_seconds: 0,
  }
}

export const cancelTask = async (token: string | null, taskId: string): Promise<TaskRead> => {
  requireAuth(token)
  const response = await api.post<TaskRead>(`/tasks/${taskId}/cancel`, {}, { headers: authHeaders(token) })
  return response.data
}

export const retryTask = async (token: string | null, taskId: string): Promise<TaskRead> => {
  requireAuth(token)
  const response = await api.post<TaskRead>(`/tasks/${taskId}/retry`, {}, { headers: authHeaders(token) })
  return response.data
}

export const getGitHubAuthorizeUrl = (): string => `${API_BASE}/api/auth/github/authorize`
