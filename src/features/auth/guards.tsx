import { Navigate, Outlet, useLocation, useSearchParams } from 'react-router'
import { FullPageSpinner } from '@/components/app/root'
import type { Profile } from './session'
import { useAuth } from './session'

export function RequireAuth() {
  const { ready, session, profile } = useAuth()
  const location = useLocation()
  if (!ready) return <FullPageSpinner />
  if (!session || !profile) {
    const next = location.pathname + location.search
    return <Navigate to={`/giris?next=${encodeURIComponent(next)}`} replace />
  }
  return <Outlet />
}

export function RedirectIfAuthed() {
  const { ready, session, profile } = useAuth()
  const [params] = useSearchParams()
  if (!ready) return <FullPageSpinner />
  if (session && profile) {
    const next = params.get('next')
    return <Navigate to={next?.startsWith('/app') ? next : '/app'} replace />
  }
  return <Outlet />
}

export function RequireRole({ roles, admin }: { roles: Profile['role'][]; admin?: boolean }) {
  const { profile } = useAuth()
  if (!profile || !roles.includes(profile.role) || (admin && !profile.is_admin)) {
    return <Navigate to="/app" replace />
  }
  return <Outlet />
}
