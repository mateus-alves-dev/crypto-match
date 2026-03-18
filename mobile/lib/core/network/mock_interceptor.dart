import 'package:dio/dio.dart';

/// MockInterceptor para mockar respostas quando backend não está disponível
///
/// Intercepta requisições HTTP para endpoints de chat e retorna dados ficcionais
/// quando há timeout ou erro de conexão.
class MockInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Mocka endpoint de conversas
    if (options.path == '/conversations' && options.method == 'GET') {
      await Future.delayed(const Duration(milliseconds: 500));

      final mockConversations = [
        {
          'id': 'conv_1',
          'participantId': 'user_2',
          'participantName': 'Alex Crypto',
          'participantAvatarUrl': 'https://i.pravatar.cc/150?img=1',
          'lastMessage': 'Esse bull market vai ser incrível! 🚀',
          'lastMessageAt': DateTime.now()
              .subtract(const Duration(minutes: 5))
              .toIso8601String(),
          'unreadCount': 2,
        },
        {
          'id': 'conv_2',
          'participantId': 'user_3',
          'participantName': 'Sofia Bitcoin',
          'participantAvatarUrl': 'https://i.pravatar.cc/150?img=2',
          'lastMessage': 'Vc viu a atualização do Ethereum?',
          'lastMessageAt': DateTime.now()
              .subtract(const Duration(hours: 2))
              .toIso8601String(),
          'unreadCount': 0,
        },
        {
          'id': 'conv_3',
          'participantId': 'user_4',
          'participantName': 'João DeFi',
          'participantAvatarUrl': 'https://i.pravatar.cc/150?img=3',
          'lastMessage': 'Bora investir juntos?',
          'lastMessageAt': DateTime.now()
              .subtract(const Duration(hours: 6))
              .toIso8601String(),
          'unreadCount': 1,
        },
      ];

      handler.resolve(
        Response(
          requestOptions: options,
          data: mockConversations,
          statusCode: 200,
        ),
      );
      return;
    }

    // Mocka endpoint de mensagens
    if (options.path.contains('/conversations') &&
        options.path.contains('/messages') &&
        options.method == 'GET') {
      await Future.delayed(const Duration(milliseconds: 300));

      final mockMessages = [
        {
          'id': 'msg_1',
          'conversationId': 'conv_1',
          'senderId': 'user_2',
          'content': 'Opa, tudo bem?',
          'sentAt': DateTime.now()
              .subtract(const Duration(minutes: 30))
              .toIso8601String(),
          'isRead': true,
        },
        {
          'id': 'msg_2',
          'conversationId': 'conv_1',
          'senderId': 'user_1',
          'content': 'Tudo certo! Bora conversar sobre crypto?',
          'sentAt': DateTime.now()
              .subtract(const Duration(minutes: 28))
              .toIso8601String(),
          'isRead': true,
        },
        {
          'id': 'msg_3',
          'conversationId': 'conv_1',
          'senderId': 'user_2',
          'content': 'Claro! Esse bull market vai ser incrível! 🚀',
          'sentAt': DateTime.now()
              .subtract(const Duration(minutes: 5))
              .toIso8601String(),
          'isRead': false,
        },
      ];

      handler.resolve(
        Response(requestOptions: options, data: mockMessages, statusCode: 200),
      );
      return;
    }

    // Deixa outras requisições passarem normalmente
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Se houver erro de conexão, tenta mockar a resposta
    if (err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.receiveTimeout ||
        err.type == DioExceptionType.unknown) {
      if (err.requestOptions.path == '/conversations') {
        final mockConversations = [
          {
            'id': 'conv_1',
            'participantId': 'user_2',
            'participantName': 'Alex Crypto',
            'participantAvatarUrl': 'https://i.pravatar.cc/150?img=1',
            'lastMessage': 'Esse bull market vai ser incrível! 🚀',
            'lastMessageAt': DateTime.now()
                .subtract(const Duration(minutes: 5))
                .toIso8601String(),
            'unreadCount': 2,
          },
          {
            'id': 'conv_2',
            'participantId': 'user_3',
            'participantName': 'Sofia Bitcoin',
            'participantAvatarUrl': 'https://i.pravatar.cc/150?img=2',
            'lastMessage': 'Vc viu a atualização do Ethereum?',
            'lastMessageAt': DateTime.now()
                .subtract(const Duration(hours: 2))
                .toIso8601String(),
            'unreadCount': 0,
          },
        ];

        handler.resolve(
          Response(
            requestOptions: err.requestOptions,
            data: mockConversations,
            statusCode: 200,
          ),
        );
        return;
      }
    }

    handler.next(err);
  }
}
