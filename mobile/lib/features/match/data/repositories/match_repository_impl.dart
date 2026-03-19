import 'package:crypto_match/core/error/failure.dart';
import 'package:crypto_match/core/network/api_error.dart';
import 'package:crypto_match/features/match/data/datasources/match_remote_data_source.dart';
import 'package:crypto_match/features/match/domain/entities/match.dart';
import 'package:crypto_match/features/match/domain/entities/swipe_result.dart';
import 'package:crypto_match/features/match/domain/repositories/match_repository.dart';
import 'package:dartz/dartz.dart';

class MatchRepositoryImpl implements MatchRepository {
  const MatchRepositoryImpl(this._dataSource);

  final MatchRemoteDataSource _dataSource;

  @override
  Future<Either<Failure, List<MatchSuggestion>>> getFeed() =>
      safeApiCall(_dataSource.getFeed);

  @override
  Future<Either<Failure, SwipeResult>> swipe({
    required String targetUserId,
    required SwipeAction action,
  }) => safeApiCall(
    () => _dataSource.swipe(targetUserId: targetUserId, action: action),
  );

  @override
  Future<Either<Failure, List<Match>>> getMatches() =>
      safeApiCall(_dataSource.getMatches);
}
