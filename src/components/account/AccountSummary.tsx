import type { UserRead } from '../../lib/api'
import { Badge } from '../ui/badge'

type AccountSummaryProps = {
  user: UserRead
}

export function AccountSummary({ user }: AccountSummaryProps) {
  const name = user.display_name || user.email

  return (
    <div className="account-summary">
      {user.avatar_url && <img className="account-avatar" src={user.avatar_url} alt={`${name} 头像`} />}
      <div>
        <div className="account-title-row">
          <h2>{name}</h2>
          <Badge>{user.is_active ? '正常' : '已停用'}</Badge>
        </div>
        <p>{user.email}</p>
        <p className="task-meta">GitHub ID：{user.github_id || '未绑定'}</p>
      </div>
    </div>
  )
}
