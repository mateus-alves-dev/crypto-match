import 'package:crypto_match/features/token/domain/entities/token_balance.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_state.freezed.dart';

@freezed
class TokenState with _$TokenState {
  const factory TokenState.initial() = _Initial;
  const factory TokenState.loading() = _Loading;
  const factory TokenState.loaded({
    required TokenBalance balance,
    required List<TokenTransaction> history,
  }) = _Loaded;
  const factory TokenState.failure({required String message}) = _Failure;
}
