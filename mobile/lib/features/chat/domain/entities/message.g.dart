// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Message _$MessageFromJson(Map<String, dynamic> json) => _Message(
      id: json['id'] as String,
      conversationId: json['conversationId'] as String,
      senderId: json['senderId'] as String,
      content: json['content'] as String,
      sentAt: DateTime.parse(json['sentAt'] as String),
      isRead: json['isRead'] as bool?,
    );

Map<String, dynamic> _$MessageToJson(_Message instance) => <String, dynamic>{
      'id': instance.id,
      'conversationId': instance.conversationId,
      'senderId': instance.senderId,
      'content': instance.content,
      'sentAt': instance.sentAt.toIso8601String(),
      'isRead': instance.isRead,
    };

_Conversation _$ConversationFromJson(Map<String, dynamic> json) =>
    _Conversation(
      id: json['id'] as String,
      participantId: json['participantId'] as String,
      participantName: json['participantName'] as String,
      participantAvatarUrl: json['participantAvatarUrl'] as String?,
      lastMessage: json['lastMessage'] as String?,
      lastMessageAt: json['lastMessageAt'] == null
          ? null
          : DateTime.parse(json['lastMessageAt'] as String),
      unreadCount: (json['unreadCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ConversationToJson(_Conversation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'participantId': instance.participantId,
      'participantName': instance.participantName,
      'participantAvatarUrl': instance.participantAvatarUrl,
      'lastMessage': instance.lastMessage,
      'lastMessageAt': instance.lastMessageAt?.toIso8601String(),
      'unreadCount': instance.unreadCount,
    };
