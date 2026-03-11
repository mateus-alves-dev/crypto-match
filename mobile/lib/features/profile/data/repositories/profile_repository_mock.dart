import 'package:crypto_match/core/error/failure.dart';
import 'package:crypto_match/features/profile/domain/entities/profile.dart';
import 'package:crypto_match/features/profile/domain/repositories/profile_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ProfileRepository)
class MockProfileRepositoryImpl implements ProfileRepository {
  Profile _profile = Profile(
    userId: 'current-user',
    displayName: 'Você',
    bio:
        'Apaixonado por cripto e tecnologia descentralizada. Hodler desde 2019.',
    avatarUrl: 'https://i.pravatar.cc/400?img=68',
    cryptoInterests: ['Bitcoin', 'Ethereum', 'DeFi'],
    age: 28,
    location: 'São Paulo, BR',
    updatedAt: DateTime.now(),
  );

  @override
  Future<Either<Failure, Profile>> getMyProfile() async {
    await Future<void>.delayed(const Duration(milliseconds: 400));
    return Right(_profile);
  }

  @override
  Future<Either<Failure, Profile>> updateMyProfile({
    String? displayName,
    String? bio,
    List<String>? cryptoInterests,
    int? age,
    String? location,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 600));
    _profile = _profile.copyWith(
      displayName: displayName ?? _profile.displayName,
      bio: bio ?? _profile.bio,
      cryptoInterests: cryptoInterests ?? _profile.cryptoInterests,
      age: age ?? _profile.age,
      location: location ?? _profile.location,
      updatedAt: DateTime.now(),
    );
    return Right(_profile);
  }
}
