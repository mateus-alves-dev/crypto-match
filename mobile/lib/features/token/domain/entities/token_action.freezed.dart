// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'token_action.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TokenAction _$TokenActionFromJson(Map<String, dynamic> json) {
  return _TokenAction.fromJson(json);
}

/// @nodoc
mixin _$TokenAction {
  String get id => throw _privateConstructorUsedError;
  TokenActionType get type => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  double get reward => throw _privateConstructorUsedError;
  bool get isAvailable => throw _privateConstructorUsedError;
  DateTime? get nextAvailableAt => throw _privateConstructorUsedError;
  DateTime? get completedAt => throw _privateConstructorUsedError;

  /// Serializes this TokenAction to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TokenAction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TokenActionCopyWith<TokenAction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenActionCopyWith<$Res> {
  factory $TokenActionCopyWith(
          TokenAction value, $Res Function(TokenAction) then) =
      _$TokenActionCopyWithImpl<$Res, TokenAction>;
  @useResult
  $Res call(
      {String id,
      TokenActionType type,
      String title,
      String description,
      double reward,
      bool isAvailable,
      DateTime? nextAvailableAt,
      DateTime? completedAt});
}

/// @nodoc
class _$TokenActionCopyWithImpl<$Res, $Val extends TokenAction>
    implements $TokenActionCopyWith<$Res> {
  _$TokenActionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TokenAction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? title = null,
    Object? description = null,
    Object? reward = null,
    Object? isAvailable = null,
    Object? nextAvailableAt = freezed,
    Object? completedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TokenActionType,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      reward: null == reward
          ? _value.reward
          : reward // ignore: cast_nullable_to_non_nullable
              as double,
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      nextAvailableAt: freezed == nextAvailableAt
          ? _value.nextAvailableAt
          : nextAvailableAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TokenActionImplCopyWith<$Res>
    implements $TokenActionCopyWith<$Res> {
  factory _$$TokenActionImplCopyWith(
          _$TokenActionImpl value, $Res Function(_$TokenActionImpl) then) =
      __$$TokenActionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      TokenActionType type,
      String title,
      String description,
      double reward,
      bool isAvailable,
      DateTime? nextAvailableAt,
      DateTime? completedAt});
}

/// @nodoc
class __$$TokenActionImplCopyWithImpl<$Res>
    extends _$TokenActionCopyWithImpl<$Res, _$TokenActionImpl>
    implements _$$TokenActionImplCopyWith<$Res> {
  __$$TokenActionImplCopyWithImpl(
      _$TokenActionImpl _value, $Res Function(_$TokenActionImpl) _then)
      : super(_value, _then);

  /// Create a copy of TokenAction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? title = null,
    Object? description = null,
    Object? reward = null,
    Object? isAvailable = null,
    Object? nextAvailableAt = freezed,
    Object? completedAt = freezed,
  }) {
    return _then(_$TokenActionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TokenActionType,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      reward: null == reward
          ? _value.reward
          : reward // ignore: cast_nullable_to_non_nullable
              as double,
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      nextAvailableAt: freezed == nextAvailableAt
          ? _value.nextAvailableAt
          : nextAvailableAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TokenActionImpl implements _TokenAction {
  const _$TokenActionImpl(
      {required this.id,
      required this.type,
      required this.title,
      required this.description,
      required this.reward,
      required this.isAvailable,
      this.nextAvailableAt,
      this.completedAt});

  factory _$TokenActionImpl.fromJson(Map<String, dynamic> json) =>
      _$$TokenActionImplFromJson(json);

  @override
  final String id;
  @override
  final TokenActionType type;
  @override
  final String title;
  @override
  final String description;
  @override
  final double reward;
  @override
  final bool isAvailable;
  @override
  final DateTime? nextAvailableAt;
  @override
  final DateTime? completedAt;

  @override
  String toString() {
    return 'TokenAction(id: $id, type: $type, title: $title, description: $description, reward: $reward, isAvailable: $isAvailable, nextAvailableAt: $nextAvailableAt, completedAt: $completedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TokenActionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.reward, reward) || other.reward == reward) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable) &&
            (identical(other.nextAvailableAt, nextAvailableAt) ||
                other.nextAvailableAt == nextAvailableAt) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, type, title, description,
      reward, isAvailable, nextAvailableAt, completedAt);

  /// Create a copy of TokenAction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TokenActionImplCopyWith<_$TokenActionImpl> get copyWith =>
      __$$TokenActionImplCopyWithImpl<_$TokenActionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TokenActionImplToJson(
      this,
    );
  }
}

abstract class _TokenAction implements TokenAction {
  const factory _TokenAction(
      {required final String id,
      required final TokenActionType type,
      required final String title,
      required final String description,
      required final double reward,
      required final bool isAvailable,
      final DateTime? nextAvailableAt,
      final DateTime? completedAt}) = _$TokenActionImpl;

  factory _TokenAction.fromJson(Map<String, dynamic> json) =
      _$TokenActionImpl.fromJson;

  @override
  String get id;
  @override
  TokenActionType get type;
  @override
  String get title;
  @override
  String get description;
  @override
  double get reward;
  @override
  bool get isAvailable;
  @override
  DateTime? get nextAvailableAt;
  @override
  DateTime? get completedAt;

  /// Create a copy of TokenAction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TokenActionImplCopyWith<_$TokenActionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
