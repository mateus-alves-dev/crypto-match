import 'package:freezed_annotation/freezed_annotation.dart';

part 'match.freezed.dart';
part 'match.g.dart';

enum SwipeAction { like, dislike, superLike }

@freezed
class Match with _$Match {
  const factory Match({
    required String id,
    required String userId,
    required String matchedUserId,
    required String matchedUserName,
    required DateTime matchedAt,
    String? matchedUserAvatarUrl,
    String? matchedUserBio,
  }) = _Match;

  factory Match.fromJson(Map<String, dynamic> json) => _$MatchFromJson(json);
}

@freezed
class MatchSuggestion with _$MatchSuggestion {
  const factory MatchSuggestion({
    required String userId,
    required String name,
    String? avatarUrl,
    String? bio,
    int? age,
    List<String>? cryptoInterests,
  }) = _MatchSuggestion;

  factory MatchSuggestion.fromJson(Map<String, dynamic> json) =>
      _$MatchSuggestionFromJson(json);
}
