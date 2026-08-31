# FrameFetch App

[简体中文](README.md) · [Server / Web](https://github.com/StephenQiu30/video-server) · [Documentation](docs/README.md)

[![Flutter quality](https://github.com/StephenQiu30/video-app/actions/workflows/flutter-quality.yml/badge.svg)](https://github.com/StephenQiu30/video-app/actions/workflows/flutter-quality.yml)
[![Flutter 3.44.7](https://img.shields.io/badge/Flutter-3.44.7-02569B?logo=flutter)](https://flutter.dev/)
[![Platforms](https://img.shields.io/badge/platforms-iOS%20%7C%20Android-111827)](#scope-and-limitations)
[![License: MIT](https://img.shields.io/badge/license-MIT-16a34a.svg)](LICENSE)

**FrameFetch is an open-source Flutter client for self-hosted media workflows on iOS and Android.** It connects to [`video-server`](https://github.com/StephenQiu30/video-server) to inspect authorized public-video links, upload local MP4 videos and screenplays, create and track download jobs, access completed media, inspect provider health, and run server-side AI video analysis.

FrameFetch does not run extractors, transcoders, or AI models on the phone. It does not bypass DRM, memberships, regional controls, or provider access rules.

## App preview

<p align="center">
  <img src="docs/images/app-home.png" width="320" alt="FrameFetch iOS home screen for public-video inspection and download workflows" />
  &nbsp;&nbsp;
  <img src="docs/images/app-provider-status.png" width="320" alt="FrameFetch iOS provider health screen backed by a self-hosted video-server" />
</p>

<p align="center">
  <sub>Public-link intake and server provider health on iPhone Simulator · <a href="docs/images/README.md">capture provenance</a></sub>
</p>

## Workflow

1. Review the open-source, self-hosted project overview without signing in.
2. Sign in to a self-hosted `video-server` with the native Bearer session.
3. Paste a public media link you own or are authorized to process.
4. Review the server's access decision, metadata, and available formats.
5. Create a download job and track progress in the native app.
6. Preview or retrieve the completed artifact through a short-lived server authorization.
7. Optionally start a server-side AI analysis and read its structured result.

## Feature status

Version `0.1.0+1` is intended for self-hosted evaluation and open-source collaboration. APIs and UX may still evolve with the server contract.

| Capability | Status | Notes |
| --- | --- | --- |
| Native Bearer authentication and session restore | Available | Access tokens stay in memory; refresh credentials use platform secure storage |
| Public-link inspection, format selection, and job creation | Available | A job is created only after the server returns a downloadable decision |
| History, details, private covers, playback, and file access | Available | Playback depends on platform codec support |
| Video AI analysis | Available | `video-server` runs inference; the app configures jobs and renders results |
| Screenplay document list | Available | Reads real server data with loading, empty, failure, and refresh states |
| Local-video and screenplay upload | Available | System picker, streaming SHA-256, bounded multipart PUT, ETag validation, and real completion requests |
| Document AI and native report export | Planned | Require dedicated contracts, design, and acceptance evidence |
| WebSocket token updates | Planned | Active jobs and analyses currently converge through controlled polling |
| Offline AI, persistent background downloads, offline library | Out of scope for the first release | No mobile extractor or embedded AI model |

See [`docs/README.md`](docs/README.md) for the Design → PRD → Plan → Acceptance history and [`docs/contracts/README.md`](docs/contracts/README.md) for the reviewed App OpenAPI boundary.

## Quick start

Requirements:

- Flutter `3.44.7` stable / Dart `3.12.2`
- Xcode `26.6` for iOS `13+`
- JDK `21` and Android API `24+` for Android
- A reachable [`video-server`](https://github.com/StephenQiu30/video-server) instance

```bash
git clone https://github.com/StephenQiu30/video-app.git
cd video-app
flutter doctor -v
flutter pub get
dart run tool/check.dart
```

Run against a local server from iOS Simulator:

```bash
flutter run \
  --dart-define=VIDEO_SERVER_BASE_URL=http://127.0.0.1:8111
```

Run from Android Emulator:

```bash
flutter run \
  --dart-define=VIDEO_SERVER_BASE_URL=http://10.0.2.2:8111
```

Use a device-reachable address on physical devices. Production builds must use a valid HTTPS origin.

## App and server responsibilities

| `video-app` | `video-server` |
| --- | --- |
| Native iOS/Android UI, routing, accessibility | FastAPI API and Next.js Web platform |
| Bearer session, secure storage, app lifecycle | Identity, roles, ownership, and authorization facts |
| Request orchestration, state, and system file entry points | Inspection, downloads, remuxing, and object storage |
| Playback capability checks and result presentation | Providers, queues, workers, and AI inference |

The app does not maintain parallel server DTOs. Its REST client is generated from a reviewed mobile-only OpenAPI snapshot.

## Stack

- Flutter 3.44.7 and Dart 3.12.2
- Riverpod for state and dependency assembly
- go_router for typed navigation and auth redirects
- Dio plus OpenAPI Generator 7.22.0 for the generated REST client
- Chewie plus video_player for standard controls and device-codec capability checks
- file_selector for Flutter-maintained system file access without broad photo or storage permissions
- flutter_secure_storage for Keychain/Keystore-backed credentials
- shared_preferences for the non-sensitive light/dark theme preference
- Material 3 and ARB localization for Chinese and English

## Security and privacy

- Process only public content you own or are explicitly authorized to use.
- Access tokens stay in memory; refresh credentials use platform secure storage.
- Tokens, cookies, full media URL queries, presigned URLs, user media, and raw AI responses must not enter logs or analytics.
- Inspection, downloading, and AI inference run on the user's `video-server`; explicitly selected local files are sent only through its authorized object-storage sessions.
- Read [`SECURITY.md`](SECURITY.md) before reporting a vulnerability; never disclose credentials or exploit details in a public issue.

## Verification

```bash
flutter pub get
dart format --output=none --set-exit-if-changed .
flutter analyze
flutter test
flutter test integration_test
flutter build apk --debug
flutter build ios --simulator --no-codesign
```

Integration tests require a usable server and device/simulator environment. See [`CONTRIBUTING.md`](CONTRIBUTING.md) for generation and contract-drift checks.

## Scope and limitations

- Android and iOS only; this repository does not enable Flutter Web or desktop platforms.
- Public, single-media workflows and explicitly selected MP4/screenplay files only. Provider cookies, platform secrets, arbitrary downloader arguments, shell input, private-network URLs, DRM, and membership bypasses are not supported.
- Native playback depends on device codecs; incompatible formats can still be retrieved through an authorized server URL.
- No App Store or Google Play binaries are currently published; build from source.

## Contributing

Read [`CONTRIBUTING.md`](CONTRIBUTING.md), [`CODE_OF_CONDUCT.md`](CODE_OF_CONDUCT.md), and [`SECURITY.md`](SECURITY.md). Use this repository for mobile UI, native-session, and device issues. Report API, Web, provider, queue, storage, or AI Worker issues to [`video-server`](https://github.com/StephenQiu30/video-server/issues).

## License

[MIT](LICENSE) © 2026 Stephen Qiu
