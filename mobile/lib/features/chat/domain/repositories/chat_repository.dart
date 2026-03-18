import 'package:crypto_match/core/error/failure.dart';
import 'package:crypto_match/features/chat/domain/entities/message.dart';
import 'package:dartz/dartz.dart';

abstract class ChatRepository {
  Future<Either<Failure, List<Conversation>>> getConversations();

  Future<Either<Failure, List<Message>>> getMessages({
    required String conversationId,
  });

  Future<Either<Failure, Message>> sendMessage({
    required String conversationId,
    required String content,
    required String senderId,
  });

  Stream<List<Message>> watchMessages({required String conversationId});
}
