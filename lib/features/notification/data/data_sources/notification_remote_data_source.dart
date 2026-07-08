import 'package:dartz/dartz.dart';
import 'package:day_i/core/networking/api_constants.dart';
import 'package:day_i/core/networking/i_api_service.dart';
import 'package:day_i/core/utils/errors/failure.dart';
import 'package:day_i/features/notification/data/models/notification_model.dart';

abstract class NotificationRemoteDataSource {
  Future<Either<Failure, List<NotificationModel>>> getNotifications();
}

class NotificationRemoteDataSourceImpl implements NotificationRemoteDataSource {
  final IApiService apiService;

  NotificationRemoteDataSourceImpl({required this.apiService});

  @override
  Future<Either<Failure, List<NotificationModel>>> getNotifications() async {
    // TODO: Update endpoint when ready
    final result = await apiService.get('${ApiConstants.baseURL}/notifications');
    return result.fold(
      (failure) => Left(failure),
      (response) {
        final List data = response.data['data'] ?? [];
        return Right(data.map((json) => NotificationModel.fromJson(json)).toList());
      },
    );
  }
}
