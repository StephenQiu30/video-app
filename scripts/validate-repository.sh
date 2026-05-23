#!/usr/bin/env bash
set -euo pipefail

required_files=(
  "README.md"
  "AGENTS.md"
  "AGENTS.local.md"
  ".github/pull_request_template.md"
  ".github/workflows/ci.yml"
  "Dockerfile"
  "docker-compose.yml"
  "nginx.conf"
  "docs/README.md"
  "docs/TEMPLATE.md"
  "docs/plans/README.md"
  "docs/design/README.md"
  "docs/acceptance/README.md"
  "docs/operations/README.md"
  "package.json"
)

for file in "${required_files[@]}"; do
  test -f "$file"
done

grep -q "Test-first Evidence" .github/pull_request_template.md
grep -q "test:" AGENTS.md
grep -q "impl:" AGENTS.md
grep -q "docs/" AGENTS.md

git diff --check
