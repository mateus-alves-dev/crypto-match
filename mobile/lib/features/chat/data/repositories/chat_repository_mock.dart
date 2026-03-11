import 'package:crypto_match/core/error/failure.dart';
import 'package:crypto_match/features/chat/domain/entities/message.dart';
import 'package:crypto_match/features/chat/domain/repositories/chat_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ChatRepository)
class MockChatRepositoryImpl implements ChatRepository {
  // In-memory messages store: conversationId -> List<Message>
  final Map<String, List<Message>> _messages = {
    'conv-mock-1': [
      Message(
        id: 'msg-1-1',
        conversationId: 'conv-mock-1',
        senderId: 'mock-1',
        content: 'Oi! Vi que você também curte Bitcoin 🙌',
        sentAt: DateTime.now().subtract(const Duration(hours: 2, minutes: 10)),
        isRead: true,
      ),
      Message(
        id: 'msg-1-2',
        conversationId: 'conv-mock-1',
        senderId: 'current-user',
        content: 'Sim! Acumulo desde 2020. Você faz DCA?',
        sentAt: DateTime.now().subtract(const Duration(hours: 2, minutes: 5)),
        isRead: true,
      ),
      Message(
        id: 'msg-1-3',
        conversationId: 'conv-mock-1',
        senderId: 'mock-1',
        content: 'Todo mês! Lightning Network vai mudar tudo ⚡',
        sentAt: DateTime.now().subtract(const Duration(hours: 2)),
        isRead: false,
      ),
    ],
    'conv-mock-2': [
      Message(
        id: 'msg-2-1',
        conversationId: 'conv-mock-2',
        senderId: 'current-user',
        content: 'Cara, você trabalha com Solidity? Demais!',
        sentAt: DateTime.now().subtract(const Duration(days: 1, hours: 3)),
        isRead: true,
      ),
      Message(
        id: 'msg-2-2',
        conversationId: 'conv-mock-2',
        senderId: 'mock-2',
        content:
            'Haha sim, tô buildando uns contratos de DeFi. Qual é a sua stack?',
        sentAt: DateTime.now().subtract(const Duration(days: 1)),
        isRead: false,
      ),
    ],
    'conv-mock-3': [
      Message(
        id: 'msg-3-1',
        conversationId: 'conv-mock-3',
        senderId: 'mock-3',
        content: 'Adorei seu perfil! Arte generativa on-chain é o futuro 🎨',
        sentAt: DateTime.now().subtract(const Duration(days: 3)),
        isRead: true,
      ),
    ],
  };

  static final List<Conversation> _conversations = [
    Conversation(
      id: 'conv-mock-1',
      participantId: 'mock-1',
      participantName: 'Camila Souza',
      participantAvatarUrl: 'https://i.pravatar.cc/400?img=47',
      lastMessage: 'Lightning Network vai mudar tudo ⚡',
      lastMessageAt: DateTime.now().subtract(const Duration(hours: 2)),
      unreadCount: 1,
    ),
    Conversation(
      id: 'conv-mock-2',
      participantId: 'mock-2',
      participantName: 'Rafael Lima',
      participantAvatarUrl: 'https://i.pravatar.cc/400?img=11',
      lastMessage: 'Qual é a sua stack?',
      lastMessageAt: DateTime.now().subtract(const Duration(days: 1)),
      unreadCount: 1,
    ),
    Conversation(
      id: 'conv-mock-3',
      participantId: 'mock-3',
      participantName: 'Isabela Torres',
      participantAvatarUrl: 'https://i.pravatar.cc/400?img=45',
      lastMessage: 'Arte generativa on-chain é o futuro 🎨',
      lastMessageAt: DateTime.now().subtract(const Duration(days: 3)),
      unreadCount: 0,
    ),
  ];

  @override
  Future<Either<Failure, List<Conversation>>> getConversations() async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    final updated = _conversations.map((c) {
      final msgs = _messages[c.id] ?? [];
      final unread = msgs
          .where((m) => m.senderId != 'current-user' && !(m.isRead ?? true))
          .length;
      return c.copyWith(unreadCount: unread);
    }).toList();
    return Right(updated);
  }

  @override
  Future<Either<Failure, List<Message>>> getMessages({
    required String conversationId,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    // Mark all messages as read
    final msgs = _messages[conversationId] ?? [];
    _messages[conversationId] =
        msgs.map((m) => m.copyWith(isRead: true)).toList();
    // Update conversation unread count
    final idx = _conversations.indexWhere((c) => c.id == conversationId);
    if (idx != -1) {
      _conversations[idx] = _conversations[idx].copyWith(unreadCount: 0);
    }
    return Right(List.from(_messages[conversationId] ?? []));
  }

  @override
  Future<Either<Failure, Message>> sendMessage({
    required String conversationId,
    required String content,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 200));
    final message = Message(
      id: 'msg-${DateTime.now().millisecondsSinceEpoch}',
      conversationId: conversationId,
      senderId: 'current-user',
      content: content,
      sentAt: DateTime.now(),
      isRead: true,
    );
    _messages.putIfAbsent(conversationId, () => []).add(message);
    // Update last message on conversation
    final idx = _conversations.indexWhere((c) => c.id == conversationId);
    if (idx != -1) {
      _conversations[idx] = _conversations[idx].copyWith(
        lastMessage: content,
        lastMessageAt: message.sentAt,
      );
    }
    return Right(message);
  }
}
