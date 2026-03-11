import 'package:crypto_match/features/profile/domain/entities/profile.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = _Initial;
  const factory ProfileState.loading() = _Loading;
  const factory ProfileState.loaded({required Profile profile}) = _Loaded;
  const factory ProfileState.updating({required Profile profile}) = _Updating;
  const factory ProfileState.updateSuccess({required Profile profile}) =
      _UpdateSuccess;
  const factory ProfileState.failure({required String message}) = _Failure;
}
