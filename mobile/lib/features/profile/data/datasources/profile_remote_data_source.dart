import 'package:crypto_match/core/network/api_client.dart';
import 'package:crypto_match/features/profile/domain/entities/profile.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProfileRemoteDataSource {
  const ProfileRemoteDataSource(this._apiClient);

  final ApiClient _apiClient;

  Future<Profile> getMyProfile() async {
    final response =
        await _apiClient.dio.get<Map<String, dynamic>>('/profiles/me');
    return Profile.fromJson(response.data!);
  }

  Future<Profile> updateMyProfile(Map<String, dynamic> data) async {
    final response = await _apiClient.dio
        .put<Map<String, dynamic>>('/profiles/me', data: data);
    return Profile.fromJson(response.data!);
  }
}
