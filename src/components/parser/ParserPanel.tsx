import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '../ui/card'

type ParserPanelProps = {
  children: React.ReactNode
}

export function ParserPanel({ children }: ParserPanelProps) {
  return (
    <Card className="parser-panel">
      <CardHeader>
        <CardTitle>首屏解析器</CardTitle>
        <CardDescription>支持登录后解析并创建下载任务，解析结果会保留标题、封面、平台与可用格式。</CardDescription>
      </CardHeader>
      <CardContent>{children}</CardContent>
    </Card>
  )
}

export function ParseResultPanel({ children }: ParserPanelProps) {
  return (
    <div className="parse-result" role="region" aria-label="解析结果">
      {children}
    </div>
  )
}
