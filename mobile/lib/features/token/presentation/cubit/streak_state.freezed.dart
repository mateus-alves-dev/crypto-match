// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'streak_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StreakState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StreakState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'StreakState()';
}


}

/// @nodoc
class $StreakStateCopyWith<$Res>  {
$StreakStateCopyWith(StreakState _, $Res Function(StreakState) __);
}


/// Adds pattern-matching-related methods to [StreakState].
extension StreakStatePatterns on StreakState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Loaded value)?  loaded,TResult Function( _Shielding value)?  shielding,TResult Function( _ShieldSuccess value)?  shieldSuccess,TResult Function( _Failure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Shielding() when shielding != null:
return shielding(_that);case _ShieldSuccess() when shieldSuccess != null:
return shieldSuccess(_that);case _Failure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Loaded value)  loaded,required TResult Function( _Shielding value)  shielding,required TResult Function( _ShieldSuccess value)  shieldSuccess,required TResult Function( _Failure value)  failure,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Loaded():
return loaded(_that);case _Shielding():
return shielding(_that);case _ShieldSuccess():
return shieldSuccess(_that);case _Failure():
return failure(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Loaded value)?  loaded,TResult? Function( _Shielding value)?  shielding,TResult? Function( _ShieldSuccess value)?  shieldSuccess,TResult? Function( _Failure value)?  failure,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Shielding() when shielding != null:
return shielding(_that);case _ShieldSuccess() when shieldSuccess != null:
return shieldSuccess(_that);case _Failure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( StreakInfo info)?  loaded,TResult Function( StreakInfo info)?  shielding,TResult Function( StreakInfo info)?  shieldSuccess,TResult Function( String message,  StreakInfo? info)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.info);case _Shielding() when shielding != null:
return shielding(_that.info);case _ShieldSuccess() when shieldSuccess != null:
return shieldSuccess(_that.info);case _Failure() when failure != null:
return failure(_that.message,_that.info);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( StreakInfo info)  loaded,required TResult Function( StreakInfo info)  shielding,required TResult Function( StreakInfo info)  shieldSuccess,required TResult Function( String message,  StreakInfo? info)  failure,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Loaded():
return loaded(_that.info);case _Shielding():
return shielding(_that.info);case _ShieldSuccess():
return shieldSuccess(_that.info);case _Failure():
return failure(_that.message,_that.info);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( StreakInfo info)?  loaded,TResult? Function( StreakInfo info)?  shielding,TResult? Function( StreakInfo info)?  shieldSuccess,TResult? Function( String message,  StreakInfo? info)?  failure,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.info);case _Shielding() when shielding != null:
return shielding(_that.info);case _ShieldSuccess() when shieldSuccess != null:
return shieldSuccess(_that.info);case _Failure() when failure != null:
return failure(_that.message,_that.info);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements StreakState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'StreakState.initial()';
}


}




/// @nodoc


class _Loading implements StreakState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'StreakState.loading()';
}


}




/// @nodoc


class _Loaded implements StreakState {
  const _Loaded({required this.info});
  

 final  StreakInfo info;

/// Create a copy of StreakState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&(identical(other.info, info) || other.info == info));
}


@override
int get hashCode => Object.hash(runtimeType,info);

@override
String toString() {
  return 'StreakState.loaded(info: $info)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $StreakStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@useResult
$Res call({
 StreakInfo info
});


$StreakInfoCopyWith<$Res> get info;

}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of StreakState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? info = null,}) {
  return _then(_Loaded(
info: null == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as StreakInfo,
  ));
}

/// Create a copy of StreakState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StreakInfoCopyWith<$Res> get info {
  
  return $StreakInfoCopyWith<$Res>(_self.info, (value) {
    return _then(_self.copyWith(info: value));
  });
}
}

/// @nodoc


class _Shielding implements StreakState {
  const _Shielding({required this.info});
  

 final  StreakInfo info;

/// Create a copy of StreakState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShieldingCopyWith<_Shielding> get copyWith => __$ShieldingCopyWithImpl<_Shielding>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Shielding&&(identical(other.info, info) || other.info == info));
}


@override
int get hashCode => Object.hash(runtimeType,info);

@override
String toString() {
  return 'StreakState.shielding(info: $info)';
}


}

