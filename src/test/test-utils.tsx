import { type ReactNode } from 'react'
import { QueryClient, QueryClientProvider } from '@tanstack/react-query'
import { MemoryRouter } from 'react-router-dom'
import { render } from '@testing-library/react'

import { AppProvider } from '../contexts/auth'

type Options = {
  initialEntries?: string[]
}

export function renderWithProviders(ui: ReactNode, options: Options = {}) {
  const client = new QueryClient({
    defaultOptions: {
      queries: {
        retry: false,
      },
      mutations: {
        retry: false,
      },
    },
  })

  return render(
    <MemoryRouter initialEntries={options.initialEntries ?? ['/']}>
      <QueryClientProvider client={client}>
        <AppProvider>{ui}</AppProvider>
      </QueryClientProvider>
    </MemoryRouter>,
  )
}
