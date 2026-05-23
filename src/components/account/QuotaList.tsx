import type { UserRead } from '../../lib/api'

type QuotaListProps = {
  user: UserRead
}

function formatBytes(value: number) {
  const gb = value / 1024 / 1024 / 1024
  if (gb >= 1) return `${Number.isInteger(gb) ? gb : gb.toFixed(1)} GB`
  const mb = value / 1024 / 1024
  return `${Number.isInteger(mb) ? mb : mb.toFixed(1)} MB`
}

export function QuotaList({ user }: QuotaListProps) {
  const items = [
    { label: '每日任务额度', value: `${user.daily_task_quota} 次` },
    { label: '并发额度', value: `${user.concurrent_task_quota} 个任务` },
    { label: '最大文件大小', value: formatBytes(user.max_file_size_bytes) },
    { label: '存储额度', value: formatBytes(user.storage_quota_bytes) },
    { label: '文件保留时间', value: `${user.file_retention_hours} 小时` },
  ]

  return (
    <dl className="quota-list">
      {items.map((item) => (
        <div key={item.label} className="quota-item">
          <dt>{item.label}</dt>
          <dd>{item.value}</dd>
        </div>
      ))}
    </dl>
  )
}
