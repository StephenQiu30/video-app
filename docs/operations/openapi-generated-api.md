# OpenAPI Generated API

前端生成 API 的契约来源是后端 FastAPI OpenAPI：

- 本地 Swagger UI：`http://localhost:8000/docs`
- 本地 OpenAPI JSON：`http://localhost:8000/openapi.json`
- CI 校验快照：`docs/openapi/video-server.openapi.json`

本地联调后端时：

```bash
OPENAPI_INPUT=http://localhost:8000/openapi.json npm run api:generate
```

不启动后端、仅校验仓库内生成文件是否同步：

```bash
npm run api:check
```

约定：

- `src/services/generated/` 由 `@hey-api/openapi-ts` 生成，禁止手工修改。
- 页面代码只依赖 `src/services/api.ts` 的业务封装，不直接依赖 generated 方法名。
- `src/services/request.ts` 是 baseURL、token header 和错误归一化的统一接入点。
