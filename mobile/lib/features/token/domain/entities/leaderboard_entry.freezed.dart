// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leaderboard_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LeaderboardEntry {
  int get rank;
  String get userId;
  String get displayName;
  double get weeklyTokens;
  bool get hasWeeklyBadge;
  bool get isCurrentUser;
  String? get avatarUrl;

  /// Create a copy of LeaderboardEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LeaderboardEntryCopyWith<LeaderboardEntry> get copyWith =>
      _$LeaderboardEntryCopyWithImpl<LeaderboardEntry>(
          this as LeaderboardEntry, _$identity);

  /// Serializes this LeaderboardEntry to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LeaderboardEntry &&
            (identical(other.rank, rank) || other.rank == rank) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.weeklyTokens, weeklyTokens) ||
                other.weeklyTokens == weeklyTokens) &&
            (identical(other.hasWeeklyBadge, hasWeeklyBadge) ||
                other.hasWeeklyBadge == hasWeeklyBadge) &&
            (identical(other.isCurrentUser, isCurrentUser) ||
                other.isCurrentUser == isCurrentUser) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, rank, userId, displayName,
      weeklyTokens, hasWeeklyBadge, isCurrentUser, avatarUrl);

  @override
  String toString() {
    return 'LeaderboardEntry(rank: $rank, userId: $userId, displayName: $displayName, weeklyTokens: $weeklyTokens, hasWeeklyBadge: $hasWeeklyBadge, isCurrentUser: $isCurrentUser, avatarUrl: $avatarUrl)';
  }
}

/// @nodoc
abstract mixin class $LeaderboardEntryCopyWith<$Res> {
  factory $LeaderboardEntryCopyWith(
          LeaderboardEntry value, $Res Function(LeaderboardEntry) _then) =
      _$LeaderboardEntryCopyWithImpl;
  @useResult
  $Res call(
      {int rank,
      String userId,
      String displayName,
      double weeklyTokens,
      bool hasWeeklyBadge,
      bool isCurrentUser,
      String? avatarUrl});
}

