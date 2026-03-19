import 'package:crypto_match/core/network/api_client.dart';
import 'package:crypto_match/features/match/domain/entities/match.dart';
import 'package:crypto_match/features/match/domain/entities/swipe_result.dart';
import 'package:injectable/injectable.dart';

@injectable
class MatchRemoteDataSource {
  const MatchRemoteDataSource(this._apiClient);

  final ApiClient _apiClient;

  Future<List<MatchSuggestion>> getFeed() async {
    final response = await _apiClient.dio.get<List<dynamic>>('/matches/feed');
    return response.data!
        .map((e) => MatchSuggestion.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<SwipeResult> swipe({
    required String targetUserId,
    required SwipeAction action,
  }) async {
    final response = await _apiClient.dio.post<Map<String, dynamic>>(
      '/matches/swipe',
      data: {'targetUserId': targetUserId, 'action': action.name},
    );
    if (response.data == null || response.data!.isEmpty) {
      return const SwipeResult();
    }
    final data = response.data!;
    final matchData = data['matched'] as Map<String, dynamic>?;
    final newTokenBalance = (data['tokenBalance'] as num?)?.toDouble();
    return SwipeResult(
      match: matchData != null ? Match.fromJson(matchData) : null,
      newTokenBalance: newTokenBalance,
    );
  }

  Future<List<Match>> getMatches() async {
    final response = await _apiClient.dio.get<List<dynamic>>('/matches');
    return response.data!
        .map((e) => Match.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
