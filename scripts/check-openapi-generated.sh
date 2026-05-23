#!/usr/bin/env bash
set -euo pipefail

OPENAPI_INPUT="${OPENAPI_INPUT:-docs/openapi/video-server.openapi.json}" npm run api:generate
cp docs/openapi/generated.README.md src/services/generated/README.md

git diff --exit-code -- src/services/generated src/services/api.ts src/services/request.ts openapi-ts.config.ts package.json package-lock.json
