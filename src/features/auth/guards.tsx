import { Navigate, Outlet, useLocation, useSearchParams } from 'react-router'
import { FullPageSpinner } from '@/components/app/root'
import { MfaChallenge, useMfaRequired } from './mfa'
import type { Profile } from './session'
import { useAuth } from './session'

export function RequireAuth() {
  const { ready, session, profile, signOut } = useAuth()
  const location = useLocation()
  const mfa = useMfaRequired(session?.access_token)
  if (!ready || (session && mfa.isPending)) return <FullPageSpinner />
  if (!session || !profile) {
    const next = location.pathname + location.search
    return <Navigate to={`/giris?next=${encodeURIComponent(next)}`} replace />
  }
  if (mfa.data) return <MfaChallenge onSignOut={() => void signOut()} />
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
