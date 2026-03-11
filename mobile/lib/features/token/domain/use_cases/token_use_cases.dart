import 'package:crypto_match/core/error/failure.dart';
import 'package:crypto_match/features/token/domain/entities/token_action.dart';
import 'package:crypto_match/features/token/domain/entities/token_balance.dart';
import 'package:crypto_match/features/token/domain/repositories/token_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetTokenBalanceUseCase {
  const GetTokenBalanceUseCase(this._repository);

  final TokenRepository _repository;

  Future<Either<Failure, TokenBalance>> call() => _repository.getBalance();
}

@injectable
class GetTokenHistoryUseCase {
  const GetTokenHistoryUseCase(this._repository);

  final TokenRepository _repository;

  Future<Either<Failure, List<TokenTransaction>>> call() =>
      _repository.getHistory();
}

@injectable
class DailyCheckinUseCase {
  const DailyCheckinUseCase(this._repository);

  final TokenRepository _repository;

  Future<Either<Failure, void>> call() => _repository.dailyCheckin();
}

@injectable
class GetRewardActionsUseCase {
  const GetRewardActionsUseCase(this._repository);

  final TokenRepository _repository;

  Future<Either<Failure, List<TokenAction>>> call() =>
      _repository.getRewardActions();
}

@injectable
class CompleteProfileActionUseCase {
  const CompleteProfileActionUseCase(this._repository);

  final TokenRepository _repository;

  Future<Either<Failure, void>> call() => _repository.completeProfileAction();
}

@injectable
class InviteFriendUseCase {
  const InviteFriendUseCase(this._repository);

  final TokenRepository _repository;

  Future<Either<Failure, void>> call({required String referralCode}) =>
      _repository.inviteFriend(referralCode: referralCode);
}
