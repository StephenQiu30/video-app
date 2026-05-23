import { PageContainer } from '../components/layout/PageContainer'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '../components/ui/card'

export function AccountPage() {
  return (
    <PageContainer title="账号" description="查看当前登录状态、任务额度与账号设置。">
      <Card>
        <CardHeader>
          <CardTitle>账号概览</CardTitle>
          <CardDescription>账号资料与额度详情会在后续任务中接入真实接口。</CardDescription>
        </CardHeader>
        <CardContent>
          <p className="state-text">当前账号已登录，可以创建解析任务并查看下载记录。</p>
        </CardContent>
      </Card>
    </PageContainer>
  )
}
