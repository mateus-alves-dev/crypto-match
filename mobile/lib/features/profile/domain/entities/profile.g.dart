// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileImpl _$$ProfileImplFromJson(Map<String, dynamic> json) =>
    _$ProfileImpl(
      userId: json['userId'] as String,
      displayName: json['displayName'] as String,
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      bio: json['bio'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
      cryptoInterests: (json['cryptoInterests'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      age: (json['age'] as num?)?.toInt(),
      location: json['location'] as String?,
    );

Map<String, dynamic> _$$ProfileImplToJson(_$ProfileImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'displayName': instance.displayName,
      'updatedAt': instance.updatedAt.toIso8601String(),
      'bio': instance.bio,
      'avatarUrl': instance.avatarUrl,
      'cryptoInterests': instance.cryptoInterests,
      'age': instance.age,
      'location': instance.location,
    };
