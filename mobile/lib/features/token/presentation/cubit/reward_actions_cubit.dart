import 'dart:async';

import 'package:crypto_match/features/token/domain/entities/token_action.dart';
import 'package:crypto_match/features/token/domain/use_cases/token_use_cases.dart';
import 'package:crypto_match/features/token/presentation/cubit/reward_actions_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class RewardActionsCubit extends Cubit<RewardActionsState> {
  RewardActionsCubit(
    this._getRewardActions,
    this._dailyCheckin,
    this._completeProfile,
    this._inviteFriend,
  ) : super(const RewardActionsState.initial());

  final GetRewardActionsUseCase _getRewardActions;
  final DailyCheckinUseCase _dailyCheckin;
  final CompleteProfileActionUseCase _completeProfile;
  final InviteFriendUseCase _inviteFriend;

  Future<void> loadActions() async {
    emit(const RewardActionsState.loading());
    final result = await _getRewardActions();
    result.fold(
      (failure) => emit(
        RewardActionsState.failure(
          message: failure.when(
            server: (_, message) => message,
            network: (message) => message,
            unauthorized: () => 'Não autorizado',
            notFound: () => 'Não encontrado',
            unknown: (message) => message,
          ),
        ),
      ),
      (actions) => emit(RewardActionsState.loaded(actions: actions)),
    );
  }

  Future<void> claimDailyCheckin() async {
    final current = _currentActions;
    if (current == null) return;
    const actionId = 'daily-checkin';
    emit(
      RewardActionsState.claiming(
        actions: current,
        claimingActionId: actionId,
      ),
    );

    final result = await _dailyCheckin();
    result.fold(
      (failure) => emit(
        RewardActionsState.failure(
          message: failure.when(
            server: (_, message) => message,
            network: (message) => message,
            unauthorized: () => 'Não autorizado',
            notFound: () => 'Não encontrado',
            unknown: (message) => message,
          ),
          actions: current,
        ),
      ),
      (_) => _onClaimSuccess(actionId),
    );
  }

  Future<void> claimCompleteProfile() async {
    final current = _currentActions;
    if (current == null) return;
    const actionId = 'complete-profile';
    emit(
      RewardActionsState.claiming(
        actions: current,
        claimingActionId: actionId,
      ),
    );

    final result = await _completeProfile();
    result.fold(
      (failure) => emit(
        RewardActionsState.failure(
          message: failure.when(
            server: (_, message) => message,
            network: (message) => message,
            unauthorized: () => 'Não autorizado',
            notFound: () => 'Não encontrado',
            unknown: (message) => message,
          ),
          actions: current,
        ),
      ),
      (_) => _onClaimSuccess(actionId),
    );
  }

  Future<void> claimInviteFriend({required String referralCode}) async {
    final current = _currentActions;
    if (current == null) return;
    const actionId = 'invite-friend';
    emit(
      RewardActionsState.claiming(
        actions: current,
        claimingActionId: actionId,
      ),
    );

    final result = await _inviteFriend(referralCode: referralCode);
    result.fold(
      (failure) => emit(
        RewardActionsState.failure(
          message: failure.when(
            server: (_, message) => message,
            network: (message) => message,
            unauthorized: () => 'Não autorizado',
            notFound: () => 'Não encontrado',
            unknown: (message) => message,
          ),
          actions: current,
        ),
      ),
      (_) => _onClaimSuccess(actionId),
    );
  }

  void _onClaimSuccess(String actionId) {
    final current = _currentActions ?? <TokenAction>[];
    final action = current.where((a) => a.id == actionId).firstOrNull;
    final earned = action?.reward ?? 0;
    emit(
      RewardActionsState.claimSuccess(
        actions: current,
        earnedAmount: earned,
      ),
    );
    // Reload actions so availability status is refreshed from the server.
    unawaited(loadActions());
  }

  List<TokenAction>? get _currentActions => state.when(
        initial: () => null,
        loading: () => null,
        loaded: (actions) => actions,
        claiming: (actions, _) => actions,
        claimSuccess: (actions, _) => actions,
        failure: (_, actions) => actions,
      );
}
