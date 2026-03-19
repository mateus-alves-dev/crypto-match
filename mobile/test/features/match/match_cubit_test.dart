import 'package:bloc_test/bloc_test.dart';
import 'package:crypto_match/core/error/failure.dart';
import 'package:crypto_match/features/match/domain/entities/match.dart';
import 'package:crypto_match/features/match/domain/entities/swipe_result.dart';
import 'package:crypto_match/features/match/domain/use_cases/match_use_cases.dart';
import 'package:crypto_match/features/match/presentation/cubit/match_cubit.dart';
import 'package:crypto_match/features/match/presentation/cubit/match_state.dart';
import 'package:crypto_match/features/token/domain/entities/token_balance.dart';
import 'package:crypto_match/features/token/domain/use_cases/token_use_cases.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// ---------------------------------------------------------------------------
// Mocks
// ---------------------------------------------------------------------------

class MockGetMatchFeedUseCase extends Mock implements GetMatchFeedUseCase {}

class MockSwipeUseCase extends Mock implements SwipeUseCase {}

class MockGetTokenBalanceUseCase extends Mock
    implements GetTokenBalanceUseCase {}

// ---------------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------------

MatchSuggestion _suggestion({String userId = 's1'}) =>
    MatchSuggestion(userId: userId, name: 'Test User');

TokenBalance _tokenBalance(double amount) =>
    TokenBalance(userId: 'u1', balance: amount, updatedAt: DateTime(2025));

// ---------------------------------------------------------------------------
// Tests
// ---------------------------------------------------------------------------

