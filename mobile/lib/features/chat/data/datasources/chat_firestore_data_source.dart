import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto_match/core/error/failure.dart';
import 'package:crypto_match/core/network/api_error.dart';
import 'package:crypto_match/features/chat/domain/entities/message.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class ChatFirestoreDataSource {
  const ChatFirestoreDataSource(this._firestore);

  final FirebaseFirestore _firestore;

  CollectionReference<Map<String, dynamic>> _messagesRef(
    String conversationId,
  ) =>
      _firestore
          .collection('conversations')
          .doc(conversationId)
          .collection('messages');

  Stream<List<Message>> watchMessages({required String conversationId}) {
    return _messagesRef(conversationId).orderBy('sentAt').snapshots().map(
          (snapshot) => snapshot.docs.map((doc) {
            final data = doc.data();
            return Message(
              id: doc.id,
              conversationId: conversationId,
              senderId: data['senderId'] as String,
              content: data['content'] as String,
              sentAt: (data['sentAt'] as Timestamp).toDate(),
              isRead: data['isRead'] as bool? ?? false,
            );
          }).toList(),
        );
  }

  Future<Either<Failure, Message>> sendMessage({
    required String conversationId,
    required String content,
    required String senderId,
  }) =>
      safeApiCall(() async {
        final ref = _messagesRef(conversationId).doc();
        final now = DateTime.now();
        await ref.set({
          'senderId': senderId,
          'content': content,
          'sentAt': Timestamp.fromDate(now),
          'isRead': false,
          'conversationId': conversationId,
        });
        return Message(
          id: ref.id,
          conversationId: conversationId,
          senderId: senderId,
          content: content,
          sentAt: now,
          isRead: false,
        );
      });
}
