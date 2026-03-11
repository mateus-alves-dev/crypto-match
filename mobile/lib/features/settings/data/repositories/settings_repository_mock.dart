import 'package:crypto_match/core/error/failure.dart';
import 'package:crypto_match/features/settings/domain/entities/user_settings.dart';
import 'package:crypto_match/features/settings/domain/repositories/settings_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: SettingsRepository)
class MockSettingsRepositoryImpl implements SettingsRepository {
  UserSettings _settings = const UserSettings(
    matchPreferences: MatchPreferences(
      minAge: 20,
      maxAge: 40,
    ),
    notificationSettings: NotificationSettings(),
    privacySettings: PrivacySettings(),
  );

  @override
  Future<Either<Failure, UserSettings>> getSettings() async {
    await Future<void>.delayed(const Duration(milliseconds: 400));
    return Right(_settings);
  }

  @override
  Future<Either<Failure, UserSettings>> updateMatchPreferences(
    MatchPreferences preferences,
  ) async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    _settings = _settings.copyWith(matchPreferences: preferences);
    return Right(_settings);
  }

  @override
  Future<Either<Failure, UserSettings>> updateNotificationSettings(
    NotificationSettings settings,
  ) async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    _settings = _settings.copyWith(notificationSettings: settings);
    return Right(_settings);
  }

  @override
  Future<Either<Failure, UserSettings>> updatePrivacySettings(
    PrivacySettings settings,
  ) async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    _settings = _settings.copyWith(privacySettings: settings);
    return Right(_settings);
  }

  @override
  Future<Either<Failure, void>> deleteAccount() async {
    await Future<void>.delayed(const Duration(milliseconds: 800));
    return const Right(null);
  }
}
