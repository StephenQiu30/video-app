/* eslint-disable react-refresh/only-export-components */

import { createContext, useContext, useEffect, useMemo, useState } from 'react'
type AppAuth = {
  token: string | null
  setToken: (next: string | null) => void
}

export const AUTH_KEY = 'video_web_access_token'
export const AUTH_EXPIRED_EVENT = 'video_web_auth_expired'

const AuthContext = createContext<AppAuth | null>(null)

export function AppProvider({ children }: { children: React.ReactNode }) {
  const [token, setTokenState] = useState<string | null>(() => {
    if (typeof window === 'undefined') return null
    return window.localStorage.getItem(AUTH_KEY)
  })

  const setToken = (next: string | null) => {
    setTokenState(next)
    if (next) {
      window.localStorage.setItem(AUTH_KEY, next)
    } else {
      window.localStorage.removeItem(AUTH_KEY)
    }
  }

  useEffect(() => {
    const onAuthExpired = () => {
      setTokenState(null)
      window.localStorage.removeItem(AUTH_KEY)
    }
    window.addEventListener(AUTH_EXPIRED_EVENT, onAuthExpired)
    return () => window.removeEventListener(AUTH_EXPIRED_EVENT, onAuthExpired)
  }, [])

  const value = useMemo(() => ({ token, setToken }), [token])

  return <AuthContext.Provider value={value}>{children}</AuthContext.Provider>
}

export function useAuth() {
  const ctx = useContext(AuthContext)
  if (!ctx) {
    throw new Error('useAuth 必须在 AppProvider 内使用')
  }
  return ctx
}
