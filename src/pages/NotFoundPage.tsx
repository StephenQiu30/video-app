import { Link } from 'react-router-dom'

import { PageContainer } from '../components/layout/PageContainer'
import { Button } from '../components/ui/button'

export function NotFoundPage() {
  return (
    <PageContainer
      title="页面不存在"
      description="当前地址没有匹配的页面，请回到解析入口或任务列表继续。"
      className="not-found-page"
    >
      <div className="not-found-actions">
        <Button asChild>
          <Link to="/">返回解析页</Link>
        </Button>
        <Button asChild variant="outline">
          <Link to="/tasks">查看任务</Link>
        </Button>
      </div>
    </PageContainer>
  )
}
