import 'package:crypto_match/core/error/failure.dart';
import 'package:crypto_match/features/settings/domain/entities/user_settings.dart';
import 'package:crypto_match/features/settings/domain/use_cases/settings_use_cases.dart';
import 'package:crypto_match/features/settings/presentation/cubit/settings_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit(
    this._getSettings,
    this._updateMatchPreferences,
    this._updateNotificationSettings,
    this._updatePrivacySettings,
    this._deleteAccount,
  ) : super(const SettingsState.initial());

  final GetUserSettingsUseCase _getSettings;
  final UpdateMatchPreferencesUseCase _updateMatchPreferences;
  final UpdateNotificationSettingsUseCase _updateNotificationSettings;
  final UpdatePrivacySettingsUseCase _updatePrivacySettings;
  final DeleteAccountUseCase _deleteAccount;

  UserSettings? get _currentSettings => state.mapOrNull(
        loaded: (s) => s.settings,
        updating: (s) => s.settings,
        updateSuccess: (s) => s.settings,
      );

  String _failureMessage(Failure failure) => failure.when(
        server: (_, message) => message,
        network: (message) => message,
        unauthorized: () => 'Não autorizado',
        notFound: () => 'Configurações não encontradas',
        unknown: (message) => message,
      );

  Future<void> loadSettings() async {
    emit(const SettingsState.loading());
    final result = await _getSettings();
    result.fold(
      (failure) =>
          emit(SettingsState.failure(message: _failureMessage(failure))),
      (settings) => emit(SettingsState.loaded(settings: settings)),
    );
  }

  Future<void> updateMatchPreferences(MatchPreferences preferences) async {
    final current = _currentSettings;
    if (current == null) return;

    final optimistic = current.copyWith(matchPreferences: preferences);
    emit(SettingsState.updating(settings: optimistic));

    final result = await _updateMatchPreferences(preferences);
    result.fold(
      (failure) =>
          emit(SettingsState.failure(message: _failureMessage(failure))),
      (_) => emit(SettingsState.updateSuccess(settings: optimistic)),
    );
  }

  Future<void> updateNotificationSettings(
    NotificationSettings notifSettings,
  ) async {
    final current = _currentSettings;
    if (current == null) return;

    final optimistic = current.copyWith(notificationSettings: notifSettings);
    emit(SettingsState.updating(settings: optimistic));

    final result = await _updateNotificationSettings(notifSettings);
    result.fold(
      (failure) =>
          emit(SettingsState.failure(message: _failureMessage(failure))),
      (_) => emit(SettingsState.updateSuccess(settings: optimistic)),
    );
  }

  Future<void> updatePrivacySettings(PrivacySettings privacySettings) async {
    final current = _currentSettings;
    if (current == null) return;

    final optimistic = current.copyWith(privacySettings: privacySettings);
    emit(SettingsState.updating(settings: optimistic));

    final result = await _updatePrivacySettings(privacySettings);
    result.fold(
      (failure) =>
          emit(SettingsState.failure(message: _failureMessage(failure))),
      (_) => emit(SettingsState.updateSuccess(settings: optimistic)),
    );
  }

  Future<void> deleteAccount() async {
    final current = _currentSettings;
    if (current == null) return;

    emit(SettingsState.updating(settings: current));

    final result = await _deleteAccount();
    result.fold(
      (failure) =>
          emit(SettingsState.failure(message: _failureMessage(failure))),
      (_) => emit(const SettingsState.accountDeleted()),
    );
  }
}
