import 'package:bloc_test/bloc_test.dart';
import 'package:crypto_match/core/error/failure.dart';
import 'package:crypto_match/features/token/domain/entities/token_action.dart';
import 'package:crypto_match/features/token/domain/use_cases/token_use_cases.dart';
import 'package:crypto_match/features/token/presentation/cubit/reward_actions_cubit.dart';
import 'package:crypto_match/features/token/presentation/cubit/reward_actions_state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// ---------------------------------------------------------------------------
// Mocks
// ---------------------------------------------------------------------------

class MockGetRewardActionsUseCase extends Mock
    implements GetRewardActionsUseCase {}

class MockDailyCheckinUseCase extends Mock implements DailyCheckinUseCase {}

class MockCompleteProfileActionUseCase extends Mock
    implements CompleteProfileActionUseCase {}

class MockInviteFriendUseCase extends Mock implements InviteFriendUseCase {}

// ---------------------------------------------------------------------------
// Fake data helpers
// ---------------------------------------------------------------------------

TokenAction _action({
  String id = 'daily-checkin',
  TokenActionType type = TokenActionType.dailyCheckin,
  String title = 'Check-in Diário',
  double reward = 10,
  bool isAvailable = true,
}) =>
    TokenAction(
      id: id,
      type: type,
      title: title,
      description: 'Faça login todo dia para ganhar tokens',
      reward: reward,
      isAvailable: isAvailable,
    );

// ---------------------------------------------------------------------------
// Tests
// ---------------------------------------------------------------------------

