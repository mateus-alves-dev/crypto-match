// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'streak_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StreakInfo _$StreakInfoFromJson(Map<String, dynamic> json) => _StreakInfo(
      currentStreak: (json['currentStreak'] as num).toInt(),
      longestStreak: (json['longestStreak'] as num).toInt(),
      streakAtRisk: json['streakAtRisk'] as bool,
      shieldCost: (json['shieldCost'] as num?)?.toInt() ?? 20,
    );

Map<String, dynamic> _$StreakInfoToJson(_StreakInfo instance) =>
    <String, dynamic>{
      'currentStreak': instance.currentStreak,
      'longestStreak': instance.longestStreak,
      'streakAtRisk': instance.streakAtRisk,
      'shieldCost': instance.shieldCost,
    };
