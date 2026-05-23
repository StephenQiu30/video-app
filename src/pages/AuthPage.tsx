import { useEffect } from 'react'
import { useLocation, useNavigate } from 'react-router-dom'

import { useAuth } from '../contexts/auth'
import { getGitHubAuthorizeUrl } from '../lib/api'
import { Button } from '../components/ui/button'
import { Card, CardContent, CardHeader, CardTitle } from '../components/ui/card'

function useSearchToken() {
  const location = useLocation()
  const search = new URLSearchParams(location.search)
  return search.get('token')
}

export function AuthPage() {
  const navigate = useNavigate()
  const { setToken, token } = useAuth()
  const callbackToken = useSearchToken()
  const isProcessing = Boolean(token || callbackToken)

  useEffect(() => {
    if (token) {
      navigate('/workbench', { replace: true })
      return
    }

    if (callbackToken) {
      setToken(callbackToken)
      navigate('/workbench', { replace: true })
      return
    }

    return
  }, [callbackToken, setToken, token, navigate])

  return (
    <section className="page">
      <Card>
        <CardHeader>
          <CardTitle>登录</CardTitle>
        </CardHeader>
        <CardContent>
            {!isProcessing ? (
              <div className="auth-actions">
                <p>请使用 GitHub 登录后开始任务创建与下载。</p>
                <Button asChild>
                  <a href={getGitHubAuthorizeUrl()}>GitHub 登录</a>
                </Button>
            </div>
          ) : (
            <p>正在处理登录回跳...</p>
          )}
        </CardContent>
      </Card>
    </section>
  )
}
