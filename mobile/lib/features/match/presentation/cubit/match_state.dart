import 'package:crypto_match/features/match/domain/entities/match.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'match_state.freezed.dart';

@freezed
class MatchState with _$MatchState {
  const factory MatchState.initial() = _Initial;
  const factory MatchState.loading() = _Loading;
  const factory MatchState.swiping({required List<MatchSuggestion> remaining}) =
      _Swiping;
  const factory MatchState.matched({
    required Match match,
    required List<MatchSuggestion> remaining,
  }) = _Matched;
  const factory MatchState.empty() = _Empty;
  const factory MatchState.failure({required String message}) = _Failure;

  /// User attempted a super-like but has fewer than 10 tokens.
  const factory MatchState.insufficientBalance({
    required List<MatchSuggestion> remaining,
  }) = _InsufficientBalance;

  /// The swipe API call failed (only emitted for superLike so the debit can be
  /// rolled back).  Remaining list is the cards still in the deck AFTER the
  /// top card was consumed.
  const factory MatchState.swipeFailed({
    required String message,
    required List<MatchSuggestion> remaining,
  }) = _SwipeFailed;
}
