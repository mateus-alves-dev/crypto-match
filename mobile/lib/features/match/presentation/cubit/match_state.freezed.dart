// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'match_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MatchState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<MatchSuggestion> remaining) swiping,
    required TResult Function(Match match, List<MatchSuggestion> remaining)
        matched,
    required TResult Function() empty,
    required TResult Function(String message) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<MatchSuggestion> remaining)? swiping,
    TResult? Function(Match match, List<MatchSuggestion> remaining)? matched,
    TResult? Function()? empty,
    TResult? Function(String message)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<MatchSuggestion> remaining)? swiping,
    TResult Function(Match match, List<MatchSuggestion> remaining)? matched,
    TResult Function()? empty,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Swiping value) swiping,
    required TResult Function(_Matched value) matched,
    required TResult Function(_Empty value) empty,
    required TResult Function(_Failure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Swiping value)? swiping,
    TResult? Function(_Matched value)? matched,
    TResult? Function(_Empty value)? empty,
    TResult? Function(_Failure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Swiping value)? swiping,
    TResult Function(_Matched value)? matched,
    TResult Function(_Empty value)? empty,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchStateCopyWith<$Res> {
  factory $MatchStateCopyWith(
          MatchState value, $Res Function(MatchState) then) =
      _$MatchStateCopyWithImpl<$Res, MatchState>;
}

/// @nodoc
class _$MatchStateCopyWithImpl<$Res, $Val extends MatchState>
    implements $MatchStateCopyWith<$Res> {
  _$MatchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MatchState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$MatchStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of MatchState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'MatchState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<MatchSuggestion> remaining) swiping,
    required TResult Function(Match match, List<MatchSuggestion> remaining)
        matched,
    required TResult Function() empty,
    required TResult Function(String message) failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<MatchSuggestion> remaining)? swiping,
    TResult? Function(Match match, List<MatchSuggestion> remaining)? matched,
    TResult? Function()? empty,
    TResult? Function(String message)? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<MatchSuggestion> remaining)? swiping,
    TResult Function(Match match, List<MatchSuggestion> remaining)? matched,
    TResult Function()? empty,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Swiping value) swiping,
    required TResult Function(_Matched value) matched,
    required TResult Function(_Empty value) empty,
    required TResult Function(_Failure value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Swiping value)? swiping,
    TResult? Function(_Matched value)? matched,
    TResult? Function(_Empty value)? empty,
    TResult? Function(_Failure value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Swiping value)? swiping,
    TResult Function(_Matched value)? matched,
    TResult Function(_Empty value)? empty,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements MatchState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$MatchStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of MatchState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'MatchState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<MatchSuggestion> remaining) swiping,
    required TResult Function(Match match, List<MatchSuggestion> remaining)
        matched,
    required TResult Function() empty,
    required TResult Function(String message) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<MatchSuggestion> remaining)? swiping,
    TResult? Function(Match match, List<MatchSuggestion> remaining)? matched,
    TResult? Function()? empty,
    TResult? Function(String message)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<MatchSuggestion> remaining)? swiping,
    TResult Function(Match match, List<MatchSuggestion> remaining)? matched,
    TResult Function()? empty,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Swiping value) swiping,
    required TResult Function(_Matched value) matched,
    required TResult Function(_Empty value) empty,
    required TResult Function(_Failure value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Swiping value)? swiping,
    TResult? Function(_Matched value)? matched,
    TResult? Function(_Empty value)? empty,
    TResult? Function(_Failure value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Swiping value)? swiping,
    TResult Function(_Matched value)? matched,
    TResult Function(_Empty value)? empty,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements MatchState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$SwipingImplCopyWith<$Res> {
  factory _$$SwipingImplCopyWith(
          _$SwipingImpl value, $Res Function(_$SwipingImpl) then) =
      __$$SwipingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<MatchSuggestion> remaining});
}

/// @nodoc
class __$$SwipingImplCopyWithImpl<$Res>
    extends _$MatchStateCopyWithImpl<$Res, _$SwipingImpl>
    implements _$$SwipingImplCopyWith<$Res> {
  __$$SwipingImplCopyWithImpl(
      _$SwipingImpl _value, $Res Function(_$SwipingImpl) _then)
      : super(_value, _then);

  /// Create a copy of MatchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? remaining = null,
  }) {
    return _then(_$SwipingImpl(
      remaining: null == remaining
          ? _value._remaining
          : remaining // ignore: cast_nullable_to_non_nullable
              as List<MatchSuggestion>,
    ));
  }
}

/// @nodoc

class _$SwipingImpl implements _Swiping {
  const _$SwipingImpl({required final List<MatchSuggestion> remaining})
      : _remaining = remaining;

