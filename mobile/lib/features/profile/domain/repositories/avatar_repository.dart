import 'package:crypto_match/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

abstract class AvatarRepository {
  /// Uploads [file] to remote storage for [userId] and returns the download URL.
  Future<Either<Failure, String>> uploadAvatar(XFile file, String userId);
}
