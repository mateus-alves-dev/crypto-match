import 'package:bloc_test/bloc_test.dart';
import 'package:crypto_match/core/error/failure.dart';
import 'package:crypto_match/features/token/domain/entities/leaderboard_entry.dart';
import 'package:crypto_match/features/token/domain/use_cases/token_use_cases.dart';
import 'package:crypto_match/features/token/presentation/cubit/leaderboard_cubit.dart';
import 'package:crypto_match/features/token/presentation/cubit/leaderboard_state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// ---------------------------------------------------------------------------
// Mocks
// ---------------------------------------------------------------------------

class MockGetLeaderboardUseCase extends Mock implements GetLeaderboardUseCase {}

// ---------------------------------------------------------------------------
// Fake data helpers
// ---------------------------------------------------------------------------

LeaderboardEntry _entry({
  int rank = 1,
  String userId = 'user-1',
  String displayName = 'Alice',
  double weeklyTokens = 340,
  bool hasWeeklyBadge = true,
  bool isCurrentUser = false,
  String? avatarUrl,
}) =>
    LeaderboardEntry(
      rank: rank,
      userId: userId,
      displayName: displayName,
      weeklyTokens: weeklyTokens,
      hasWeeklyBadge: hasWeeklyBadge,
      isCurrentUser: isCurrentUser,
      avatarUrl: avatarUrl,
    );

// ---------------------------------------------------------------------------
// Tests
// ---------------------------------------------------------------------------

void main() {
  late MockGetLeaderboardUseCase getLeaderboard;

  setUp(() {
    getLeaderboard = MockGetLeaderboardUseCase();
  });

  LeaderboardCubit buildCubit() => LeaderboardCubit(getLeaderboard);

  group('LeaderboardCubit', () {
    // -----------------------------------------------------------------------
    // loadLeaderboard
    // -----------------------------------------------------------------------
    group('loadLeaderboard', () {
      final entries = [
        _entry(rank: 1, userId: 'user-1', displayName: 'Alice'),
        _entry(
          rank: 2,
          userId: 'user-2',
          displayName: 'Bob',
          weeklyTokens: 200,
          hasWeeklyBadge: true,
        ),
        _entry(
          rank: 3,
          userId: 'user-3',
          displayName: 'Carol',
          weeklyTokens: 150,
          hasWeeklyBadge: true,
        ),
        _entry(
          rank: 4,
          userId: 'user-me',
          displayName: 'Me',
          weeklyTokens: 80,
          hasWeeklyBadge: false,
          isCurrentUser: true,
        ),
      ];

      blocTest<LeaderboardCubit, LeaderboardState>(
        'emits [loading, loaded] with userRank when use case succeeds',
        setUp: () =>
            when(getLeaderboard.call).thenAnswer((_) async => Right(entries)),
        build: buildCubit,
        act: (cubit) => cubit.loadLeaderboard(),
        expect: () => [
          const LeaderboardState.loading(),
          LeaderboardState.loaded(entries: entries, userRank: 4),
        ],
      );

      blocTest<LeaderboardCubit, LeaderboardState>(
        'emits [loading, loaded] with null userRank when no current user entry',
        setUp: () => when(getLeaderboard.call).thenAnswer(
          (_) async => Right([
            _entry(rank: 1),
            _entry(rank: 2, userId: 'user-2', weeklyTokens: 200),
          ]),
        ),
        build: buildCubit,
        act: (cubit) => cubit.loadLeaderboard(),
        expect: () => [
          const LeaderboardState.loading(),
          LeaderboardState.loaded(
            entries: [
              _entry(rank: 1),
              _entry(rank: 2, userId: 'user-2', weeklyTokens: 200),
            ],
            userRank: null,
          ),
        ],
      );

      blocTest<LeaderboardCubit, LeaderboardState>(
        'emits [loading, failure] when use case returns NetworkFailure',
        setUp: () => when(getLeaderboard.call).thenAnswer(
          (_) async => const Left(Failure.network(message: 'Sem conexão')),
        ),
        build: buildCubit,
        act: (cubit) => cubit.loadLeaderboard(),
        expect: () => [
          const LeaderboardState.loading(),
          const LeaderboardState.failure(message: 'Sem conexão'),
        ],
      );

      blocTest<LeaderboardCubit, LeaderboardState>(
        'emits [loading, failure] when use case returns ServerFailure',
        setUp: () => when(getLeaderboard.call).thenAnswer(
          (_) async => const Left(
            Failure.server(statusCode: 500, message: 'Erro interno'),
          ),
        ),
        build: buildCubit,
        act: (cubit) => cubit.loadLeaderboard(),
        expect: () => [
          const LeaderboardState.loading(),
          const LeaderboardState.failure(message: 'Erro interno'),
        ],
      );
    });
  });
}
