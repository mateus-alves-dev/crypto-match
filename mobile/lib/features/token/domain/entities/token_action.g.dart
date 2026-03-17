// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_action.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TokenAction _$TokenActionFromJson(Map<String, dynamic> json) => _TokenAction(
      id: json['id'] as String,
      type: $enumDecode(_$TokenActionTypeEnumMap, json['type']),
      title: json['title'] as String,
      description: json['description'] as String,
      reward: (json['reward'] as num).toDouble(),
      isAvailable: json['isAvailable'] as bool,
      nextAvailableAt: json['nextAvailableAt'] == null
          ? null
          : DateTime.parse(json['nextAvailableAt'] as String),
      completedAt: json['completedAt'] == null
          ? null
          : DateTime.parse(json['completedAt'] as String),
    );

Map<String, dynamic> _$TokenActionToJson(_TokenAction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$TokenActionTypeEnumMap[instance.type]!,
      'title': instance.title,
      'description': instance.description,
      'reward': instance.reward,
      'isAvailable': instance.isAvailable,
      'nextAvailableAt': instance.nextAvailableAt?.toIso8601String(),
      'completedAt': instance.completedAt?.toIso8601String(),
    };

const _$TokenActionTypeEnumMap = {
  TokenActionType.dailyCheckin: 'dailyCheckin',
  TokenActionType.completeProfile: 'completeProfile',
  TokenActionType.inviteFriend: 'inviteFriend',
  TokenActionType.streakShield: 'streakShield',
};
