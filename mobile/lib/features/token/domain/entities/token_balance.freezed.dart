// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'token_balance.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TokenBalance {

 String get userId; double get balance; DateTime get updatedAt;
/// Create a copy of TokenBalance
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TokenBalanceCopyWith<TokenBalance> get copyWith => _$TokenBalanceCopyWithImpl<TokenBalance>(this as TokenBalance, _$identity);

  /// Serializes this TokenBalance to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TokenBalance&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,balance,updatedAt);

@override
String toString() {
  return 'TokenBalance(userId: $userId, balance: $balance, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $TokenBalanceCopyWith<$Res>  {
  factory $TokenBalanceCopyWith(TokenBalance value, $Res Function(TokenBalance) _then) = _$TokenBalanceCopyWithImpl;
@useResult
$Res call({
 String userId, double balance, DateTime updatedAt
});




}
/// @nodoc
class _$TokenBalanceCopyWithImpl<$Res>
    implements $TokenBalanceCopyWith<$Res> {
  _$TokenBalanceCopyWithImpl(this._self, this._then);

  final TokenBalance _self;
  final $Res Function(TokenBalance) _then;

/// Create a copy of TokenBalance
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? balance = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as double,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [TokenBalance].
extension TokenBalancePatterns on TokenBalance {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TokenBalance value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TokenBalance() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TokenBalance value)  $default,){
final _that = this;
switch (_that) {
case _TokenBalance():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TokenBalance value)?  $default,){
final _that = this;
switch (_that) {
case _TokenBalance() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userId,  double balance,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TokenBalance() when $default != null:
return $default(_that.userId,_that.balance,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userId,  double balance,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _TokenBalance():
return $default(_that.userId,_that.balance,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userId,  double balance,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _TokenBalance() when $default != null:
return $default(_that.userId,_that.balance,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TokenBalance implements TokenBalance {
  const _TokenBalance({required this.userId, required this.balance, required this.updatedAt});
  factory _TokenBalance.fromJson(Map<String, dynamic> json) => _$TokenBalanceFromJson(json);

@override final  String userId;
@override final  double balance;
@override final  DateTime updatedAt;

/// Create a copy of TokenBalance
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TokenBalanceCopyWith<_TokenBalance> get copyWith => __$TokenBalanceCopyWithImpl<_TokenBalance>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TokenBalanceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TokenBalance&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,balance,updatedAt);

@override
String toString() {
  return 'TokenBalance(userId: $userId, balance: $balance, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$TokenBalanceCopyWith<$Res> implements $TokenBalanceCopyWith<$Res> {
  factory _$TokenBalanceCopyWith(_TokenBalance value, $Res Function(_TokenBalance) _then) = __$TokenBalanceCopyWithImpl;
@override @useResult
$Res call({
 String userId, double balance, DateTime updatedAt
});




}
/// @nodoc
class __$TokenBalanceCopyWithImpl<$Res>
    implements _$TokenBalanceCopyWith<$Res> {
  __$TokenBalanceCopyWithImpl(this._self, this._then);

  final _TokenBalance _self;
  final $Res Function(_TokenBalance) _then;

/// Create a copy of TokenBalance
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? balance = null,Object? updatedAt = null,}) {
  return _then(_TokenBalance(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as double,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$TokenTransaction {

 String get id; String get userId; TokenTransactionType get type; double get amount; String get reason; DateTime get createdAt; Map<String, dynamic>? get metadata;
/// Create a copy of TokenTransaction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TokenTransactionCopyWith<TokenTransaction> get copyWith => _$TokenTransactionCopyWithImpl<TokenTransaction>(this as TokenTransaction, _$identity);

  /// Serializes this TokenTransaction to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TokenTransaction&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.type, type) || other.type == type)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other.metadata, metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,type,amount,reason,createdAt,const DeepCollectionEquality().hash(metadata));

@override
String toString() {
  return 'TokenTransaction(id: $id, userId: $userId, type: $type, amount: $amount, reason: $reason, createdAt: $createdAt, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $TokenTransactionCopyWith<$Res>  {
  factory $TokenTransactionCopyWith(TokenTransaction value, $Res Function(TokenTransaction) _then) = _$TokenTransactionCopyWithImpl;
@useResult
$Res call({
 String id, String userId, TokenTransactionType type, double amount, String reason, DateTime createdAt, Map<String, dynamic>? metadata
});




}
/// @nodoc
class _$TokenTransactionCopyWithImpl<$Res>
    implements $TokenTransactionCopyWith<$Res> {
  _$TokenTransactionCopyWithImpl(this._self, this._then);

  final TokenTransaction _self;
  final $Res Function(TokenTransaction) _then;

/// Create a copy of TokenTransaction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? type = null,Object? amount = null,Object? reason = null,Object? createdAt = null,Object? metadata = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TokenTransactionType,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [TokenTransaction].
extension TokenTransactionPatterns on TokenTransaction {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TokenTransaction value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TokenTransaction() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TokenTransaction value)  $default,){
final _that = this;
switch (_that) {
case _TokenTransaction():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TokenTransaction value)?  $default,){
final _that = this;
switch (_that) {
case _TokenTransaction() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  TokenTransactionType type,  double amount,  String reason,  DateTime createdAt,  Map<String, dynamic>? metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TokenTransaction() when $default != null:
return $default(_that.id,_that.userId,_that.type,_that.amount,_that.reason,_that.createdAt,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  TokenTransactionType type,  double amount,  String reason,  DateTime createdAt,  Map<String, dynamic>? metadata)  $default,) {final _that = this;
switch (_that) {
case _TokenTransaction():
return $default(_that.id,_that.userId,_that.type,_that.amount,_that.reason,_that.createdAt,_that.metadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  TokenTransactionType type,  double amount,  String reason,  DateTime createdAt,  Map<String, dynamic>? metadata)?  $default,) {final _that = this;
switch (_that) {
case _TokenTransaction() when $default != null:
return $default(_that.id,_that.userId,_that.type,_that.amount,_that.reason,_that.createdAt,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TokenTransaction implements TokenTransaction {
  const _TokenTransaction({required this.id, required this.userId, required this.type, required this.amount, required this.reason, required this.createdAt, final  Map<String, dynamic>? metadata}): _metadata = metadata;
  factory _TokenTransaction.fromJson(Map<String, dynamic> json) => _$TokenTransactionFromJson(json);

@override final  String id;
@override final  String userId;
@override final  TokenTransactionType type;
@override final  double amount;
@override final  String reason;
@override final  DateTime createdAt;
 final  Map<String, dynamic>? _metadata;
@override Map<String, dynamic>? get metadata {
  final value = _metadata;
  if (value == null) return null;
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of TokenTransaction
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TokenTransactionCopyWith<_TokenTransaction> get copyWith => __$TokenTransactionCopyWithImpl<_TokenTransaction>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TokenTransactionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TokenTransaction&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.type, type) || other.type == type)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other._metadata, _metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,type,amount,reason,createdAt,const DeepCollectionEquality().hash(_metadata));

@override
String toString() {
  return 'TokenTransaction(id: $id, userId: $userId, type: $type, amount: $amount, reason: $reason, createdAt: $createdAt, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$TokenTransactionCopyWith<$Res> implements $TokenTransactionCopyWith<$Res> {
  factory _$TokenTransactionCopyWith(_TokenTransaction value, $Res Function(_TokenTransaction) _then) = __$TokenTransactionCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, TokenTransactionType type, double amount, String reason, DateTime createdAt, Map<String, dynamic>? metadata
});




}
/// @nodoc
class __$TokenTransactionCopyWithImpl<$Res>
    implements _$TokenTransactionCopyWith<$Res> {
  __$TokenTransactionCopyWithImpl(this._self, this._then);

  final _TokenTransaction _self;
  final $Res Function(_TokenTransaction) _then;

/// Create a copy of TokenTransaction
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? type = null,Object? amount = null,Object? reason = null,Object? createdAt = null,Object? metadata = freezed,}) {
  return _then(_TokenTransaction(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TokenTransactionType,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,metadata: freezed == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}

// dart format on
