import 'dart:io';

import 'package:crypto_match/core/error/failure.dart';
import 'package:crypto_match/features/profile/domain/repositories/avatar_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AvatarRepository)
class AvatarRepositoryImpl implements AvatarRepository {
  const AvatarRepositoryImpl(this._storage);

  final FirebaseStorage _storage;

  @override
  Future<Either<Failure, String>> uploadAvatar(
    XFile file,
    String userId,
  ) async {
    try {
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final ref = _storage.ref().child('avatars/$userId/$timestamp.jpg');
      await ref.putFile(File(file.path));
      final url = await ref.getDownloadURL();
      return Right(url);
    } on FirebaseException catch (e) {
      return Left(
        Failure.unknown(message: e.message ?? 'Falha ao enviar a foto.'),
      );
    } catch (e) {
      return Left(Failure.unknown(message: e.toString()));
    }
  }
}
