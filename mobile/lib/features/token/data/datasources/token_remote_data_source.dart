import 'package:crypto_match/core/network/api_client.dart';
import 'package:crypto_match/features/token/domain/entities/token_balance.dart';
import 'package:injectable/injectable.dart';

@injectable
class TokenRemoteDataSource {
  const TokenRemoteDataSource(this._apiClient);

  final ApiClient _apiClient;

  Future<TokenBalance> getBalance() async {
    final response =
        await _apiClient.dio.get<Map<String, dynamic>>('/token/balance');
    return TokenBalance.fromJson(response.data!);
  }

  Future<List<TokenTransaction>> getHistory() async {
    final response = await _apiClient.dio.get<List<dynamic>>('/token/history');
    return response.data!
        .map((e) => TokenTransaction.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<void> completeProfileAction() async {
    await _apiClient.dio.post<void>('/token/actions/complete-profile');
  }

  Future<void> dailyCheckin() async {
    await _apiClient.dio.post<void>('/token/actions/daily-checkin');
  }

  Future<void> inviteFriend({required String referralCode}) async {
    await _apiClient.dio.post<void>(
      '/token/actions/invite-friend',
      data: {'referralCode': referralCode},
    );
  }
}
