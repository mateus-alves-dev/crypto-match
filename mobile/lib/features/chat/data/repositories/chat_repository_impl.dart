import 'package:crypto_match/core/error/failure.dart';
import 'package:crypto_match/features/chat/data/datasources/chat_firestore_data_source.dart';
import 'package:crypto_match/features/chat/data/datasources/chat_remote_data_source.dart';
import 'package:crypto_match/features/chat/domain/entities/message.dart';
import 'package:crypto_match/features/chat/domain/repositories/chat_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ChatRepository)
class ChatRepositoryImpl implements ChatRepository {
  const ChatRepositoryImpl(this._dataSource, this._firestoreSource);

  final ChatRemoteDataSource _dataSource;
  final ChatFirestoreDataSource _firestoreSource;

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
    required String senderId,
  }) =>
      _firestoreSource.sendMessage(
        conversationId: conversationId,
        content: content,
        senderId: senderId,
      );

  @override
  Stream<List<Message>> watchMessages({required String conversationId}) =>
      _firestoreSource.watchMessages(conversationId: conversationId);
}
