import 'package:crypto_match/features/auth/domain/use_cases/auth_use_cases.dart';
import 'package:crypto_match/features/auth/presentation/cubit/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  AuthCubit(
    this._loginUseCase,
    this._registerUseCase,
    this._getMeUseCase,
  ) : super(const AuthState.initial());

  final LoginUseCase _loginUseCase;
  final RegisterUseCase _registerUseCase;
  final GetMeUseCase _getMeUseCase;

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(const AuthState.loading());
    final result = await _loginUseCase(email: email, password: password);
    result.fold(
      (failure) => emit(
        AuthState.failure(
          message: failure.when(
            server: (_, message) => message,
            network: (message) => message,
            unauthorized: () => 'Invalid credentials',
            notFound: () => 'User not found',
            unknown: (message) => message,
          ),
        ),
      ),
      (user) => emit(AuthState.authenticated(user: user)),
    );
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(const AuthState.loading());
    final result = await _registerUseCase(
      name: name,
      email: email,
      password: password,
    );
    result.fold(
      (failure) => emit(
        AuthState.failure(
          message: failure.when(
            server: (_, message) => message,
            network: (message) => message,
            unauthorized: () => 'Unauthorized',
            notFound: () => 'Not found',
            unknown: (message) => message,
          ),
        ),
      ),
      (user) => emit(AuthState.authenticated(user: user)),
    );
  }

  Future<void> checkAuth() async {
    emit(const AuthState.loading());
    final result = await _getMeUseCase();
    result.fold(
      (_) => emit(const AuthState.unauthenticated()),
      (user) => emit(AuthState.authenticated(user: user)),
    );
  }

  void logout() => emit(const AuthState.unauthenticated());
}
