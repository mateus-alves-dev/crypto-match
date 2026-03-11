import 'package:crypto_match/core/error/failure.dart';
import 'package:crypto_match/features/match/domain/entities/match.dart';
import 'package:crypto_match/features/match/domain/repositories/match_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetMatchFeedUseCase {
  const GetMatchFeedUseCase(this._repository);

  final MatchRepository _repository;

  Future<Either<Failure, List<MatchSuggestion>>> call() =>
      _repository.getFeed();
}

@injectable
class SwipeUseCase {
  const SwipeUseCase(this._repository);

  final MatchRepository _repository;

  Future<Either<Failure, Match?>> call({
    required String targetUserId,
    required SwipeAction action,
  }) =>
      _repository.swipe(targetUserId: targetUserId, action: action);
}

@injectable
class GetMatchesUseCase {
  const GetMatchesUseCase(this._repository);

  final MatchRepository _repository;

  Future<Either<Failure, List<Match>>> call() => _repository.getMatches();
}
