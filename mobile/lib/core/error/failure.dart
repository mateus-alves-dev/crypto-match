import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
class Failure with _$Failure {
  const factory Failure.server({
    required int statusCode,
    required String message,
  }) = ServerFailure;

  const factory Failure.network({
    required String message,
  }) = NetworkFailure;

  const factory Failure.unauthorized() = UnauthorizedFailure;

  const factory Failure.notFound() = NotFoundFailure;

  const factory Failure.unknown({
    @Default('An unexpected error occurred') String message,
  }) = UnknownFailure;
}
