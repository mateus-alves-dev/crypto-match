import 'package:crypto_match/core/error/failure.dart';
import 'package:crypto_match/features/match/domain/entities/match.dart';
import 'package:crypto_match/features/match/domain/use_cases/match_use_cases.dart';
import 'package:crypto_match/features/match/presentation/cubit/match_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class MatchCubit extends Cubit<MatchState> {
  MatchCubit(this._getFeed, this._swipe) : super(const MatchState.initial());

  final GetMatchFeedUseCase _getFeed;
  final SwipeUseCase _swipe;

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
    final current = state.mapOrNull(swiping: (s) => s);
    if (current == null) return;

    final top = current.remaining.first;
    final rest = current.remaining.sublist(1);

    final result = await _swipe(targetUserId: top.userId, action: action);

    result.fold(
      (_) => rest.isEmpty
          ? emit(const MatchState.empty())
          : emit(MatchState.swiping(remaining: rest)),
      (match) {
        if (match != null) {
          emit(MatchState.matched(match: match, remaining: rest));
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
}
