import 'package:crypto_match/features/chat/domain/entities/message.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'messages_state.freezed.dart';

@freezed
class MessagesState with _$MessagesState {
  const factory MessagesState.initial() = _Initial;
  const factory MessagesState.loading() = _Loading;
  const factory MessagesState.loaded({
    required Conversation conversation,
    required List<Message> messages,
  }) = _Loaded;
  const factory MessagesState.sending({
    required Conversation conversation,
    required List<Message> messages,
  }) = _Sending;
  const factory MessagesState.failure({required String message}) = _Failure;
}
