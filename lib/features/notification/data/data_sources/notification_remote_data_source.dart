import 'package:dartz/dartz.dart';
import 'package:day_i/core/networking/api_constants.dart';
import 'package:day_i/core/networking/i_api_service.dart';
import 'package:day_i/core/utils/errors/failure.dart';
import 'package:day_i/features/notification/data/models/notification_model.dart';

abstract class NotificationRemoteDataSource {
  Future<Either<Failure, List<NotificationModel>>> getNotifications();
  Future<Either<Failure, List<NotificationModel>>> getUnreadNotifications();
  Future<Either<Failure, int>> getUnreadCount({required String lang});
}

class NotificationRemoteDataSourceImpl implements NotificationRemoteDataSource {
  final IApiService apiService;

  NotificationRemoteDataSourceImpl({required this.apiService});

  List<dynamic> _extractList(dynamic responseData) {
    if (responseData is List) {
      return responseData;
    }
    if (responseData is Map) {
      final data = responseData['data'] ?? responseData['notifications'];
      if (data is List) {
        return data;
      }
    }
    return [];
  }

  @override
  Future<Either<Failure, List<NotificationModel>>> getNotifications() async {
    final result = await apiService.get(ApiConstants.notifications);
    return result.fold(
      (failure) => Left(failure),
      (response) {
        final List data = _extractList(response.data);
        return Right(data.map((json) => NotificationModel.fromJson(json)).toList());
      },
    );
  }

  @override
  Future<Either<Failure, List<NotificationModel>>> getUnreadNotifications() async {
    final result = await apiService.get(ApiConstants.unreadNotifications);
    return result.fold(
      (failure) => Left(failure),
      (response) {
        final List data = _extractList(response.data);
        return Right(data.map((json) => NotificationModel.fromJson(json)).toList());
      },
    );
  }

  @override
  Future<Either<Failure, int>> getUnreadCount({required String lang}) async {
    final result = await apiService.get(
      ApiConstants.unreadNotificationsCount,
      queryParameters: {'lang': lang},
    );
    return result.fold(
      (failure) => Left(failure),
      (response) {
        dynamic countData = response.data;
        if (response.data is Map) {
          final map = response.data as Map;
          countData = map['count'] ?? (map['data'] is Map ? map['data']['count'] : map['data']);
        }
        int count = 0;
        if (countData is int) {
          count = countData;
        } else if (countData != null) {
          count = int.tryParse(countData.toString()) ?? 0;
        }
        return Right(count);
      },
    );
  }
}
