// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Profile _$ProfileFromJson(Map<String, dynamic> json) => _Profile(
  userId: json['userId'] as String,
  displayName: json['displayName'] as String,
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  bio: json['bio'] as String?,
  avatarUrl: json['avatarUrl'] as String?,
  cryptoInterests: (json['cryptoInterests'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  personaTags: (json['personaTags'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  age: (json['age'] as num?)?.toInt(),
  location: json['location'] as String?,
  badges: (json['badges'] as List<dynamic>?)?.map((e) => e as String).toList(),
);

Map<String, dynamic> _$ProfileToJson(_Profile instance) => <String, dynamic>{
  'userId': instance.userId,
  'displayName': instance.displayName,
  'updatedAt': instance.updatedAt.toIso8601String(),
  'bio': instance.bio,
  'avatarUrl': instance.avatarUrl,
  'cryptoInterests': instance.cryptoInterests,
  'personaTags': instance.personaTags,
  'age': instance.age,
  'location': instance.location,
  'badges': instance.badges,
};
