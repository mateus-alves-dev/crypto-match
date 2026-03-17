import 'package:crypto_match/core/error/failure.dart';
import 'package:crypto_match/features/match/domain/use_cases/match_use_cases.dart';
import 'package:crypto_match/features/match/presentation/cubit/matches_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class MatchesListCubit extends Cubit<MatchesListState> {
  MatchesListCubit(this._getMatches) : super(const MatchesListState.initial());

  final GetMatchesUseCase _getMatches;

  Future<void> loadMatches() async {
    emit(const MatchesListState.loading());
    final result = await _getMatches();
    result.fold(
      (failure) => emit(
        MatchesListState.failure(
          message: failure.map(
            server: (f) => f.message,
            network: (f) => f.message,
            unauthorized: (_) => 'Não autorizado',
            notFound: (_) => 'Não encontrado',
            unknown: (f) => f.message,
          ),
        ),
      ),
      (matches) => emit(MatchesListState.loaded(matches: matches)),
    );
  }
}
