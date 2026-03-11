import 'package:crypto_match/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

/// Maps a [DioException] to a typed [Failure].
Failure dioExceptionToFailure(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.receiveTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.connectionError:
      return Failure.network(message: e.message ?? 'Network error');
    case DioExceptionType.badResponse:
      final statusCode = e.response?.statusCode ?? 0;
      if (statusCode == 401) return const Failure.unauthorized();
      if (statusCode == 404) return const Failure.notFound();
      final data = e.response?.data;
      final message = data is Map<String, dynamic>
          ? data['message']?.toString() ?? 'Server error'
          : 'Server error';
      return Failure.server(statusCode: statusCode, message: message);
    default:
      return Failure.unknown(message: e.message ?? 'Unknown error');
  }
}

/// Wraps a repository call, catching [DioException] and mapping to [Failure].
Future<Either<Failure, T>> safeApiCall<T>(
  Future<T> Function() call,
) async {
  try {
    final result = await call();
    return Right(result);
  } on DioException catch (e) {
    return Left(dioExceptionToFailure(e));
  } catch (e) {
    return Left(Failure.unknown(message: e.toString()));
  }
}
