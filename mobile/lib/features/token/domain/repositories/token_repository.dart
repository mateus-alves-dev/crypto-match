import 'package:crypto_match/core/error/failure.dart';
import 'package:crypto_match/features/token/domain/entities/streak_info.dart';
import 'package:crypto_match/features/token/domain/entities/token_action.dart';
import 'package:crypto_match/features/token/domain/entities/token_balance.dart';
import 'package:dartz/dartz.dart';

abstract class TokenRepository {
  Future<Either<Failure, TokenBalance>> getBalance();

  Future<Either<Failure, List<TokenTransaction>>> getHistory();

  Future<Either<Failure, List<TokenAction>>> getRewardActions();

  Future<Either<Failure, void>> completeProfileAction();

  Future<Either<Failure, void>> dailyCheckin();

  Future<Either<Failure, void>> inviteFriend({required String referralCode});

  Future<Either<Failure, StreakInfo>> getStreakInfo();

  Future<Either<Failure, void>> useStreakShield();
}
