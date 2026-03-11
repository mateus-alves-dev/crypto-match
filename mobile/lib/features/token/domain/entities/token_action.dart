import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_action.freezed.dart';
part 'token_action.g.dart';

enum TokenActionType {
  dailyCheckin,
  completeProfile,
  inviteFriend,
}

@freezed
class TokenAction with _$TokenAction {
  const factory TokenAction({
    required String id,
    required TokenActionType type,
    required String title,
    required String description,
    required double reward,
    required bool isAvailable,
    DateTime? nextAvailableAt,
    DateTime? completedAt,
  }) = _TokenAction;

  factory TokenAction.fromJson(Map<String, dynamic> json) =>
      _$TokenActionFromJson(json);
}
