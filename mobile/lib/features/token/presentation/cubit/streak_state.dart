import 'package:crypto_match/features/token/domain/entities/streak_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'streak_state.freezed.dart';

@freezed
class StreakState with _$StreakState {
  const factory StreakState.initial() = _Initial;
  const factory StreakState.loading() = _Loading;
  const factory StreakState.loaded({required StreakInfo info}) = _Loaded;
  const factory StreakState.shielding({required StreakInfo info}) = _Shielding;
  const factory StreakState.shieldSuccess({required StreakInfo info}) =
      _ShieldSuccess;
  const factory StreakState.failure({
    required String message,
    StreakInfo? info,
  }) = _Failure;
}
