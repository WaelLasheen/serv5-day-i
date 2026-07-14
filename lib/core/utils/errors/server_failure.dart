import 'package:day_i/core/utils/errors/failure.dart';
import 'package:day_i/core/utils/extensions/number_range.dart';
import 'package:day_i/generated/l10n.dart';
import 'package:dio/dio.dart';

class ServerFailure extends Failure {
  const ServerFailure(super.message);

  factory ServerFailure.fromDioError(DioException dioException) {
    final s = S.current;

    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(s.connectionTimeout);

      case DioExceptionType.sendTimeout:
        return ServerFailure(s.sendTimeout);

      case DioExceptionType.receiveTimeout:
        return ServerFailure(s.receiveTimeout);

      case DioExceptionType.badCertificate:
        return ServerFailure(s.badCertificate);

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(dioException.response);

      case DioExceptionType.cancel:
        return ServerFailure(s.requestCanceled);

      case DioExceptionType.connectionError:
        return ServerFailure(s.noInternetConnection);

      case DioExceptionType.unknown:
        return ServerFailure(s.unexpectedError);

      default:
        return ServerFailure(s.unexpectedError);
    }
  }

  factory ServerFailure.fromResponse(Response? response) {
    final s = S.current;

    final int? statusCode = response?.statusCode;
    final data = response?.data;

    if (statusCode != null && statusCode.isBetween(400, 499)) {
      if (data is Map<String, dynamic>) {
        final message = data['message'] ?? data['error'] ?? data['errors'];
        if (message is String && message.isNotEmpty) {
          return ServerFailure(message);
        } else if (message != null) {
          return ServerFailure(message.toString());
        }
      } else if (data is String && data.isNotEmpty) {
        return ServerFailure(data);
      }
      return ServerFailure(s.oopsError);
    } else if (statusCode != null && statusCode.isBetween(500, 599)) {
      if (data is Map<String, dynamic>) {
        final message = data['message'] ?? data['error'];
        if (message is String && message.isNotEmpty) {
          return ServerFailure(message);
        }
      }
      return ServerFailure(s.internalServerError);
    } else {
      return ServerFailure(s.oopsError);
    }
  }
}
