import 'package:crypto_match/core/error/failure.dart';
import 'package:crypto_match/features/token/domain/entities/streak_info.dart';
import 'package:crypto_match/features/token/domain/use_cases/token_use_cases.dart';
import 'package:crypto_match/features/token/presentation/cubit/streak_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class StreakCubit extends Cubit<StreakState> {
  StreakCubit(this._getStreakInfo, this._useStreakShield)
      : super(const StreakState.initial());

  final GetStreakInfoUseCase _getStreakInfo;
  final UseStreakShieldUseCase _useStreakShield;

  String _mapFailure(Failure failure) => failure.when(
        server: (_, message) => message,
        network: (message) => message,
        unauthorized: () => 'Não autorizado',
        notFound: () => 'Recurso não encontrado',
        unknown: (message) => message,
      );

  Future<void> loadStreak() async {
    emit(const StreakState.loading());
    final result = await _getStreakInfo();
    result.fold(
      (failure) => emit(StreakState.failure(message: _mapFailure(failure))),
      (info) => emit(StreakState.loaded(info: info)),
    );
  }

  Future<void> useShield() async {
    final current = state.mapOrNull(
      loaded: (s) => s.info,
      failure: (s) => s.info,
    );
    if (current == null) return;

    emit(StreakState.shielding(info: current));
    final result = await _useStreakShield();
    result.fold(
      (failure) => emit(
        StreakState.failure(
          message: _mapFailure(failure),
          info: current,
        ),
      ),
      (_) => emit(
        StreakState.shieldSuccess(
          info: current.copyWith(streakAtRisk: false),
        ),
      ),
    );
  }

  StreakInfo? get currentInfo => state.mapOrNull(
        loaded: (s) => s.info,
        shielding: (s) => s.info,
        shieldSuccess: (s) => s.info,
        failure: (s) => s.info,
      );
}
