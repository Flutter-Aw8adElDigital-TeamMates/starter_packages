import 'package:freezed_annotation/freezed_annotation.dart';

part 'remote_response.freezed.dart';

/// Represents different states of an HTTP response
@freezed
class RemoteResponse<T> with _$RemoteResponse<T> {
  const RemoteResponse._();

  /// Represents no internet connection scenario
  const factory RemoteResponse.noConnection() = _NoConnection;

  /// Represents a failure scenario with an error message and success flag
  const factory RemoteResponse.failure(String message, bool success, {int? statusCode}) = _Failure;

  /// Represents a successful response with data
  const factory RemoteResponse.data(T data) = _Data<T>;

  /// Represents a successful response but no data returned
  const factory RemoteResponse.noData() = _NoData;

  /// Represents an unexpected error
  const factory RemoteResponse.unexpectedError({
    required String message,
  }) = _UnexpectedError;
}

