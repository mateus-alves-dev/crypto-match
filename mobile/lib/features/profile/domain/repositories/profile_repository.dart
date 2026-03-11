import 'package:crypto_match/core/error/failure.dart';
import 'package:crypto_match/features/profile/domain/entities/profile.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRepository {
  Future<Either<Failure, Profile>> getMyProfile();

  Future<Either<Failure, Profile>> updateMyProfile({
    String? displayName,
    String? bio,
    List<String>? cryptoInterests,
    int? age,
    String? location,
  });
}
