import { Link, NavLink, useLocation } from 'react-router-dom'

import { useAuth } from '../../contexts/auth'
import { Button } from '../ui/button'

type AppLayoutProps = {
  children: React.ReactNode
}

type NavItem = {
  label: string
  to: string
  end?: boolean
}

const NAV_ITEMS: NavItem[] = [
  { label: '解析', to: '/', end: true },
  { label: '任务', to: '/tasks' },
  { label: '报告', to: '/tasks?state=SUCCEEDED' },
  { label: '账号', to: '/account' },
]

function isReportActive(pathname: string, search: string) {
  return pathname === '/tasks' && search.includes('state=SUCCEEDED')
}

export function AppLayout({ children }: AppLayoutProps) {
  const { token, setToken } = useAuth()
  const location = useLocation()

  return (
    <div className="app-shell">
      <header className="app-header" aria-label="应用顶部栏">
        <Link className="brand" to="/">
          <span>万能视频下载器</span>
          <span className="brand-sub">解析 · 队列 · AI 报告</span>
        </Link>
        <nav className="header-nav" aria-label="主导航">
          {NAV_ITEMS.map((item) => (
            <NavLink
              key={item.label}
              to={item.to}
              end={item.end}
              className={({ isActive }) => {
                const active =
                  item.label === '报告' ? isReportActive(location.pathname, location.search) : isActive && item.label !== '报告'
                return active ? 'active' : ''
              }}
            >
              {item.label}
            </NavLink>
          ))}
        </nav>
        <div className="account-entry">
          {token ? (
            <>
              <span className="account-status">已登录</span>
              <Button type="button" size="sm" variant="outline" onClick={() => setToken(null)}>
                退出
              </Button>
            </>
          ) : (
            <Button asChild size="sm">
              <Link to="/auth">登录</Link>
            </Button>
          )}
        </div>
      </header>
      <main className="app-main">{children}</main>
      <footer className="app-footer">API-First 视频下载器 · video-server + video-web</footer>
    </div>
  )
}
