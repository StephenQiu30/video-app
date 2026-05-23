import axios from 'axios'

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
  extractor: string | null
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
