import 'package:freezed_annotation/freezed_annotation.dart';

part 'message.freezed.dart';
part 'message.g.dart';

@freezed
abstract class Message with _$Message {
  const factory Message({
    required String id,
    required String conversationId,
    required String senderId,
    required String content,
    required DateTime sentAt,
    bool? isRead,
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
}

@freezed
abstract class Conversation with _$Conversation {
  const factory Conversation({
    required String id,
    required String participantId,
    required String participantName,
    String? participantAvatarUrl,
    String? lastMessage,
    DateTime? lastMessageAt,
    int? unreadCount,
  }) = _Conversation;

  factory Conversation.fromJson(Map<String, dynamic> json) =>
      _$ConversationFromJson(json);
}