/// @nodoc
abstract mixin class _$ShieldingCopyWith<$Res> implements $StreakStateCopyWith<$Res> {
  factory _$ShieldingCopyWith(_Shielding value, $Res Function(_Shielding) _then) = __$ShieldingCopyWithImpl;
@useResult
$Res call({
 StreakInfo info
});


$StreakInfoCopyWith<$Res> get info;

}
/// @nodoc
class __$ShieldingCopyWithImpl<$Res>
    implements _$ShieldingCopyWith<$Res> {
  __$ShieldingCopyWithImpl(this._self, this._then);

  final _Shielding _self;
  final $Res Function(_Shielding) _then;

/// Create a copy of StreakState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? info = null,}) {
  return _then(_Shielding(
info: null == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as StreakInfo,
  ));
}

/// Create a copy of StreakState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StreakInfoCopyWith<$Res> get info {
  
  return $StreakInfoCopyWith<$Res>(_self.info, (value) {
    return _then(_self.copyWith(info: value));
  });
}
}

/// @nodoc


class _ShieldSuccess implements StreakState {
  const _ShieldSuccess({required this.info});
  

 final  StreakInfo info;

/// Create a copy of StreakState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShieldSuccessCopyWith<_ShieldSuccess> get copyWith => __$ShieldSuccessCopyWithImpl<_ShieldSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShieldSuccess&&(identical(other.info, info) || other.info == info));
}


@override
int get hashCode => Object.hash(runtimeType,info);

@override
String toString() {
  return 'StreakState.shieldSuccess(info: $info)';
}


}

/// @nodoc
abstract mixin class _$ShieldSuccessCopyWith<$Res> implements $StreakStateCopyWith<$Res> {
  factory _$ShieldSuccessCopyWith(_ShieldSuccess value, $Res Function(_ShieldSuccess) _then) = __$ShieldSuccessCopyWithImpl;
@useResult
$Res call({
 StreakInfo info
});


$StreakInfoCopyWith<$Res> get info;

}
/// @nodoc
class __$ShieldSuccessCopyWithImpl<$Res>
    implements _$ShieldSuccessCopyWith<$Res> {
  __$ShieldSuccessCopyWithImpl(this._self, this._then);

  final _ShieldSuccess _self;
  final $Res Function(_ShieldSuccess) _then;

/// Create a copy of StreakState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? info = null,}) {
  return _then(_ShieldSuccess(
info: null == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as StreakInfo,
  ));
}

/// Create a copy of StreakState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StreakInfoCopyWith<$Res> get info {
  
  return $StreakInfoCopyWith<$Res>(_self.info, (value) {
    return _then(_self.copyWith(info: value));
  });
}
}

/// @nodoc


class _Failure implements StreakState {
  const _Failure({required this.message, this.info});
  

 final  String message;
 final  StreakInfo? info;

/// Create a copy of StreakState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FailureCopyWith<_Failure> get copyWith => __$FailureCopyWithImpl<_Failure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Failure&&(identical(other.message, message) || other.message == message)&&(identical(other.info, info) || other.info == info));
}


@override
int get hashCode => Object.hash(runtimeType,message,info);

@override
String toString() {
  return 'StreakState.failure(message: $message, info: $info)';
}


}

/// @nodoc
abstract mixin class _$FailureCopyWith<$Res> implements $StreakStateCopyWith<$Res> {
  factory _$FailureCopyWith(_Failure value, $Res Function(_Failure) _then) = __$FailureCopyWithImpl;
@useResult
$Res call({
 String message, StreakInfo? info
});


$StreakInfoCopyWith<$Res>? get info;

}
/// @nodoc
class __$FailureCopyWithImpl<$Res>
    implements _$FailureCopyWith<$Res> {
  __$FailureCopyWithImpl(this._self, this._then);

  final _Failure _self;
  final $Res Function(_Failure) _then;

/// Create a copy of StreakState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,Object? info = freezed,}) {
  return _then(_Failure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,info: freezed == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as StreakInfo?,
  ));
}

/// Create a copy of StreakState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StreakInfoCopyWith<$Res>? get info {
    if (_self.info == null) {
    return null;
  }

  return $StreakInfoCopyWith<$Res>(_self.info!, (value) {
    return _then(_self.copyWith(info: value));
  });
}
}

// dart format on
