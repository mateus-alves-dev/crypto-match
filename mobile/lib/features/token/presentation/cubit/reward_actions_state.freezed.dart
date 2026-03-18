// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reward_actions_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RewardActionsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RewardActionsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RewardActionsState()';
}


}

/// @nodoc
class $RewardActionsStateCopyWith<$Res>  {
$RewardActionsStateCopyWith(RewardActionsState _, $Res Function(RewardActionsState) __);
}


/// Adds pattern-matching-related methods to [RewardActionsState].
extension RewardActionsStatePatterns on RewardActionsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Loaded value)?  loaded,TResult Function( _Claiming value)?  claiming,TResult Function( _ClaimSuccess value)?  claimSuccess,TResult Function( _Failure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Claiming() when claiming != null:
return claiming(_that);case _ClaimSuccess() when claimSuccess != null:
return claimSuccess(_that);case _Failure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Loaded value)  loaded,required TResult Function( _Claiming value)  claiming,required TResult Function( _ClaimSuccess value)  claimSuccess,required TResult Function( _Failure value)  failure,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Loaded():
return loaded(_that);case _Claiming():
return claiming(_that);case _ClaimSuccess():
return claimSuccess(_that);case _Failure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Loaded value)?  loaded,TResult? Function( _Claiming value)?  claiming,TResult? Function( _ClaimSuccess value)?  claimSuccess,TResult? Function( _Failure value)?  failure,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Claiming() when claiming != null:
return claiming(_that);case _ClaimSuccess() when claimSuccess != null:
return claimSuccess(_that);case _Failure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<TokenAction> actions)?  loaded,TResult Function( List<TokenAction> actions,  String claimingActionId)?  claiming,TResult Function( List<TokenAction> actions,  double earnedAmount)?  claimSuccess,TResult Function( String message,  List<TokenAction>? actions)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.actions);case _Claiming() when claiming != null:
return claiming(_that.actions,_that.claimingActionId);case _ClaimSuccess() when claimSuccess != null:
return claimSuccess(_that.actions,_that.earnedAmount);case _Failure() when failure != null:
return failure(_that.message,_that.actions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<TokenAction> actions)  loaded,required TResult Function( List<TokenAction> actions,  String claimingActionId)  claiming,required TResult Function( List<TokenAction> actions,  double earnedAmount)  claimSuccess,required TResult Function( String message,  List<TokenAction>? actions)  failure,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Loaded():
return loaded(_that.actions);case _Claiming():
return claiming(_that.actions,_that.claimingActionId);case _ClaimSuccess():
return claimSuccess(_that.actions,_that.earnedAmount);case _Failure():
return failure(_that.message,_that.actions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<TokenAction> actions)?  loaded,TResult? Function( List<TokenAction> actions,  String claimingActionId)?  claiming,TResult? Function( List<TokenAction> actions,  double earnedAmount)?  claimSuccess,TResult? Function( String message,  List<TokenAction>? actions)?  failure,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.actions);case _Claiming() when claiming != null:
return claiming(_that.actions,_that.claimingActionId);case _ClaimSuccess() when claimSuccess != null:
return claimSuccess(_that.actions,_that.earnedAmount);case _Failure() when failure != null:
return failure(_that.message,_that.actions);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements RewardActionsState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RewardActionsState.initial()';
}


}




/// @nodoc


class _Loading implements RewardActionsState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RewardActionsState.loading()';
}


}




/// @nodoc


class _Loaded implements RewardActionsState {
  const _Loaded({required final  List<TokenAction> actions}): _actions = actions;
  

 final  List<TokenAction> _actions;
 List<TokenAction> get actions {
  if (_actions is EqualUnmodifiableListView) return _actions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_actions);
}


/// Create a copy of RewardActionsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&const DeepCollectionEquality().equals(other._actions, _actions));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_actions));

@override
String toString() {
  return 'RewardActionsState.loaded(actions: $actions)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $RewardActionsStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@useResult
$Res call({
 List<TokenAction> actions
});




}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of RewardActionsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? actions = null,}) {
  return _then(_Loaded(
actions: null == actions ? _self._actions : actions // ignore: cast_nullable_to_non_nullable
as List<TokenAction>,
  ));
}


}

/// @nodoc


class _Claiming implements RewardActionsState {
  const _Claiming({required final  List<TokenAction> actions, required this.claimingActionId}): _actions = actions;
  

 final  List<TokenAction> _actions;
 List<TokenAction> get actions {
  if (_actions is EqualUnmodifiableListView) return _actions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_actions);
}

 final  String claimingActionId;

/// Create a copy of RewardActionsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClaimingCopyWith<_Claiming> get copyWith => __$ClaimingCopyWithImpl<_Claiming>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Claiming&&const DeepCollectionEquality().equals(other._actions, _actions)&&(identical(other.claimingActionId, claimingActionId) || other.claimingActionId == claimingActionId));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_actions),claimingActionId);

