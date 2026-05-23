import { afterEach, describe, expect, it, vi } from 'vitest'

import { api, getTaskReportLink } from './api'

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
