import 'package:crypto_match/core/error/failure.dart';
import 'package:crypto_match/features/match/domain/entities/match.dart';
import 'package:crypto_match/features/match/domain/use_cases/match_use_cases.dart';
import 'package:crypto_match/features/match/presentation/cubit/match_state.dart';
import 'package:crypto_match/features/token/domain/use_cases/token_use_cases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class MatchCubit extends Cubit<MatchState> {
  MatchCubit(this._getFeed, this._swipe, this._getTokenBalance)
    : super(const MatchState.initial());

  final GetMatchFeedUseCase _getFeed;
  final SwipeUseCase _swipe;
  final GetTokenBalanceUseCase _getTokenBalance;

  static const double _superLikeCost = 10;

  Future<void> loadFeed() async {
    emit(const MatchState.loading());
    final result = await _getFeed();
    result.fold(
      (failure) => emit(
        MatchState.failure(
          message: failure.map(
            server: (f) => f.message,
            network: (f) => f.message,
            unauthorized: (_) => 'Nao autorizado',
            notFound: (_) => 'Nao encontrado',
            unknown: (f) => f.message,
          ),
        ),
      ),
      (suggestions) => suggestions.isEmpty
          ? emit(const MatchState.empty())
          : emit(MatchState.swiping(remaining: suggestions)),
    );
  }

  Future<void> swipe({required SwipeAction action}) async {
    final remaining = _currentRemaining;
    if (remaining == null) return;

    // Balance gate: check BEFORE optimistic debit (which was applied in the UI)
    if (action == SwipeAction.superLike) {
      final balanceResult = await _getTokenBalance();
      bool? sufficient;
      balanceResult.fold(
        (_) {
          sufficient = null; // network/server error – can't verify
        },
        (b) {
          sufficient = b.balance >= _superLikeCost;
        },
      );

      if (sufficient == null) {
        // Can't check balance – treat as a recoverable failure so the
        // optimistic debit can be rolled back by FeedPage.
        emit(
          MatchState.swipeFailed(
            message: 'Não foi possível verificar seu saldo. Tente novamente.',
            remaining: remaining,
          ),
        );
        return;
      }

      if (sufficient == false) {
        emit(MatchState.insufficientBalance(remaining: remaining));
        return;
      }
    }

    final top = remaining.first;
    final rest = remaining.sublist(1);

    final result = await _swipe(targetUserId: top.userId, action: action);

    result.fold(
      (failure) {
        if (action == SwipeAction.superLike) {
          // Emit swipeFailed so FeedPage can roll back the optimistic debit.
          final message = failure.map(
            server: (f) => f.message,
            network: (_) => 'Sem conexão. Super-like não enviado.',
            unauthorized: (_) => 'Sessão expirada.',
            notFound: (_) => 'Perfil não encontrado.',
            unknown: (f) => f.message,
          );
          emit(MatchState.swipeFailed(message: message, remaining: rest));
        } else {
          // For like/dislike, silently advance (card is already gone visually).
          rest.isEmpty
              ? emit(const MatchState.empty())
              : emit(MatchState.swiping(remaining: rest));
        }
      },
      (swipeResult) {
        if (swipeResult.match != null) {
          emit(MatchState.matched(match: swipeResult.match!, remaining: rest));
        } else if (rest.isEmpty) {
          emit(const MatchState.empty());
        } else {
          emit(MatchState.swiping(remaining: rest));
        }
      },
    );
  }

  void continueAfterMatch() {
    final current = state.mapOrNull(matched: (s) => s);
    if (current == null) return;
    final rest = current.remaining;
    if (rest.isEmpty) {
      emit(const MatchState.empty());
    } else {
      emit(MatchState.swiping(remaining: rest));
    }
  }

  /// Transitions from [MatchState.swipeFailed] back to [MatchState.swiping]
  /// (or [MatchState.empty]). Called by FeedPage after the snackbar is shown.
  void recoverFromSwipeFailed() {
    final current = state.mapOrNull(swipeFailed: (s) => s);
    if (current == null) return;
    current.remaining.isEmpty
        ? emit(const MatchState.empty())
        : emit(MatchState.swiping(remaining: current.remaining));
  }

  /// Returns the current remaining card list regardless of which
  /// "in-progress swipe" state the cubit is in.
  List<MatchSuggestion>? get _currentRemaining => state.mapOrNull(
    swiping: (s) => s.remaining,
    insufficientBalance: (s) => s.remaining,
    swipeFailed: (s) => s.remaining,
  );
}
