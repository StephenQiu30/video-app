import { screen } from '@testing-library/react'
import { describe, expect, it } from 'vitest'

import { renderWithProviders } from './test/test-utils'
import App from './App'

describe('路由鉴权', () => {
  it('未登录访问工作台会重定向到登录页', async () => {
    renderWithProviders(<App />, { initialEntries: ['/workbench'] })

    expect(await screen.findByRole('heading', { name: '登录' })).toBeInTheDocument()
  })

  it('授权页访问时会展示回跳按钮', async () => {
    renderWithProviders(<App />, { initialEntries: ['/auth'] })

    expect(await screen.findByRole('link', { name: 'GitHub 登录' })).toBeInTheDocument()
  })
})
