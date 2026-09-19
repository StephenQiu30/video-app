abstract final class AppConfig {
  // Mobile VPN relay setup and TLS share this finite connection budget.
  static const apiConnectTimeout = Duration(seconds: 30);
  static const apiReceiveTimeout = Duration(seconds: 185);

  static const serverBaseUrl = String.fromEnvironment(
    'VIDEO_SERVER_BASE_URL',
    defaultValue: 'http://127.0.0.1:8111',
  );
}
