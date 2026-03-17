import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_mission.freezed.dart';
part 'daily_mission.g.dart';

enum DailyMissionType {
  like,
  chat,
  streak7d,
}

@freezed
abstract class DailyMission with _$DailyMission {
  const factory DailyMission({
    required String id,
    required DailyMissionType type,
    required String title,
    required String description,
    required double reward,
    required int progress,
    required int target,
    required bool isCompleted,
    required bool isRewarded,
    required DateTime resetsAt,
  }) = _DailyMission;

  factory DailyMission.fromJson(Map<String, dynamic> json) =>
      _$DailyMissionFromJson(json);
}
