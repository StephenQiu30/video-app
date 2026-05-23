import { Navigate, NavLink, Route, Routes, useLocation } from 'react-router-dom'

import { AuthPage } from './pages/AuthPage'
import { HomePage } from './pages/HomePage'
import { TaskDetailPage } from './pages/TaskDetailPage'
import { WorkbenchPage } from './pages/WorkbenchPage'
import { useAuth } from './contexts/auth'

import './App.css'

function AppHeader() {
  return (
    <header className="app-header">
      <div className="brand">
        <span>VideoWeb</span>
        <span className="brand-sub">AI 工具化下载</span>
      </div>
      <nav className="header-nav">
        <NavLink to="/" end>
          落地页
        </NavLink>
        <NavLink to="/workbench">工作台</NavLink>
        <NavLink to="/auth">登录 / 注册</NavLink>
      </nav>
    </header>
  )
}

function RequireAuth({ children }: { children: React.ReactNode }) {
  const { token } = useAuth()
  const location = useLocation()

  if (!token) {
    return <Navigate to="/auth" replace state={{ redirectTo: location.pathname }} />
  }
  return <>{children}</>
}

function App() {
  return (
    <div className="app-shell">
      <AppHeader />
      <main className="app-main">
        <Routes>
          <Route path="/" element={<HomePage />} />
          <Route path="/auth" element={<AuthPage />} />
          <Route
            path="/workbench"
            element={
              <RequireAuth>
                <WorkbenchPage />
              </RequireAuth>
            }
          />
          <Route
            path="/tasks/:taskId"
            element={
              <RequireAuth>
                <TaskDetailPage />
              </RequireAuth>
            }
          />
          <Route path="*" element={<Navigate to="/" replace />} />
        </Routes>
      </main>
      <footer className="app-footer">MVP API-First 视频下载器 · video-server + video-web</footer>
    </div>
  )
}

export default App
