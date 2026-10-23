import { MutationCache, QueryCache, QueryClient, QueryClientProvider } from '@tanstack/react-query'
import { MotionConfig } from 'motion/react'
import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import { RouterProvider } from 'react-router/dom'
import { Toaster } from 'sonner'
import { AuthProvider } from '@/features/auth/session'
import { installGlobalErrorLogging, reportError } from '@/lib/error-log'
import '@/lib/install'
import { applyAccent } from '@/lib/accent'
import { applyTheme } from '@/lib/theme'
import { watchForUpdates } from '@/lib/update'
import { router } from './router'
import './index.css'

applyTheme()
applyAccent()
installGlobalErrorLogging()
watchForUpdates()

const queryClient = new QueryClient({
  queryCache: new QueryCache({ onError: (error, query) => reportError(error, `query ${String(query.queryKey[0])}`) }),
  mutationCache: new MutationCache({ onError: (error) => reportError(error, 'mutation') }),
  defaultOptions: {
    queries: { staleTime: 30_000, retry: 1, refetchOnWindowFocus: true },
    mutations: { retry: 0 },
  },
})

createRoot(document.getElementById('root')!).render(
  <StrictMode>
    <QueryClientProvider client={queryClient}>
      <MotionConfig reducedMotion="user">
        <AuthProvider>
          <RouterProvider router={router} />
          <Toaster
            position="top-center"
            toastOptions={{
              className: '!rounded-xl !border-line !bg-surface !text-fg !shadow-pop !font-sans',
            }}
          />
        </AuthProvider>
      </MotionConfig>
    </QueryClientProvider>
  </StrictMode>,
)
