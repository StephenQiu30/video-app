import { afterEach, describe, expect, it, vi } from 'vitest'

import axios from 'axios'

import { api, getTaskReportLink, normalizeApiError } from './api'

describe('api report contract', () => {
  afterEach(() => {
    vi.restoreAllMocks()
  })

  it('通过真实后端 PDF 接口拉取 blob 并生成临时报告 URL', async () => {
    const pdf = new Blob(['%PDF-1.4'], { type: 'application/pdf' })
    const getSpy = vi.spyOn(api, 'get').mockResolvedValue({ data: pdf })
    URL.createObjectURL = vi.fn()
    const createObjectURL = vi.spyOn(URL, 'createObjectURL').mockReturnValue('blob:http://localhost/report')

    const result = await getTaskReportLink('unit-token', 'task-1')

    expect(getSpy).toHaveBeenCalledWith('/tasks/task-1/pdf', {
      headers: { Authorization: 'Bearer unit-token' },
      responseType: 'blob',
    })
    expect(createObjectURL).toHaveBeenCalledWith(pdf)
    expect(result).toEqual({
      url: 'blob:http://localhost/report',
      expires_in_seconds: 0,
    })
  })
})

describe('normalizeApiError', () => {
  it('优先使用后端统一错误 envelope', () => {
    const error = new axios.AxiosError('bad request', 'ERR_BAD_REQUEST', undefined, undefined, {
      status: 422,
      statusText: 'Unprocessable Entity',
      headers: {},
      config: {} as never,
      data: {
        error: {
          code: 'validation_error',
          message: '请输入有效链接',
          details: { field: 'url' },
        },
      },
    })

    expect(normalizeApiError(error)).toEqual({
      code: 'validation_error',
      message: '请输入有效链接',
      details: { field: 'url' },
      status: 422,
    })
  })

  it('归一化限流、服务端和网络错误文案', () => {
    const rateLimit = new axios.AxiosError('rate limited', 'ERR_BAD_REQUEST', undefined, undefined, {
      status: 429,
      statusText: 'Too Many Requests',
      headers: {},
      config: {} as never,
      data: {},
    })
    const serverError = new axios.AxiosError('server down', 'ERR_BAD_RESPONSE', undefined, undefined, {
      status: 503,
      statusText: 'Service Unavailable',
      headers: {},
      config: {} as never,
      data: {},
    })

    expect(normalizeApiError(rateLimit).message).toBe('请求太频繁，请稍后再试')
    expect(normalizeApiError(serverError).message).toBe('服务暂时不可用，请稍后重试')
    expect(normalizeApiError(new TypeError('Failed to fetch')).message).toBe('网络连接异常，请检查网络后重试')
  })
})
