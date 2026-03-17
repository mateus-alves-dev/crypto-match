// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Profile {
  String get userId;
  String get displayName;
  DateTime get updatedAt;
  String? get bio;
  String? get avatarUrl;
  List<String>? get cryptoInterests;
  List<String>? get personaTags;
  int? get age;
  String? get location;
  List<String>? get badges;

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProfileCopyWith<Profile> get copyWith =>
      _$ProfileCopyWithImpl<Profile>(this as Profile, _$identity);

  /// Serializes this Profile to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Profile &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            const DeepCollectionEquality()
                .equals(other.cryptoInterests, cryptoInterests) &&
            const DeepCollectionEquality()
                .equals(other.personaTags, personaTags) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.location, location) ||
                other.location == location) &&
            const DeepCollectionEquality().equals(other.badges, badges));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      displayName,
      updatedAt,
      bio,
      avatarUrl,
      const DeepCollectionEquality().hash(cryptoInterests),
      const DeepCollectionEquality().hash(personaTags),
      age,
      location,
      const DeepCollectionEquality().hash(badges));

  @override
  String toString() {
    return 'Profile(userId: $userId, displayName: $displayName, updatedAt: $updatedAt, bio: $bio, avatarUrl: $avatarUrl, cryptoInterests: $cryptoInterests, personaTags: $personaTags, age: $age, location: $location, badges: $badges)';
  }
}

/// @nodoc
abstract mixin class $ProfileCopyWith<$Res> {
  factory $ProfileCopyWith(Profile value, $Res Function(Profile) _then) =
      _$ProfileCopyWithImpl;
  @useResult
  $Res call(
      {String userId,
      String displayName,
      DateTime updatedAt,
      String? bio,
      String? avatarUrl,
      List<String>? cryptoInterests,
      List<String>? personaTags,
      int? age,
      String? location,
      List<String>? badges});
}

/// @nodoc
class _$ProfileCopyWithImpl<$Res> implements $ProfileCopyWith<$Res> {
  _$ProfileCopyWithImpl(this._self, this._then);

