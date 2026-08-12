#!/usr/bin/env bash

set -euo pipefail

expected_flutter="3.44.7"
actual_flutter="$(flutter --version | sed -n '1s/^Flutter \([^ ]*\).*/\1/p')"

if [[ "$actual_flutter" != "$expected_flutter" ]]; then
  echo "Expected Flutter $expected_flutter, found $actual_flutter." >&2
  exit 1
fi

flutter pub get
flutter gen-l10n
dart run build_runner build
dart format --output=none --set-exit-if-changed .
flutter analyze
flutter test
