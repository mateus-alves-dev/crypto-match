// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'match.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Match {
  String get id;
  String get userId;
  String get matchedUserId;
  String get matchedUserName;
  DateTime get matchedAt;
  String? get matchedUserAvatarUrl;
  String? get matchedUserBio;

  /// Create a copy of Match
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MatchCopyWith<Match> get copyWith =>
      _$MatchCopyWithImpl<Match>(this as Match, _$identity);

  /// Serializes this Match to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Match &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.matchedUserId, matchedUserId) ||
                other.matchedUserId == matchedUserId) &&
            (identical(other.matchedUserName, matchedUserName) ||
                other.matchedUserName == matchedUserName) &&
            (identical(other.matchedAt, matchedAt) ||
                other.matchedAt == matchedAt) &&
            (identical(other.matchedUserAvatarUrl, matchedUserAvatarUrl) ||
                other.matchedUserAvatarUrl == matchedUserAvatarUrl) &&
            (identical(other.matchedUserBio, matchedUserBio) ||
                other.matchedUserBio == matchedUserBio));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, matchedUserId,
      matchedUserName, matchedAt, matchedUserAvatarUrl, matchedUserBio);

  @override
  String toString() {
    return 'Match(id: $id, userId: $userId, matchedUserId: $matchedUserId, matchedUserName: $matchedUserName, matchedAt: $matchedAt, matchedUserAvatarUrl: $matchedUserAvatarUrl, matchedUserBio: $matchedUserBio)';
  }
}

/// @nodoc
abstract mixin class $MatchCopyWith<$Res> {
  factory $MatchCopyWith(Match value, $Res Function(Match) _then) =
      _$MatchCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String userId,
      String matchedUserId,
      String matchedUserName,
      DateTime matchedAt,
      String? matchedUserAvatarUrl,
      String? matchedUserBio});
}

/// @nodoc
class _$MatchCopyWithImpl<$Res> implements $MatchCopyWith<$Res> {
  _$MatchCopyWithImpl(this._self, this._then);

  final Match _self;
  final $Res Function(Match) _then;

  /// Create a copy of Match
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? matchedUserId = null,
    Object? matchedUserName = null,
    Object? matchedAt = null,
    Object? matchedUserAvatarUrl = freezed,
    Object? matchedUserBio = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      matchedUserId: null == matchedUserId
          ? _self.matchedUserId
          : matchedUserId // ignore: cast_nullable_to_non_nullable
              as String,
      matchedUserName: null == matchedUserName
          ? _self.matchedUserName
          : matchedUserName // ignore: cast_nullable_to_non_nullable
              as String,
      matchedAt: null == matchedAt
          ? _self.matchedAt
          : matchedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      matchedUserAvatarUrl: freezed == matchedUserAvatarUrl
          ? _self.matchedUserAvatarUrl
          : matchedUserAvatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      matchedUserBio: freezed == matchedUserBio
          ? _self.matchedUserBio
          : matchedUserBio // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [Match].
extension MatchPatterns on Match {
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
    TResult Function(_Match value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Match() when $default != null:
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
    TResult Function(_Match value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Match():
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
    TResult? Function(_Match value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Match() when $default != null:
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
            String id,
            String userId,
            String matchedUserId,
            String matchedUserName,
            DateTime matchedAt,
            String? matchedUserAvatarUrl,
            String? matchedUserBio)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Match() when $default != null:
        return $default(
            _that.id,
            _that.userId,
            _that.matchedUserId,
            _that.matchedUserName,
            _that.matchedAt,
            _that.matchedUserAvatarUrl,
            _that.matchedUserBio);
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
            String id,
            String userId,
            String matchedUserId,
            String matchedUserName,
            DateTime matchedAt,
            String? matchedUserAvatarUrl,
            String? matchedUserBio)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Match():
        return $default(
            _that.id,
            _that.userId,
            _that.matchedUserId,
            _that.matchedUserName,
            _that.matchedAt,
            _that.matchedUserAvatarUrl,
            _that.matchedUserBio);
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
            String id,
            String userId,
            String matchedUserId,
            String matchedUserName,
            DateTime matchedAt,
            String? matchedUserAvatarUrl,
            String? matchedUserBio)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Match() when $default != null:
        return $default(
            _that.id,
            _that.userId,
            _that.matchedUserId,
            _that.matchedUserName,
            _that.matchedAt,
            _that.matchedUserAvatarUrl,
            _that.matchedUserBio);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Match implements Match {
  const _Match(
      {required this.id,
      required this.userId,
      required this.matchedUserId,
      required this.matchedUserName,
      required this.matchedAt,
      this.matchedUserAvatarUrl,
      this.matchedUserBio});
  factory _Match.fromJson(Map<String, dynamic> json) => _$MatchFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String matchedUserId;
  @override
  final String matchedUserName;
  @override
  final DateTime matchedAt;
  @override
  final String? matchedUserAvatarUrl;
  @override
  final String? matchedUserBio;

  /// Create a copy of Match
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MatchCopyWith<_Match> get copyWith =>
      __$MatchCopyWithImpl<_Match>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MatchToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Match &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.matchedUserId, matchedUserId) ||
                other.matchedUserId == matchedUserId) &&
            (identical(other.matchedUserName, matchedUserName) ||
                other.matchedUserName == matchedUserName) &&
            (identical(other.matchedAt, matchedAt) ||
                other.matchedAt == matchedAt) &&
            (identical(other.matchedUserAvatarUrl, matchedUserAvatarUrl) ||
                other.matchedUserAvatarUrl == matchedUserAvatarUrl) &&
            (identical(other.matchedUserBio, matchedUserBio) ||
                other.matchedUserBio == matchedUserBio));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, matchedUserId,
      matchedUserName, matchedAt, matchedUserAvatarUrl, matchedUserBio);

  @override
  String toString() {
    return 'Match(id: $id, userId: $userId, matchedUserId: $matchedUserId, matchedUserName: $matchedUserName, matchedAt: $matchedAt, matchedUserAvatarUrl: $matchedUserAvatarUrl, matchedUserBio: $matchedUserBio)';
  }
}

