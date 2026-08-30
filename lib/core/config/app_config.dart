abstract final class AppConfig {
  static const serverBaseUrl = String.fromEnvironment(
    'VIDEO_SERVER_BASE_URL',
    defaultValue: 'http://127.0.0.1:8000',
  );
}