@override
String toString() {
  return 'RewardActionsState.claiming(actions: $actions, claimingActionId: $claimingActionId)';
}


}

/// @nodoc
abstract mixin class _$ClaimingCopyWith<$Res> implements $RewardActionsStateCopyWith<$Res> {
  factory _$ClaimingCopyWith(_Claiming value, $Res Function(_Claiming) _then) = __$ClaimingCopyWithImpl;
@useResult
$Res call({
 List<TokenAction> actions, String claimingActionId
});




}
/// @nodoc
class __$ClaimingCopyWithImpl<$Res>
    implements _$ClaimingCopyWith<$Res> {
  __$ClaimingCopyWithImpl(this._self, this._then);

  final _Claiming _self;
  final $Res Function(_Claiming) _then;

/// Create a copy of RewardActionsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? actions = null,Object? claimingActionId = null,}) {
  return _then(_Claiming(
actions: null == actions ? _self._actions : actions // ignore: cast_nullable_to_non_nullable
as List<TokenAction>,claimingActionId: null == claimingActionId ? _self.claimingActionId : claimingActionId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ClaimSuccess implements RewardActionsState {
  const _ClaimSuccess({required final  List<TokenAction> actions, required this.earnedAmount}): _actions = actions;
  

 final  List<TokenAction> _actions;
 List<TokenAction> get actions {
  if (_actions is EqualUnmodifiableListView) return _actions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_actions);
}

 final  double earnedAmount;

/// Create a copy of RewardActionsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClaimSuccessCopyWith<_ClaimSuccess> get copyWith => __$ClaimSuccessCopyWithImpl<_ClaimSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClaimSuccess&&const DeepCollectionEquality().equals(other._actions, _actions)&&(identical(other.earnedAmount, earnedAmount) || other.earnedAmount == earnedAmount));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_actions),earnedAmount);

@override
String toString() {
  return 'RewardActionsState.claimSuccess(actions: $actions, earnedAmount: $earnedAmount)';
}


}

/// @nodoc
abstract mixin class _$ClaimSuccessCopyWith<$Res> implements $RewardActionsStateCopyWith<$Res> {
  factory _$ClaimSuccessCopyWith(_ClaimSuccess value, $Res Function(_ClaimSuccess) _then) = __$ClaimSuccessCopyWithImpl;
@useResult
$Res call({
 List<TokenAction> actions, double earnedAmount
});




}
/// @nodoc
class __$ClaimSuccessCopyWithImpl<$Res>
    implements _$ClaimSuccessCopyWith<$Res> {
  __$ClaimSuccessCopyWithImpl(this._self, this._then);

  final _ClaimSuccess _self;
  final $Res Function(_ClaimSuccess) _then;

/// Create a copy of RewardActionsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? actions = null,Object? earnedAmount = null,}) {
  return _then(_ClaimSuccess(
actions: null == actions ? _self._actions : actions // ignore: cast_nullable_to_non_nullable
as List<TokenAction>,earnedAmount: null == earnedAmount ? _self.earnedAmount : earnedAmount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc


class _Failure implements RewardActionsState {
  const _Failure({required this.message, final  List<TokenAction>? actions}): _actions = actions;
  

 final  String message;
 final  List<TokenAction>? _actions;
 List<TokenAction>? get actions {
  final value = _actions;
  if (value == null) return null;
  if (_actions is EqualUnmodifiableListView) return _actions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of RewardActionsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FailureCopyWith<_Failure> get copyWith => __$FailureCopyWithImpl<_Failure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Failure&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._actions, _actions));
}


@override
int get hashCode => Object.hash(runtimeType,message,const DeepCollectionEquality().hash(_actions));

@override
String toString() {
  return 'RewardActionsState.failure(message: $message, actions: $actions)';
}


}

/// @nodoc
abstract mixin class _$FailureCopyWith<$Res> implements $RewardActionsStateCopyWith<$Res> {
  factory _$FailureCopyWith(_Failure value, $Res Function(_Failure) _then) = __$FailureCopyWithImpl;
@useResult
$Res call({
 String message, List<TokenAction>? actions
});




}
/// @nodoc
class __$FailureCopyWithImpl<$Res>
    implements _$FailureCopyWith<$Res> {
  __$FailureCopyWithImpl(this._self, this._then);

  final _Failure _self;
  final $Res Function(_Failure) _then;

/// Create a copy of RewardActionsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,Object? actions = freezed,}) {
  return _then(_Failure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,actions: freezed == actions ? _self._actions : actions // ignore: cast_nullable_to_non_nullable
as List<TokenAction>?,
  ));
}


}

// dart format on
