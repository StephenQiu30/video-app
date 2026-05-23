import { Navigate, Route, Routes, useLocation } from 'react-router-dom'

import { AccountPage } from './pages/AccountPage'
import { AuthPage } from './pages/AuthPage'
import { HomePage } from './pages/HomePage'
import { NotFoundPage } from './pages/NotFoundPage'
import { TaskDetailPage } from './pages/TaskDetailPage'
import { WorkbenchPage } from './pages/WorkbenchPage'
import { AppLayout } from './components/layout/AppLayout'
import { useAuth } from './contexts/auth'

import './App.css'

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
    <AppLayout>
      <Routes>
        <Route path="/" element={<HomePage />} />
        <Route path="/auth" element={<AuthPage />} />
        <Route
          path="/tasks"
          element={
            <RequireAuth>
              <WorkbenchPage />
            </RequireAuth>
          }
        />
        <Route
          path="/workbench"
          element={
            <RequireAuth>
              <Navigate to="/tasks" replace />
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
        <Route
          path="/account"
          element={
            <RequireAuth>
              <AccountPage />
            </RequireAuth>
          }
        />
        <Route path="*" element={<NotFoundPage />} />
      </Routes>
    </AppLayout>
  )
}

export default App
