import 'package:crypto_match/core/error/failure.dart';
import 'package:crypto_match/features/auth/domain/entities/user.dart';
import 'package:crypto_match/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepository)
class MockAuthRepositoryImpl implements AuthRepository {
  User? _loggedInUser;

  @override
  Future<Either<Failure, User>> login({
    required String email,
    required String password,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 600));
    _loggedInUser = _buildUser(email);
    return Right(_loggedInUser!);
  }

  @override
  Future<Either<Failure, User>> register({
    required String name,
    required String email,
    required String password,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 600));
    _loggedInUser = _buildUser(email, name: name);
    return Right(_loggedInUser!);
  }

  @override
  Future<Either<Failure, User>> getMe() async {
    if (_loggedInUser != null) return Right(_loggedInUser!);
    return const Left(Failure.unauthorized());
  }

  @override
  Future<Either<Failure, void>> logout() async {
    _loggedInUser = null;
    return const Right(null);
  }

  User _buildUser(String email, {String? name}) {
    final username = email.split('@').first;
    return User(
      id: 'mock-user-${username.hashCode.abs()}',
      email: email,
      name: name ?? _capitalize(username),
      createdAt: DateTime.now(),
      avatarUrl: 'https://i.pravatar.cc/200?u=$email',
    );
  }

  String _capitalize(String s) =>
      s.isEmpty ? s : s[0].toUpperCase() + s.substring(1);
}
