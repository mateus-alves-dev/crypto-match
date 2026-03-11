// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_balance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TokenBalanceImpl _$$TokenBalanceImplFromJson(Map<String, dynamic> json) =>
    _$TokenBalanceImpl(
      userId: json['userId'] as String,
      balance: (json['balance'] as num).toDouble(),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$TokenBalanceImplToJson(_$TokenBalanceImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'balance': instance.balance,
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

_$TokenTransactionImpl _$$TokenTransactionImplFromJson(
        Map<String, dynamic> json) =>
    _$TokenTransactionImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      type: $enumDecode(_$TokenTransactionTypeEnumMap, json['type']),
      amount: (json['amount'] as num).toDouble(),
      reason: json['reason'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$TokenTransactionImplToJson(
        _$TokenTransactionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'type': _$TokenTransactionTypeEnumMap[instance.type]!,
      'amount': instance.amount,
      'reason': instance.reason,
      'createdAt': instance.createdAt.toIso8601String(),
      'metadata': instance.metadata,
    };

const _$TokenTransactionTypeEnumMap = {
  TokenTransactionType.credit: 'credit',
  TokenTransactionType.debit: 'debit',
};
