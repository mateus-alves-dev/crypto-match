import 'package:crypto_match/core/error/failure.dart';
import 'package:crypto_match/features/token/domain/entities/daily_mission.dart';
import 'package:crypto_match/features/token/domain/use_cases/token_use_cases.dart';
import 'package:crypto_match/features/token/presentation/cubit/daily_missions_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class DailyMissionsCubit extends Cubit<DailyMissionsState> {
  DailyMissionsCubit(
    this._getDailyMissions,
    this._claimMissionReward,
  ) : super(const DailyMissionsState.initial());

  final GetDailyMissionsUseCase _getDailyMissions;
  final ClaimMissionRewardUseCase _claimMissionReward;

  Future<void> loadMissions() async {
    emit(const DailyMissionsState.loading());
    final result = await _getDailyMissions();
    result.fold(
      (failure) => emit(
        DailyMissionsState.failure(
          message: failure.map(
            server: (f) => f.message,
            network: (f) => f.message,
            unauthorized: (_) => 'Não autorizado',
            notFound: (_) => 'Não encontrado',
            unknown: (f) => f.message,
          ),
        ),
      ),
      (missions) {
        emit(DailyMissionsState.loaded(missions: missions));
        _autoClaimCompleted(missions);
      },
    );
  }

  Future<void> refresh() => loadMissions();

  // ---------------------------------------------------------------------------
  // Private helpers
  // ---------------------------------------------------------------------------

  void _autoClaimCompleted(List<DailyMission> missions) {
    for (final mission in missions) {
      if (mission.isCompleted && !mission.isRewarded) {
        _autoClaim(mission, missions);
      }
    }
  }

  Future<void> _autoClaim(
    DailyMission mission,
    List<DailyMission> currentMissions,
  ) async {
    emit(
      DailyMissionsState.claiming(
        missions: currentMissions,
        claimingMissionId: mission.id,
      ),
    );

    final result = await _claimMissionReward(missionId: mission.id);
    result.fold(
      (failure) => emit(
        DailyMissionsState.failure(
          message: failure.map(
            server: (f) => f.message,
            network: (f) => f.message,
            unauthorized: (_) => 'Não autorizado',
            notFound: (_) => 'Não encontrado',
            unknown: (f) => f.message,
          ),
          missions: currentMissions,
        ),
      ),
      (earnedAmount) {
        emit(
          DailyMissionsState.claimSuccess(
            missions: currentMissions,
            earnedAmount: earnedAmount,
            completedMissionId: mission.id,
          ),
        );
        loadMissions();
      },
    );
  }
}