  final Profile _self;
  final $Res Function(Profile) _then;

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? displayName = null,
    Object? updatedAt = null,
    Object? bio = freezed,
    Object? avatarUrl = freezed,
    Object? cryptoInterests = freezed,
    Object? personaTags = freezed,
    Object? age = freezed,
    Object? location = freezed,
    Object? badges = freezed,
  }) {
    return _then(_self.copyWith(
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _self.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      bio: freezed == bio
          ? _self.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarUrl: freezed == avatarUrl
          ? _self.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      cryptoInterests: freezed == cryptoInterests
          ? _self.cryptoInterests
          : cryptoInterests // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      personaTags: freezed == personaTags
          ? _self.personaTags
          : personaTags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      age: freezed == age
          ? _self.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      location: freezed == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      badges: freezed == badges
          ? _self.badges
          : badges // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// Adds pattern-matching-related methods to [Profile].
extension ProfilePatterns on Profile {
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
    TResult Function(_Profile value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Profile() when $default != null:
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
    TResult Function(_Profile value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Profile():
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
    TResult? Function(_Profile value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Profile() when $default != null:
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
            String userId,
            String displayName,
            DateTime updatedAt,
            String? bio,
            String? avatarUrl,
            List<String>? cryptoInterests,
            List<String>? personaTags,
            int? age,
            String? location,
            List<String>? badges)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Profile() when $default != null:
        return $default(
            _that.userId,
            _that.displayName,
            _that.updatedAt,
            _that.bio,
            _that.avatarUrl,
            _that.cryptoInterests,
            _that.personaTags,
            _that.age,
            _that.location,
            _that.badges);
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
            String userId,
            String displayName,
            DateTime updatedAt,
            String? bio,
            String? avatarUrl,
            List<String>? cryptoInterests,
            List<String>? personaTags,
            int? age,
            String? location,
            List<String>? badges)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Profile():
        return $default(
            _that.userId,
            _that.displayName,
            _that.updatedAt,
            _that.bio,
            _that.avatarUrl,
            _that.cryptoInterests,
            _that.personaTags,
            _that.age,
            _that.location,
            _that.badges);
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
            String userId,
            String displayName,
            DateTime updatedAt,
            String? bio,
            String? avatarUrl,
            List<String>? cryptoInterests,
            List<String>? personaTags,
            int? age,
            String? location,
            List<String>? badges)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Profile() when $default != null:
        return $default(
            _that.userId,
            _that.displayName,
            _that.updatedAt,
            _that.bio,
            _that.avatarUrl,
            _that.cryptoInterests,
            _that.personaTags,
            _that.age,
            _that.location,
            _that.badges);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Profile implements Profile {
  const _Profile(
      {required this.userId,
      required this.displayName,
      required this.updatedAt,
      this.bio,
      this.avatarUrl,
      final List<String>? cryptoInterests,
      final List<String>? personaTags,
      this.age,
      this.location,
      final List<String>? badges})
      : _cryptoInterests = cryptoInterests,
        _personaTags = personaTags,
        _badges = badges;
  factory _Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  @override
  final String userId;
  @override
  final String displayName;
  @override
  final DateTime updatedAt;
  @override
  final String? bio;
  @override
  final String? avatarUrl;
  final List<String>? _cryptoInterests;
  @override
  List<String>? get cryptoInterests {
    final value = _cryptoInterests;
    if (value == null) return null;
    if (_cryptoInterests is EqualUnmodifiableListView) return _cryptoInterests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _personaTags;
  @override
  List<String>? get personaTags {
    final value = _personaTags;
    if (value == null) return null;
    if (_personaTags is EqualUnmodifiableListView) return _personaTags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? age;
  @override
  final String? location;
  final List<String>? _badges;
  @override
  List<String>? get badges {
    final value = _badges;
    if (value == null) return null;
    if (_badges is EqualUnmodifiableListView) return _badges;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProfileCopyWith<_Profile> get copyWith =>
      __$ProfileCopyWithImpl<_Profile>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProfileToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Profile &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            const DeepCollectionEquality()
                .equals(other._cryptoInterests, _cryptoInterests) &&
            const DeepCollectionEquality()
                .equals(other._personaTags, _personaTags) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.location, location) ||
                other.location == location) &&
            const DeepCollectionEquality().equals(other._badges, _badges));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      displayName,
      updatedAt,
      bio,
      avatarUrl,
      const DeepCollectionEquality().hash(_cryptoInterests),
      const DeepCollectionEquality().hash(_personaTags),
      age,
      location,
      const DeepCollectionEquality().hash(_badges));

  @override
  String toString() {
    return 'Profile(userId: $userId, displayName: $displayName, updatedAt: $updatedAt, bio: $bio, avatarUrl: $avatarUrl, cryptoInterests: $cryptoInterests, personaTags: $personaTags, age: $age, location: $location, badges: $badges)';
  }
}

/// @nodoc
abstract mixin class _$ProfileCopyWith<$Res> implements $ProfileCopyWith<$Res> {
  factory _$ProfileCopyWith(_Profile value, $Res Function(_Profile) _then) =
      __$ProfileCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String userId,
      String displayName,
      DateTime updatedAt,
      String? bio,
      String? avatarUrl,
      List<String>? cryptoInterests,
      List<String>? personaTags,
      int? age,
      String? location,
      List<String>? badges});
}

/// @nodoc
class __$ProfileCopyWithImpl<$Res> implements _$ProfileCopyWith<$Res> {
  __$ProfileCopyWithImpl(this._self, this._then);

  final _Profile _self;
  final $Res Function(_Profile) _then;

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? userId = null,
    Object? displayName = null,
    Object? updatedAt = null,
    Object? bio = freezed,
    Object? avatarUrl = freezed,
    Object? cryptoInterests = freezed,
    Object? personaTags = freezed,
    Object? age = freezed,
    Object? location = freezed,
    Object? badges = freezed,
  }) {
    return _then(_Profile(
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _self.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      bio: freezed == bio
          ? _self.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarUrl: freezed == avatarUrl
          ? _self.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      cryptoInterests: freezed == cryptoInterests
          ? _self._cryptoInterests
          : cryptoInterests // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      personaTags: freezed == personaTags
          ? _self._personaTags
          : personaTags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      age: freezed == age
          ? _self.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      location: freezed == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      badges: freezed == badges
          ? _self._badges
          : badges // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

// dart format on
