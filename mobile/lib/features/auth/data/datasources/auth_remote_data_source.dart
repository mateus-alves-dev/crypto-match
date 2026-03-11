import 'package:crypto_match/core/network/api_client.dart';
import 'package:crypto_match/features/auth/domain/entities/user.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthRemoteDataSource {
  const AuthRemoteDataSource(this._apiClient);

  final ApiClient _apiClient;

  Future<User> register({
    required String name,
    required String email,
    required String password,
  }) async {
    final response = await _apiClient.dio.post<Map<String, dynamic>>(
      '/auth/register',
      data: {'name': name, 'email': email, 'password': password},
    );
    return User.fromJson(response.data!);
  }

  Future<User> login({
    required String email,
    required String password,
  }) async {
    final response = await _apiClient.dio.post<Map<String, dynamic>>(
      '/auth/login',
      data: {'email': email, 'password': password},
    );
    return User.fromJson(response.data!);
  }

  Future<User> getMe() async {
    final response = await _apiClient.dio.get<Map<String, dynamic>>('/me');
    return User.fromJson(response.data!);
  }
}
