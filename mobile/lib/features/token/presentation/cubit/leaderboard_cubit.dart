import 'package:crypto_match/features/token/domain/use_cases/token_use_cases.dart';
import 'package:crypto_match/features/token/presentation/cubit/leaderboard_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class LeaderboardCubit extends Cubit<LeaderboardState> {
  LeaderboardCubit(this._getLeaderboard)
      : super(const LeaderboardState.initial());

  final GetLeaderboardUseCase _getLeaderboard;

  Future<void> loadLeaderboard() async {
    emit(const LeaderboardState.loading());
    final result = await _getLeaderboard();
    result.fold(
      (failure) => emit(
        LeaderboardState.failure(
          message: failure.when(
            server: (_, message) => message,
            network: (message) => message,
            unauthorized: () => 'Não autorizado',
            notFound: () => 'Não encontrado',
            unknown: (message) => message,
          ),
        ),
      ),
      (entries) {
        final userEntry = entries.where((e) => e.isCurrentUser).firstOrNull;
        emit(
          LeaderboardState.loaded(
            entries: entries,
            userRank: userEntry?.rank,
          ),
        );
      },
    );
  }
}