/// @nodoc
class _$LeaderboardEntryCopyWithImpl<$Res>
    implements $LeaderboardEntryCopyWith<$Res> {
  _$LeaderboardEntryCopyWithImpl(this._self, this._then);

  final LeaderboardEntry _self;
  final $Res Function(LeaderboardEntry) _then;

  /// Create a copy of LeaderboardEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rank = null,
    Object? userId = null,
    Object? displayName = null,
    Object? weeklyTokens = null,
    Object? hasWeeklyBadge = null,
    Object? isCurrentUser = null,
    Object? avatarUrl = freezed,
  }) {
    return _then(_self.copyWith(
      rank: null == rank
          ? _self.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _self.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      weeklyTokens: null == weeklyTokens
          ? _self.weeklyTokens
          : weeklyTokens // ignore: cast_nullable_to_non_nullable
              as double,
      hasWeeklyBadge: null == hasWeeklyBadge
          ? _self.hasWeeklyBadge
          : hasWeeklyBadge // ignore: cast_nullable_to_non_nullable
              as bool,
      isCurrentUser: null == isCurrentUser
          ? _self.isCurrentUser
          : isCurrentUser // ignore: cast_nullable_to_non_nullable
              as bool,
      avatarUrl: freezed == avatarUrl
          ? _self.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [LeaderboardEntry].
extension LeaderboardEntryPatterns on LeaderboardEntry {
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
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_LeaderboardEntry value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LeaderboardEntry() when $default != null:
        return $default(_that);
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
  TResult map<TResult extends Object?>(
    TResult Function(_LeaderboardEntry value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LeaderboardEntry():
        return $default(_that);
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
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_LeaderboardEntry value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LeaderboardEntry() when $default != null:
        return $default(_that);
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
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            int rank,
            String userId,
            String displayName,
            double weeklyTokens,
            bool hasWeeklyBadge,
            bool isCurrentUser,
            String? avatarUrl)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LeaderboardEntry() when $default != null:
        return $default(
            _that.rank,
            _that.userId,
            _that.displayName,
            _that.weeklyTokens,
            _that.hasWeeklyBadge,
            _that.isCurrentUser,
            _that.avatarUrl);
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
  TResult when<TResult extends Object?>(
    TResult Function(
            int rank,
            String userId,
            String displayName,
            double weeklyTokens,
            bool hasWeeklyBadge,
            bool isCurrentUser,
            String? avatarUrl)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LeaderboardEntry():
        return $default(
            _that.rank,
            _that.userId,
            _that.displayName,
            _that.weeklyTokens,
            _that.hasWeeklyBadge,
            _that.isCurrentUser,
            _that.avatarUrl);
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
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            int rank,
            String userId,
            String displayName,
            double weeklyTokens,
            bool hasWeeklyBadge,
            bool isCurrentUser,
            String? avatarUrl)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LeaderboardEntry() when $default != null:
        return $default(
            _that.rank,
            _that.userId,
            _that.displayName,
            _that.weeklyTokens,
            _that.hasWeeklyBadge,
            _that.isCurrentUser,
            _that.avatarUrl);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _LeaderboardEntry implements LeaderboardEntry {
  const _LeaderboardEntry(
      {required this.rank,
      required this.userId,
      required this.displayName,
      required this.weeklyTokens,
      required this.hasWeeklyBadge,
      required this.isCurrentUser,
      this.avatarUrl});
  factory _LeaderboardEntry.fromJson(Map<String, dynamic> json) =>
      _$LeaderboardEntryFromJson(json);

  @override
  final int rank;
  @override
  final String userId;
  @override
  final String displayName;
  @override
  final double weeklyTokens;
  @override
  final bool hasWeeklyBadge;
  @override
  final bool isCurrentUser;
  @override
  final String? avatarUrl;

  /// Create a copy of LeaderboardEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LeaderboardEntryCopyWith<_LeaderboardEntry> get copyWith =>
      __$LeaderboardEntryCopyWithImpl<_LeaderboardEntry>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LeaderboardEntryToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LeaderboardEntry &&
            (identical(other.rank, rank) || other.rank == rank) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.weeklyTokens, weeklyTokens) ||
                other.weeklyTokens == weeklyTokens) &&
            (identical(other.hasWeeklyBadge, hasWeeklyBadge) ||
                other.hasWeeklyBadge == hasWeeklyBadge) &&
            (identical(other.isCurrentUser, isCurrentUser) ||
                other.isCurrentUser == isCurrentUser) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, rank, userId, displayName,
      weeklyTokens, hasWeeklyBadge, isCurrentUser, avatarUrl);

  @override
  String toString() {
    return 'LeaderboardEntry(rank: $rank, userId: $userId, displayName: $displayName, weeklyTokens: $weeklyTokens, hasWeeklyBadge: $hasWeeklyBadge, isCurrentUser: $isCurrentUser, avatarUrl: $avatarUrl)';
  }
}

/// @nodoc
abstract mixin class _$LeaderboardEntryCopyWith<$Res>
    implements $LeaderboardEntryCopyWith<$Res> {
  factory _$LeaderboardEntryCopyWith(
          _LeaderboardEntry value, $Res Function(_LeaderboardEntry) _then) =
      __$LeaderboardEntryCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int rank,
      String userId,
      String displayName,
      double weeklyTokens,
      bool hasWeeklyBadge,
      bool isCurrentUser,
      String? avatarUrl});
}

/// @nodoc
class __$LeaderboardEntryCopyWithImpl<$Res>
    implements _$LeaderboardEntryCopyWith<$Res> {
  __$LeaderboardEntryCopyWithImpl(this._self, this._then);

  final _LeaderboardEntry _self;
  final $Res Function(_LeaderboardEntry) _then;

  /// Create a copy of LeaderboardEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? rank = null,
    Object? userId = null,
    Object? displayName = null,
    Object? weeklyTokens = null,
    Object? hasWeeklyBadge = null,
    Object? isCurrentUser = null,
    Object? avatarUrl = freezed,
  }) {
    return _then(_LeaderboardEntry(
      rank: null == rank
          ? _self.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _self.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      weeklyTokens: null == weeklyTokens
          ? _self.weeklyTokens
          : weeklyTokens // ignore: cast_nullable_to_non_nullable
              as double,
      hasWeeklyBadge: null == hasWeeklyBadge
          ? _self.hasWeeklyBadge
          : hasWeeklyBadge // ignore: cast_nullable_to_non_nullable
              as bool,
      isCurrentUser: null == isCurrentUser
          ? _self.isCurrentUser
          : isCurrentUser // ignore: cast_nullable_to_non_nullable
              as bool,
      avatarUrl: freezed == avatarUrl
          ? _self.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
