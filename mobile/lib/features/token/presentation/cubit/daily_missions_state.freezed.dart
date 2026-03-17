// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_missions_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DailyMissionsState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DailyMissionsState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DailyMissionsState()';
  }
}

/// @nodoc
class $DailyMissionsStateCopyWith<$Res> {
  $DailyMissionsStateCopyWith(
      DailyMissionsState _, $Res Function(DailyMissionsState) __);
}

/// Adds pattern-matching-related methods to [DailyMissionsState].
extension DailyMissionsStatePatterns on DailyMissionsState {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Claiming value)? claiming,
    TResult Function(_ClaimSuccess value)? claimSuccess,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _Loading() when loading != null:
        return loading(_that);
      case _Loaded() when loaded != null:
        return loaded(_that);
      case _Claiming() when claiming != null:
        return claiming(_that);
      case _ClaimSuccess() when claimSuccess != null:
        return claimSuccess(_that);
      case _Failure() when failure != null:
        return failure(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Claiming value) claiming,
    required TResult Function(_ClaimSuccess value) claimSuccess,
    required TResult Function(_Failure value) failure,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial(_that);
      case _Loading():
        return loading(_that);
      case _Loaded():
        return loaded(_that);
      case _Claiming():
        return claiming(_that);
      case _ClaimSuccess():
        return claimSuccess(_that);
      case _Failure():
        return failure(_that);
      case _:
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Claiming value)? claiming,
    TResult? Function(_ClaimSuccess value)? claimSuccess,
    TResult? Function(_Failure value)? failure,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _Loading() when loading != null:
        return loading(_that);
      case _Loaded() when loaded != null:
        return loaded(_that);
      case _Claiming() when claiming != null:
        return claiming(_that);
      case _ClaimSuccess() when claimSuccess != null:
        return claimSuccess(_that);
      case _Failure() when failure != null:
        return failure(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<DailyMission> missions)? loaded,
    TResult Function(List<DailyMission> missions, String claimingMissionId)?
        claiming,
    TResult Function(List<DailyMission> missions, double earnedAmount,
            String completedMissionId)?
        claimSuccess,
    TResult Function(String message, List<DailyMission>? missions)? failure,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case _Loading() when loading != null:
        return loading();
      case _Loaded() when loaded != null:
        return loaded(_that.missions);
      case _Claiming() when claiming != null:
        return claiming(_that.missions, _that.claimingMissionId);
      case _ClaimSuccess() when claimSuccess != null:
        return claimSuccess(
            _that.missions, _that.earnedAmount, _that.completedMissionId);
      case _Failure() when failure != null:
        return failure(_that.message, _that.missions);
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<DailyMission> missions) loaded,
    required TResult Function(
            List<DailyMission> missions, String claimingMissionId)
        claiming,
    required TResult Function(List<DailyMission> missions, double earnedAmount,
            String completedMissionId)
        claimSuccess,
    required TResult Function(String message, List<DailyMission>? missions)
        failure,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial();
      case _Loading():
        return loading();
      case _Loaded():
        return loaded(_that.missions);
      case _Claiming():
        return claiming(_that.missions, _that.claimingMissionId);
      case _ClaimSuccess():
        return claimSuccess(
            _that.missions, _that.earnedAmount, _that.completedMissionId);
      case _Failure():
        return failure(_that.message, _that.missions);
      case _:
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<DailyMission> missions)? loaded,
    TResult? Function(List<DailyMission> missions, String claimingMissionId)?
        claiming,
    TResult? Function(List<DailyMission> missions, double earnedAmount,
            String completedMissionId)?
        claimSuccess,
    TResult? Function(String message, List<DailyMission>? missions)? failure,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case _Loading() when loading != null:
        return loading();
      case _Loaded() when loaded != null:
        return loaded(_that.missions);
      case _Claiming() when claiming != null:
        return claiming(_that.missions, _that.claimingMissionId);
      case _ClaimSuccess() when claimSuccess != null:
        return claimSuccess(
            _that.missions, _that.earnedAmount, _that.completedMissionId);
      case _Failure() when failure != null:
        return failure(_that.message, _that.missions);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial implements DailyMissionsState {
  const _Initial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DailyMissionsState.initial()';
  }
}

/// @nodoc

class _Loading implements DailyMissionsState {
  const _Loading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DailyMissionsState.loading()';
  }
}

/// @nodoc

class _Loaded implements DailyMissionsState {
  const _Loaded({required final List<DailyMission> missions})
      : _missions = missions;

  final List<DailyMission> _missions;
  List<DailyMission> get missions {
    if (_missions is EqualUnmodifiableListView) return _missions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_missions);
  }

  /// Create a copy of DailyMissionsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoadedCopyWith<_Loaded> get copyWith =>
      __$LoadedCopyWithImpl<_Loaded>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Loaded &&
            const DeepCollectionEquality().equals(other._missions, _missions));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_missions));

  @override
  String toString() {
    return 'DailyMissionsState.loaded(missions: $missions)';
  }
}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res>
    implements $DailyMissionsStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) =
      __$LoadedCopyWithImpl;
  @useResult
  $Res call({List<DailyMission> missions});
}

/// @nodoc
class __$LoadedCopyWithImpl<$Res> implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

  /// Create a copy of DailyMissionsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? missions = null,
  }) {
    return _then(_Loaded(
      missions: null == missions
          ? _self._missions
          : missions // ignore: cast_nullable_to_non_nullable
              as List<DailyMission>,
    ));
  }
}

/// @nodoc

class _Claiming implements DailyMissionsState {
  const _Claiming(
      {required final List<DailyMission> missions,
      required this.claimingMissionId})
      : _missions = missions;

