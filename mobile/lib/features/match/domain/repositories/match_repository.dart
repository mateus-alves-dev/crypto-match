import 'package:crypto_match/core/error/failure.dart';
import 'package:crypto_match/features/match/domain/entities/match.dart';
import 'package:crypto_match/features/match/domain/entities/swipe_result.dart';
import 'package:dartz/dartz.dart';

abstract class MatchRepository {
  Future<Either<Failure, List<MatchSuggestion>>> getFeed();

  Future<Either<Failure, SwipeResult>> swipe({
    required String targetUserId,
    required SwipeAction action,
  });

  Future<Either<Failure, List<Match>>> getMatches();
}
