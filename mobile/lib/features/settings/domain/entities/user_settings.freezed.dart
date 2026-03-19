// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MatchPreferences {

 int get maxDistanceKm; int get minAge; int get maxAge; bool get filterByCryptoInterests;
/// Create a copy of MatchPreferences
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatchPreferencesCopyWith<MatchPreferences> get copyWith => _$MatchPreferencesCopyWithImpl<MatchPreferences>(this as MatchPreferences, _$identity);

  /// Serializes this MatchPreferences to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatchPreferences&&(identical(other.maxDistanceKm, maxDistanceKm) || other.maxDistanceKm == maxDistanceKm)&&(identical(other.minAge, minAge) || other.minAge == minAge)&&(identical(other.maxAge, maxAge) || other.maxAge == maxAge)&&(identical(other.filterByCryptoInterests, filterByCryptoInterests) || other.filterByCryptoInterests == filterByCryptoInterests));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,maxDistanceKm,minAge,maxAge,filterByCryptoInterests);

@override
String toString() {
  return 'MatchPreferences(maxDistanceKm: $maxDistanceKm, minAge: $minAge, maxAge: $maxAge, filterByCryptoInterests: $filterByCryptoInterests)';
}


}

/// @nodoc
abstract mixin class $MatchPreferencesCopyWith<$Res>  {
  factory $MatchPreferencesCopyWith(MatchPreferences value, $Res Function(MatchPreferences) _then) = _$MatchPreferencesCopyWithImpl;
@useResult
$Res call({
 int maxDistanceKm, int minAge, int maxAge, bool filterByCryptoInterests
});




}
/// @nodoc
class _$MatchPreferencesCopyWithImpl<$Res>
    implements $MatchPreferencesCopyWith<$Res> {
  _$MatchPreferencesCopyWithImpl(this._self, this._then);

  final MatchPreferences _self;
  final $Res Function(MatchPreferences) _then;

/// Create a copy of MatchPreferences
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? maxDistanceKm = null,Object? minAge = null,Object? maxAge = null,Object? filterByCryptoInterests = null,}) {
  return _then(_self.copyWith(
maxDistanceKm: null == maxDistanceKm ? _self.maxDistanceKm : maxDistanceKm // ignore: cast_nullable_to_non_nullable
as int,minAge: null == minAge ? _self.minAge : minAge // ignore: cast_nullable_to_non_nullable
as int,maxAge: null == maxAge ? _self.maxAge : maxAge // ignore: cast_nullable_to_non_nullable
as int,filterByCryptoInterests: null == filterByCryptoInterests ? _self.filterByCryptoInterests : filterByCryptoInterests // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [MatchPreferences].
extension MatchPreferencesPatterns on MatchPreferences {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MatchPreferences value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MatchPreferences() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MatchPreferences value)  $default,){
final _that = this;
switch (_that) {
case _MatchPreferences():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MatchPreferences value)?  $default,){
final _that = this;
switch (_that) {
case _MatchPreferences() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int maxDistanceKm,  int minAge,  int maxAge,  bool filterByCryptoInterests)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MatchPreferences() when $default != null:
return $default(_that.maxDistanceKm,_that.minAge,_that.maxAge,_that.filterByCryptoInterests);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int maxDistanceKm,  int minAge,  int maxAge,  bool filterByCryptoInterests)  $default,) {final _that = this;
switch (_that) {
case _MatchPreferences():
return $default(_that.maxDistanceKm,_that.minAge,_that.maxAge,_that.filterByCryptoInterests);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int maxDistanceKm,  int minAge,  int maxAge,  bool filterByCryptoInterests)?  $default,) {final _that = this;
switch (_that) {
case _MatchPreferences() when $default != null:
return $default(_that.maxDistanceKm,_that.minAge,_that.maxAge,_that.filterByCryptoInterests);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MatchPreferences implements MatchPreferences {
  const _MatchPreferences({this.maxDistanceKm = 50, this.minAge = 18, this.maxAge = 50, this.filterByCryptoInterests = false});
  factory _MatchPreferences.fromJson(Map<String, dynamic> json) => _$MatchPreferencesFromJson(json);

@override@JsonKey() final  int maxDistanceKm;
@override@JsonKey() final  int minAge;
@override@JsonKey() final  int maxAge;
@override@JsonKey() final  bool filterByCryptoInterests;

/// Create a copy of MatchPreferences
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MatchPreferencesCopyWith<_MatchPreferences> get copyWith => __$MatchPreferencesCopyWithImpl<_MatchPreferences>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MatchPreferencesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MatchPreferences&&(identical(other.maxDistanceKm, maxDistanceKm) || other.maxDistanceKm == maxDistanceKm)&&(identical(other.minAge, minAge) || other.minAge == minAge)&&(identical(other.maxAge, maxAge) || other.maxAge == maxAge)&&(identical(other.filterByCryptoInterests, filterByCryptoInterests) || other.filterByCryptoInterests == filterByCryptoInterests));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,maxDistanceKm,minAge,maxAge,filterByCryptoInterests);

@override
String toString() {
  return 'MatchPreferences(maxDistanceKm: $maxDistanceKm, minAge: $minAge, maxAge: $maxAge, filterByCryptoInterests: $filterByCryptoInterests)';
}


}

/// @nodoc
abstract mixin class _$MatchPreferencesCopyWith<$Res> implements $MatchPreferencesCopyWith<$Res> {
  factory _$MatchPreferencesCopyWith(_MatchPreferences value, $Res Function(_MatchPreferences) _then) = __$MatchPreferencesCopyWithImpl;
@override @useResult
$Res call({
 int maxDistanceKm, int minAge, int maxAge, bool filterByCryptoInterests
});




}
/// @nodoc
class __$MatchPreferencesCopyWithImpl<$Res>
    implements _$MatchPreferencesCopyWith<$Res> {
  __$MatchPreferencesCopyWithImpl(this._self, this._then);

  final _MatchPreferences _self;
  final $Res Function(_MatchPreferences) _then;

/// Create a copy of MatchPreferences
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? maxDistanceKm = null,Object? minAge = null,Object? maxAge = null,Object? filterByCryptoInterests = null,}) {
  return _then(_MatchPreferences(
maxDistanceKm: null == maxDistanceKm ? _self.maxDistanceKm : maxDistanceKm // ignore: cast_nullable_to_non_nullable
as int,minAge: null == minAge ? _self.minAge : minAge // ignore: cast_nullable_to_non_nullable
as int,maxAge: null == maxAge ? _self.maxAge : maxAge // ignore: cast_nullable_to_non_nullable
as int,filterByCryptoInterests: null == filterByCryptoInterests ? _self.filterByCryptoInterests : filterByCryptoInterests // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$NotificationSettings {

 bool get newMatches; bool get newMessages; bool get tokenRewards; bool get appUpdates; bool get dailyStreak;
/// Create a copy of NotificationSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationSettingsCopyWith<NotificationSettings> get copyWith => _$NotificationSettingsCopyWithImpl<NotificationSettings>(this as NotificationSettings, _$identity);

  /// Serializes this NotificationSettings to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationSettings&&(identical(other.newMatches, newMatches) || other.newMatches == newMatches)&&(identical(other.newMessages, newMessages) || other.newMessages == newMessages)&&(identical(other.tokenRewards, tokenRewards) || other.tokenRewards == tokenRewards)&&(identical(other.appUpdates, appUpdates) || other.appUpdates == appUpdates)&&(identical(other.dailyStreak, dailyStreak) || other.dailyStreak == dailyStreak));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,newMatches,newMessages,tokenRewards,appUpdates,dailyStreak);

@override
String toString() {
  return 'NotificationSettings(newMatches: $newMatches, newMessages: $newMessages, tokenRewards: $tokenRewards, appUpdates: $appUpdates, dailyStreak: $dailyStreak)';
}


}

/// @nodoc
abstract mixin class $NotificationSettingsCopyWith<$Res>  {
  factory $NotificationSettingsCopyWith(NotificationSettings value, $Res Function(NotificationSettings) _then) = _$NotificationSettingsCopyWithImpl;
@useResult
$Res call({
 bool newMatches, bool newMessages, bool tokenRewards, bool appUpdates, bool dailyStreak
});




}
/// @nodoc
class _$NotificationSettingsCopyWithImpl<$Res>
    implements $NotificationSettingsCopyWith<$Res> {
  _$NotificationSettingsCopyWithImpl(this._self, this._then);

  final NotificationSettings _self;
  final $Res Function(NotificationSettings) _then;

/// Create a copy of NotificationSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? newMatches = null,Object? newMessages = null,Object? tokenRewards = null,Object? appUpdates = null,Object? dailyStreak = null,}) {
  return _then(_self.copyWith(
newMatches: null == newMatches ? _self.newMatches : newMatches // ignore: cast_nullable_to_non_nullable
as bool,newMessages: null == newMessages ? _self.newMessages : newMessages // ignore: cast_nullable_to_non_nullable
as bool,tokenRewards: null == tokenRewards ? _self.tokenRewards : tokenRewards // ignore: cast_nullable_to_non_nullable
as bool,appUpdates: null == appUpdates ? _self.appUpdates : appUpdates // ignore: cast_nullable_to_non_nullable
as bool,dailyStreak: null == dailyStreak ? _self.dailyStreak : dailyStreak // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [NotificationSettings].
extension NotificationSettingsPatterns on NotificationSettings {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationSettings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationSettings() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationSettings value)  $default,){
final _that = this;
switch (_that) {
case _NotificationSettings():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationSettings value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationSettings() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool newMatches,  bool newMessages,  bool tokenRewards,  bool appUpdates,  bool dailyStreak)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationSettings() when $default != null:
return $default(_that.newMatches,_that.newMessages,_that.tokenRewards,_that.appUpdates,_that.dailyStreak);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool newMatches,  bool newMessages,  bool tokenRewards,  bool appUpdates,  bool dailyStreak)  $default,) {final _that = this;
switch (_that) {
case _NotificationSettings():
return $default(_that.newMatches,_that.newMessages,_that.tokenRewards,_that.appUpdates,_that.dailyStreak);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool newMatches,  bool newMessages,  bool tokenRewards,  bool appUpdates,  bool dailyStreak)?  $default,) {final _that = this;
switch (_that) {
case _NotificationSettings() when $default != null:
return $default(_that.newMatches,_that.newMessages,_that.tokenRewards,_that.appUpdates,_that.dailyStreak);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NotificationSettings implements NotificationSettings {
  const _NotificationSettings({this.newMatches = true, this.newMessages = true, this.tokenRewards = true, this.appUpdates = false, this.dailyStreak = true});
  factory _NotificationSettings.fromJson(Map<String, dynamic> json) => _$NotificationSettingsFromJson(json);

@override@JsonKey() final  bool newMatches;
@override@JsonKey() final  bool newMessages;
@override@JsonKey() final  bool tokenRewards;
@override@JsonKey() final  bool appUpdates;
@override@JsonKey() final  bool dailyStreak;

/// Create a copy of NotificationSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationSettingsCopyWith<_NotificationSettings> get copyWith => __$NotificationSettingsCopyWithImpl<_NotificationSettings>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NotificationSettingsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationSettings&&(identical(other.newMatches, newMatches) || other.newMatches == newMatches)&&(identical(other.newMessages, newMessages) || other.newMessages == newMessages)&&(identical(other.tokenRewards, tokenRewards) || other.tokenRewards == tokenRewards)&&(identical(other.appUpdates, appUpdates) || other.appUpdates == appUpdates)&&(identical(other.dailyStreak, dailyStreak) || other.dailyStreak == dailyStreak));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,newMatches,newMessages,tokenRewards,appUpdates,dailyStreak);

@override
String toString() {
  return 'NotificationSettings(newMatches: $newMatches, newMessages: $newMessages, tokenRewards: $tokenRewards, appUpdates: $appUpdates, dailyStreak: $dailyStreak)';
}


}

/// @nodoc
abstract mixin class _$NotificationSettingsCopyWith<$Res> implements $NotificationSettingsCopyWith<$Res> {
  factory _$NotificationSettingsCopyWith(_NotificationSettings value, $Res Function(_NotificationSettings) _then) = __$NotificationSettingsCopyWithImpl;
@override @useResult
$Res call({
 bool newMatches, bool newMessages, bool tokenRewards, bool appUpdates, bool dailyStreak
});




}
/// @nodoc
class __$NotificationSettingsCopyWithImpl<$Res>
    implements _$NotificationSettingsCopyWith<$Res> {
  __$NotificationSettingsCopyWithImpl(this._self, this._then);

  final _NotificationSettings _self;
  final $Res Function(_NotificationSettings) _then;

/// Create a copy of NotificationSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? newMatches = null,Object? newMessages = null,Object? tokenRewards = null,Object? appUpdates = null,Object? dailyStreak = null,}) {
  return _then(_NotificationSettings(
newMatches: null == newMatches ? _self.newMatches : newMatches // ignore: cast_nullable_to_non_nullable
as bool,newMessages: null == newMessages ? _self.newMessages : newMessages // ignore: cast_nullable_to_non_nullable
as bool,tokenRewards: null == tokenRewards ? _self.tokenRewards : tokenRewards // ignore: cast_nullable_to_non_nullable
as bool,appUpdates: null == appUpdates ? _self.appUpdates : appUpdates // ignore: cast_nullable_to_non_nullable
as bool,dailyStreak: null == dailyStreak ? _self.dailyStreak : dailyStreak // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$PrivacySettings {

 bool get showOnlineStatus; bool get showDistance; bool get profileVisible;
/// Create a copy of PrivacySettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PrivacySettingsCopyWith<PrivacySettings> get copyWith => _$PrivacySettingsCopyWithImpl<PrivacySettings>(this as PrivacySettings, _$identity);

  /// Serializes this PrivacySettings to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrivacySettings&&(identical(other.showOnlineStatus, showOnlineStatus) || other.showOnlineStatus == showOnlineStatus)&&(identical(other.showDistance, showDistance) || other.showDistance == showDistance)&&(identical(other.profileVisible, profileVisible) || other.profileVisible == profileVisible));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,showOnlineStatus,showDistance,profileVisible);

@override
String toString() {
  return 'PrivacySettings(showOnlineStatus: $showOnlineStatus, showDistance: $showDistance, profileVisible: $profileVisible)';
}


}

/// @nodoc
abstract mixin class $PrivacySettingsCopyWith<$Res>  {
  factory $PrivacySettingsCopyWith(PrivacySettings value, $Res Function(PrivacySettings) _then) = _$PrivacySettingsCopyWithImpl;
@useResult
$Res call({
 bool showOnlineStatus, bool showDistance, bool profileVisible
});




}
/// @nodoc
class _$PrivacySettingsCopyWithImpl<$Res>
    implements $PrivacySettingsCopyWith<$Res> {
  _$PrivacySettingsCopyWithImpl(this._self, this._then);

  final PrivacySettings _self;
  final $Res Function(PrivacySettings) _then;

/// Create a copy of PrivacySettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? showOnlineStatus = null,Object? showDistance = null,Object? profileVisible = null,}) {
  return _then(_self.copyWith(
showOnlineStatus: null == showOnlineStatus ? _self.showOnlineStatus : showOnlineStatus // ignore: cast_nullable_to_non_nullable
as bool,showDistance: null == showDistance ? _self.showDistance : showDistance // ignore: cast_nullable_to_non_nullable
as bool,profileVisible: null == profileVisible ? _self.profileVisible : profileVisible // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PrivacySettings].
extension PrivacySettingsPatterns on PrivacySettings {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PrivacySettings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PrivacySettings() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PrivacySettings value)  $default,){
final _that = this;
switch (_that) {
case _PrivacySettings():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PrivacySettings value)?  $default,){
final _that = this;
switch (_that) {
case _PrivacySettings() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool showOnlineStatus,  bool showDistance,  bool profileVisible)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PrivacySettings() when $default != null:
return $default(_that.showOnlineStatus,_that.showDistance,_that.profileVisible);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool showOnlineStatus,  bool showDistance,  bool profileVisible)  $default,) {final _that = this;
switch (_that) {
case _PrivacySettings():
return $default(_that.showOnlineStatus,_that.showDistance,_that.profileVisible);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool showOnlineStatus,  bool showDistance,  bool profileVisible)?  $default,) {final _that = this;
switch (_that) {
case _PrivacySettings() when $default != null:
return $default(_that.showOnlineStatus,_that.showDistance,_that.profileVisible);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PrivacySettings implements PrivacySettings {
  const _PrivacySettings({this.showOnlineStatus = true, this.showDistance = true, this.profileVisible = true});
  factory _PrivacySettings.fromJson(Map<String, dynamic> json) => _$PrivacySettingsFromJson(json);

@override@JsonKey() final  bool showOnlineStatus;
@override@JsonKey() final  bool showDistance;
@override@JsonKey() final  bool profileVisible;

/// Create a copy of PrivacySettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PrivacySettingsCopyWith<_PrivacySettings> get copyWith => __$PrivacySettingsCopyWithImpl<_PrivacySettings>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PrivacySettingsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PrivacySettings&&(identical(other.showOnlineStatus, showOnlineStatus) || other.showOnlineStatus == showOnlineStatus)&&(identical(other.showDistance, showDistance) || other.showDistance == showDistance)&&(identical(other.profileVisible, profileVisible) || other.profileVisible == profileVisible));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,showOnlineStatus,showDistance,profileVisible);

@override
String toString() {
  return 'PrivacySettings(showOnlineStatus: $showOnlineStatus, showDistance: $showDistance, profileVisible: $profileVisible)';
}


}

/// @nodoc
abstract mixin class _$PrivacySettingsCopyWith<$Res> implements $PrivacySettingsCopyWith<$Res> {
  factory _$PrivacySettingsCopyWith(_PrivacySettings value, $Res Function(_PrivacySettings) _then) = __$PrivacySettingsCopyWithImpl;
@override @useResult
$Res call({
 bool showOnlineStatus, bool showDistance, bool profileVisible
});




}
/// @nodoc
class __$PrivacySettingsCopyWithImpl<$Res>
    implements _$PrivacySettingsCopyWith<$Res> {
  __$PrivacySettingsCopyWithImpl(this._self, this._then);

  final _PrivacySettings _self;
  final $Res Function(_PrivacySettings) _then;

/// Create a copy of PrivacySettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? showOnlineStatus = null,Object? showDistance = null,Object? profileVisible = null,}) {
  return _then(_PrivacySettings(
showOnlineStatus: null == showOnlineStatus ? _self.showOnlineStatus : showOnlineStatus // ignore: cast_nullable_to_non_nullable
as bool,showDistance: null == showDistance ? _self.showDistance : showDistance // ignore: cast_nullable_to_non_nullable
as bool,profileVisible: null == profileVisible ? _self.profileVisible : profileVisible // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$UserSettings {

 MatchPreferences get matchPreferences; NotificationSettings get notificationSettings; PrivacySettings get privacySettings;
/// Create a copy of UserSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserSettingsCopyWith<UserSettings> get copyWith => _$UserSettingsCopyWithImpl<UserSettings>(this as UserSettings, _$identity);

  /// Serializes this UserSettings to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserSettings&&(identical(other.matchPreferences, matchPreferences) || other.matchPreferences == matchPreferences)&&(identical(other.notificationSettings, notificationSettings) || other.notificationSettings == notificationSettings)&&(identical(other.privacySettings, privacySettings) || other.privacySettings == privacySettings));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,matchPreferences,notificationSettings,privacySettings);

@override
String toString() {
  return 'UserSettings(matchPreferences: $matchPreferences, notificationSettings: $notificationSettings, privacySettings: $privacySettings)';
}


}

/// @nodoc
abstract mixin class $UserSettingsCopyWith<$Res>  {
  factory $UserSettingsCopyWith(UserSettings value, $Res Function(UserSettings) _then) = _$UserSettingsCopyWithImpl;
@useResult
$Res call({
 MatchPreferences matchPreferences, NotificationSettings notificationSettings, PrivacySettings privacySettings
});


$MatchPreferencesCopyWith<$Res> get matchPreferences;$NotificationSettingsCopyWith<$Res> get notificationSettings;$PrivacySettingsCopyWith<$Res> get privacySettings;

}
/// @nodoc
class _$UserSettingsCopyWithImpl<$Res>
    implements $UserSettingsCopyWith<$Res> {
  _$UserSettingsCopyWithImpl(this._self, this._then);

  final UserSettings _self;
  final $Res Function(UserSettings) _then;

/// Create a copy of UserSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? matchPreferences = null,Object? notificationSettings = null,Object? privacySettings = null,}) {
  return _then(_self.copyWith(
matchPreferences: null == matchPreferences ? _self.matchPreferences : matchPreferences // ignore: cast_nullable_to_non_nullable
as MatchPreferences,notificationSettings: null == notificationSettings ? _self.notificationSettings : notificationSettings // ignore: cast_nullable_to_non_nullable
as NotificationSettings,privacySettings: null == privacySettings ? _self.privacySettings : privacySettings // ignore: cast_nullable_to_non_nullable
as PrivacySettings,
  ));
}
/// Create a copy of UserSettings
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MatchPreferencesCopyWith<$Res> get matchPreferences {
  
  return $MatchPreferencesCopyWith<$Res>(_self.matchPreferences, (value) {
    return _then(_self.copyWith(matchPreferences: value));
  });
}/// Create a copy of UserSettings
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NotificationSettingsCopyWith<$Res> get notificationSettings {
  
  return $NotificationSettingsCopyWith<$Res>(_self.notificationSettings, (value) {
    return _then(_self.copyWith(notificationSettings: value));
  });
}/// Create a copy of UserSettings
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PrivacySettingsCopyWith<$Res> get privacySettings {
  
  return $PrivacySettingsCopyWith<$Res>(_self.privacySettings, (value) {
    return _then(_self.copyWith(privacySettings: value));
  });
}
}


/// Adds pattern-matching-related methods to [UserSettings].
extension UserSettingsPatterns on UserSettings {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserSettings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserSettings() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserSettings value)  $default,){
final _that = this;
switch (_that) {
case _UserSettings():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserSettings value)?  $default,){
final _that = this;
switch (_that) {
case _UserSettings() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( MatchPreferences matchPreferences,  NotificationSettings notificationSettings,  PrivacySettings privacySettings)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserSettings() when $default != null:
return $default(_that.matchPreferences,_that.notificationSettings,_that.privacySettings);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( MatchPreferences matchPreferences,  NotificationSettings notificationSettings,  PrivacySettings privacySettings)  $default,) {final _that = this;
switch (_that) {
case _UserSettings():
return $default(_that.matchPreferences,_that.notificationSettings,_that.privacySettings);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( MatchPreferences matchPreferences,  NotificationSettings notificationSettings,  PrivacySettings privacySettings)?  $default,) {final _that = this;
switch (_that) {
case _UserSettings() when $default != null:
return $default(_that.matchPreferences,_that.notificationSettings,_that.privacySettings);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserSettings implements UserSettings {
  const _UserSettings({required this.matchPreferences, required this.notificationSettings, required this.privacySettings});
  factory _UserSettings.fromJson(Map<String, dynamic> json) => _$UserSettingsFromJson(json);

@override final  MatchPreferences matchPreferences;
@override final  NotificationSettings notificationSettings;
@override final  PrivacySettings privacySettings;

/// Create a copy of UserSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserSettingsCopyWith<_UserSettings> get copyWith => __$UserSettingsCopyWithImpl<_UserSettings>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserSettingsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserSettings&&(identical(other.matchPreferences, matchPreferences) || other.matchPreferences == matchPreferences)&&(identical(other.notificationSettings, notificationSettings) || other.notificationSettings == notificationSettings)&&(identical(other.privacySettings, privacySettings) || other.privacySettings == privacySettings));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,matchPreferences,notificationSettings,privacySettings);

@override
String toString() {
  return 'UserSettings(matchPreferences: $matchPreferences, notificationSettings: $notificationSettings, privacySettings: $privacySettings)';
}


}

/// @nodoc
abstract mixin class _$UserSettingsCopyWith<$Res> implements $UserSettingsCopyWith<$Res> {
  factory _$UserSettingsCopyWith(_UserSettings value, $Res Function(_UserSettings) _then) = __$UserSettingsCopyWithImpl;
@override @useResult
$Res call({
 MatchPreferences matchPreferences, NotificationSettings notificationSettings, PrivacySettings privacySettings
});


@override $MatchPreferencesCopyWith<$Res> get matchPreferences;@override $NotificationSettingsCopyWith<$Res> get notificationSettings;@override $PrivacySettingsCopyWith<$Res> get privacySettings;

}
/// @nodoc
class __$UserSettingsCopyWithImpl<$Res>
    implements _$UserSettingsCopyWith<$Res> {
  __$UserSettingsCopyWithImpl(this._self, this._then);

  final _UserSettings _self;
  final $Res Function(_UserSettings) _then;

/// Create a copy of UserSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? matchPreferences = null,Object? notificationSettings = null,Object? privacySettings = null,}) {
  return _then(_UserSettings(
matchPreferences: null == matchPreferences ? _self.matchPreferences : matchPreferences // ignore: cast_nullable_to_non_nullable
as MatchPreferences,notificationSettings: null == notificationSettings ? _self.notificationSettings : notificationSettings // ignore: cast_nullable_to_non_nullable
as NotificationSettings,privacySettings: null == privacySettings ? _self.privacySettings : privacySettings // ignore: cast_nullable_to_non_nullable
as PrivacySettings,
  ));
}

/// Create a copy of UserSettings
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MatchPreferencesCopyWith<$Res> get matchPreferences {
  
  return $MatchPreferencesCopyWith<$Res>(_self.matchPreferences, (value) {
    return _then(_self.copyWith(matchPreferences: value));
  });
}/// Create a copy of UserSettings
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NotificationSettingsCopyWith<$Res> get notificationSettings {
  
  return $NotificationSettingsCopyWith<$Res>(_self.notificationSettings, (value) {
    return _then(_self.copyWith(notificationSettings: value));
  });
}/// Create a copy of UserSettings
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PrivacySettingsCopyWith<$Res> get privacySettings {
  
  return $PrivacySettingsCopyWith<$Res>(_self.privacySettings, (value) {
    return _then(_self.copyWith(privacySettings: value));
  });
}
}

// dart format on
