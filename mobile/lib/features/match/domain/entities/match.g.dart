// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Match _$MatchFromJson(Map<String, dynamic> json) => _Match(
      id: json['id'] as String,
      userId: json['userId'] as String,
      matchedUserId: json['matchedUserId'] as String,
      matchedUserName: json['matchedUserName'] as String,
      matchedAt: DateTime.parse(json['matchedAt'] as String),
      matchedUserAvatarUrl: json['matchedUserAvatarUrl'] as String?,
      matchedUserBio: json['matchedUserBio'] as String?,
    );

Map<String, dynamic> _$MatchToJson(_Match instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'matchedUserId': instance.matchedUserId,
      'matchedUserName': instance.matchedUserName,
      'matchedAt': instance.matchedAt.toIso8601String(),
      'matchedUserAvatarUrl': instance.matchedUserAvatarUrl,
      'matchedUserBio': instance.matchedUserBio,
    };

_MatchSuggestion _$MatchSuggestionFromJson(Map<String, dynamic> json) =>
    _MatchSuggestion(
      userId: json['userId'] as String,
      name: json['name'] as String,
      avatarUrl: json['avatarUrl'] as String?,
      bio: json['bio'] as String?,
      age: (json['age'] as num?)?.toInt(),
      cryptoInterests: (json['cryptoInterests'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$MatchSuggestionToJson(_MatchSuggestion instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'name': instance.name,
      'avatarUrl': instance.avatarUrl,
      'bio': instance.bio,
      'age': instance.age,
      'cryptoInterests': instance.cryptoInterests,
    };
