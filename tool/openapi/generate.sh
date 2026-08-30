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

pubspec_path="$output_path/pubspec.yaml"
temporary_pubspec="$pubspec_path.tmp"
awk '
  $0 == "  sdk: '\''>=2.18.0 <4.0.0'\''" { print "  sdk: '\''>=3.0.0 <4.0.0'\''"; next }
  { print }
' "$pubspec_path" > "$temporary_pubspec"
mv "$temporary_pubspec" "$pubspec_path"

optional_path="$output_path/lib/lib/optional.dart"
temporary_optional="$optional_path.tmp"
awk '
  {
    sub(/Object\? readOptionalValue\(Map map,/, "Object? readOptionalValue(Map<dynamic, dynamic> map,")
    print
  }
' "$optional_path" > "$temporary_optional"
mv "$temporary_optional" "$optional_path"

(
  cd "$output_path"
  dart pub get
  dart run build_runner build
  dart fix --apply --code=unused_import
  dart format .
)
