import 'package:crypto_match/core/network/api_client.dart';
import 'package:crypto_match/features/match/domain/entities/match.dart';
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

  Future<Match?> swipe({
    required String targetUserId,
    required SwipeAction action,
  }) async {
    final response = await _apiClient.dio.post<Map<String, dynamic>>(
      '/matches/swipe',
      data: {'targetUserId': targetUserId, 'action': action.name},
    );
    if (response.data == null || response.data!.isEmpty) return null;
    return Match.fromJson(response.data!);
  }

  Future<List<Match>> getMatches() async {
    final response = await _apiClient.dio.get<List<dynamic>>('/matches');
    return response.data!
        .map((e) => Match.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
