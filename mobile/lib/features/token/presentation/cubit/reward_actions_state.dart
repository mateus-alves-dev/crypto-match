import 'package:crypto_match/features/token/domain/entities/token_action.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reward_actions_state.freezed.dart';

@freezed
class RewardActionsState with _$RewardActionsState {
  const factory RewardActionsState.initial() = _Initial;
  const factory RewardActionsState.loading() = _Loading;
  const factory RewardActionsState.loaded({
    required List<TokenAction> actions,
  }) = _Loaded;
  const factory RewardActionsState.claiming({
    required List<TokenAction> actions,
    required String claimingActionId,
  }) = _Claiming;
  const factory RewardActionsState.claimSuccess({
    required List<TokenAction> actions,
    required double earnedAmount,
  }) = _ClaimSuccess;
  const factory RewardActionsState.failure({
    required String message,
    List<TokenAction>? actions,
  }) = _Failure;
}
