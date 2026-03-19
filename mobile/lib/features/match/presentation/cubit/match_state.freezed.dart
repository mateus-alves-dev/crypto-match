// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'match_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MatchState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatchState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MatchState()';
}


}

/// @nodoc
class $MatchStateCopyWith<$Res>  {
$MatchStateCopyWith(MatchState _, $Res Function(MatchState) __);
}


/// Adds pattern-matching-related methods to [MatchState].
extension MatchStatePatterns on MatchState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Swiping value)?  swiping,TResult Function( _Matched value)?  matched,TResult Function( _Empty value)?  empty,TResult Function( _Failure value)?  failure,TResult Function( _InsufficientBalance value)?  insufficientBalance,TResult Function( _SwipeFailed value)?  swipeFailed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Swiping() when swiping != null:
return swiping(_that);case _Matched() when matched != null:
return matched(_that);case _Empty() when empty != null:
return empty(_that);case _Failure() when failure != null:
return failure(_that);case _InsufficientBalance() when insufficientBalance != null:
return insufficientBalance(_that);case _SwipeFailed() when swipeFailed != null:
return swipeFailed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Swiping value)  swiping,required TResult Function( _Matched value)  matched,required TResult Function( _Empty value)  empty,required TResult Function( _Failure value)  failure,required TResult Function( _InsufficientBalance value)  insufficientBalance,required TResult Function( _SwipeFailed value)  swipeFailed,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Swiping():
return swiping(_that);case _Matched():
return matched(_that);case _Empty():
return empty(_that);case _Failure():
return failure(_that);case _InsufficientBalance():
return insufficientBalance(_that);case _SwipeFailed():
return swipeFailed(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Swiping value)?  swiping,TResult? Function( _Matched value)?  matched,TResult? Function( _Empty value)?  empty,TResult? Function( _Failure value)?  failure,TResult? Function( _InsufficientBalance value)?  insufficientBalance,TResult? Function( _SwipeFailed value)?  swipeFailed,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Swiping() when swiping != null:
return swiping(_that);case _Matched() when matched != null:
return matched(_that);case _Empty() when empty != null:
return empty(_that);case _Failure() when failure != null:
return failure(_that);case _InsufficientBalance() when insufficientBalance != null:
return insufficientBalance(_that);case _SwipeFailed() when swipeFailed != null:
return swipeFailed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<MatchSuggestion> remaining)?  swiping,TResult Function( Match match,  List<MatchSuggestion> remaining)?  matched,TResult Function()?  empty,TResult Function( String message)?  failure,TResult Function( List<MatchSuggestion> remaining)?  insufficientBalance,TResult Function( String message,  List<MatchSuggestion> remaining)?  swipeFailed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Swiping() when swiping != null:
return swiping(_that.remaining);case _Matched() when matched != null:
return matched(_that.match,_that.remaining);case _Empty() when empty != null:
return empty();case _Failure() when failure != null:
return failure(_that.message);case _InsufficientBalance() when insufficientBalance != null:
return insufficientBalance(_that.remaining);case _SwipeFailed() when swipeFailed != null:
return swipeFailed(_that.message,_that.remaining);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<MatchSuggestion> remaining)  swiping,required TResult Function( Match match,  List<MatchSuggestion> remaining)  matched,required TResult Function()  empty,required TResult Function( String message)  failure,required TResult Function( List<MatchSuggestion> remaining)  insufficientBalance,required TResult Function( String message,  List<MatchSuggestion> remaining)  swipeFailed,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Swiping():
return swiping(_that.remaining);case _Matched():
return matched(_that.match,_that.remaining);case _Empty():
return empty();case _Failure():
return failure(_that.message);case _InsufficientBalance():
return insufficientBalance(_that.remaining);case _SwipeFailed():
return swipeFailed(_that.message,_that.remaining);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<MatchSuggestion> remaining)?  swiping,TResult? Function( Match match,  List<MatchSuggestion> remaining)?  matched,TResult? Function()?  empty,TResult? Function( String message)?  failure,TResult? Function( List<MatchSuggestion> remaining)?  insufficientBalance,TResult? Function( String message,  List<MatchSuggestion> remaining)?  swipeFailed,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Swiping() when swiping != null:
return swiping(_that.remaining);case _Matched() when matched != null:
return matched(_that.match,_that.remaining);case _Empty() when empty != null:
return empty();case _Failure() when failure != null:
return failure(_that.message);case _InsufficientBalance() when insufficientBalance != null:
return insufficientBalance(_that.remaining);case _SwipeFailed() when swipeFailed != null:
return swipeFailed(_that.message,_that.remaining);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements MatchState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MatchState.initial()';
}


}




