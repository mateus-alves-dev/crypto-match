import 'package:firebase_messaging/firebase_messaging.dart';

enum NotificationType {
  newMatch,
  newMessage,
  tokenReward,
  appUpdate,
  dailyStreak,
  unknown,
}

class NotificationPayload {
  const NotificationPayload({
    required this.type,
    required this.title,
    required this.body,
    this.conversationId,
    this.matchId,
  });

  final NotificationType type;
  final String title;
  final String body;
  final String? conversationId;
  final String? matchId;

  factory NotificationPayload.fromRemoteMessage(RemoteMessage message) {
    final data = message.data;
    final notification = message.notification;

    final type = _parseType(data['type'] as String?);

    return NotificationPayload(
      type: type,
      title:
          notification?.title ??
          data['title'] as String? ??
          _defaultTitle(type),
      body: notification?.body ?? data['body'] as String? ?? '',
      conversationId: data['conversationId'] as String?,
      matchId: data['matchId'] as String?,
    );
  }

  static NotificationType _parseType(String? raw) {
    switch (raw) {
      case 'new_match':
        return NotificationType.newMatch;
      case 'new_message':
        return NotificationType.newMessage;
      case 'token_reward':
        return NotificationType.tokenReward;
      case 'app_update':
        return NotificationType.appUpdate;
      case 'daily_streak':
        return NotificationType.dailyStreak;
      default:
        return NotificationType.unknown;
    }
  }

  static String _defaultTitle(NotificationType type) {
    switch (type) {
      case NotificationType.newMatch:
        return 'Novo Match! 🎉';
      case NotificationType.newMessage:
        return 'Nova mensagem';
      case NotificationType.tokenReward:
        return 'Tokens ganhos! 💰';
      case NotificationType.appUpdate:
        return 'Novidades no CryptoMatch';
      case NotificationType.dailyStreak:
        return 'Não perca sua streak! 🔥';
      case NotificationType.unknown:
        return 'CryptoMatch';
    }
  }
}
