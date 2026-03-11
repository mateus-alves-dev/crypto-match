// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'token_balance.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TokenBalance _$TokenBalanceFromJson(Map<String, dynamic> json) {
  return _TokenBalance.fromJson(json);
}

/// @nodoc
mixin _$TokenBalance {
  String get userId => throw _privateConstructorUsedError;
  double get balance => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this TokenBalance to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TokenBalance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TokenBalanceCopyWith<TokenBalance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenBalanceCopyWith<$Res> {
  factory $TokenBalanceCopyWith(
          TokenBalance value, $Res Function(TokenBalance) then) =
      _$TokenBalanceCopyWithImpl<$Res, TokenBalance>;
  @useResult
  $Res call({String userId, double balance, DateTime updatedAt});
}

/// @nodoc
class _$TokenBalanceCopyWithImpl<$Res, $Val extends TokenBalance>
    implements $TokenBalanceCopyWith<$Res> {
  _$TokenBalanceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TokenBalance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? balance = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TokenBalanceImplCopyWith<$Res>
    implements $TokenBalanceCopyWith<$Res> {
  factory _$$TokenBalanceImplCopyWith(
          _$TokenBalanceImpl value, $Res Function(_$TokenBalanceImpl) then) =
      __$$TokenBalanceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId, double balance, DateTime updatedAt});
}

/// @nodoc
class __$$TokenBalanceImplCopyWithImpl<$Res>
    extends _$TokenBalanceCopyWithImpl<$Res, _$TokenBalanceImpl>
    implements _$$TokenBalanceImplCopyWith<$Res> {
  __$$TokenBalanceImplCopyWithImpl(
      _$TokenBalanceImpl _value, $Res Function(_$TokenBalanceImpl) _then)
      : super(_value, _then);

  /// Create a copy of TokenBalance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? balance = null,
    Object? updatedAt = null,
  }) {
    return _then(_$TokenBalanceImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TokenBalanceImpl implements _TokenBalance {
  const _$TokenBalanceImpl(
      {required this.userId, required this.balance, required this.updatedAt});

  factory _$TokenBalanceImpl.fromJson(Map<String, dynamic> json) =>
      _$$TokenBalanceImplFromJson(json);

  @override
  final String userId;
  @override
  final double balance;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'TokenBalance(userId: $userId, balance: $balance, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TokenBalanceImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userId, balance, updatedAt);

  /// Create a copy of TokenBalance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TokenBalanceImplCopyWith<_$TokenBalanceImpl> get copyWith =>
      __$$TokenBalanceImplCopyWithImpl<_$TokenBalanceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TokenBalanceImplToJson(
      this,
    );
  }
}

abstract class _TokenBalance implements TokenBalance {
  const factory _TokenBalance(
      {required final String userId,
      required final double balance,
      required final DateTime updatedAt}) = _$TokenBalanceImpl;

  factory _TokenBalance.fromJson(Map<String, dynamic> json) =
      _$TokenBalanceImpl.fromJson;

  @override
  String get userId;
  @override
  double get balance;
  @override
  DateTime get updatedAt;

  /// Create a copy of TokenBalance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TokenBalanceImplCopyWith<_$TokenBalanceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TokenTransaction _$TokenTransactionFromJson(Map<String, dynamic> json) {
  return _TokenTransaction.fromJson(json);
}

/// @nodoc
mixin _$TokenTransaction {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  TokenTransactionType get type => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  String get reason => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

  /// Serializes this TokenTransaction to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TokenTransaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TokenTransactionCopyWith<TokenTransaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenTransactionCopyWith<$Res> {
  factory $TokenTransactionCopyWith(
          TokenTransaction value, $Res Function(TokenTransaction) then) =
      _$TokenTransactionCopyWithImpl<$Res, TokenTransaction>;
  @useResult
  $Res call(
      {String id,
      String userId,
      TokenTransactionType type,
      double amount,
      String reason,
      DateTime createdAt,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class _$TokenTransactionCopyWithImpl<$Res, $Val extends TokenTransaction>
    implements $TokenTransactionCopyWith<$Res> {
  _$TokenTransactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TokenTransaction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? type = null,
    Object? amount = null,
    Object? reason = null,
    Object? createdAt = null,
    Object? metadata = freezed,
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
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TokenTransactionType,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TokenTransactionImplCopyWith<$Res>
    implements $TokenTransactionCopyWith<$Res> {
  factory _$$TokenTransactionImplCopyWith(_$TokenTransactionImpl value,
          $Res Function(_$TokenTransactionImpl) then) =
      __$$TokenTransactionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      TokenTransactionType type,
      double amount,
      String reason,
      DateTime createdAt,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class __$$TokenTransactionImplCopyWithImpl<$Res>
    extends _$TokenTransactionCopyWithImpl<$Res, _$TokenTransactionImpl>
    implements _$$TokenTransactionImplCopyWith<$Res> {
  __$$TokenTransactionImplCopyWithImpl(_$TokenTransactionImpl _value,
      $Res Function(_$TokenTransactionImpl) _then)
      : super(_value, _then);

  /// Create a copy of TokenTransaction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? type = null,
    Object? amount = null,
    Object? reason = null,
    Object? createdAt = null,
    Object? metadata = freezed,
  }) {
    return _then(_$TokenTransactionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TokenTransactionType,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TokenTransactionImpl implements _TokenTransaction {
  const _$TokenTransactionImpl(
      {required this.id,
      required this.userId,
      required this.type,
      required this.amount,
      required this.reason,
      required this.createdAt,
      final Map<String, dynamic>? metadata})
      : _metadata = metadata;

  factory _$TokenTransactionImpl.fromJson(Map<String, dynamic> json) =>
      _$$TokenTransactionImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final TokenTransactionType type;
  @override
  final double amount;
  @override
  final String reason;
  @override
  final DateTime createdAt;
  final Map<String, dynamic>? _metadata;
  @override
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'TokenTransaction(id: $id, userId: $userId, type: $type, amount: $amount, reason: $reason, createdAt: $createdAt, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TokenTransactionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, type, amount, reason,
      createdAt, const DeepCollectionEquality().hash(_metadata));

  /// Create a copy of TokenTransaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TokenTransactionImplCopyWith<_$TokenTransactionImpl> get copyWith =>
      __$$TokenTransactionImplCopyWithImpl<_$TokenTransactionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TokenTransactionImplToJson(
      this,
    );
  }
}

abstract class _TokenTransaction implements TokenTransaction {
  const factory _TokenTransaction(
      {required final String id,
      required final String userId,
      required final TokenTransactionType type,
      required final double amount,
      required final String reason,
      required final DateTime createdAt,
      final Map<String, dynamic>? metadata}) = _$TokenTransactionImpl;

  factory _TokenTransaction.fromJson(Map<String, dynamic> json) =
      _$TokenTransactionImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  TokenTransactionType get type;
  @override
  double get amount;
  @override
  String get reason;
  @override
  DateTime get createdAt;
  @override
  Map<String, dynamic>? get metadata;

  /// Create a copy of TokenTransaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TokenTransactionImplCopyWith<_$TokenTransactionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
