import 'package:crypto_match/core/error/failure.dart';
import 'package:crypto_match/features/chat/domain/entities/message.dart';
import 'package:crypto_match/features/chat/domain/repositories/chat_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetConversationsUseCase {
  const GetConversationsUseCase(this._repository);

  final ChatRepository _repository;

  Future<Either<Failure, List<Conversation>>> call() =>
      _repository.getConversations();
}

@injectable
class GetMessagesUseCase {
  const GetMessagesUseCase(this._repository);

  final ChatRepository _repository;

  Future<Either<Failure, List<Message>>> call({
    required String conversationId,
  }) =>
      _repository.getMessages(conversationId: conversationId);
}

@injectable
class SendMessageUseCase {
  const SendMessageUseCase(this._repository);

  final ChatRepository _repository;

  Future<Either<Failure, Message>> call({
    required String conversationId,
    required String content,
    required String senderId,
  }) =>
      _repository.sendMessage(
        conversationId: conversationId,
        content: content,
        senderId: senderId,
      );
}

@injectable
class WatchMessagesUseCase {
  const WatchMessagesUseCase(this._repository);

  final ChatRepository _repository;

  Stream<List<Message>> call({required String conversationId}) =>
      _repository.watchMessages(conversationId: conversationId);
}
