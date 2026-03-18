import 'package:crypto_match/core/error/failure.dart';
import 'package:crypto_match/core/network/api_error.dart';
import 'package:crypto_match/features/profile/data/datasources/profile_remote_data_source.dart';
import 'package:crypto_match/features/profile/domain/entities/profile.dart';
import 'package:crypto_match/features/profile/domain/repositories/profile_repository.dart';
import 'package:dartz/dartz.dart';

// Swap @LazySingleton here when the backend is ready.
// For MVP the MockProfileRepositoryImpl is registered instead.
class ProfileRepositoryImpl implements ProfileRepository {
  const ProfileRepositoryImpl(this._dataSource);

  final ProfileRemoteDataSource _dataSource;

  @override
  Future<Either<Failure, Profile>> getMyProfile() =>
      safeApiCall(_dataSource.getMyProfile);

  @override
  Future<Either<Failure, Profile>> updateMyProfile({
    String? displayName,
    String? bio,
    List<String>? cryptoInterests,
    List<String>? personaTags,
    int? age,
    String? location,
    String? avatarUrl,
  }) => safeApiCall(
    () => _dataSource.updateMyProfile({
      'displayName': ?displayName,
      'bio': ?bio,
      'cryptoInterests': ?cryptoInterests,
      'personaTags': ?personaTags,
      'age': ?age,
      'location': ?location,
      'avatarUrl': ?avatarUrl,
    }),
  );
}
