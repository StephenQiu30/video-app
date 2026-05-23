import { useQuery } from '@tanstack/react-query'

import { AccountSummary } from '../components/account/AccountSummary'
import { QuotaList } from '../components/account/QuotaList'
import { PageContainer } from '../components/layout/PageContainer'
import { useAuth } from '../contexts/auth'
import { getCurrentUser } from '../lib/api'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '../components/ui/card'

export function AccountPage() {
  const { token } = useAuth()
  const { data: user, isLoading, isError, error } = useQuery({
    queryKey: ['current-user', token],
    queryFn: () => getCurrentUser(token),
    enabled: Boolean(token),
  })

  return (
    <PageContainer title="账号" description="查看当前登录状态、任务额度与账号设置。">
      <Card>
        <CardHeader>
          <CardTitle>账号概览</CardTitle>
          <CardDescription>基础资料与下载任务额度来自后端账号接口。</CardDescription>
        </CardHeader>
        <CardContent>
          {isLoading && <p className="state-text">账号加载中...</p>}
          {isError && <p className="error-text">{error instanceof Error ? error.message : '账号加载失败'}</p>}
          {user && (
            <div className="account-page-grid">
              <AccountSummary user={user} />
              <QuotaList user={user} />
            </div>
          )}
        </CardContent>
      </Card>
    </PageContainer>
  )
}
