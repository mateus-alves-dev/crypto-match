import 'package:freezed_annotation/freezed_annotation.dart';

part 'streak_info.freezed.dart';
part 'streak_info.g.dart';

@freezed
abstract class StreakInfo with _$StreakInfo {
  const factory StreakInfo({
    required int currentStreak,
    required int longestStreak,
    required bool streakAtRisk,
    @Default(20) int shieldCost,
  }) = _StreakInfo;

  factory StreakInfo.fromJson(Map<String, dynamic> json) =>
      _$StreakInfoFromJson(json);
}
