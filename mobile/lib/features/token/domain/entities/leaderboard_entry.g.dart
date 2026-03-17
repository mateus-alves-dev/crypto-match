// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leaderboard_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LeaderboardEntry _$LeaderboardEntryFromJson(Map<String, dynamic> json) =>
    _LeaderboardEntry(
      rank: (json['rank'] as num).toInt(),
      userId: json['userId'] as String,
      displayName: json['displayName'] as String,
      weeklyTokens: (json['weeklyTokens'] as num).toDouble(),
      hasWeeklyBadge: json['hasWeeklyBadge'] as bool,
      isCurrentUser: json['isCurrentUser'] as bool,
      avatarUrl: json['avatarUrl'] as String?,
    );

Map<String, dynamic> _$LeaderboardEntryToJson(_LeaderboardEntry instance) =>
    <String, dynamic>{
      'rank': instance.rank,
      'userId': instance.userId,
      'displayName': instance.displayName,
      'weeklyTokens': instance.weeklyTokens,
      'hasWeeklyBadge': instance.hasWeeklyBadge,
      'isCurrentUser': instance.isCurrentUser,
      'avatarUrl': instance.avatarUrl,
    };
