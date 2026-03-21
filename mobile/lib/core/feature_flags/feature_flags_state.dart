import 'package:freezed_annotation/freezed_annotation.dart';

part 'feature_flags_state.freezed.dart';

@freezed
class FeatureFlagsState with _$FeatureFlagsState {
  const factory FeatureFlagsState.initial() = _Initial;
  const factory FeatureFlagsState.loading() = _Loading;
  const factory FeatureFlagsState.loaded({
    required bool enableEmailLogin,
    required bool enableGoogleLogin,
  }) = _Loaded;
}
