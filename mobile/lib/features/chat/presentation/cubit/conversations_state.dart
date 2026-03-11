import 'package:crypto_match/features/chat/domain/entities/message.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'conversations_state.freezed.dart';

@freezed
class ConversationsState with _$ConversationsState {
  const factory ConversationsState.initial() = _Initial;
  const factory ConversationsState.loading() = _Loading;
  const factory ConversationsState.loaded({
    required List<Conversation> conversations,
  }) = _Loaded;
  const factory ConversationsState.failure({required String message}) =
      _Failure;
}
