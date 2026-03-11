import 'package:crypto_match/features/match/domain/entities/match.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'match_state.freezed.dart';

@freezed
class MatchState with _$MatchState {
  const factory MatchState.initial() = _Initial;
  const factory MatchState.loading() = _Loading;
  const factory MatchState.swiping({
    required List<MatchSuggestion> remaining,
  }) = _Swiping;
  const factory MatchState.matched({
    required Match match,
    required List<MatchSuggestion> remaining,
  }) = _Matched;
  const factory MatchState.empty() = _Empty;
  const factory MatchState.failure({required String message}) = _Failure;
}
