import { existsSync, readFileSync } from 'node:fs'
import { join } from 'node:path'
import { describe, expect, it } from 'vitest'

const root = process.cwd()

describe('OpenAPI generated client baseline', () => {
  it('提供生成脚本、配置和生成目录', () => {
    const packageJson = JSON.parse(readFileSync(join(root, 'package.json'), 'utf-8')) as {
      scripts: Record<string, string>
      devDependencies: Record<string, string>
    }

    expect(packageJson.scripts['api:generate']).toContain('openapi-ts')
    expect(packageJson.scripts['api:check']).toContain('check-openapi-generated')
    expect(packageJson.devDependencies['@hey-api/openapi-ts']).toBeTruthy()
    expect(existsSync(join(root, 'openapi-ts.config.ts'))).toBe(true)
    expect(existsSync(join(root, 'src/services/generated/index.ts'))).toBe(true)
  })

  it('记录 generated 目录禁止手改说明', () => {
    expect(readFileSync(join(root, 'src/services/generated/README.md'), 'utf-8')).toContain('禁止手工修改')
  })
})
