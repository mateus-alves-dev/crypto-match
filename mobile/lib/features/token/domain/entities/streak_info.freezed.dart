// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'streak_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StreakInfo {

 int get currentStreak; int get longestStreak; bool get streakAtRisk; int get shieldCost;
/// Create a copy of StreakInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StreakInfoCopyWith<StreakInfo> get copyWith => _$StreakInfoCopyWithImpl<StreakInfo>(this as StreakInfo, _$identity);

  /// Serializes this StreakInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StreakInfo&&(identical(other.currentStreak, currentStreak) || other.currentStreak == currentStreak)&&(identical(other.longestStreak, longestStreak) || other.longestStreak == longestStreak)&&(identical(other.streakAtRisk, streakAtRisk) || other.streakAtRisk == streakAtRisk)&&(identical(other.shieldCost, shieldCost) || other.shieldCost == shieldCost));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currentStreak,longestStreak,streakAtRisk,shieldCost);

@override
String toString() {
  return 'StreakInfo(currentStreak: $currentStreak, longestStreak: $longestStreak, streakAtRisk: $streakAtRisk, shieldCost: $shieldCost)';
}


}

/// @nodoc
abstract mixin class $StreakInfoCopyWith<$Res>  {
  factory $StreakInfoCopyWith(StreakInfo value, $Res Function(StreakInfo) _then) = _$StreakInfoCopyWithImpl;
@useResult
$Res call({
 int currentStreak, int longestStreak, bool streakAtRisk, int shieldCost
});




}
/// @nodoc
class _$StreakInfoCopyWithImpl<$Res>
    implements $StreakInfoCopyWith<$Res> {
  _$StreakInfoCopyWithImpl(this._self, this._then);

  final StreakInfo _self;
  final $Res Function(StreakInfo) _then;

/// Create a copy of StreakInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentStreak = null,Object? longestStreak = null,Object? streakAtRisk = null,Object? shieldCost = null,}) {
  return _then(_self.copyWith(
currentStreak: null == currentStreak ? _self.currentStreak : currentStreak // ignore: cast_nullable_to_non_nullable
as int,longestStreak: null == longestStreak ? _self.longestStreak : longestStreak // ignore: cast_nullable_to_non_nullable
as int,streakAtRisk: null == streakAtRisk ? _self.streakAtRisk : streakAtRisk // ignore: cast_nullable_to_non_nullable
as bool,shieldCost: null == shieldCost ? _self.shieldCost : shieldCost // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [StreakInfo].
extension StreakInfoPatterns on StreakInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StreakInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StreakInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StreakInfo value)  $default,){
final _that = this;
switch (_that) {
case _StreakInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StreakInfo value)?  $default,){
final _that = this;
switch (_that) {
case _StreakInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int currentStreak,  int longestStreak,  bool streakAtRisk,  int shieldCost)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StreakInfo() when $default != null:
return $default(_that.currentStreak,_that.longestStreak,_that.streakAtRisk,_that.shieldCost);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int currentStreak,  int longestStreak,  bool streakAtRisk,  int shieldCost)  $default,) {final _that = this;
switch (_that) {
case _StreakInfo():
return $default(_that.currentStreak,_that.longestStreak,_that.streakAtRisk,_that.shieldCost);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int currentStreak,  int longestStreak,  bool streakAtRisk,  int shieldCost)?  $default,) {final _that = this;
switch (_that) {
case _StreakInfo() when $default != null:
return $default(_that.currentStreak,_that.longestStreak,_that.streakAtRisk,_that.shieldCost);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StreakInfo implements StreakInfo {
  const _StreakInfo({required this.currentStreak, required this.longestStreak, required this.streakAtRisk, this.shieldCost = 20});
  factory _StreakInfo.fromJson(Map<String, dynamic> json) => _$StreakInfoFromJson(json);

@override final  int currentStreak;
@override final  int longestStreak;
@override final  bool streakAtRisk;
@override@JsonKey() final  int shieldCost;

/// Create a copy of StreakInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StreakInfoCopyWith<_StreakInfo> get copyWith => __$StreakInfoCopyWithImpl<_StreakInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StreakInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StreakInfo&&(identical(other.currentStreak, currentStreak) || other.currentStreak == currentStreak)&&(identical(other.longestStreak, longestStreak) || other.longestStreak == longestStreak)&&(identical(other.streakAtRisk, streakAtRisk) || other.streakAtRisk == streakAtRisk)&&(identical(other.shieldCost, shieldCost) || other.shieldCost == shieldCost));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currentStreak,longestStreak,streakAtRisk,shieldCost);

@override
String toString() {
  return 'StreakInfo(currentStreak: $currentStreak, longestStreak: $longestStreak, streakAtRisk: $streakAtRisk, shieldCost: $shieldCost)';
}


}

/// @nodoc
abstract mixin class _$StreakInfoCopyWith<$Res> implements $StreakInfoCopyWith<$Res> {
  factory _$StreakInfoCopyWith(_StreakInfo value, $Res Function(_StreakInfo) _then) = __$StreakInfoCopyWithImpl;
@override @useResult
$Res call({
 int currentStreak, int longestStreak, bool streakAtRisk, int shieldCost
});




}
/// @nodoc
class __$StreakInfoCopyWithImpl<$Res>
    implements _$StreakInfoCopyWith<$Res> {
  __$StreakInfoCopyWithImpl(this._self, this._then);

  final _StreakInfo _self;
  final $Res Function(_StreakInfo) _then;

/// Create a copy of StreakInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentStreak = null,Object? longestStreak = null,Object? streakAtRisk = null,Object? shieldCost = null,}) {
  return _then(_StreakInfo(
currentStreak: null == currentStreak ? _self.currentStreak : currentStreak // ignore: cast_nullable_to_non_nullable
as int,longestStreak: null == longestStreak ? _self.longestStreak : longestStreak // ignore: cast_nullable_to_non_nullable
as int,streakAtRisk: null == streakAtRisk ? _self.streakAtRisk : streakAtRisk // ignore: cast_nullable_to_non_nullable
as bool,shieldCost: null == shieldCost ? _self.shieldCost : shieldCost // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