  final List<DailyMission> _missions;
  List<DailyMission> get missions {
    if (_missions is EqualUnmodifiableListView) return _missions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_missions);
  }

  final String claimingMissionId;

  /// Create a copy of DailyMissionsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ClaimingCopyWith<_Claiming> get copyWith =>
      __$ClaimingCopyWithImpl<_Claiming>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Claiming &&
            const DeepCollectionEquality().equals(other._missions, _missions) &&
            (identical(other.claimingMissionId, claimingMissionId) ||
                other.claimingMissionId == claimingMissionId));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_missions), claimingMissionId);

  @override
  String toString() {
    return 'DailyMissionsState.claiming(missions: $missions, claimingMissionId: $claimingMissionId)';
  }
}

/// @nodoc
abstract mixin class _$ClaimingCopyWith<$Res>
    implements $DailyMissionsStateCopyWith<$Res> {
  factory _$ClaimingCopyWith(_Claiming value, $Res Function(_Claiming) _then) =
      __$ClaimingCopyWithImpl;
  @useResult
  $Res call({List<DailyMission> missions, String claimingMissionId});
}

/// @nodoc
class __$ClaimingCopyWithImpl<$Res> implements _$ClaimingCopyWith<$Res> {
  __$ClaimingCopyWithImpl(this._self, this._then);

  final _Claiming _self;
  final $Res Function(_Claiming) _then;

  /// Create a copy of DailyMissionsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? missions = null,
    Object? claimingMissionId = null,
  }) {
    return _then(_Claiming(
      missions: null == missions
          ? _self._missions
          : missions // ignore: cast_nullable_to_non_nullable
              as List<DailyMission>,
      claimingMissionId: null == claimingMissionId
          ? _self.claimingMissionId
          : claimingMissionId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _ClaimSuccess implements DailyMissionsState {
  const _ClaimSuccess(
      {required final List<DailyMission> missions,
      required this.earnedAmount,
      required this.completedMissionId})
      : _missions = missions;

  final List<DailyMission> _missions;
  List<DailyMission> get missions {
    if (_missions is EqualUnmodifiableListView) return _missions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_missions);
  }

  final double earnedAmount;
  final String completedMissionId;

  /// Create a copy of DailyMissionsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ClaimSuccessCopyWith<_ClaimSuccess> get copyWith =>
      __$ClaimSuccessCopyWithImpl<_ClaimSuccess>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ClaimSuccess &&
            const DeepCollectionEquality().equals(other._missions, _missions) &&
            (identical(other.earnedAmount, earnedAmount) ||
                other.earnedAmount == earnedAmount) &&
            (identical(other.completedMissionId, completedMissionId) ||
                other.completedMissionId == completedMissionId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_missions),
      earnedAmount,
      completedMissionId);

  @override
  String toString() {
    return 'DailyMissionsState.claimSuccess(missions: $missions, earnedAmount: $earnedAmount, completedMissionId: $completedMissionId)';
  }
}

/// @nodoc
abstract mixin class _$ClaimSuccessCopyWith<$Res>
    implements $DailyMissionsStateCopyWith<$Res> {
  factory _$ClaimSuccessCopyWith(
          _ClaimSuccess value, $Res Function(_ClaimSuccess) _then) =
      __$ClaimSuccessCopyWithImpl;
  @useResult
  $Res call(
      {List<DailyMission> missions,
      double earnedAmount,
      String completedMissionId});
}

/// @nodoc
class __$ClaimSuccessCopyWithImpl<$Res>
    implements _$ClaimSuccessCopyWith<$Res> {
  __$ClaimSuccessCopyWithImpl(this._self, this._then);

  final _ClaimSuccess _self;
  final $Res Function(_ClaimSuccess) _then;

  /// Create a copy of DailyMissionsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? missions = null,
    Object? earnedAmount = null,
    Object? completedMissionId = null,
  }) {
    return _then(_ClaimSuccess(
      missions: null == missions
          ? _self._missions
          : missions // ignore: cast_nullable_to_non_nullable
              as List<DailyMission>,
      earnedAmount: null == earnedAmount
          ? _self.earnedAmount
          : earnedAmount // ignore: cast_nullable_to_non_nullable
              as double,
      completedMissionId: null == completedMissionId
          ? _self.completedMissionId
          : completedMissionId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _Failure implements DailyMissionsState {
  const _Failure({required this.message, final List<DailyMission>? missions})
      : _missions = missions;

  final String message;
  final List<DailyMission>? _missions;
  List<DailyMission>? get missions {
    final value = _missions;
    if (value == null) return null;
    if (_missions is EqualUnmodifiableListView) return _missions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of DailyMissionsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FailureCopyWith<_Failure> get copyWith =>
      __$FailureCopyWithImpl<_Failure>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Failure &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._missions, _missions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, message, const DeepCollectionEquality().hash(_missions));

  @override
  String toString() {
    return 'DailyMissionsState.failure(message: $message, missions: $missions)';
  }
}

/// @nodoc
abstract mixin class _$FailureCopyWith<$Res>
    implements $DailyMissionsStateCopyWith<$Res> {
  factory _$FailureCopyWith(_Failure value, $Res Function(_Failure) _then) =
      __$FailureCopyWithImpl;
  @useResult
  $Res call({String message, List<DailyMission>? missions});
}

/// @nodoc
class __$FailureCopyWithImpl<$Res> implements _$FailureCopyWith<$Res> {
  __$FailureCopyWithImpl(this._self, this._then);

  final _Failure _self;
  final $Res Function(_Failure) _then;

  /// Create a copy of DailyMissionsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
    Object? missions = freezed,
  }) {
    return _then(_Failure(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      missions: freezed == missions
          ? _self._missions
          : missions // ignore: cast_nullable_to_non_nullable
              as List<DailyMission>?,
    ));
  }
}

// dart format on
