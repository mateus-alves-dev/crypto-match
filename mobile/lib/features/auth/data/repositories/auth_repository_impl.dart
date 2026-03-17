import 'package:crypto_match/core/error/failure.dart';
import 'package:crypto_match/core/network/api_error.dart';
import 'package:crypto_match/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:crypto_match/features/auth/domain/entities/user.dart';
import 'package:crypto_match/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl(this._dataSource, this._storage);

  final AuthRemoteDataSource _dataSource;
  final FlutterSecureStorage _storage;

  static const _tokenKey = 'access_token';

  @override
  Future<Either<Failure, User>> register({
    required String name,
    required String email,
    required String password,
  }) =>
      safeApiCall(() async {
        final authResponse = await _dataSource.register(
          name: name,
          email: email,
          password: password,
        );
        await _storage.write(key: _tokenKey, value: authResponse.accessToken);
        return authResponse.user;
      });

  @override
  Future<Either<Failure, User>> login({
    required String email,
    required String password,
  }) =>
      safeApiCall(() async {
        final authResponse = await _dataSource.login(
          email: email,
          password: password,
        );
        await _storage.write(key: _tokenKey, value: authResponse.accessToken);
        return authResponse.user;
      });

  @override
  Future<Either<Failure, User>> getMe() => safeApiCall(_dataSource.getMe);

  @override
  Future<Either<Failure, void>> logout() async {
    await _storage.delete(key: _tokenKey);
    return const Right(null);
  }
}