/// @nodoc


class _Loading implements MatchState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MatchState.loading()';
}


}




/// @nodoc


class _Swiping implements MatchState {
  const _Swiping({required final  List<MatchSuggestion> remaining}): _remaining = remaining;
  

 final  List<MatchSuggestion> _remaining;
 List<MatchSuggestion> get remaining {
  if (_remaining is EqualUnmodifiableListView) return _remaining;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_remaining);
}


/// Create a copy of MatchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SwipingCopyWith<_Swiping> get copyWith => __$SwipingCopyWithImpl<_Swiping>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Swiping&&const DeepCollectionEquality().equals(other._remaining, _remaining));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_remaining));

@override
String toString() {
  return 'MatchState.swiping(remaining: $remaining)';
}


}

/// @nodoc
abstract mixin class _$SwipingCopyWith<$Res> implements $MatchStateCopyWith<$Res> {
  factory _$SwipingCopyWith(_Swiping value, $Res Function(_Swiping) _then) = __$SwipingCopyWithImpl;
@useResult
$Res call({
 List<MatchSuggestion> remaining
});




}
/// @nodoc
class __$SwipingCopyWithImpl<$Res>
    implements _$SwipingCopyWith<$Res> {
  __$SwipingCopyWithImpl(this._self, this._then);

  final _Swiping _self;
  final $Res Function(_Swiping) _then;

/// Create a copy of MatchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? remaining = null,}) {
  return _then(_Swiping(
remaining: null == remaining ? _self._remaining : remaining // ignore: cast_nullable_to_non_nullable
as List<MatchSuggestion>,
  ));
}


}

/// @nodoc


class _Matched implements MatchState {
  const _Matched({required this.match, required final  List<MatchSuggestion> remaining}): _remaining = remaining;
  

 final  Match match;
 final  List<MatchSuggestion> _remaining;
 List<MatchSuggestion> get remaining {
  if (_remaining is EqualUnmodifiableListView) return _remaining;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_remaining);
}


/// Create a copy of MatchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MatchedCopyWith<_Matched> get copyWith => __$MatchedCopyWithImpl<_Matched>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Matched&&(identical(other.match, match) || other.match == match)&&const DeepCollectionEquality().equals(other._remaining, _remaining));
}


@override
int get hashCode => Object.hash(runtimeType,match,const DeepCollectionEquality().hash(_remaining));

@override
String toString() {
  return 'MatchState.matched(match: $match, remaining: $remaining)';
}


}

/// @nodoc
abstract mixin class _$MatchedCopyWith<$Res> implements $MatchStateCopyWith<$Res> {
  factory _$MatchedCopyWith(_Matched value, $Res Function(_Matched) _then) = __$MatchedCopyWithImpl;
@useResult
$Res call({
 Match match, List<MatchSuggestion> remaining
});


$MatchCopyWith<$Res> get match;

}
/// @nodoc
class __$MatchedCopyWithImpl<$Res>
    implements _$MatchedCopyWith<$Res> {
  __$MatchedCopyWithImpl(this._self, this._then);

  final _Matched _self;
  final $Res Function(_Matched) _then;

/// Create a copy of MatchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? match = null,Object? remaining = null,}) {
  return _then(_Matched(
match: null == match ? _self.match : match // ignore: cast_nullable_to_non_nullable
as Match,remaining: null == remaining ? _self._remaining : remaining // ignore: cast_nullable_to_non_nullable
as List<MatchSuggestion>,
  ));
}

/// Create a copy of MatchState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MatchCopyWith<$Res> get match {
  
  return $MatchCopyWith<$Res>(_self.match, (value) {
    return _then(_self.copyWith(match: value));
  });
}
}

/// @nodoc


class _Empty implements MatchState {
  const _Empty();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Empty);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MatchState.empty()';
}


}




