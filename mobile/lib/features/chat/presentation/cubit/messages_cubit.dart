import 'package:crypto_match/features/chat/domain/entities/message.dart';
import 'package:crypto_match/features/chat/domain/use_cases/chat_use_cases.dart';
import 'package:crypto_match/features/chat/presentation/cubit/messages_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class MessagesCubit extends Cubit<MessagesState> {
  MessagesCubit(this._getMessages, this._sendMessage)
      : super(const MessagesState.initial());

  final GetMessagesUseCase _getMessages;
  final SendMessageUseCase _sendMessage;

  Future<void> loadMessages({required Conversation conversation}) async {
    emit(const MessagesState.loading());
    final result = await _getMessages(conversationId: conversation.id);
    result.fold(
      (failure) => emit(
        MessagesState.failure(
          message: failure.when(
            server: (_, message) => message,
            network: (message) => message,
            unauthorized: () => 'Não autorizado',
            notFound: () => 'Não encontrado',
            unknown: (message) => message,
          ),
        ),
      ),
      (messages) => emit(
        MessagesState.loaded(conversation: conversation, messages: messages),
      ),
    );
  }

  Future<void> sendMessage({required String content}) async {
    Conversation? conversation;
    List<Message>? currentMessages;

    state.mapOrNull(
      loaded: (s) {
        conversation = s.conversation;
        currentMessages = s.messages;
      },
      sending: (s) {
        conversation = s.conversation;
        currentMessages = s.messages;
      },
    );

    if (conversation == null || currentMessages == null) return;
    final conv = conversation!;
    final msgs = List<Message>.from(currentMessages!);

    emit(
      MessagesState.sending(
        conversation: conv,
        messages: msgs,
      ),
    );

    final result = await _sendMessage(
      conversationId: conv.id,
      content: content,
    );

    result.fold(
      (failure) => emit(
        MessagesState.loaded(
          conversation: conv,
          messages: msgs,
        ),
      ),
      (newMessage) => emit(
        MessagesState.loaded(
          conversation: conv,
          messages: [...msgs, newMessage],
        ),
      ),
    );
  }
}
