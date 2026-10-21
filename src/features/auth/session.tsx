import type { Session } from '@supabase/supabase-js'
import { useQueryClient } from '@tanstack/react-query'
import { createContext, useCallback, useContext, useEffect, useMemo, useState, type ReactNode } from 'react'
import { loginEmail } from '../../../shared/accounts'
import { supabase, unwrap, type Tables } from '@/lib/supabase'

export type Profile = Tables<'profiles'>
export type Student = Tables<'students'>
export type Child = Student & { full_name: string }

type AuthState = {
  ready: boolean
  session: Session | null
  profile: Profile | null
  student: Student | null
  children: Child[]
  activeChild: Child | null
  setActiveChild: (id: string) => void
  signIn: (identifier: string, password: string) => Promise<void>
  signOut: () => Promise<void>
  refresh: () => Promise<void>
}

const AuthContext = createContext<AuthState | null>(null)
const CHILD_KEY = 'sinavika-active-child'

function readChild() {
  try {
    return localStorage.getItem(CHILD_KEY)
  } catch {
    return null
  }
}

async function loadAccount(userId: string) {
  const profile = unwrap(await supabase.from('profiles').select('*').eq('id', userId).maybeSingle())
  if (!profile) return { profile: null, student: null, children: [] as Child[] }
  if (profile.role === 'student') {
    const student = unwrap(await supabase.from('students').select('*').eq('id', userId).maybeSingle())
    return { profile, student, children: [] as Child[] }
  }
  if (profile.role === 'parent') {
    const links = unwrap(await supabase.from('parent_links').select('student_id').eq('parent_id', userId))
    const ids = links.map((l) => l.student_id)
    if (!ids.length) return { profile, student: null, children: [] as Child[] }
    const [students, names] = await Promise.all([
      supabase.from('students').select('*').in('id', ids),
      supabase.from('profiles').select('id, full_name').in('id', ids),
    ])
    const nameById = new Map(unwrap(names).map((n) => [n.id, n.full_name]))
    const children = unwrap(students)
      .map((s) => ({ ...s, full_name: nameById.get(s.id) ?? 'Öğrenci' }))
      .sort((a, b) => a.full_name.localeCompare(b.full_name, 'tr'))
    return { profile, student: null, children }
  }
  return { profile, student: null, children: [] as Child[] }
}

export function AuthProvider({ children: node }: { children: ReactNode }) {
  const queryClient = useQueryClient()
  const [ready, setReady] = useState(false)
  const [session, setSession] = useState<Session | null>(null)
  const [account, setAccount] = useState<Awaited<ReturnType<typeof loadAccount>>>({
    profile: null,
    student: null,
    children: [],
  })
  const [activeChildId, setActiveChildId] = useState<string | null>(readChild)

  const load = useCallback(async (next: Session | null) => {
    setSession(next)
    if (!next) {
      setAccount({ profile: null, student: null, children: [] })
      setReady(true)
      return
    }
    try {
      const result = await loadAccount(next.user.id)
      if (!result.profile) {
        await supabase.auth.signOut()
        setSession(null)
      }
      setAccount(result)
      if (result.profile) void supabase.rpc('touch_last_seen')
    } catch {
      setAccount({ profile: null, student: null, children: [] })
    } finally {
      setReady(true)
    }
  }, [])

  useEffect(() => {
    let current: string | undefined
    supabase.auth.getSession().then(({ data }) => {
      current = data.session?.user.id
      void load(data.session)
    })
    const { data } = supabase.auth.onAuthStateChange((event, next) => {
      if (event === 'SIGNED_OUT') {
        current = undefined
        queryClient.clear()
        void load(null)
      } else if (event === 'SIGNED_IN' && next?.user.id !== current) {
        current = next?.user.id
        void load(next)
      } else if (next) {
        setSession(next)
      }
    })
    return () => data.subscription.unsubscribe()
  }, [load, queryClient])

  const signIn = useCallback(async (identifier: string, password: string) => {
    const { error } = await supabase.auth.signInWithPassword({ email: loginEmail(identifier), password })
    if (error) {
      if (/invalid/i.test(error.message)) throw new Error('Kullanıcı adı veya şifre hatalı')
      if (/rate|too many/i.test(error.message)) throw new Error('Çok fazla deneme yapıldı, biraz bekleyip tekrar deneyin')
      throw new Error('Giriş yapılamadı, tekrar deneyin')
    }
  }, [])

  const signOut = useCallback(async () => {
    await supabase.auth.signOut()
  }, [])

  const refresh = useCallback(async () => {
    const { data } = await supabase.auth.getSession()
    await load(data.session)
  }, [load])

  const setActiveChild = useCallback((id: string) => {
    setActiveChildId(id)
    try {
      localStorage.setItem(CHILD_KEY, id)
    } catch {
      /* depolama kapalıysa sadece bu oturumda hatırlanır */
    }
  }, [])

  const value = useMemo<AuthState>(() => {
    const activeChild = account.children.find((c) => c.id === activeChildId) ?? account.children[0] ?? null
    return { ready, session, ...account, activeChild, setActiveChild, signIn, signOut, refresh }
  }, [ready, session, account, activeChildId, setActiveChild, signIn, signOut, refresh])

  return <AuthContext.Provider value={value}>{node}</AuthContext.Provider>
}

export function useAuth() {
  const ctx = useContext(AuthContext)
  if (!ctx) throw new Error('useAuth must be used inside AuthProvider')
  return ctx
}

export function useProfile() {
  const { profile } = useAuth()
  if (!profile) throw new Error('useProfile requires a signed-in user')
  return profile
}

export type ViewedStudent = { studentId: string; student: Student; name: string; canEdit: boolean }

export function useViewedStudent(): ViewedStudent | null {
  const { profile, student, activeChild } = useAuth()
  if (profile?.role === 'student' && student) {
    return { studentId: student.id, student, name: profile.full_name, canEdit: true }
  }
  if (profile?.role === 'parent' && activeChild) {
    return { studentId: activeChild.id, student: activeChild, name: activeChild.full_name, canEdit: false }
  }
  return null
}
