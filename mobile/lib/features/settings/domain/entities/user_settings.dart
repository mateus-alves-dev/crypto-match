import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_settings.freezed.dart';
part 'user_settings.g.dart';

@freezed
abstract class MatchPreferences with _$MatchPreferences {
  const factory MatchPreferences({
    @Default(50) int maxDistanceKm,
    @Default(18) int minAge,
    @Default(50) int maxAge,
    @Default(false) bool filterByCryptoInterests,
  }) = _MatchPreferences;

  factory MatchPreferences.fromJson(Map<String, dynamic> json) =>
      _$MatchPreferencesFromJson(json);
}

@freezed
abstract class NotificationSettings with _$NotificationSettings {
  const factory NotificationSettings({
    @Default(true) bool newMatches,
    @Default(true) bool newMessages,
    @Default(true) bool tokenRewards,
    @Default(false) bool appUpdates,
    @Default(true) bool dailyStreak,
  }) = _NotificationSettings;

  factory NotificationSettings.fromJson(Map<String, dynamic> json) =>
      _$NotificationSettingsFromJson(json);
}

@freezed
abstract class PrivacySettings with _$PrivacySettings {
  const factory PrivacySettings({
    @Default(true) bool showOnlineStatus,
    @Default(true) bool showDistance,
    @Default(true) bool profileVisible,
  }) = _PrivacySettings;

  factory PrivacySettings.fromJson(Map<String, dynamic> json) =>
      _$PrivacySettingsFromJson(json);
}

@freezed
abstract class UserSettings with _$UserSettings {
  const factory UserSettings({
    required MatchPreferences matchPreferences,
    required NotificationSettings notificationSettings,
    required PrivacySettings privacySettings,
  }) = _UserSettings;

  factory UserSettings.fromJson(Map<String, dynamic> json) =>
      _$UserSettingsFromJson(json);
}