void main() {
  late MockGetMatchFeedUseCase getFeed;
  late MockSwipeUseCase swipeUseCase;
  late MockGetTokenBalanceUseCase getTokenBalance;

  setUpAll(() {
    registerFallbackValue(SwipeAction.like);
  });

  setUp(() {
    getFeed = MockGetMatchFeedUseCase();
    swipeUseCase = MockSwipeUseCase();
    getTokenBalance = MockGetTokenBalanceUseCase();
  });

  MatchCubit buildCubit() => MatchCubit(getFeed, swipeUseCase, getTokenBalance);

  // Helper: stub swipeUseCase to return a no-match result by default.
  void stubSwipeNoMatch() {
    when(
      () => swipeUseCase.call(
        targetUserId: any(named: 'targetUserId'),
        action: any(named: 'action'),
      ),
    ).thenAnswer((_) async => const Right(SwipeResult()));
  }

  group('MatchCubit', () {
    // -----------------------------------------------------------------------
    // swipe — superLike — insufficient balance
    // -----------------------------------------------------------------------
    group('swipe(superLike) — insufficient balance', () {
      blocTest<MatchCubit, MatchState>(
        'emits insufficientBalance when balance < 10',
        setUp: () {
          when(
            getTokenBalance.call,
          ).thenAnswer((_) async => Right(_tokenBalance(9)));
        },
        build: buildCubit,
        seed: () => MatchState.swiping(remaining: [_suggestion()]),
        act: (cubit) => cubit.swipe(action: SwipeAction.superLike),
        expect: () => [
          MatchState.insufficientBalance(remaining: [_suggestion()]),
        ],
        verify: (_) => verifyNever(
          () => swipeUseCase.call(
            targetUserId: any(named: 'targetUserId'),
            action: any(named: 'action'),
          ),
        ),
      );

      blocTest<MatchCubit, MatchState>(
        'emits insufficientBalance when balance == 0',
        setUp: () {
          when(
            getTokenBalance.call,
          ).thenAnswer((_) async => Right(_tokenBalance(0)));
        },
        build: buildCubit,
        seed: () => MatchState.swiping(remaining: [_suggestion()]),
        act: (cubit) => cubit.swipe(action: SwipeAction.superLike),
        expect: () => [
          MatchState.insufficientBalance(remaining: [_suggestion()]),
        ],
      );

      blocTest<MatchCubit, MatchState>(
        'emits insufficientBalance when balance == exactly 9.9',
        setUp: () {
          when(
            getTokenBalance.call,
          ).thenAnswer((_) async => Right(_tokenBalance(9.9)));
        },
        build: buildCubit,
        seed: () => MatchState.swiping(remaining: [_suggestion()]),
        act: (cubit) => cubit.swipe(action: SwipeAction.superLike),
        expect: () => [
          MatchState.insufficientBalance(remaining: [_suggestion()]),
        ],
      );

      blocTest<MatchCubit, MatchState>(
        'emits swipeFailed when getTokenBalance returns a Failure',
        setUp: () {
          when(getTokenBalance.call).thenAnswer(
            (_) async => const Left(Failure.network(message: 'Sem conexão')),
          );
        },
        build: buildCubit,
        seed: () => MatchState.swiping(remaining: [_suggestion()]),
        act: (cubit) => cubit.swipe(action: SwipeAction.superLike),
        expect: () => [
          isA<MatchState>().having(
            (s) => s.mapOrNull(swipeFailed: (sf) => sf.remaining),
            'swipeFailed.remaining',
            [_suggestion()],
          ),
        ],
        verify: (_) => verifyNever(
          () => swipeUseCase.call(
            targetUserId: any(named: 'targetUserId'),
            action: any(named: 'action'),
          ),
        ),
      );
    });

    // -----------------------------------------------------------------------
    // swipe — superLike — sufficient balance
    // -----------------------------------------------------------------------
    group('swipe(superLike) — sufficient balance', () {
      void stubBalance(double amount) {
        when(
          getTokenBalance.call,
        ).thenAnswer((_) async => Right(_tokenBalance(amount)));
      }

      blocTest<MatchCubit, MatchState>(
        'advances to next card when no match',
        setUp: () {
          stubBalance(100);
          stubSwipeNoMatch();
        },
        build: buildCubit,
        seed: () => MatchState.swiping(
          remaining: [
            _suggestion(userId: 'a'),
            _suggestion(userId: 'b'),
          ],
        ),
        act: (cubit) => cubit.swipe(action: SwipeAction.superLike),
        expect: () => [
          MatchState.swiping(remaining: [_suggestion(userId: 'b')]),
        ],
      );

      blocTest<MatchCubit, MatchState>(
        'emits matched when SwipeResult contains a match',
        setUp: () {
          stubBalance(100);
          when(
            () => swipeUseCase.call(
              targetUserId: any(named: 'targetUserId'),
              action: any(named: 'action'),
            ),
          ).thenAnswer(
            (_) async => Right(
              SwipeResult(
                match: Match(
                  id: 'match-1',
                  userId: 'me',
                  matchedUserId: 'a',
                  matchedUserName: 'Test',
                  matchedAt: DateTime(2025),
                ),
              ),
            ),
          );
        },
        build: buildCubit,
        seed: () => MatchState.swiping(
          remaining: [
            _suggestion(userId: 'a'),
            _suggestion(userId: 'b'),
          ],
        ),
        act: (cubit) => cubit.swipe(action: SwipeAction.superLike),
        expect: () => [
          MatchState.matched(
            match: Match(
              id: 'match-1',
              userId: 'me',
              matchedUserId: 'a',
              matchedUserName: 'Test',
              matchedAt: DateTime(2025),
            ),
            remaining: [_suggestion(userId: 'b')],
          ),
        ],
      );

      blocTest<MatchCubit, MatchState>(
        'emits empty when last card swiped with no match',
        setUp: () {
          stubBalance(100);
          stubSwipeNoMatch();
        },
        build: buildCubit,
        seed: () => MatchState.swiping(remaining: [_suggestion()]),
        act: (cubit) => cubit.swipe(action: SwipeAction.superLike),
        expect: () => [const MatchState.empty()],
      );

      blocTest<MatchCubit, MatchState>(
        'works from insufficientBalance state when balance now sufficient',
        setUp: () {
          stubBalance(100);
          stubSwipeNoMatch();
        },
        build: buildCubit,
        seed: () => MatchState.insufficientBalance(remaining: [_suggestion()]),
        act: (cubit) => cubit.swipe(action: SwipeAction.superLike),
        expect: () => [const MatchState.empty()],
      );
    });

    // -----------------------------------------------------------------------
    // swipe — superLike — API failure
    // -----------------------------------------------------------------------
    group('swipe(superLike) — API failure', () {
      blocTest<MatchCubit, MatchState>(
        'emits swipeFailed with rest of cards when swipe API returns failure',
        setUp: () {
          when(
            getTokenBalance.call,
          ).thenAnswer((_) async => Right(_tokenBalance(100)));
          when(
            () => swipeUseCase.call(
              targetUserId: any(named: 'targetUserId'),
              action: any(named: 'action'),
            ),
          ).thenAnswer(
            (_) async => const Left(Failure.network(message: 'Sem conexão')),
          );
        },
        build: buildCubit,
        seed: () => MatchState.swiping(
          remaining: [
            _suggestion(userId: 'a'),
            _suggestion(userId: 'b'),
          ],
        ),
        act: (cubit) => cubit.swipe(action: SwipeAction.superLike),
        expect: () => [
          isA<MatchState>().having(
            (s) => s.mapOrNull(swipeFailed: (sf) => sf.remaining),
            'swipeFailed.remaining',
            [_suggestion(userId: 'b')],
          ),
        ],
      );
    });

    // -----------------------------------------------------------------------
    // swipe — like / dislike — no balance check
    // -----------------------------------------------------------------------
    group('swipe(like / dislike) — no balance check', () {
      test('never calls getTokenBalance for like', () async {
        stubSwipeNoMatch();
        final cubit = buildCubit()
          ..emit(MatchState.swiping(remaining: [_suggestion()]));
        await cubit.swipe(action: SwipeAction.like);
        verifyNever(getTokenBalance.call);
        await cubit.close();
      });

      test('never calls getTokenBalance for dislike', () async {
        stubSwipeNoMatch();
        final cubit = buildCubit()
          ..emit(MatchState.swiping(remaining: [_suggestion()]));
        await cubit.swipe(action: SwipeAction.dislike);
        verifyNever(getTokenBalance.call);
        await cubit.close();
      });
    });

    // -----------------------------------------------------------------------
    // recoverFromSwipeFailed
    // -----------------------------------------------------------------------
    group('recoverFromSwipeFailed', () {
      blocTest<MatchCubit, MatchState>(
        'emits swiping when remaining is non-empty',
        build: buildCubit,
        seed: () => MatchState.swipeFailed(
          message: 'error',
          remaining: [_suggestion()],
        ),
        act: (cubit) => cubit.recoverFromSwipeFailed(),
        expect: () => [
          MatchState.swiping(remaining: [_suggestion()]),
        ],
      );

      blocTest<MatchCubit, MatchState>(
        'emits empty when remaining is empty',
        build: buildCubit,
        seed: () =>
            const MatchState.swipeFailed(message: 'error', remaining: []),
        act: (cubit) => cubit.recoverFromSwipeFailed(),
        expect: () => [const MatchState.empty()],
      );

      blocTest<MatchCubit, MatchState>(
        'does nothing when state is not swipeFailed',
        build: buildCubit,
        seed: () => MatchState.swiping(remaining: [_suggestion()]),
        act: (cubit) => cubit.recoverFromSwipeFailed(),
        expect: () => [],
      );
    });
  });
}
