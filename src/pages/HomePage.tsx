import { useMemo, useState } from 'react'
import type { FormEvent } from 'react'
import { useNavigate } from 'react-router-dom'
import { useMutation } from '@tanstack/react-query'

import { parseVideo, createTask, getGitHubAuthorizeUrl, type ParseResult } from '../lib/api'
import { useAuth } from '../contexts/auth'
import { Badge } from '../components/ui/badge'
import { Button } from '../components/ui/button'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '../components/ui/card'
import { Input } from '../components/ui/input'

type ParsedFormat = NonNullable<ParseResult['formats']>[number]

function resolveStatusMessage(error: unknown): string {
  if (error instanceof Error) return error.message
  return '请求失败，请稍后重试'
}

function parseStateDescription(state: 'idle' | 'parsing' | 'ready' | 'creating' | 'error', error?: string) {
  if (state === 'parsing') return '正在解析视频...'
  if (state === 'ready') return '解析完成，选择规格后可创建下载任务'
  if (state === 'creating') return '正在创建任务...'
  if (state === 'error' && error) return error
  return '请输入公开分享链接进行解析'
}

export function HomePage() {
  const { token } = useAuth()
  const navigate = useNavigate()
  const [url, setUrl] = useState('')
  const [formatId, setFormatId] = useState('')
  const [parseResult, setParseResult] = useState<ParseResult | null>(null)
  const [errorMessage, setErrorMessage] = useState('')
  const [selectedTitle, setSelectedTitle] = useState('')

  const parseMutation = useMutation({
    mutationFn: async (payload: { url: string }) => parseVideo(token, payload.url),
    onSuccess: (result) => {
      setParseResult(result)
      setFormatId(result.formats.at(0)?.format_id ?? '')
      setSelectedTitle(result.title ?? '')
      setErrorMessage('')
    },
    onError: (error) => {
      setParseResult(null)
      setErrorMessage(resolveStatusMessage(error))
    },
  })

  const createMutation = useMutation({
    mutationFn: async () => {
      if (!parseResult) throw new Error('请先解析视频')
      if (!formatId) throw new Error('请选择下载规格')

      const selected = parseResult.formats.find((item) => item.format_id === formatId)
      return createTask(token, {
        url: parseResult.url,
        format_id: formatId,
        title: parseResult.title ?? selectedTitle,
        cover_url: parseResult.cover_url,
        duration_seconds: parseResult.duration_seconds ?? undefined,
        format_label: selected?.label,
      })
    },
    onSuccess: (task) => {
      setErrorMessage('')
      navigate(`/tasks/${task.id}`)
    },
    onError: (error) => {
      setErrorMessage(resolveStatusMessage(error))
    },
  })

  const uiState = parseMutation.isPending
    ? 'parsing'
    : createMutation.isPending
      ? 'creating'
      : errorMessage
        ? 'error'
        : parseResult
          ? 'ready'
          : 'idle'

  const canSubmit = Boolean(url.trim()) && !parseMutation.isPending && !createMutation.isPending
  const platform = parseResult?.source_site ? `来源：${parseResult.source_site}` : ''

  const recommendedFormats = useMemo(() => {
    if (!parseResult) return [] as ParsedFormat[]
    return parseResult.formats.filter((item) => item.available)
  }, [parseResult])

  const onSubmit = (evt: FormEvent<HTMLFormElement>) => {
    evt.preventDefault()
    if (!url.trim()) {
      setErrorMessage('请输入分享链接')
      return
    }
    parseMutation.mutate({ url: url.trim() })
  }

  const onCreate = () => createMutation.mutate()

  return (
    <section className="page">
      <Card>
        <CardHeader>
          <CardTitle>AI 风格视频下载工作台</CardTitle>
          <CardDescription>粘贴国内外视频分享链接，解析视频后即可一键创建下载任务</CardDescription>
        </CardHeader>
        <CardContent>
          <form className="parse-form" onSubmit={onSubmit}>
            <label className="form-label" htmlFor="video-url">
              视频链接
            </label>
            <div className="parse-input-wrap">
              <Input
                id="video-url"
                placeholder="https://v.douyin.com/xxx"
                value={url}
                onChange={(evt) => setUrl(evt.target.value)}
                required
              />
              <Button type="submit" disabled={!canSubmit}>
                {parseMutation.isPending ? '解析中...' : '解析视频'}
              </Button>
            </div>
          </form>

          {!token && (
            <p className="helper-text">
              当前未登录，解析/创建需要登录。请先
              <a href={getGitHubAuthorizeUrl()}>前往 GitHub 登录</a>，或到登录页继续。
            </p>
          )}

          <p className="state-text">{parseStateDescription(uiState, errorMessage)}</p>
          {platform && <p className="platform-tag">{platform}</p>}

          {errorMessage && uiState === 'error' && (
            <p className="error-text" role="alert">
              {errorMessage}
            </p>
          )}
          {parseResult && (
            <div className="parse-result">
              <div className="result-header">
                <strong>标题：</strong>
                <span>{parseResult.title || '未返回标题'}</span>
              </div>
              {parseResult.formats.length > 0 && (
                <div className="format-group">
                  <p>选择规格：</p>
                  <div className="format-list" role="radiogroup" aria-label="format-selection">
                    {recommendedFormats.map((item) => (
                      <label key={item.format_id} className="format-item">
                        <input
                          type="radio"
                          name="format"
                          value={item.format_id}
                          checked={formatId === item.format_id}
                          onChange={() => setFormatId(item.format_id)}
                        />
                        <span>{item.label}</span>
                        {item.quality_label && <Badge>{item.quality_label}</Badge>}
                        {item.filesize && <small>{Math.round(item.filesize / 1024 / 1024)} MB</small>}
                        {item.note && <small className="note">{item.note}</small>}
                      </label>
                    ))}
                  </div>
                  <div className="create-actions">
                    <Button type="button" onClick={onCreate} disabled={!canSubmit || !formatId}>
                      {createMutation.isPending ? '创建中...' : '创建下载任务'}
                    </Button>
                  </div>
                </div>
              )}
            </div>
          )}
        </CardContent>
      </Card>
    </section>
  )
}
