import 'package:crypto_match/core/error/failure.dart';
import 'package:crypto_match/features/settings/domain/entities/user_settings.dart';
import 'package:crypto_match/features/settings/domain/repositories/settings_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetUserSettingsUseCase {
  const GetUserSettingsUseCase(this._repository);

  final SettingsRepository _repository;

  Future<Either<Failure, UserSettings>> call() => _repository.getSettings();
}

@injectable
class UpdateMatchPreferencesUseCase {
  const UpdateMatchPreferencesUseCase(this._repository);

  final SettingsRepository _repository;

  Future<Either<Failure, UserSettings>> call(MatchPreferences preferences) =>
      _repository.updateMatchPreferences(preferences);
}

@injectable
class UpdateNotificationSettingsUseCase {
  const UpdateNotificationSettingsUseCase(this._repository);

  final SettingsRepository _repository;

  Future<Either<Failure, UserSettings>> call(NotificationSettings settings) =>
      _repository.updateNotificationSettings(settings);
}

@injectable
class UpdatePrivacySettingsUseCase {
  const UpdatePrivacySettingsUseCase(this._repository);

  final SettingsRepository _repository;

  Future<Either<Failure, UserSettings>> call(PrivacySettings settings) =>
      _repository.updatePrivacySettings(settings);
}

@injectable
class DeleteAccountUseCase {
  const DeleteAccountUseCase(this._repository);

  final SettingsRepository _repository;

  Future<Either<Failure, void>> call() => _repository.deleteAccount();
}
