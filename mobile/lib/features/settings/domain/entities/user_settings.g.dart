// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MatchPreferences _$MatchPreferencesFromJson(Map<String, dynamic> json) =>
    _MatchPreferences(
      maxDistanceKm: (json['maxDistanceKm'] as num?)?.toInt() ?? 50,
      minAge: (json['minAge'] as num?)?.toInt() ?? 18,
      maxAge: (json['maxAge'] as num?)?.toInt() ?? 50,
      filterByCryptoInterests:
          json['filterByCryptoInterests'] as bool? ?? false,
    );

Map<String, dynamic> _$MatchPreferencesToJson(_MatchPreferences instance) =>
    <String, dynamic>{
      'maxDistanceKm': instance.maxDistanceKm,
      'minAge': instance.minAge,
      'maxAge': instance.maxAge,
      'filterByCryptoInterests': instance.filterByCryptoInterests,
    };

_NotificationSettings _$NotificationSettingsFromJson(
  Map<String, dynamic> json,
) => _NotificationSettings(
  newMatches: json['newMatches'] as bool? ?? true,
  newMessages: json['newMessages'] as bool? ?? true,
  tokenRewards: json['tokenRewards'] as bool? ?? true,
  appUpdates: json['appUpdates'] as bool? ?? false,
);

Map<String, dynamic> _$NotificationSettingsToJson(
  _NotificationSettings instance,
) => <String, dynamic>{
  'newMatches': instance.newMatches,
  'newMessages': instance.newMessages,
  'tokenRewards': instance.tokenRewards,
  'appUpdates': instance.appUpdates,
};

_PrivacySettings _$PrivacySettingsFromJson(Map<String, dynamic> json) =>
    _PrivacySettings(
      showOnlineStatus: json['showOnlineStatus'] as bool? ?? true,
      showDistance: json['showDistance'] as bool? ?? true,
      profileVisible: json['profileVisible'] as bool? ?? true,
    );

Map<String, dynamic> _$PrivacySettingsToJson(_PrivacySettings instance) =>
    <String, dynamic>{
      'showOnlineStatus': instance.showOnlineStatus,
      'showDistance': instance.showDistance,
      'profileVisible': instance.profileVisible,
    };

_UserSettings _$UserSettingsFromJson(Map<String, dynamic> json) =>
    _UserSettings(
      matchPreferences: MatchPreferences.fromJson(
        json['matchPreferences'] as Map<String, dynamic>,
      ),
      notificationSettings: NotificationSettings.fromJson(
        json['notificationSettings'] as Map<String, dynamic>,
      ),
      privacySettings: PrivacySettings.fromJson(
        json['privacySettings'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$UserSettingsToJson(_UserSettings instance) =>
    <String, dynamic>{
      'matchPreferences': instance.matchPreferences,
      'notificationSettings': instance.notificationSettings,
      'privacySettings': instance.privacySettings,
    };