  final List<MatchSuggestion> _remaining;
  @override
  List<MatchSuggestion> get remaining {
    if (_remaining is EqualUnmodifiableListView) return _remaining;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_remaining);
  }

  @override
  String toString() {
    return 'MatchState.swiping(remaining: $remaining)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SwipingImpl &&
            const DeepCollectionEquality()
                .equals(other._remaining, _remaining));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_remaining));

  /// Create a copy of MatchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SwipingImplCopyWith<_$SwipingImpl> get copyWith =>
      __$$SwipingImplCopyWithImpl<_$SwipingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<MatchSuggestion> remaining) swiping,
    required TResult Function(Match match, List<MatchSuggestion> remaining)
        matched,
    required TResult Function() empty,
    required TResult Function(String message) failure,
  }) {
    return swiping(remaining);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<MatchSuggestion> remaining)? swiping,
    TResult? Function(Match match, List<MatchSuggestion> remaining)? matched,
    TResult? Function()? empty,
    TResult? Function(String message)? failure,
  }) {
    return swiping?.call(remaining);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<MatchSuggestion> remaining)? swiping,
    TResult Function(Match match, List<MatchSuggestion> remaining)? matched,
    TResult Function()? empty,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (swiping != null) {
      return swiping(remaining);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Swiping value) swiping,
    required TResult Function(_Matched value) matched,
    required TResult Function(_Empty value) empty,
    required TResult Function(_Failure value) failure,
  }) {
    return swiping(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Swiping value)? swiping,
    TResult? Function(_Matched value)? matched,
    TResult? Function(_Empty value)? empty,
    TResult? Function(_Failure value)? failure,
  }) {
    return swiping?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Swiping value)? swiping,
    TResult Function(_Matched value)? matched,
    TResult Function(_Empty value)? empty,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (swiping != null) {
      return swiping(this);
    }
    return orElse();
  }
}

abstract class _Swiping implements MatchState {
  const factory _Swiping({required final List<MatchSuggestion> remaining}) =
      _$SwipingImpl;

  List<MatchSuggestion> get remaining;

  /// Create a copy of MatchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SwipingImplCopyWith<_$SwipingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MatchedImplCopyWith<$Res> {
  factory _$$MatchedImplCopyWith(
          _$MatchedImpl value, $Res Function(_$MatchedImpl) then) =
      __$$MatchedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Match match, List<MatchSuggestion> remaining});

  $MatchCopyWith<$Res> get match;
}

/// @nodoc
class __$$MatchedImplCopyWithImpl<$Res>
    extends _$MatchStateCopyWithImpl<$Res, _$MatchedImpl>
    implements _$$MatchedImplCopyWith<$Res> {
  __$$MatchedImplCopyWithImpl(
      _$MatchedImpl _value, $Res Function(_$MatchedImpl) _then)
      : super(_value, _then);

  /// Create a copy of MatchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? match = null,
    Object? remaining = null,
  }) {
    return _then(_$MatchedImpl(
      match: null == match
          ? _value.match
          : match // ignore: cast_nullable_to_non_nullable
              as Match,
      remaining: null == remaining
          ? _value._remaining
          : remaining // ignore: cast_nullable_to_non_nullable
              as List<MatchSuggestion>,
    ));
  }

  /// Create a copy of MatchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MatchCopyWith<$Res> get match {
    return $MatchCopyWith<$Res>(_value.match, (value) {
      return _then(_value.copyWith(match: value));
    });
  }
}

/// @nodoc

class _$MatchedImpl implements _Matched {
  const _$MatchedImpl(
      {required this.match, required final List<MatchSuggestion> remaining})
      : _remaining = remaining;

  @override
  final Match match;
  final List<MatchSuggestion> _remaining;
  @override
  List<MatchSuggestion> get remaining {
    if (_remaining is EqualUnmodifiableListView) return _remaining;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_remaining);
  }

  @override
  String toString() {
    return 'MatchState.matched(match: $match, remaining: $remaining)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchedImpl &&
            (identical(other.match, match) || other.match == match) &&
            const DeepCollectionEquality()
                .equals(other._remaining, _remaining));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, match, const DeepCollectionEquality().hash(_remaining));

  /// Create a copy of MatchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MatchedImplCopyWith<_$MatchedImpl> get copyWith =>
      __$$MatchedImplCopyWithImpl<_$MatchedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<MatchSuggestion> remaining) swiping,
    required TResult Function(Match match, List<MatchSuggestion> remaining)
        matched,
    required TResult Function() empty,
    required TResult Function(String message) failure,
  }) {
    return matched(match, remaining);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<MatchSuggestion> remaining)? swiping,
    TResult? Function(Match match, List<MatchSuggestion> remaining)? matched,
    TResult? Function()? empty,
    TResult? Function(String message)? failure,
  }) {
    return matched?.call(match, remaining);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<MatchSuggestion> remaining)? swiping,
    TResult Function(Match match, List<MatchSuggestion> remaining)? matched,
    TResult Function()? empty,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (matched != null) {
      return matched(match, remaining);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Swiping value) swiping,
    required TResult Function(_Matched value) matched,
    required TResult Function(_Empty value) empty,
    required TResult Function(_Failure value) failure,
  }) {
    return matched(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Swiping value)? swiping,
    TResult? Function(_Matched value)? matched,
    TResult? Function(_Empty value)? empty,
    TResult? Function(_Failure value)? failure,
  }) {
    return matched?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Swiping value)? swiping,
    TResult Function(_Matched value)? matched,
    TResult Function(_Empty value)? empty,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (matched != null) {
      return matched(this);
    }
    return orElse();
  }
}

