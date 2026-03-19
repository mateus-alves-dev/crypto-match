// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'swipe_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SwipeResult {

 Match? get match; double? get newTokenBalance;
/// Create a copy of SwipeResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SwipeResultCopyWith<SwipeResult> get copyWith => _$SwipeResultCopyWithImpl<SwipeResult>(this as SwipeResult, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SwipeResult&&(identical(other.match, match) || other.match == match)&&(identical(other.newTokenBalance, newTokenBalance) || other.newTokenBalance == newTokenBalance));
}


@override
int get hashCode => Object.hash(runtimeType,match,newTokenBalance);

@override
String toString() {
  return 'SwipeResult(match: $match, newTokenBalance: $newTokenBalance)';
}


}

/// @nodoc
abstract mixin class $SwipeResultCopyWith<$Res>  {
  factory $SwipeResultCopyWith(SwipeResult value, $Res Function(SwipeResult) _then) = _$SwipeResultCopyWithImpl;
@useResult
$Res call({
 Match? match, double? newTokenBalance
});


$MatchCopyWith<$Res>? get match;

}
/// @nodoc
class _$SwipeResultCopyWithImpl<$Res>
    implements $SwipeResultCopyWith<$Res> {
  _$SwipeResultCopyWithImpl(this._self, this._then);

  final SwipeResult _self;
  final $Res Function(SwipeResult) _then;

/// Create a copy of SwipeResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? match = freezed,Object? newTokenBalance = freezed,}) {
  return _then(_self.copyWith(
match: freezed == match ? _self.match : match // ignore: cast_nullable_to_non_nullable
as Match?,newTokenBalance: freezed == newTokenBalance ? _self.newTokenBalance : newTokenBalance // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}
/// Create a copy of SwipeResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MatchCopyWith<$Res>? get match {
    if (_self.match == null) {
    return null;
  }

  return $MatchCopyWith<$Res>(_self.match!, (value) {
    return _then(_self.copyWith(match: value));
  });
}
}


/// Adds pattern-matching-related methods to [SwipeResult].
extension SwipeResultPatterns on SwipeResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SwipeResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SwipeResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SwipeResult value)  $default,){
final _that = this;
switch (_that) {
case _SwipeResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SwipeResult value)?  $default,){
final _that = this;
switch (_that) {
case _SwipeResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Match? match,  double? newTokenBalance)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SwipeResult() when $default != null:
return $default(_that.match,_that.newTokenBalance);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Match? match,  double? newTokenBalance)  $default,) {final _that = this;
switch (_that) {
case _SwipeResult():
return $default(_that.match,_that.newTokenBalance);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Match? match,  double? newTokenBalance)?  $default,) {final _that = this;
switch (_that) {
case _SwipeResult() when $default != null:
return $default(_that.match,_that.newTokenBalance);case _:
  return null;

}
}

}

/// @nodoc


class _SwipeResult implements SwipeResult {
  const _SwipeResult({this.match, this.newTokenBalance});
  

@override final  Match? match;
@override final  double? newTokenBalance;

/// Create a copy of SwipeResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SwipeResultCopyWith<_SwipeResult> get copyWith => __$SwipeResultCopyWithImpl<_SwipeResult>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SwipeResult&&(identical(other.match, match) || other.match == match)&&(identical(other.newTokenBalance, newTokenBalance) || other.newTokenBalance == newTokenBalance));
}


@override
int get hashCode => Object.hash(runtimeType,match,newTokenBalance);

@override
String toString() {
  return 'SwipeResult(match: $match, newTokenBalance: $newTokenBalance)';
}


}

/// @nodoc
abstract mixin class _$SwipeResultCopyWith<$Res> implements $SwipeResultCopyWith<$Res> {
  factory _$SwipeResultCopyWith(_SwipeResult value, $Res Function(_SwipeResult) _then) = __$SwipeResultCopyWithImpl;
@override @useResult
$Res call({
 Match? match, double? newTokenBalance
});


@override $MatchCopyWith<$Res>? get match;

}
/// @nodoc
class __$SwipeResultCopyWithImpl<$Res>
    implements _$SwipeResultCopyWith<$Res> {
  __$SwipeResultCopyWithImpl(this._self, this._then);

  final _SwipeResult _self;
  final $Res Function(_SwipeResult) _then;

/// Create a copy of SwipeResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? match = freezed,Object? newTokenBalance = freezed,}) {
  return _then(_SwipeResult(
match: freezed == match ? _self.match : match // ignore: cast_nullable_to_non_nullable
as Match?,newTokenBalance: freezed == newTokenBalance ? _self.newTokenBalance : newTokenBalance // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

/// Create a copy of SwipeResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MatchCopyWith<$Res>? get match {
    if (_self.match == null) {
    return null;
  }

  return $MatchCopyWith<$Res>(_self.match!, (value) {
    return _then(_self.copyWith(match: value));
  });
}
}

// dart format on
