// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MatchPreferencesImpl _$$MatchPreferencesImplFromJson(
        Map<String, dynamic> json) =>
    _$MatchPreferencesImpl(
      maxDistanceKm: (json['maxDistanceKm'] as num?)?.toInt() ?? 50,
      minAge: (json['minAge'] as num?)?.toInt() ?? 18,
      maxAge: (json['maxAge'] as num?)?.toInt() ?? 50,
      filterByCryptoInterests:
          json['filterByCryptoInterests'] as bool? ?? false,
    );

Map<String, dynamic> _$$MatchPreferencesImplToJson(
        _$MatchPreferencesImpl instance) =>
    <String, dynamic>{
      'maxDistanceKm': instance.maxDistanceKm,
      'minAge': instance.minAge,
      'maxAge': instance.maxAge,
      'filterByCryptoInterests': instance.filterByCryptoInterests,
    };

_$NotificationSettingsImpl _$$NotificationSettingsImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationSettingsImpl(
      newMatches: json['newMatches'] as bool? ?? true,
      newMessages: json['newMessages'] as bool? ?? true,
      tokenRewards: json['tokenRewards'] as bool? ?? true,
      appUpdates: json['appUpdates'] as bool? ?? false,
    );

Map<String, dynamic> _$$NotificationSettingsImplToJson(
        _$NotificationSettingsImpl instance) =>
    <String, dynamic>{
      'newMatches': instance.newMatches,
      'newMessages': instance.newMessages,
      'tokenRewards': instance.tokenRewards,
      'appUpdates': instance.appUpdates,
    };

_$PrivacySettingsImpl _$$PrivacySettingsImplFromJson(
        Map<String, dynamic> json) =>
    _$PrivacySettingsImpl(
      showOnlineStatus: json['showOnlineStatus'] as bool? ?? true,
      showDistance: json['showDistance'] as bool? ?? true,
      profileVisible: json['profileVisible'] as bool? ?? true,
    );

Map<String, dynamic> _$$PrivacySettingsImplToJson(
        _$PrivacySettingsImpl instance) =>
    <String, dynamic>{
      'showOnlineStatus': instance.showOnlineStatus,
      'showDistance': instance.showDistance,
      'profileVisible': instance.profileVisible,
    };

_$UserSettingsImpl _$$UserSettingsImplFromJson(Map<String, dynamic> json) =>
    _$UserSettingsImpl(
      matchPreferences: MatchPreferences.fromJson(
          json['matchPreferences'] as Map<String, dynamic>),
      notificationSettings: NotificationSettings.fromJson(
          json['notificationSettings'] as Map<String, dynamic>),
      privacySettings: PrivacySettings.fromJson(
          json['privacySettings'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserSettingsImplToJson(_$UserSettingsImpl instance) =>
    <String, dynamic>{
      'matchPreferences': instance.matchPreferences,
      'notificationSettings': instance.notificationSettings,
      'privacySettings': instance.privacySettings,
    };
