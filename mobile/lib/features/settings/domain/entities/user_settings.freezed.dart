// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MatchPreferences _$MatchPreferencesFromJson(Map<String, dynamic> json) {
  return _MatchPreferences.fromJson(json);
}

/// @nodoc
mixin _$MatchPreferences {
  int get maxDistanceKm => throw _privateConstructorUsedError;
  int get minAge => throw _privateConstructorUsedError;
  int get maxAge => throw _privateConstructorUsedError;
  bool get filterByCryptoInterests => throw _privateConstructorUsedError;

  /// Serializes this MatchPreferences to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MatchPreferences
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MatchPreferencesCopyWith<MatchPreferences> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchPreferencesCopyWith<$Res> {
  factory $MatchPreferencesCopyWith(
          MatchPreferences value, $Res Function(MatchPreferences) then) =
      _$MatchPreferencesCopyWithImpl<$Res, MatchPreferences>;
  @useResult
  $Res call(
      {int maxDistanceKm,
      int minAge,
      int maxAge,
      bool filterByCryptoInterests});
}

/// @nodoc
class _$MatchPreferencesCopyWithImpl<$Res, $Val extends MatchPreferences>
    implements $MatchPreferencesCopyWith<$Res> {
  _$MatchPreferencesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MatchPreferences
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? maxDistanceKm = null,
    Object? minAge = null,
    Object? maxAge = null,
    Object? filterByCryptoInterests = null,
  }) {
    return _then(_value.copyWith(
      maxDistanceKm: null == maxDistanceKm
          ? _value.maxDistanceKm
          : maxDistanceKm // ignore: cast_nullable_to_non_nullable
              as int,
      minAge: null == minAge
          ? _value.minAge
          : minAge // ignore: cast_nullable_to_non_nullable
              as int,
      maxAge: null == maxAge
          ? _value.maxAge
          : maxAge // ignore: cast_nullable_to_non_nullable
              as int,
      filterByCryptoInterests: null == filterByCryptoInterests
          ? _value.filterByCryptoInterests
          : filterByCryptoInterests // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MatchPreferencesImplCopyWith<$Res>
    implements $MatchPreferencesCopyWith<$Res> {
  factory _$$MatchPreferencesImplCopyWith(_$MatchPreferencesImpl value,
          $Res Function(_$MatchPreferencesImpl) then) =
      __$$MatchPreferencesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int maxDistanceKm,
      int minAge,
      int maxAge,
      bool filterByCryptoInterests});
}

/// @nodoc
class __$$MatchPreferencesImplCopyWithImpl<$Res>
    extends _$MatchPreferencesCopyWithImpl<$Res, _$MatchPreferencesImpl>
    implements _$$MatchPreferencesImplCopyWith<$Res> {
  __$$MatchPreferencesImplCopyWithImpl(_$MatchPreferencesImpl _value,
      $Res Function(_$MatchPreferencesImpl) _then)
      : super(_value, _then);

  /// Create a copy of MatchPreferences
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? maxDistanceKm = null,
    Object? minAge = null,
    Object? maxAge = null,
    Object? filterByCryptoInterests = null,
  }) {
    return _then(_$MatchPreferencesImpl(
      maxDistanceKm: null == maxDistanceKm
          ? _value.maxDistanceKm
          : maxDistanceKm // ignore: cast_nullable_to_non_nullable
              as int,
      minAge: null == minAge
          ? _value.minAge
          : minAge // ignore: cast_nullable_to_non_nullable
              as int,
      maxAge: null == maxAge
          ? _value.maxAge
          : maxAge // ignore: cast_nullable_to_non_nullable
              as int,
      filterByCryptoInterests: null == filterByCryptoInterests
          ? _value.filterByCryptoInterests
          : filterByCryptoInterests // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MatchPreferencesImpl implements _MatchPreferences {
  const _$MatchPreferencesImpl(
      {this.maxDistanceKm = 50,
      this.minAge = 18,
      this.maxAge = 50,
      this.filterByCryptoInterests = false});

  factory _$MatchPreferencesImpl.fromJson(Map<String, dynamic> json) =>
      _$$MatchPreferencesImplFromJson(json);

  @override
  @JsonKey()
  final int maxDistanceKm;
  @override
  @JsonKey()
  final int minAge;
  @override
  @JsonKey()
  final int maxAge;
  @override
  @JsonKey()
  final bool filterByCryptoInterests;

  @override
  String toString() {
    return 'MatchPreferences(maxDistanceKm: $maxDistanceKm, minAge: $minAge, maxAge: $maxAge, filterByCryptoInterests: $filterByCryptoInterests)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchPreferencesImpl &&
            (identical(other.maxDistanceKm, maxDistanceKm) ||
                other.maxDistanceKm == maxDistanceKm) &&
            (identical(other.minAge, minAge) || other.minAge == minAge) &&
            (identical(other.maxAge, maxAge) || other.maxAge == maxAge) &&
            (identical(
                    other.filterByCryptoInterests, filterByCryptoInterests) ||
                other.filterByCryptoInterests == filterByCryptoInterests));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, maxDistanceKm, minAge, maxAge, filterByCryptoInterests);

  /// Create a copy of MatchPreferences
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MatchPreferencesImplCopyWith<_$MatchPreferencesImpl> get copyWith =>
      __$$MatchPreferencesImplCopyWithImpl<_$MatchPreferencesImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MatchPreferencesImplToJson(
      this,
    );
  }
}

