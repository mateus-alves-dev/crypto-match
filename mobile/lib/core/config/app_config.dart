abstract final class AppConfig {
  static const String apiBaseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'http://localhost:3000',
  );

  static const String appEnv = String.fromEnvironment(
    'APP_ENV',
    defaultValue: 'dev',
  );

  static const bool enableLogs = bool.fromEnvironment(
    'ENABLE_LOGS',
    defaultValue: true,
  );

  static bool get isProduction => appEnv == 'prod';

  static bool get isDevelopment => appEnv == 'dev';
}