/// @nodoc


class _Failure implements MatchState {
  const _Failure({required this.message});
  

 final  String message;

/// Create a copy of MatchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FailureCopyWith<_Failure> get copyWith => __$FailureCopyWithImpl<_Failure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Failure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'MatchState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class _$FailureCopyWith<$Res> implements $MatchStateCopyWith<$Res> {
  factory _$FailureCopyWith(_Failure value, $Res Function(_Failure) _then) = __$FailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$FailureCopyWithImpl<$Res>
    implements _$FailureCopyWith<$Res> {
  __$FailureCopyWithImpl(this._self, this._then);

  final _Failure _self;
  final $Res Function(_Failure) _then;

/// Create a copy of MatchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Failure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _InsufficientBalance implements MatchState {
  const _InsufficientBalance({required final  List<MatchSuggestion> remaining}): _remaining = remaining;
  

 final  List<MatchSuggestion> _remaining;
 List<MatchSuggestion> get remaining {
  if (_remaining is EqualUnmodifiableListView) return _remaining;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_remaining);
}


/// Create a copy of MatchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InsufficientBalanceCopyWith<_InsufficientBalance> get copyWith => __$InsufficientBalanceCopyWithImpl<_InsufficientBalance>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InsufficientBalance&&const DeepCollectionEquality().equals(other._remaining, _remaining));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_remaining));

@override
String toString() {
  return 'MatchState.insufficientBalance(remaining: $remaining)';
}


}

/// @nodoc
abstract mixin class _$InsufficientBalanceCopyWith<$Res> implements $MatchStateCopyWith<$Res> {
  factory _$InsufficientBalanceCopyWith(_InsufficientBalance value, $Res Function(_InsufficientBalance) _then) = __$InsufficientBalanceCopyWithImpl;
@useResult
$Res call({
 List<MatchSuggestion> remaining
});




}
/// @nodoc
class __$InsufficientBalanceCopyWithImpl<$Res>
    implements _$InsufficientBalanceCopyWith<$Res> {
  __$InsufficientBalanceCopyWithImpl(this._self, this._then);

  final _InsufficientBalance _self;
  final $Res Function(_InsufficientBalance) _then;

/// Create a copy of MatchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? remaining = null,}) {
  return _then(_InsufficientBalance(
remaining: null == remaining ? _self._remaining : remaining // ignore: cast_nullable_to_non_nullable
as List<MatchSuggestion>,
  ));
}


}

/// @nodoc


class _SwipeFailed implements MatchState {
  const _SwipeFailed({required this.message, required final  List<MatchSuggestion> remaining}): _remaining = remaining;
  

 final  String message;
 final  List<MatchSuggestion> _remaining;
 List<MatchSuggestion> get remaining {
  if (_remaining is EqualUnmodifiableListView) return _remaining;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_remaining);
}


/// Create a copy of MatchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SwipeFailedCopyWith<_SwipeFailed> get copyWith => __$SwipeFailedCopyWithImpl<_SwipeFailed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SwipeFailed&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._remaining, _remaining));
}


@override
int get hashCode => Object.hash(runtimeType,message,const DeepCollectionEquality().hash(_remaining));

@override
String toString() {
  return 'MatchState.swipeFailed(message: $message, remaining: $remaining)';
}


}

/// @nodoc
abstract mixin class _$SwipeFailedCopyWith<$Res> implements $MatchStateCopyWith<$Res> {
  factory _$SwipeFailedCopyWith(_SwipeFailed value, $Res Function(_SwipeFailed) _then) = __$SwipeFailedCopyWithImpl;
@useResult
$Res call({
 String message, List<MatchSuggestion> remaining
});




}
/// @nodoc
class __$SwipeFailedCopyWithImpl<$Res>
    implements _$SwipeFailedCopyWith<$Res> {
  __$SwipeFailedCopyWithImpl(this._self, this._then);

  final _SwipeFailed _self;
  final $Res Function(_SwipeFailed) _then;

/// Create a copy of MatchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,Object? remaining = null,}) {
  return _then(_SwipeFailed(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,remaining: null == remaining ? _self._remaining : remaining // ignore: cast_nullable_to_non_nullable
as List<MatchSuggestion>,
  ));
}


}

// dart format on
