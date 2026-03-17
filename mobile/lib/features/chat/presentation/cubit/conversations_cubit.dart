import 'package:crypto_match/core/error/failure.dart';
import 'package:crypto_match/features/chat/domain/use_cases/chat_use_cases.dart';
import 'package:crypto_match/features/chat/presentation/cubit/conversations_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ConversationsCubit extends Cubit<ConversationsState> {
  ConversationsCubit(this._getConversations)
      : super(const ConversationsState.initial());

  final GetConversationsUseCase _getConversations;

  Future<void> loadConversations() async {
    emit(const ConversationsState.loading());
    final result = await _getConversations();
    result.fold(
      (failure) => emit(
        ConversationsState.failure(
          message: failure.map(
            server: (f) => f.message,
            network: (f) => f.message,
            unauthorized: (_) => 'Não autorizado',
            notFound: (_) => 'Não encontrado',
            unknown: (f) => f.message,
          ),
        ),
      ),
      (conversations) =>
          emit(ConversationsState.loaded(conversations: conversations)),
    );
  }

  int get totalUnread {
    return state.maybeWhen(
      loaded: (conversations) =>
          conversations.fold(0, (sum, c) => sum + (c.unreadCount ?? 0)),
      orElse: () => 0,
    );
  }
}
