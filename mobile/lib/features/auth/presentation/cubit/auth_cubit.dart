import 'package:crypto_match/core/error/failure.dart';
import 'package:crypto_match/features/auth/domain/entities/user.dart';
import 'package:crypto_match/features/auth/domain/use_cases/auth_use_cases.dart';
import 'package:crypto_match/features/auth/presentation/cubit/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AuthCubit extends Cubit<AuthState> {
  AuthCubit(
    this._loginUseCase,
    this._registerUseCase,
    this._loginWithGoogleUseCase,
    this._getMeUseCase,
    this._logoutUseCase,
  ) : super(const AuthState.initial());

  final LoginUseCase _loginUseCase;
  final RegisterUseCase _registerUseCase;
  final LoginWithGoogleUseCase _loginWithGoogleUseCase;
  final GetMeUseCase _getMeUseCase;
  final LogoutUseCase _logoutUseCase;

  User? _pendingUser;

  Future<void> login({required String email, required String password}) async {
    emit(const AuthState.loading());
    final result = await _loginUseCase(email: email, password: password);
    result.fold(
      (failure) => emit(
        AuthState.failure(
          message: failure.map(
            server: (f) => f.message,
            network: (f) => f.message,
            unauthorized: (_) => 'Invalid credentials',
            notFound: (_) => 'User not found',
            unknown: (f) => f.message,
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
          message: failure.map(
            server: (f) => f.message,
            network: (f) => f.message,
            unauthorized: (_) => 'Unauthorized',
            notFound: (_) => 'Not found',
            unknown: (f) => f.message,
          ),
        ),
      ),
      (user) {
        _pendingUser = user;
        emit(AuthState.needsOnboarding(user: user));
      },
    );
  }

  Future<void> loginWithGoogle() async {
    emit(const AuthState.loading());
    final result = await _loginWithGoogleUseCase();
    result.fold(
      (failure) => emit(
        AuthState.failure(
          message: failure.map(
            server: (f) => f.message,
            network: (f) => f.message,
            unauthorized: (_) => 'Google login failed',
            notFound: (_) => 'User not found',
            unknown: (f) => f.message,
          ),
        ),
      ),
      (user) => emit(AuthState.authenticated(user: user)),
    );
  }

  void completeOnboarding() {
    final user = _pendingUser;
    if (user != null) {
      _pendingUser = null;
      emit(AuthState.authenticated(user: user));
    }
  }

  Future<void> checkAuth() async {
    emit(const AuthState.loading());
    final result = await _getMeUseCase();
    result.fold(
      (_) => emit(const AuthState.unauthenticated()),
      (user) => emit(AuthState.authenticated(user: user)),
    );
  }

  void logout() {
    _logoutUseCase();
    emit(const AuthState.unauthenticated());
  }
}
