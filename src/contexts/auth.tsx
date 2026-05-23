/* eslint-disable react-refresh/only-export-components */

import { createContext, useContext, useMemo, useState } from 'react'
type AppAuth = {
  token: string | null
  setToken: (next: string | null) => void
}

const AUTH_KEY = 'video_web_access_token'

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
