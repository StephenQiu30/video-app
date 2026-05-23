export const PENDING_URL_KEY = 'video_web_pending_url'

export const readPendingUrl = (): string => window.sessionStorage.getItem(PENDING_URL_KEY) ?? ''

export const savePendingUrl = (url: string) => {
  window.sessionStorage.setItem(PENDING_URL_KEY, url)
}

export const hasPendingUrl = (): boolean => Boolean(readPendingUrl())
