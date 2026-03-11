import 'package:crypto_match/features/match/domain/entities/match.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'matches_list_state.freezed.dart';

@freezed
class MatchesListState with _$MatchesListState {
  const factory MatchesListState.initial() = _Initial;
  const factory MatchesListState.loading() = _Loading;
  const factory MatchesListState.loaded({required List<Match> matches}) =
      _Loaded;
  const factory MatchesListState.failure({required String message}) = _Failure;
}
