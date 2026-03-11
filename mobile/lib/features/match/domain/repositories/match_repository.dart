import 'package:crypto_match/core/error/failure.dart';
import 'package:crypto_match/features/match/domain/entities/match.dart';
import 'package:dartz/dartz.dart';

abstract class MatchRepository {
  Future<Either<Failure, List<MatchSuggestion>>> getFeed();

  Future<Either<Failure, Match?>> swipe({
    required String targetUserId,
    required SwipeAction action,
  });

  Future<Either<Failure, List<Match>>> getMatches();
}
