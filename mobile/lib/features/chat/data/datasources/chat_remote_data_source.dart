import 'package:crypto_match/core/error/failure.dart';
import 'package:crypto_match/core/network/api_client.dart';
import 'package:crypto_match/core/network/api_error.dart';
import 'package:crypto_match/features/chat/domain/entities/message.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class ChatRemoteDataSource {
  const ChatRemoteDataSource(this._apiClient);

  final ApiClient _apiClient;

  Future<Either<Failure, List<Conversation>>> getConversations() =>
      safeApiCall(() async {
        final response =
            await _apiClient.dio.get<List<dynamic>>('/conversations');
        return (response.data ?? [])
            .map((e) => Conversation.fromJson(e as Map<String, dynamic>))
            .toList();
      });

  Future<Either<Failure, List<Message>>> getMessages({
    required String conversationId,
  }) =>
      safeApiCall(() async {
        final response = await _apiClient.dio
            .get<List<dynamic>>('/conversations/$conversationId/messages');
        return (response.data ?? [])
            .map((e) => Message.fromJson(e as Map<String, dynamic>))
            .toList();
      });

  Future<Either<Failure, Message>> sendMessage({
    required String conversationId,
    required String content,
    required String senderId, // ignored: server infers sender from JWT
  }) =>
      safeApiCall(() async {
        final response = await _apiClient.dio.post<Map<String, dynamic>>(
          '/conversations/$conversationId/messages',
          data: {'content': content},
        );
        return Message.fromJson(response.data!);
      });
}
