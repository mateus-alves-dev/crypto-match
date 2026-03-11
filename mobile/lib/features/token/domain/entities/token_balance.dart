import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_balance.freezed.dart';
part 'token_balance.g.dart';

enum TokenTransactionType {
  credit,
  debit,
}

@freezed
class TokenBalance with _$TokenBalance {
  const factory TokenBalance({
    required String userId,
    required double balance,
    required DateTime updatedAt,
  }) = _TokenBalance;

  factory TokenBalance.fromJson(Map<String, dynamic> json) =>
      _$TokenBalanceFromJson(json);
}

@freezed
class TokenTransaction with _$TokenTransaction {
  const factory TokenTransaction({
    required String id,
    required String userId,
    required TokenTransactionType type,
    required double amount,
    required String reason,
    required DateTime createdAt,
    Map<String, dynamic>? metadata,
  }) = _TokenTransaction;

  factory TokenTransaction.fromJson(Map<String, dynamic> json) =>
      _$TokenTransactionFromJson(json);
}
