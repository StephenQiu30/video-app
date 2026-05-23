import axios from 'axios'
import { describe, expect, it } from 'vitest'

import { buildAuthHeaders, normalizeApiError } from './request'

describe('services/request', () => {
  it('统一注入 token header', () => {
    expect(buildAuthHeaders('unit-token')).toEqual({ Authorization: 'Bearer unit-token' })
    expect(buildAuthHeaders(null)).toEqual({})
  })

  it('复用统一错误归一化', () => {
    const error = new axios.AxiosError('rate limited', 'ERR_BAD_REQUEST', undefined, undefined, {
      status: 429,
      statusText: 'Too Many Requests',
      headers: {},
      config: {} as never,
      data: {},
    })

    expect(normalizeApiError(error)).toEqual({
      code: 'rate_limited',
      message: '请求太频繁，请稍后再试',
      status: 429,
    })
  })
})
