import 'package:crypto_match/core/network/api_client.dart';
import 'package:crypto_match/features/token/domain/entities/daily_mission.dart';
import 'package:crypto_match/features/token/domain/entities/leaderboard_entry.dart';
import 'package:crypto_match/features/token/domain/entities/streak_info.dart';
import 'package:crypto_match/features/token/domain/entities/token_action.dart';
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

  Future<List<TokenAction>> getRewardActions() async {
    final response = await _apiClient.dio.get<List<dynamic>>('/token/actions');
    return response.data!
        .map((e) => TokenAction.fromJson(e as Map<String, dynamic>))
        .toList();
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

  Future<StreakInfo> getStreakInfo() async {
    final response =
        await _apiClient.dio.get<Map<String, dynamic>>('/token/streak');
    return StreakInfo.fromJson(response.data!);
  }

  Future<void> useStreakShield() async {
    await _apiClient.dio.post<void>('/token/actions/streak-shield');
  }

  Future<List<LeaderboardEntry>> getLeaderboard() async {
    final response =
        await _apiClient.dio.get<List<dynamic>>('/token/leaderboard');
    return response.data!
        .map((e) => LeaderboardEntry.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<List<DailyMission>> getDailyMissions() async {
    final response = await _apiClient.dio.get<List<dynamic>>('/token/missions');
    return response.data!
        .map((e) => DailyMission.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<double> claimMissionReward({required String missionId}) async {
    final response = await _apiClient.dio
        .post<Map<String, dynamic>>('/token/missions/$missionId/claim');
    return (response.data!['earnedAmount'] as num).toDouble();
  }
}