void main() {
  late MockGetRewardActionsUseCase getRewardActions;
  late MockDailyCheckinUseCase dailyCheckin;
  late MockCompleteProfileActionUseCase completeProfile;
  late MockInviteFriendUseCase inviteFriend;

  setUp(() {
    getRewardActions = MockGetRewardActionsUseCase();
    dailyCheckin = MockDailyCheckinUseCase();
    completeProfile = MockCompleteProfileActionUseCase();
    inviteFriend = MockInviteFriendUseCase();
  });

  RewardActionsCubit buildCubit() => RewardActionsCubit(
        getRewardActions,
        dailyCheckin,
        completeProfile,
        inviteFriend,
      );

  group('RewardActionsCubit', () {
    // -----------------------------------------------------------------------
    // loadActions
    // -----------------------------------------------------------------------
    group('loadActions', () {
      final actions = [_action()];

      blocTest<RewardActionsCubit, RewardActionsState>(
        'emits [loading, loaded] when use case succeeds',
        setUp: () =>
            when(getRewardActions.call).thenAnswer((_) async => Right(actions)),
        build: buildCubit,
        act: (cubit) => cubit.loadActions(),
        expect: () => [
          const RewardActionsState.loading(),
          RewardActionsState.loaded(actions: actions),
        ],
      );

      blocTest<RewardActionsCubit, RewardActionsState>(
        'emits [loading, failure] when use case returns a NetworkFailure',
        setUp: () => when(getRewardActions.call).thenAnswer(
          (_) async => const Left(Failure.network(message: 'Sem conexão')),
        ),
        build: buildCubit,
        act: (cubit) => cubit.loadActions(),
        expect: () => [
          const RewardActionsState.loading(),
          const RewardActionsState.failure(message: 'Sem conexão'),
        ],
      );

      blocTest<RewardActionsCubit, RewardActionsState>(
        'emits [loading, failure] when use case returns an UnauthorizedFailure',
        setUp: () => when(getRewardActions.call).thenAnswer(
          (_) async => const Left(Failure.unauthorized()),
        ),
        build: buildCubit,
        act: (cubit) => cubit.loadActions(),
        expect: () => [
          const RewardActionsState.loading(),
          const RewardActionsState.failure(message: 'Não autorizado'),
        ],
      );
    });

    // -----------------------------------------------------------------------
    // claimDailyCheckin
    // -----------------------------------------------------------------------
    group('claimDailyCheckin', () {
      final actions = [_action(reward: 10)];

      blocTest<RewardActionsCubit, RewardActionsState>(
        'emits [claiming, claimSuccess, loading, loaded] when checkin succeeds',
        setUp: () {
          when(getRewardActions.call).thenAnswer((_) async => Right(actions));
          when(dailyCheckin.call).thenAnswer((_) async => const Right(null));
        },
        build: buildCubit,
        seed: () => RewardActionsState.loaded(actions: actions),
        act: (cubit) => cubit.claimDailyCheckin(),
        expect: () => [
          RewardActionsState.claiming(
            actions: actions,
            claimingActionId: 'daily-checkin',
          ),
          RewardActionsState.claimSuccess(actions: actions, earnedAmount: 10),
          const RewardActionsState.loading(),
          RewardActionsState.loaded(actions: actions),
        ],
      );

      blocTest<RewardActionsCubit, RewardActionsState>(
        'emits [claiming, failure] when checkin fails',
        setUp: () => when(dailyCheckin.call).thenAnswer(
          (_) async => const Left(Failure.network(message: 'Erro de rede')),
        ),
        build: buildCubit,
        seed: () => RewardActionsState.loaded(actions: actions),
        act: (cubit) => cubit.claimDailyCheckin(),
        expect: () => [
          RewardActionsState.claiming(
            actions: actions,
            claimingActionId: 'daily-checkin',
          ),
          RewardActionsState.failure(
            message: 'Erro de rede',
            actions: actions,
          ),
        ],
      );

      blocTest<RewardActionsCubit, RewardActionsState>(
        'does nothing when called from initial state (no current actions)',
        build: buildCubit,
        act: (cubit) => cubit.claimDailyCheckin(),
        expect: () => <RewardActionsState>[],
      );
    });

    // -----------------------------------------------------------------------
    // claimCompleteProfile
    // -----------------------------------------------------------------------
    group('claimCompleteProfile', () {
      final actions = [
        _action(
          id: 'complete-profile',
          type: TokenActionType.completeProfile,
          reward: 50,
        ),
      ];

      blocTest<RewardActionsCubit, RewardActionsState>(
        'emits [claiming, claimSuccess, loading, loaded] when action succeeds',
        setUp: () {
          when(getRewardActions.call).thenAnswer((_) async => Right(actions));
          when(completeProfile.call).thenAnswer((_) async => const Right(null));
        },
        build: buildCubit,
        seed: () => RewardActionsState.loaded(actions: actions),
        act: (cubit) => cubit.claimCompleteProfile(),
        expect: () => [
          RewardActionsState.claiming(
            actions: actions,
            claimingActionId: 'complete-profile',
          ),
          RewardActionsState.claimSuccess(actions: actions, earnedAmount: 50),
          const RewardActionsState.loading(),
          RewardActionsState.loaded(actions: actions),
        ],
      );

      blocTest<RewardActionsCubit, RewardActionsState>(
        'emits zero states when called from initial state',
        build: buildCubit,
        act: (cubit) => cubit.claimCompleteProfile(),
        expect: () => <RewardActionsState>[],
      );
    });

    // -----------------------------------------------------------------------
    // claimInviteFriend
    // -----------------------------------------------------------------------
    group('claimInviteFriend', () {
      final actions = [
        _action(
          id: 'invite-friend',
          type: TokenActionType.inviteFriend,
          reward: 30,
        ),
      ];

      blocTest<RewardActionsCubit, RewardActionsState>(
        'emits [claiming, claimSuccess, loading, loaded] when invite succeeds',
        setUp: () {
          when(getRewardActions.call).thenAnswer((_) async => Right(actions));
          when(
            () => inviteFriend(referralCode: 'ABC123'),
          ).thenAnswer((_) async => const Right(null));
        },
        build: buildCubit,
        seed: () => RewardActionsState.loaded(actions: actions),
        act: (cubit) => cubit.claimInviteFriend(referralCode: 'ABC123'),
        expect: () => [
          RewardActionsState.claiming(
            actions: actions,
            claimingActionId: 'invite-friend',
          ),
          RewardActionsState.claimSuccess(actions: actions, earnedAmount: 30),
          const RewardActionsState.loading(),
          RewardActionsState.loaded(actions: actions),
        ],
      );

      blocTest<RewardActionsCubit, RewardActionsState>(
        'emits [claiming, failure] when invite returns ServerFailure',
        setUp: () => when(
          () => inviteFriend(referralCode: 'INVALID'),
        ).thenAnswer(
          (_) async => const Left(
            Failure.server(statusCode: 400, message: 'Código inválido'),
          ),
        ),
        build: buildCubit,
        seed: () => RewardActionsState.loaded(actions: actions),
        act: (cubit) => cubit.claimInviteFriend(referralCode: 'INVALID'),
        expect: () => [
          RewardActionsState.claiming(
            actions: actions,
            claimingActionId: 'invite-friend',
          ),
          RewardActionsState.failure(
            message: 'Código inválido',
            actions: actions,
          ),
        ],
      );
    });
  });
}