abstract class _Matched implements MatchState {
  const factory _Matched(
      {required final Match match,
      required final List<MatchSuggestion> remaining}) = _$MatchedImpl;

  Match get match;
  List<MatchSuggestion> get remaining;

  /// Create a copy of MatchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MatchedImplCopyWith<_$MatchedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EmptyImplCopyWith<$Res> {
  factory _$$EmptyImplCopyWith(
          _$EmptyImpl value, $Res Function(_$EmptyImpl) then) =
      __$$EmptyImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EmptyImplCopyWithImpl<$Res>
    extends _$MatchStateCopyWithImpl<$Res, _$EmptyImpl>
    implements _$$EmptyImplCopyWith<$Res> {
  __$$EmptyImplCopyWithImpl(
      _$EmptyImpl _value, $Res Function(_$EmptyImpl) _then)
      : super(_value, _then);

  /// Create a copy of MatchState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$EmptyImpl implements _Empty {
  const _$EmptyImpl();

  @override
  String toString() {
    return 'MatchState.empty()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EmptyImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<MatchSuggestion> remaining) swiping,
    required TResult Function(Match match, List<MatchSuggestion> remaining)
        matched,
    required TResult Function() empty,
    required TResult Function(String message) failure,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<MatchSuggestion> remaining)? swiping,
    TResult? Function(Match match, List<MatchSuggestion> remaining)? matched,
    TResult? Function()? empty,
    TResult? Function(String message)? failure,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<MatchSuggestion> remaining)? swiping,
    TResult Function(Match match, List<MatchSuggestion> remaining)? matched,
    TResult Function()? empty,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Swiping value) swiping,
    required TResult Function(_Matched value) matched,
    required TResult Function(_Empty value) empty,
    required TResult Function(_Failure value) failure,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Swiping value)? swiping,
    TResult? Function(_Matched value)? matched,
    TResult? Function(_Empty value)? empty,
    TResult? Function(_Failure value)? failure,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Swiping value)? swiping,
    TResult Function(_Matched value)? matched,
    TResult Function(_Empty value)? empty,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class _Empty implements MatchState {
  const factory _Empty() = _$EmptyImpl;
}

/// @nodoc
abstract class _$$FailureImplCopyWith<$Res> {
  factory _$$FailureImplCopyWith(
          _$FailureImpl value, $Res Function(_$FailureImpl) then) =
      __$$FailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$FailureImplCopyWithImpl<$Res>
    extends _$MatchStateCopyWithImpl<$Res, _$FailureImpl>
    implements _$$FailureImplCopyWith<$Res> {
  __$$FailureImplCopyWithImpl(
      _$FailureImpl _value, $Res Function(_$FailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of MatchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$FailureImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FailureImpl implements _Failure {
  const _$FailureImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'MatchState.failure(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of MatchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      __$$FailureImplCopyWithImpl<_$FailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<MatchSuggestion> remaining) swiping,
    required TResult Function(Match match, List<MatchSuggestion> remaining)
        matched,
    required TResult Function() empty,
    required TResult Function(String message) failure,
  }) {
    return failure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<MatchSuggestion> remaining)? swiping,
    TResult? Function(Match match, List<MatchSuggestion> remaining)? matched,
    TResult? Function()? empty,
    TResult? Function(String message)? failure,
  }) {
    return failure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<MatchSuggestion> remaining)? swiping,
    TResult Function(Match match, List<MatchSuggestion> remaining)? matched,
    TResult Function()? empty,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Swiping value) swiping,
    required TResult Function(_Matched value) matched,
    required TResult Function(_Empty value) empty,
    required TResult Function(_Failure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Swiping value)? swiping,
    TResult? Function(_Matched value)? matched,
    TResult? Function(_Empty value)? empty,
    TResult? Function(_Failure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Swiping value)? swiping,
    TResult Function(_Matched value)? matched,
    TResult Function(_Empty value)? empty,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _Failure implements MatchState {
  const factory _Failure({required final String message}) = _$FailureImpl;

  String get message;

  /// Create a copy of MatchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
