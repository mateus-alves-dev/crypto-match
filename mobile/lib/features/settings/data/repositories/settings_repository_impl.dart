import 'package:crypto_match/core/error/failure.dart';
import 'package:crypto_match/core/network/api_error.dart';
import 'package:crypto_match/features/settings/data/datasources/settings_remote_data_source.dart';
import 'package:crypto_match/features/settings/domain/entities/user_settings.dart';
import 'package:crypto_match/features/settings/domain/repositories/settings_repository.dart';
import 'package:dartz/dartz.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  const SettingsRepositoryImpl(this._dataSource);

  final SettingsRemoteDataSource _dataSource;

  @override
  Future<Either<Failure, UserSettings>> getSettings() =>
      safeApiCall(_dataSource.getSettings);

  @override
  Future<Either<Failure, UserSettings>> updateMatchPreferences(
    MatchPreferences preferences,
  ) =>
      safeApiCall(() => _dataSource.updateMatchPreferences(preferences));

  @override
  Future<Either<Failure, UserSettings>> updateNotificationSettings(
    NotificationSettings settings,
  ) =>
      safeApiCall(() => _dataSource.updateNotificationSettings(settings));

  @override
  Future<Either<Failure, UserSettings>> updatePrivacySettings(
    PrivacySettings settings,
  ) =>
      safeApiCall(() => _dataSource.updatePrivacySettings(settings));

  @override
  Future<Either<Failure, void>> deleteAccount() =>
      safeApiCall(_dataSource.deleteAccount);
}
