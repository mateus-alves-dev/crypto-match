import 'package:bloc_test/bloc_test.dart';
import 'package:crypto_match/core/error/failure.dart';
import 'package:crypto_match/features/token/domain/entities/daily_mission.dart';
import 'package:crypto_match/features/token/domain/use_cases/token_use_cases.dart';
import 'package:crypto_match/features/token/presentation/cubit/daily_missions_cubit.dart';
import 'package:crypto_match/features/token/presentation/cubit/daily_missions_state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// ---------------------------------------------------------------------------
// Mocks
// ---------------------------------------------------------------------------

class MockGetDailyMissionsUseCase extends Mock
    implements GetDailyMissionsUseCase {}

class MockClaimMissionRewardUseCase extends Mock
    implements ClaimMissionRewardUseCase {}

// ---------------------------------------------------------------------------
// Fake data helpers
// ---------------------------------------------------------------------------

DailyMission _mission({
  String id = 'mission-like',
  DailyMissionType type = DailyMissionType.like,
  String title = 'Dar 3 likes hoje',
  String description = 'Curta perfis para ganhar tokens',
  double reward = 5,
  int progress = 0,
  int target = 3,
  bool isCompleted = false,
  bool isRewarded = false,
  DateTime? resetsAt,
}) =>
    DailyMission(
      id: id,
      type: type,
      title: title,
      description: description,
      reward: reward,
      progress: progress,
      target: target,
      isCompleted: isCompleted,
      isRewarded: isRewarded,
      resetsAt: resetsAt ?? DateTime(2026, 3, 17),
    );

// ---------------------------------------------------------------------------
// Tests
// ---------------------------------------------------------------------------

void main() {
  late MockGetDailyMissionsUseCase getDailyMissions;
  late MockClaimMissionRewardUseCase claimMissionReward;

  setUp(() {
    getDailyMissions = MockGetDailyMissionsUseCase();
    claimMissionReward = MockClaimMissionRewardUseCase();
  });

  DailyMissionsCubit buildCubit() =>
      DailyMissionsCubit(getDailyMissions, claimMissionReward);

  group('DailyMissionsCubit', () {
    // -----------------------------------------------------------------------
    // loadMissions
    // -----------------------------------------------------------------------
    group('loadMissions', () {
      final missions = [_mission()];

      blocTest<DailyMissionsCubit, DailyMissionsState>(
        'emits [loading, loaded] when use case succeeds with no completed missions',
        setUp: () => when(getDailyMissions.call)
            .thenAnswer((_) async => Right(missions)),
        build: buildCubit,
        act: (cubit) => cubit.loadMissions(),
        expect: () => [
          const DailyMissionsState.loading(),
          DailyMissionsState.loaded(missions: missions),
        ],
      );

      blocTest<DailyMissionsCubit, DailyMissionsState>(
        'emits [loading, failure] when use case returns a NetworkFailure',
        setUp: () => when(getDailyMissions.call).thenAnswer(
          (_) async => const Left(Failure.network(message: 'Sem conexão')),
        ),
        build: buildCubit,
        act: (cubit) => cubit.loadMissions(),
        expect: () => [
          const DailyMissionsState.loading(),
          const DailyMissionsState.failure(message: 'Sem conexão'),
        ],
      );

      blocTest<DailyMissionsCubit, DailyMissionsState>(
        'emits [loading, failure] when use case returns UnauthorizedFailure',
        setUp: () => when(getDailyMissions.call).thenAnswer(
          (_) async => const Left(Failure.unauthorized()),
        ),
        build: buildCubit,
        act: (cubit) => cubit.loadMissions(),
        expect: () => [
          const DailyMissionsState.loading(),
          const DailyMissionsState.failure(message: 'Não autorizado'),
        ],
      );
    });

    // -----------------------------------------------------------------------
    // auto-claim on load
    // -----------------------------------------------------------------------
    group('auto-claim', () {
      final completedMission = _mission(
        id: 'mission-like',
        isCompleted: true,
        isRewarded: false,
        reward: 5,
      );
      final reloadedMissions = [
        _mission(
          id: 'mission-like',
          isCompleted: true,
          isRewarded: true,
          progress: 3,
          target: 3,
          reward: 5,
        ),
      ];

      blocTest<DailyMissionsCubit, DailyMissionsState>(
        'emits [loading, loaded, claiming, claimSuccess, loading, loaded] '
        'when a completed+unawarded mission is found on load',
        setUp: () {
          // First call returns completed mission, second call returns rewarded
          var callCount = 0;
          when(getDailyMissions.call).thenAnswer((_) async {
            callCount++;
            return callCount == 1
                ? Right([completedMission])
                : Right(reloadedMissions);
          });
          when(
            () => claimMissionReward(missionId: completedMission.id),
          ).thenAnswer((_) async => const Right(5.0));
        },
        build: buildCubit,
        act: (cubit) => cubit.loadMissions(),
        expect: () => [
          const DailyMissionsState.loading(),
          DailyMissionsState.loaded(missions: [completedMission]),
          DailyMissionsState.claiming(
            missions: [completedMission],
            claimingMissionId: completedMission.id,
          ),
          DailyMissionsState.claimSuccess(
            missions: [completedMission],
            earnedAmount: 5.0,
            completedMissionId: completedMission.id,
          ),
          const DailyMissionsState.loading(),
          DailyMissionsState.loaded(missions: reloadedMissions),
        ],
      );

      blocTest<DailyMissionsCubit, DailyMissionsState>(
        'emits [..claiming, failure] with previous missions when claim fails',
        setUp: () {
          when(getDailyMissions.call).thenAnswer(
            (_) async => Right([completedMission]),
          );
          when(
            () => claimMissionReward(missionId: completedMission.id),
          ).thenAnswer(
            (_) async =>
                const Left(Failure.network(message: 'Erro ao reclamar')),
          );
        },
        build: buildCubit,
        act: (cubit) => cubit.loadMissions(),
        expect: () => [
          const DailyMissionsState.loading(),
          DailyMissionsState.loaded(missions: [completedMission]),
          DailyMissionsState.claiming(
            missions: [completedMission],
            claimingMissionId: completedMission.id,
          ),
          DailyMissionsState.failure(
            message: 'Erro ao reclamar',
            missions: [completedMission],
          ),
        ],
      );

      blocTest<DailyMissionsCubit, DailyMissionsState>(
        'does NOT auto-claim a mission that is already rewarded',
        setUp: () => when(getDailyMissions.call).thenAnswer(
          (_) async => Right([
            _mission(isCompleted: true, isRewarded: true),
          ]),
        ),
        build: buildCubit,
        act: (cubit) => cubit.loadMissions(),
        expect: () => [
          const DailyMissionsState.loading(),
          DailyMissionsState.loaded(
            missions: [_mission(isCompleted: true, isRewarded: true)],
          ),
        ],
        verify: (_) => verifyNever(
          () => claimMissionReward(missionId: any(named: 'missionId')),
        ),
      );
    });

    // -----------------------------------------------------------------------
    // refresh
    // -----------------------------------------------------------------------
    group('refresh', () {
      final missions = [_mission()];

      blocTest<DailyMissionsCubit, DailyMissionsState>(
        'refresh delegates to loadMissions',
        setUp: () => when(getDailyMissions.call)
            .thenAnswer((_) async => Right(missions)),
        build: buildCubit,
        act: (cubit) => cubit.refresh(),
        expect: () => [
          const DailyMissionsState.loading(),
          DailyMissionsState.loaded(missions: missions),
        ],
      );
    });
  });
}
