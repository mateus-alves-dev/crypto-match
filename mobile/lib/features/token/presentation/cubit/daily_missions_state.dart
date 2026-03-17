import 'package:crypto_match/features/token/domain/entities/daily_mission.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_missions_state.freezed.dart';

@freezed
class DailyMissionsState with _$DailyMissionsState {
  const factory DailyMissionsState.initial() = _Initial;
  const factory DailyMissionsState.loading() = _Loading;
  const factory DailyMissionsState.loaded({
    required List<DailyMission> missions,
  }) = _Loaded;
  const factory DailyMissionsState.claiming({
    required List<DailyMission> missions,
    required String claimingMissionId,
  }) = _Claiming;
  const factory DailyMissionsState.claimSuccess({
    required List<DailyMission> missions,
    required double earnedAmount,
    required String completedMissionId,
  }) = _ClaimSuccess;
  const factory DailyMissionsState.failure({
    required String message,
    List<DailyMission>? missions,
  }) = _Failure;
}
