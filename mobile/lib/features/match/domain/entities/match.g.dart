// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MatchImpl _$$MatchImplFromJson(Map<String, dynamic> json) => _$MatchImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      matchedUserId: json['matchedUserId'] as String,
      matchedUserName: json['matchedUserName'] as String,
      matchedAt: DateTime.parse(json['matchedAt'] as String),
      matchedUserAvatarUrl: json['matchedUserAvatarUrl'] as String?,
      matchedUserBio: json['matchedUserBio'] as String?,
    );

Map<String, dynamic> _$$MatchImplToJson(_$MatchImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'matchedUserId': instance.matchedUserId,
      'matchedUserName': instance.matchedUserName,
      'matchedAt': instance.matchedAt.toIso8601String(),
      'matchedUserAvatarUrl': instance.matchedUserAvatarUrl,
      'matchedUserBio': instance.matchedUserBio,
    };

_$MatchSuggestionImpl _$$MatchSuggestionImplFromJson(
        Map<String, dynamic> json) =>
    _$MatchSuggestionImpl(
      userId: json['userId'] as String,
      name: json['name'] as String,
      avatarUrl: json['avatarUrl'] as String?,
      bio: json['bio'] as String?,
      age: (json['age'] as num?)?.toInt(),
      cryptoInterests: (json['cryptoInterests'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$MatchSuggestionImplToJson(
        _$MatchSuggestionImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'name': instance.name,
      'avatarUrl': instance.avatarUrl,
      'bio': instance.bio,
      'age': instance.age,
      'cryptoInterests': instance.cryptoInterests,
    };
