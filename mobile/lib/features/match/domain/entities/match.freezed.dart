// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'match.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Match _$MatchFromJson(Map<String, dynamic> json) {
  return _Match.fromJson(json);
}

/// @nodoc
mixin _$Match {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get matchedUserId => throw _privateConstructorUsedError;
  String get matchedUserName => throw _privateConstructorUsedError;
  DateTime get matchedAt => throw _privateConstructorUsedError;
  String? get matchedUserAvatarUrl => throw _privateConstructorUsedError;
  String? get matchedUserBio => throw _privateConstructorUsedError;

  /// Serializes this Match to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Match
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MatchCopyWith<Match> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchCopyWith<$Res> {
  factory $MatchCopyWith(Match value, $Res Function(Match) then) =
      _$MatchCopyWithImpl<$Res, Match>;
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
class _$MatchCopyWithImpl<$Res, $Val extends Match>
    implements $MatchCopyWith<$Res> {
  _$MatchCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      matchedUserId: null == matchedUserId
          ? _value.matchedUserId
          : matchedUserId // ignore: cast_nullable_to_non_nullable
              as String,
      matchedUserName: null == matchedUserName
          ? _value.matchedUserName
          : matchedUserName // ignore: cast_nullable_to_non_nullable
              as String,
      matchedAt: null == matchedAt
          ? _value.matchedAt
          : matchedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      matchedUserAvatarUrl: freezed == matchedUserAvatarUrl
          ? _value.matchedUserAvatarUrl
          : matchedUserAvatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      matchedUserBio: freezed == matchedUserBio
          ? _value.matchedUserBio
          : matchedUserBio // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MatchImplCopyWith<$Res> implements $MatchCopyWith<$Res> {
  factory _$$MatchImplCopyWith(
          _$MatchImpl value, $Res Function(_$MatchImpl) then) =
      __$$MatchImplCopyWithImpl<$Res>;
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
class __$$MatchImplCopyWithImpl<$Res>
    extends _$MatchCopyWithImpl<$Res, _$MatchImpl>
    implements _$$MatchImplCopyWith<$Res> {
  __$$MatchImplCopyWithImpl(
      _$MatchImpl _value, $Res Function(_$MatchImpl) _then)
      : super(_value, _then);

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
    return _then(_$MatchImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      matchedUserId: null == matchedUserId
          ? _value.matchedUserId
          : matchedUserId // ignore: cast_nullable_to_non_nullable
              as String,
      matchedUserName: null == matchedUserName
          ? _value.matchedUserName
          : matchedUserName // ignore: cast_nullable_to_non_nullable
              as String,
      matchedAt: null == matchedAt
          ? _value.matchedAt
          : matchedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      matchedUserAvatarUrl: freezed == matchedUserAvatarUrl
          ? _value.matchedUserAvatarUrl
          : matchedUserAvatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      matchedUserBio: freezed == matchedUserBio
          ? _value.matchedUserBio
          : matchedUserBio // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MatchImpl implements _Match {
  const _$MatchImpl(
      {required this.id,
      required this.userId,
      required this.matchedUserId,
      required this.matchedUserName,
      required this.matchedAt,
      this.matchedUserAvatarUrl,
      this.matchedUserBio});

  factory _$MatchImpl.fromJson(Map<String, dynamic> json) =>
      _$$MatchImplFromJson(json);

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

  @override
  String toString() {
    return 'Match(id: $id, userId: $userId, matchedUserId: $matchedUserId, matchedUserName: $matchedUserName, matchedAt: $matchedAt, matchedUserAvatarUrl: $matchedUserAvatarUrl, matchedUserBio: $matchedUserBio)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchImpl &&
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

  /// Create a copy of Match
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MatchImplCopyWith<_$MatchImpl> get copyWith =>
      __$$MatchImplCopyWithImpl<_$MatchImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MatchImplToJson(
      this,
    );
  }
}

abstract class _Match implements Match {
  const factory _Match(
      {required final String id,
      required final String userId,
      required final String matchedUserId,
      required final String matchedUserName,
      required final DateTime matchedAt,
      final String? matchedUserAvatarUrl,
      final String? matchedUserBio}) = _$MatchImpl;

  factory _Match.fromJson(Map<String, dynamic> json) = _$MatchImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get matchedUserId;
  @override
  String get matchedUserName;
  @override
  DateTime get matchedAt;
  @override
  String? get matchedUserAvatarUrl;
  @override
  String? get matchedUserBio;

  /// Create a copy of Match
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MatchImplCopyWith<_$MatchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MatchSuggestion _$MatchSuggestionFromJson(Map<String, dynamic> json) {
  return _MatchSuggestion.fromJson(json);
}

/// @nodoc
mixin _$MatchSuggestion {
  String get userId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get avatarUrl => throw _privateConstructorUsedError;
  String? get bio => throw _privateConstructorUsedError;
  int? get age => throw _privateConstructorUsedError;
  List<String>? get cryptoInterests => throw _privateConstructorUsedError;

  /// Serializes this MatchSuggestion to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MatchSuggestion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MatchSuggestionCopyWith<MatchSuggestion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchSuggestionCopyWith<$Res> {
  factory $MatchSuggestionCopyWith(
          MatchSuggestion value, $Res Function(MatchSuggestion) then) =
      _$MatchSuggestionCopyWithImpl<$Res, MatchSuggestion>;
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
class _$MatchSuggestionCopyWithImpl<$Res, $Val extends MatchSuggestion>
    implements $MatchSuggestionCopyWith<$Res> {
  _$MatchSuggestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      cryptoInterests: freezed == cryptoInterests
          ? _value.cryptoInterests
          : cryptoInterests // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MatchSuggestionImplCopyWith<$Res>
    implements $MatchSuggestionCopyWith<$Res> {
  factory _$$MatchSuggestionImplCopyWith(_$MatchSuggestionImpl value,
          $Res Function(_$MatchSuggestionImpl) then) =
      __$$MatchSuggestionImplCopyWithImpl<$Res>;
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
class __$$MatchSuggestionImplCopyWithImpl<$Res>
    extends _$MatchSuggestionCopyWithImpl<$Res, _$MatchSuggestionImpl>
    implements _$$MatchSuggestionImplCopyWith<$Res> {
  __$$MatchSuggestionImplCopyWithImpl(
      _$MatchSuggestionImpl _value, $Res Function(_$MatchSuggestionImpl) _then)
      : super(_value, _then);

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
    return _then(_$MatchSuggestionImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      cryptoInterests: freezed == cryptoInterests
          ? _value._cryptoInterests
          : cryptoInterests // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MatchSuggestionImpl implements _MatchSuggestion {
  const _$MatchSuggestionImpl(
      {required this.userId,
      required this.name,
      this.avatarUrl,
      this.bio,
      this.age,
      final List<String>? cryptoInterests})
      : _cryptoInterests = cryptoInterests;

  factory _$MatchSuggestionImpl.fromJson(Map<String, dynamic> json) =>
      _$$MatchSuggestionImplFromJson(json);

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

  @override
  String toString() {
    return 'MatchSuggestion(userId: $userId, name: $name, avatarUrl: $avatarUrl, bio: $bio, age: $age, cryptoInterests: $cryptoInterests)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchSuggestionImpl &&
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

  /// Create a copy of MatchSuggestion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MatchSuggestionImplCopyWith<_$MatchSuggestionImpl> get copyWith =>
      __$$MatchSuggestionImplCopyWithImpl<_$MatchSuggestionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MatchSuggestionImplToJson(
      this,
    );
  }
}

abstract class _MatchSuggestion implements MatchSuggestion {
  const factory _MatchSuggestion(
      {required final String userId,
      required final String name,
      final String? avatarUrl,
      final String? bio,
      final int? age,
      final List<String>? cryptoInterests}) = _$MatchSuggestionImpl;

  factory _MatchSuggestion.fromJson(Map<String, dynamic> json) =
      _$MatchSuggestionImpl.fromJson;

  @override
  String get userId;
  @override
  String get name;
  @override
  String? get avatarUrl;
  @override
  String? get bio;
  @override
  int? get age;
  @override
  List<String>? get cryptoInterests;

  /// Create a copy of MatchSuggestion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MatchSuggestionImplCopyWith<_$MatchSuggestionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
