import 'package:crypto_match/features/match/domain/entities/match.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'swipe_result.freezed.dart';

@freezed
abstract class SwipeResult with _$SwipeResult {
  const factory SwipeResult({Match? match, double? newTokenBalance}) =
      _SwipeResult;
}
