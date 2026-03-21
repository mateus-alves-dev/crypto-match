import 'package:crypto_match/core/error/failure.dart';
import 'package:crypto_match/core/network/api_error.dart';
import 'package:crypto_match/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:crypto_match/features/auth/domain/entities/user.dart';
import 'package:crypto_match/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl(
    this._dataSource,
    this._storage,
    this._googleSignIn,
    this._firebaseAuth,
  );

  final AuthRemoteDataSource _dataSource;
  final FlutterSecureStorage _storage;
  final GoogleSignIn _googleSignIn;
  final FirebaseAuth _firebaseAuth;

  static const _tokenKey = 'access_token';

  @override
  Future<Either<Failure, User>> register({
    required String name,
    required String email,
    required String password,
  }) => safeApiCall(() async {
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
  }) => safeApiCall(() async {
    final authResponse = await _dataSource.login(
      email: email,
      password: password,
    );
    await _storage.write(key: _tokenKey, value: authResponse.accessToken);
    return authResponse.user;
  });

  @override
  Future<Either<Failure, User>> loginWithGoogle() => safeApiCall(() async {
    final googleAccount = await _googleSignIn.signIn();
    if (googleAccount == null) {
      throw Exception('Google sign-in cancelled by user');
    }
    final googleAuth = await googleAccount.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final userCredential = await _firebaseAuth.signInWithCredential(credential);
    final firebaseIdToken = await userCredential.user!.getIdToken();

    final authResponse = await _dataSource.loginWithGoogle(
      idToken: firebaseIdToken!,
    );
    await _storage.write(key: _tokenKey, value: authResponse.accessToken);
    return authResponse.user;
  });

  @override
  Future<Either<Failure, User>> getMe() => safeApiCall(_dataSource.getMe);

  @override
  Future<Either<Failure, void>> logout() async {
    await Future.wait([
      _storage.delete(key: _tokenKey),
      _googleSignIn.signOut(),
      _firebaseAuth.signOut(),
    ]);
    return const Right(null);
  }
}
