import 'dart:async';

import 'package:crypto_match/features/chat/domain/entities/message.dart';
import 'package:crypto_match/features/chat/domain/use_cases/chat_use_cases.dart';
import 'package:crypto_match/features/chat/presentation/cubit/messages_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class MessagesCubit extends Cubit<MessagesState> {
  MessagesCubit(this._sendMessage, this._watchMessages)
      : super(const MessagesState.initial());

  final SendMessageUseCase _sendMessage;
  final WatchMessagesUseCase _watchMessages;

  StreamSubscription<List<Message>>? _subscription;
  Conversation? _conversation;

  void watchMessages({required Conversation conversation}) {
    _conversation = conversation;
    emit(const MessagesState.loading());
    _subscription?.cancel();
    _subscription = _watchMessages(conversationId: conversation.id).listen(
      (messages) => emit(
        MessagesState.loaded(conversation: conversation, messages: messages),
      ),
      onError: (_) => emit(
        const MessagesState.failure(message: 'Erro ao carregar mensagens'),
      ),
    );
  }

  Future<void> sendMessage({
    required String content,
    required String senderId,
  }) async {
    if (_conversation == null) return;
    // Fire-and-forget: Firestore stream updates the UI automatically
    await _sendMessage(
      conversationId: _conversation!.id,
      content: content,
      senderId: senderId,
    );
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
