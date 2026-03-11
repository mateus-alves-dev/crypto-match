import 'package:crypto_match/features/settings/domain/entities/user_settings.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_state.freezed.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState.initial() = _Initial;
  const factory SettingsState.loading() = _Loading;
  const factory SettingsState.loaded({required UserSettings settings}) =
      _Loaded;
  const factory SettingsState.updating({required UserSettings settings}) =
      _Updating;
  const factory SettingsState.updateSuccess({required UserSettings settings}) =
      _UpdateSuccess;
  const factory SettingsState.failure({required String message}) = _Failure;
  const factory SettingsState.accountDeleted() = _AccountDeleted;
}
