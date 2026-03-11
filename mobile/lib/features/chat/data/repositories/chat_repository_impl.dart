import 'package:crypto_match/core/error/failure.dart';
import 'package:crypto_match/features/chat/data/datasources/chat_remote_data_source.dart';
import 'package:crypto_match/features/chat/domain/entities/message.dart';
import 'package:crypto_match/features/chat/domain/repositories/chat_repository.dart';
import 'package:dartz/dartz.dart';

// Swap @LazySingleton annotation here when backend is ready.
// For MVP the mock repository is registered instead.
class ChatRepositoryImpl implements ChatRepository {
  const ChatRepositoryImpl(this._dataSource);

  final ChatRemoteDataSource _dataSource;

  @override
  Future<Either<Failure, List<Conversation>>> getConversations() =>
      _dataSource.getConversations();

  @override
  Future<Either<Failure, List<Message>>> getMessages({
    required String conversationId,
  }) =>
      _dataSource.getMessages(conversationId: conversationId);

  @override
  Future<Either<Failure, Message>> sendMessage({
    required String conversationId,
    required String content,
  }) =>
      _dataSource.sendMessage(
        conversationId: conversationId,
        content: content,
      );
}
