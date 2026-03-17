// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_mission.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DailyMission _$DailyMissionFromJson(Map<String, dynamic> json) =>
    _DailyMission(
      id: json['id'] as String,
      type: $enumDecode(_$DailyMissionTypeEnumMap, json['type']),
      title: json['title'] as String,
      description: json['description'] as String,
      reward: (json['reward'] as num).toDouble(),
      progress: (json['progress'] as num).toInt(),
      target: (json['target'] as num).toInt(),
      isCompleted: json['isCompleted'] as bool,
      isRewarded: json['isRewarded'] as bool,
      resetsAt: DateTime.parse(json['resetsAt'] as String),
    );

Map<String, dynamic> _$DailyMissionToJson(_DailyMission instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$DailyMissionTypeEnumMap[instance.type]!,
      'title': instance.title,
      'description': instance.description,
      'reward': instance.reward,
      'progress': instance.progress,
      'target': instance.target,
      'isCompleted': instance.isCompleted,
      'isRewarded': instance.isRewarded,
      'resetsAt': instance.resetsAt.toIso8601String(),
    };

const _$DailyMissionTypeEnumMap = {
  DailyMissionType.like: 'like',
  DailyMissionType.chat: 'chat',
  DailyMissionType.streak7d: 'streak7d',
};
