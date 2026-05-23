import { api, normalizeApiError } from '../lib/api'

export const request = api
export { normalizeApiError }

export const buildAuthHeaders = (token: string | null): Record<string, string> => {
  return token ? { Authorization: `Bearer ${token}` } : {}
}