/// @nodoc
abstract mixin class _$MatchCopyWith<$Res> implements $MatchCopyWith<$Res> {
  factory _$MatchCopyWith(_Match value, $Res Function(_Match) _then) =
      __$MatchCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String matchedUserId,
      String matchedUserName,
      DateTime matchedAt,
      String? matchedUserAvatarUrl,
      String? matchedUserBio});
}

/// @nodoc
class __$MatchCopyWithImpl<$Res> implements _$MatchCopyWith<$Res> {
  __$MatchCopyWithImpl(this._self, this._then);

  final _Match _self;
  final $Res Function(_Match) _then;

  /// Create a copy of Match
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? matchedUserId = null,
    Object? matchedUserName = null,
    Object? matchedAt = null,
    Object? matchedUserAvatarUrl = freezed,
    Object? matchedUserBio = freezed,
  }) {
    return _then(_Match(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      matchedUserId: null == matchedUserId
          ? _self.matchedUserId
          : matchedUserId // ignore: cast_nullable_to_non_nullable
              as String,
      matchedUserName: null == matchedUserName
          ? _self.matchedUserName
          : matchedUserName // ignore: cast_nullable_to_non_nullable
              as String,
      matchedAt: null == matchedAt
          ? _self.matchedAt
          : matchedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      matchedUserAvatarUrl: freezed == matchedUserAvatarUrl
          ? _self.matchedUserAvatarUrl
          : matchedUserAvatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      matchedUserBio: freezed == matchedUserBio
          ? _self.matchedUserBio
          : matchedUserBio // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$MatchSuggestion {
  String get userId;
  String get name;
  String? get avatarUrl;
  String? get bio;
  int? get age;
  List<String>? get cryptoInterests;

  /// Create a copy of MatchSuggestion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MatchSuggestionCopyWith<MatchSuggestion> get copyWith =>
      _$MatchSuggestionCopyWithImpl<MatchSuggestion>(
          this as MatchSuggestion, _$identity);

  /// Serializes this MatchSuggestion to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MatchSuggestion &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.age, age) || other.age == age) &&
            const DeepCollectionEquality()
                .equals(other.cryptoInterests, cryptoInterests));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userId, name, avatarUrl, bio,
      age, const DeepCollectionEquality().hash(cryptoInterests));

  @override
  String toString() {
    return 'MatchSuggestion(userId: $userId, name: $name, avatarUrl: $avatarUrl, bio: $bio, age: $age, cryptoInterests: $cryptoInterests)';
  }
}

/// @nodoc
abstract mixin class $MatchSuggestionCopyWith<$Res> {
  factory $MatchSuggestionCopyWith(
          MatchSuggestion value, $Res Function(MatchSuggestion) _then) =
      _$MatchSuggestionCopyWithImpl;
  @useResult
  $Res call(
      {String userId,
      String name,
      String? avatarUrl,
      String? bio,
      int? age,
      List<String>? cryptoInterests});
}

