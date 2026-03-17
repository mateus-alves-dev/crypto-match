import 'package:crypto_match/features/token/domain/entities/leaderboard_entry.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'leaderboard_state.freezed.dart';

@freezed
class LeaderboardState with _$LeaderboardState {
  const factory LeaderboardState.initial() = _Initial;
  const factory LeaderboardState.loading() = _Loading;
  const factory LeaderboardState.loaded({
    required List<LeaderboardEntry> entries,
    int? userRank,
  }) = _Loaded;
  const factory LeaderboardState.failure({required String message}) = _Failure;
}