abstract class _MatchPreferences implements MatchPreferences {
  const factory _MatchPreferences(
      {final int maxDistanceKm,
      final int minAge,
      final int maxAge,
      final bool filterByCryptoInterests}) = _$MatchPreferencesImpl;

  factory _MatchPreferences.fromJson(Map<String, dynamic> json) =
      _$MatchPreferencesImpl.fromJson;

  @override
  int get maxDistanceKm;
  @override
  int get minAge;
  @override
  int get maxAge;
  @override
  bool get filterByCryptoInterests;

  /// Create a copy of MatchPreferences
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MatchPreferencesImplCopyWith<_$MatchPreferencesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NotificationSettings _$NotificationSettingsFromJson(Map<String, dynamic> json) {
  return _NotificationSettings.fromJson(json);
}

/// @nodoc
mixin _$NotificationSettings {
  bool get newMatches => throw _privateConstructorUsedError;
  bool get newMessages => throw _privateConstructorUsedError;
  bool get tokenRewards => throw _privateConstructorUsedError;
  bool get appUpdates => throw _privateConstructorUsedError;

  /// Serializes this NotificationSettings to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NotificationSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NotificationSettingsCopyWith<NotificationSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationSettingsCopyWith<$Res> {
  factory $NotificationSettingsCopyWith(NotificationSettings value,
          $Res Function(NotificationSettings) then) =
      _$NotificationSettingsCopyWithImpl<$Res, NotificationSettings>;
  @useResult
  $Res call(
      {bool newMatches, bool newMessages, bool tokenRewards, bool appUpdates});
}

/// @nodoc
class _$NotificationSettingsCopyWithImpl<$Res,
        $Val extends NotificationSettings>
    implements $NotificationSettingsCopyWith<$Res> {
  _$NotificationSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotificationSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newMatches = null,
    Object? newMessages = null,
    Object? tokenRewards = null,
    Object? appUpdates = null,
  }) {
    return _then(_value.copyWith(
      newMatches: null == newMatches
          ? _value.newMatches
          : newMatches // ignore: cast_nullable_to_non_nullable
              as bool,
      newMessages: null == newMessages
          ? _value.newMessages
          : newMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      tokenRewards: null == tokenRewards
          ? _value.tokenRewards
          : tokenRewards // ignore: cast_nullable_to_non_nullable
              as bool,
      appUpdates: null == appUpdates
          ? _value.appUpdates
          : appUpdates // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotificationSettingsImplCopyWith<$Res>
    implements $NotificationSettingsCopyWith<$Res> {
  factory _$$NotificationSettingsImplCopyWith(_$NotificationSettingsImpl value,
          $Res Function(_$NotificationSettingsImpl) then) =
      __$$NotificationSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool newMatches, bool newMessages, bool tokenRewards, bool appUpdates});
}

/// @nodoc
class __$$NotificationSettingsImplCopyWithImpl<$Res>
    extends _$NotificationSettingsCopyWithImpl<$Res, _$NotificationSettingsImpl>
    implements _$$NotificationSettingsImplCopyWith<$Res> {
  __$$NotificationSettingsImplCopyWithImpl(_$NotificationSettingsImpl _value,
      $Res Function(_$NotificationSettingsImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newMatches = null,
    Object? newMessages = null,
    Object? tokenRewards = null,
    Object? appUpdates = null,
  }) {
    return _then(_$NotificationSettingsImpl(
      newMatches: null == newMatches
          ? _value.newMatches
          : newMatches // ignore: cast_nullable_to_non_nullable
              as bool,
      newMessages: null == newMessages
          ? _value.newMessages
          : newMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      tokenRewards: null == tokenRewards
          ? _value.tokenRewards
          : tokenRewards // ignore: cast_nullable_to_non_nullable
              as bool,
      appUpdates: null == appUpdates
          ? _value.appUpdates
          : appUpdates // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationSettingsImpl implements _NotificationSettings {
  const _$NotificationSettingsImpl(
      {this.newMatches = true,
      this.newMessages = true,
      this.tokenRewards = true,
      this.appUpdates = false});

  factory _$NotificationSettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationSettingsImplFromJson(json);

  @override
  @JsonKey()
  final bool newMatches;
  @override
  @JsonKey()
  final bool newMessages;
  @override
  @JsonKey()
  final bool tokenRewards;
  @override
  @JsonKey()
  final bool appUpdates;

  @override
  String toString() {
    return 'NotificationSettings(newMatches: $newMatches, newMessages: $newMessages, tokenRewards: $tokenRewards, appUpdates: $appUpdates)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationSettingsImpl &&
            (identical(other.newMatches, newMatches) ||
                other.newMatches == newMatches) &&
            (identical(other.newMessages, newMessages) ||
                other.newMessages == newMessages) &&
            (identical(other.tokenRewards, tokenRewards) ||
                other.tokenRewards == tokenRewards) &&
            (identical(other.appUpdates, appUpdates) ||
                other.appUpdates == appUpdates));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, newMatches, newMessages, tokenRewards, appUpdates);

  /// Create a copy of NotificationSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationSettingsImplCopyWith<_$NotificationSettingsImpl>
      get copyWith =>
          __$$NotificationSettingsImplCopyWithImpl<_$NotificationSettingsImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationSettingsImplToJson(
      this,
    );
  }
}

abstract class _NotificationSettings implements NotificationSettings {
  const factory _NotificationSettings(
      {final bool newMatches,
      final bool newMessages,
      final bool tokenRewards,
      final bool appUpdates}) = _$NotificationSettingsImpl;

  factory _NotificationSettings.fromJson(Map<String, dynamic> json) =
      _$NotificationSettingsImpl.fromJson;

  @override
  bool get newMatches;
  @override
  bool get newMessages;
  @override
  bool get tokenRewards;
  @override
  bool get appUpdates;

  /// Create a copy of NotificationSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificationSettingsImplCopyWith<_$NotificationSettingsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PrivacySettings _$PrivacySettingsFromJson(Map<String, dynamic> json) {
  return _PrivacySettings.fromJson(json);
}

/// @nodoc
mixin _$PrivacySettings {
  bool get showOnlineStatus => throw _privateConstructorUsedError;
  bool get showDistance => throw _privateConstructorUsedError;
  bool get profileVisible => throw _privateConstructorUsedError;

  /// Serializes this PrivacySettings to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PrivacySettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PrivacySettingsCopyWith<PrivacySettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrivacySettingsCopyWith<$Res> {
  factory $PrivacySettingsCopyWith(
          PrivacySettings value, $Res Function(PrivacySettings) then) =
      _$PrivacySettingsCopyWithImpl<$Res, PrivacySettings>;
  @useResult
  $Res call({bool showOnlineStatus, bool showDistance, bool profileVisible});
}

/// @nodoc
class _$PrivacySettingsCopyWithImpl<$Res, $Val extends PrivacySettings>
    implements $PrivacySettingsCopyWith<$Res> {
  _$PrivacySettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PrivacySettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showOnlineStatus = null,
    Object? showDistance = null,
    Object? profileVisible = null,
  }) {
    return _then(_value.copyWith(
      showOnlineStatus: null == showOnlineStatus
          ? _value.showOnlineStatus
          : showOnlineStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      showDistance: null == showDistance
          ? _value.showDistance
          : showDistance // ignore: cast_nullable_to_non_nullable
              as bool,
      profileVisible: null == profileVisible
          ? _value.profileVisible
          : profileVisible // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PrivacySettingsImplCopyWith<$Res>
    implements $PrivacySettingsCopyWith<$Res> {
  factory _$$PrivacySettingsImplCopyWith(_$PrivacySettingsImpl value,
          $Res Function(_$PrivacySettingsImpl) then) =
      __$$PrivacySettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool showOnlineStatus, bool showDistance, bool profileVisible});
}

/// @nodoc
class __$$PrivacySettingsImplCopyWithImpl<$Res>
    extends _$PrivacySettingsCopyWithImpl<$Res, _$PrivacySettingsImpl>
    implements _$$PrivacySettingsImplCopyWith<$Res> {
  __$$PrivacySettingsImplCopyWithImpl(
      _$PrivacySettingsImpl _value, $Res Function(_$PrivacySettingsImpl) _then)
      : super(_value, _then);

  /// Create a copy of PrivacySettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showOnlineStatus = null,
    Object? showDistance = null,
    Object? profileVisible = null,
  }) {
    return _then(_$PrivacySettingsImpl(
      showOnlineStatus: null == showOnlineStatus
          ? _value.showOnlineStatus
          : showOnlineStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      showDistance: null == showDistance
          ? _value.showDistance
          : showDistance // ignore: cast_nullable_to_non_nullable
              as bool,
      profileVisible: null == profileVisible
          ? _value.profileVisible
          : profileVisible // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PrivacySettingsImpl implements _PrivacySettings {
  const _$PrivacySettingsImpl(
      {this.showOnlineStatus = true,
      this.showDistance = true,
      this.profileVisible = true});

  factory _$PrivacySettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$PrivacySettingsImplFromJson(json);

  @override
  @JsonKey()
  final bool showOnlineStatus;
  @override
  @JsonKey()
  final bool showDistance;
  @override
  @JsonKey()
  final bool profileVisible;

  @override
  String toString() {
    return 'PrivacySettings(showOnlineStatus: $showOnlineStatus, showDistance: $showDistance, profileVisible: $profileVisible)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrivacySettingsImpl &&
            (identical(other.showOnlineStatus, showOnlineStatus) ||
                other.showOnlineStatus == showOnlineStatus) &&
            (identical(other.showDistance, showDistance) ||
                other.showDistance == showDistance) &&
            (identical(other.profileVisible, profileVisible) ||
                other.profileVisible == profileVisible));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, showOnlineStatus, showDistance, profileVisible);

  /// Create a copy of PrivacySettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PrivacySettingsImplCopyWith<_$PrivacySettingsImpl> get copyWith =>
      __$$PrivacySettingsImplCopyWithImpl<_$PrivacySettingsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PrivacySettingsImplToJson(
      this,
    );
  }
}

abstract class _PrivacySettings implements PrivacySettings {
  const factory _PrivacySettings(
      {final bool showOnlineStatus,
      final bool showDistance,
      final bool profileVisible}) = _$PrivacySettingsImpl;

  factory _PrivacySettings.fromJson(Map<String, dynamic> json) =
      _$PrivacySettingsImpl.fromJson;

  @override
  bool get showOnlineStatus;
  @override
  bool get showDistance;
  @override
  bool get profileVisible;

  /// Create a copy of PrivacySettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PrivacySettingsImplCopyWith<_$PrivacySettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserSettings _$UserSettingsFromJson(Map<String, dynamic> json) {
  return _UserSettings.fromJson(json);
}

/// @nodoc
mixin _$UserSettings {
  MatchPreferences get matchPreferences => throw _privateConstructorUsedError;
  NotificationSettings get notificationSettings =>
      throw _privateConstructorUsedError;
  PrivacySettings get privacySettings => throw _privateConstructorUsedError;

  /// Serializes this UserSettings to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserSettingsCopyWith<UserSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserSettingsCopyWith<$Res> {
  factory $UserSettingsCopyWith(
          UserSettings value, $Res Function(UserSettings) then) =
      _$UserSettingsCopyWithImpl<$Res, UserSettings>;
  @useResult
  $Res call(
      {MatchPreferences matchPreferences,
      NotificationSettings notificationSettings,
      PrivacySettings privacySettings});

  $MatchPreferencesCopyWith<$Res> get matchPreferences;
  $NotificationSettingsCopyWith<$Res> get notificationSettings;
  $PrivacySettingsCopyWith<$Res> get privacySettings;
}

/// @nodoc
class _$UserSettingsCopyWithImpl<$Res, $Val extends UserSettings>
    implements $UserSettingsCopyWith<$Res> {
  _$UserSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? matchPreferences = null,
    Object? notificationSettings = null,
    Object? privacySettings = null,
  }) {
    return _then(_value.copyWith(
      matchPreferences: null == matchPreferences
          ? _value.matchPreferences
          : matchPreferences // ignore: cast_nullable_to_non_nullable
              as MatchPreferences,
      notificationSettings: null == notificationSettings
          ? _value.notificationSettings
          : notificationSettings // ignore: cast_nullable_to_non_nullable
              as NotificationSettings,
      privacySettings: null == privacySettings
          ? _value.privacySettings
          : privacySettings // ignore: cast_nullable_to_non_nullable
              as PrivacySettings,
    ) as $Val);
  }

  /// Create a copy of UserSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MatchPreferencesCopyWith<$Res> get matchPreferences {
    return $MatchPreferencesCopyWith<$Res>(_value.matchPreferences, (value) {
      return _then(_value.copyWith(matchPreferences: value) as $Val);
    });
  }

  /// Create a copy of UserSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NotificationSettingsCopyWith<$Res> get notificationSettings {
    return $NotificationSettingsCopyWith<$Res>(_value.notificationSettings,
        (value) {
      return _then(_value.copyWith(notificationSettings: value) as $Val);
    });
  }

  /// Create a copy of UserSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PrivacySettingsCopyWith<$Res> get privacySettings {
    return $PrivacySettingsCopyWith<$Res>(_value.privacySettings, (value) {
      return _then(_value.copyWith(privacySettings: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserSettingsImplCopyWith<$Res>
    implements $UserSettingsCopyWith<$Res> {
  factory _$$UserSettingsImplCopyWith(
          _$UserSettingsImpl value, $Res Function(_$UserSettingsImpl) then) =
      __$$UserSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {MatchPreferences matchPreferences,
      NotificationSettings notificationSettings,
      PrivacySettings privacySettings});

  @override
  $MatchPreferencesCopyWith<$Res> get matchPreferences;
  @override
  $NotificationSettingsCopyWith<$Res> get notificationSettings;
  @override
  $PrivacySettingsCopyWith<$Res> get privacySettings;
}

/// @nodoc
class __$$UserSettingsImplCopyWithImpl<$Res>
    extends _$UserSettingsCopyWithImpl<$Res, _$UserSettingsImpl>
    implements _$$UserSettingsImplCopyWith<$Res> {
  __$$UserSettingsImplCopyWithImpl(
      _$UserSettingsImpl _value, $Res Function(_$UserSettingsImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? matchPreferences = null,
    Object? notificationSettings = null,
    Object? privacySettings = null,
  }) {
    return _then(_$UserSettingsImpl(
      matchPreferences: null == matchPreferences
          ? _value.matchPreferences
          : matchPreferences // ignore: cast_nullable_to_non_nullable
              as MatchPreferences,
      notificationSettings: null == notificationSettings
          ? _value.notificationSettings
          : notificationSettings // ignore: cast_nullable_to_non_nullable
              as NotificationSettings,
      privacySettings: null == privacySettings
          ? _value.privacySettings
          : privacySettings // ignore: cast_nullable_to_non_nullable
              as PrivacySettings,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserSettingsImpl implements _UserSettings {
  const _$UserSettingsImpl(
      {required this.matchPreferences,
      required this.notificationSettings,
      required this.privacySettings});

  factory _$UserSettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserSettingsImplFromJson(json);

  @override
  final MatchPreferences matchPreferences;
  @override
  final NotificationSettings notificationSettings;
  @override
  final PrivacySettings privacySettings;

  @override
  String toString() {
    return 'UserSettings(matchPreferences: $matchPreferences, notificationSettings: $notificationSettings, privacySettings: $privacySettings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserSettingsImpl &&
            (identical(other.matchPreferences, matchPreferences) ||
                other.matchPreferences == matchPreferences) &&
            (identical(other.notificationSettings, notificationSettings) ||
                other.notificationSettings == notificationSettings) &&
            (identical(other.privacySettings, privacySettings) ||
                other.privacySettings == privacySettings));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, matchPreferences, notificationSettings, privacySettings);

  /// Create a copy of UserSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserSettingsImplCopyWith<_$UserSettingsImpl> get copyWith =>
      __$$UserSettingsImplCopyWithImpl<_$UserSettingsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserSettingsImplToJson(
      this,
    );
  }
}

abstract class _UserSettings implements UserSettings {
  const factory _UserSettings(
      {required final MatchPreferences matchPreferences,
      required final NotificationSettings notificationSettings,
      required final PrivacySettings privacySettings}) = _$UserSettingsImpl;

  factory _UserSettings.fromJson(Map<String, dynamic> json) =
      _$UserSettingsImpl.fromJson;

  @override
  MatchPreferences get matchPreferences;
  @override
  NotificationSettings get notificationSettings;
  @override
  PrivacySettings get privacySettings;

  /// Create a copy of UserSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserSettingsImplCopyWith<_$UserSettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