/// @nodoc
class _$MatchSuggestionCopyWithImpl<$Res>
    implements $MatchSuggestionCopyWith<$Res> {
  _$MatchSuggestionCopyWithImpl(this._self, this._then);

  final MatchSuggestion _self;
  final $Res Function(MatchSuggestion) _then;

  /// Create a copy of MatchSuggestion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? name = null,
    Object? avatarUrl = freezed,
    Object? bio = freezed,
    Object? age = freezed,
    Object? cryptoInterests = freezed,
  }) {
    return _then(_self.copyWith(
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: freezed == avatarUrl
          ? _self.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _self.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      age: freezed == age
          ? _self.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      cryptoInterests: freezed == cryptoInterests
          ? _self.cryptoInterests
          : cryptoInterests // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// Adds pattern-matching-related methods to [MatchSuggestion].
extension MatchSuggestionPatterns on MatchSuggestion {
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
    TResult Function(_MatchSuggestion value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MatchSuggestion() when $default != null:
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
    TResult Function(_MatchSuggestion value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MatchSuggestion():
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
    TResult? Function(_MatchSuggestion value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MatchSuggestion() when $default != null:
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
    TResult Function(String userId, String name, String? avatarUrl, String? bio,
            int? age, List<String>? cryptoInterests)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MatchSuggestion() when $default != null:
        return $default(_that.userId, _that.name, _that.avatarUrl, _that.bio,
            _that.age, _that.cryptoInterests);
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
    TResult Function(String userId, String name, String? avatarUrl, String? bio,
            int? age, List<String>? cryptoInterests)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MatchSuggestion():
        return $default(_that.userId, _that.name, _that.avatarUrl, _that.bio,
            _that.age, _that.cryptoInterests);
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
    TResult? Function(String userId, String name, String? avatarUrl,
            String? bio, int? age, List<String>? cryptoInterests)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MatchSuggestion() when $default != null:
        return $default(_that.userId, _that.name, _that.avatarUrl, _that.bio,
            _that.age, _that.cryptoInterests);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _MatchSuggestion implements MatchSuggestion {
  const _MatchSuggestion(
      {required this.userId,
      required this.name,
      this.avatarUrl,
      this.bio,
      this.age,
      final List<String>? cryptoInterests})
      : _cryptoInterests = cryptoInterests;
  factory _MatchSuggestion.fromJson(Map<String, dynamic> json) =>
      _$MatchSuggestionFromJson(json);

  @override
  final String userId;
  @override
  final String name;
  @override
  final String? avatarUrl;
  @override
  final String? bio;
  @override
  final int? age;
  final List<String>? _cryptoInterests;
  @override
  List<String>? get cryptoInterests {
    final value = _cryptoInterests;
    if (value == null) return null;
    if (_cryptoInterests is EqualUnmodifiableListView) return _cryptoInterests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of MatchSuggestion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MatchSuggestionCopyWith<_MatchSuggestion> get copyWith =>
      __$MatchSuggestionCopyWithImpl<_MatchSuggestion>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MatchSuggestionToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MatchSuggestion &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.age, age) || other.age == age) &&
            const DeepCollectionEquality()
                .equals(other._cryptoInterests, _cryptoInterests));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userId, name, avatarUrl, bio,
      age, const DeepCollectionEquality().hash(_cryptoInterests));

  @override
  String toString() {
    return 'MatchSuggestion(userId: $userId, name: $name, avatarUrl: $avatarUrl, bio: $bio, age: $age, cryptoInterests: $cryptoInterests)';
  }
}

/// @nodoc
abstract mixin class _$MatchSuggestionCopyWith<$Res>
    implements $MatchSuggestionCopyWith<$Res> {
  factory _$MatchSuggestionCopyWith(
          _MatchSuggestion value, $Res Function(_MatchSuggestion) _then) =
      __$MatchSuggestionCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String userId,
      String name,
      String? avatarUrl,
      String? bio,
      int? age,
      List<String>? cryptoInterests});
}

/// @nodoc
class __$MatchSuggestionCopyWithImpl<$Res>
    implements _$MatchSuggestionCopyWith<$Res> {
  __$MatchSuggestionCopyWithImpl(this._self, this._then);

  final _MatchSuggestion _self;
  final $Res Function(_MatchSuggestion) _then;

  /// Create a copy of MatchSuggestion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? userId = null,
    Object? name = null,
    Object? avatarUrl = freezed,
    Object? bio = freezed,
    Object? age = freezed,
    Object? cryptoInterests = freezed,
  }) {
    return _then(_MatchSuggestion(
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: freezed == avatarUrl
          ? _self.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _self.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      age: freezed == age
          ? _self.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      cryptoInterests: freezed == cryptoInterests
          ? _self._cryptoInterests
          : cryptoInterests // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

// dart format on
