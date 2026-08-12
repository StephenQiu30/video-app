#!/usr/bin/env bash

set -euo pipefail

project_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd -P)"
schema_path="$project_root/contracts/openapi/video-server.openapi.json"
output_path="$project_root/packages/video_server_api"

if [[ ! -f "$schema_path" ]]; then
  echo "Missing frozen mobile OpenAPI contract: $schema_path" >&2
  echo "Do not generate from the browser-cookie contract." >&2
  exit 1
fi

command -v docker >/dev/null 2>&1 || {
  echo "Docker is required to run the pinned OpenAPI Generator." >&2
  exit 1
}

docker run --rm \
  --user "$(id -u):$(id -g)" \
  --volume "$project_root:/local" \
  openapitools/openapi-generator-cli:v7.22.0 generate \
  --input-spec /local/contracts/openapi/video-server.openapi.json \
  --generator-name dart-dio \
  --output /local/packages/video_server_api \
  --config /local/tool/openapi/config.yaml

dart format "$output_path"
