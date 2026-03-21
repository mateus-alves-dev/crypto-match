import 'package:crypto_match/core/error/failure.dart';
import 'package:crypto_match/features/auth/domain/entities/user.dart';
import 'package:crypto_match/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUseCase {
  const LoginUseCase(this._repository);

  final AuthRepository _repository;

  Future<Either<Failure, User>> call({
    required String email,
    required String password,
  }) => _repository.login(email: email, password: password);
}

@injectable
class RegisterUseCase {
  const RegisterUseCase(this._repository);

  final AuthRepository _repository;

  Future<Either<Failure, User>> call({
    required String name,
    required String email,
    required String password,
  }) => _repository.register(name: name, email: email, password: password);
}

@injectable
class LoginWithGoogleUseCase {
  const LoginWithGoogleUseCase(this._repository);

  final AuthRepository _repository;

  Future<Either<Failure, User>> call() => _repository.loginWithGoogle();
}

@injectable
class GetMeUseCase {
  const GetMeUseCase(this._repository);

  final AuthRepository _repository;

  Future<Either<Failure, User>> call() => _repository.getMe();
}

@injectable
class LogoutUseCase {
  const LogoutUseCase(this._repository);

  final AuthRepository _repository;

  Future<Either<Failure, void>> call() => _repository.logout();
}
