import 'package:crypto_match/core/network/api_client.dart';
import 'package:crypto_match/features/settings/domain/entities/user_settings.dart';
import 'package:injectable/injectable.dart';

@injectable
class SettingsRemoteDataSource {
  const SettingsRemoteDataSource(this._apiClient);

  final ApiClient _apiClient;

  Future<UserSettings> getSettings() async {
    final response =
        await _apiClient.dio.get<Map<String, dynamic>>('/settings');
    return UserSettings.fromJson(response.data!);
  }

  Future<UserSettings> updateMatchPreferences(
    MatchPreferences preferences,
  ) async {
    final response = await _apiClient.dio.put<Map<String, dynamic>>(
      '/settings/match-preferences',
      data: preferences.toJson(),
    );
    return UserSettings.fromJson(response.data!);
  }

  Future<UserSettings> updateNotificationSettings(
    NotificationSettings settings,
  ) async {
    final response = await _apiClient.dio.put<Map<String, dynamic>>(
      '/settings/notifications',
      data: settings.toJson(),
    );
    return UserSettings.fromJson(response.data!);
  }

  Future<UserSettings> updatePrivacySettings(PrivacySettings settings) async {
    final response = await _apiClient.dio.put<Map<String, dynamic>>(
      '/settings/privacy',
      data: settings.toJson(),
    );
    return UserSettings.fromJson(response.data!);
  }

  Future<void> deleteAccount() async {
    await _apiClient.dio.delete<void>('/user');
  }
}
