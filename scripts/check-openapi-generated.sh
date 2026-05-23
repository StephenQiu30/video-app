#!/usr/bin/env bash
set -euo pipefail

OPENAPI_INPUT="${OPENAPI_INPUT:-docs/openapi/video-server.openapi.json}" npm run openapi

git diff --exit-code -- src/services docs/openapi package.json package-lock.json
