import 'package:crypto_match/core/error/failure.dart';
import 'package:crypto_match/features/settings/domain/entities/user_settings.dart';
import 'package:dartz/dartz.dart';

abstract class SettingsRepository {
  Future<Either<Failure, UserSettings>> getSettings();

  Future<Either<Failure, UserSettings>> updateMatchPreferences(
    MatchPreferences preferences,
  );

  Future<Either<Failure, UserSettings>> updateNotificationSettings(
    NotificationSettings settings,
  );

  Future<Either<Failure, UserSettings>> updatePrivacySettings(
    PrivacySettings settings,
  );

  Future<Either<Failure, void>> deleteAccount();
}
