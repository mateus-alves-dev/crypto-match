import 'package:crypto_match/core/error/failure.dart';
import 'package:crypto_match/core/network/api_error.dart';
import 'package:crypto_match/features/token/data/datasources/token_remote_data_source.dart';
import 'package:crypto_match/features/token/domain/entities/daily_mission.dart';
import 'package:crypto_match/features/token/domain/entities/leaderboard_entry.dart';
import 'package:crypto_match/features/token/domain/entities/streak_info.dart';
import 'package:crypto_match/features/token/domain/entities/token_action.dart';
import 'package:crypto_match/features/token/domain/entities/token_balance.dart';
import 'package:crypto_match/features/token/domain/repositories/token_repository.dart';
import 'package:dartz/dartz.dart';

class TokenRepositoryImpl implements TokenRepository {
  const TokenRepositoryImpl(this._dataSource);

  final TokenRemoteDataSource _dataSource;

  @override
  Future<Either<Failure, TokenBalance>> getBalance() =>
      safeApiCall(_dataSource.getBalance);

  @override
  Future<Either<Failure, List<TokenTransaction>>> getHistory() =>
      safeApiCall(_dataSource.getHistory);

  @override
  Future<Either<Failure, List<TokenAction>>> getRewardActions() =>
      safeApiCall(_dataSource.getRewardActions);

  @override
  Future<Either<Failure, void>> completeProfileAction() =>
      safeApiCall(_dataSource.completeProfileAction);

  @override
  Future<Either<Failure, void>> dailyCheckin() =>
      safeApiCall(_dataSource.dailyCheckin);

  @override
  Future<Either<Failure, void>> inviteFriend({required String referralCode}) =>
      safeApiCall(() => _dataSource.inviteFriend(referralCode: referralCode));

  @override
  Future<Either<Failure, StreakInfo>> getStreakInfo() =>
      safeApiCall(_dataSource.getStreakInfo);

  @override
  Future<Either<Failure, void>> useStreakShield() =>
      safeApiCall(_dataSource.useStreakShield);

  @override
  Future<Either<Failure, List<LeaderboardEntry>>> getLeaderboard() =>
      safeApiCall(_dataSource.getLeaderboard);

  @override
  Future<Either<Failure, List<DailyMission>>> getDailyMissions() =>
      safeApiCall(_dataSource.getDailyMissions);

  @override
  Future<Either<Failure, double>> claimMissionReward({
    required String missionId,
  }) =>
      safeApiCall(
        () => _dataSource.claimMissionReward(missionId: missionId),
      );
}
