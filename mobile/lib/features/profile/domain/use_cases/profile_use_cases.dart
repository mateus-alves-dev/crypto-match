import 'package:crypto_match/core/error/failure.dart';
import 'package:crypto_match/features/profile/domain/entities/profile.dart';
import 'package:crypto_match/features/profile/domain/repositories/profile_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetMyProfileUseCase {
  const GetMyProfileUseCase(this._repository);

  final ProfileRepository _repository;

  Future<Either<Failure, Profile>> call() => _repository.getMyProfile();
}

@injectable
class UpdateMyProfileUseCase {
  const UpdateMyProfileUseCase(this._repository);

  final ProfileRepository _repository;

  Future<Either<Failure, Profile>> call({
    String? displayName,
    String? bio,
    List<String>? cryptoInterests,
    List<String>? personaTags,
    int? age,
    String? location,
    String? avatarUrl,
  }) => _repository.updateMyProfile(
    displayName: displayName,
    bio: bio,
    cryptoInterests: cryptoInterests,
    personaTags: personaTags,
    age: age,
    location: location,
    avatarUrl: avatarUrl,
  );
}
