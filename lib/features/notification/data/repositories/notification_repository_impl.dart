import 'package:dartz/dartz.dart';
import 'package:day_i/core/utils/errors/failure.dart';
import 'package:day_i/features/notification/data/data_sources/notification_remote_data_source.dart';
import 'package:day_i/features/notification/domain/entities/notification_entity.dart';
import 'package:day_i/features/notification/domain/repositories/notification_repository.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  final NotificationRemoteDataSource remoteDataSource;

  NotificationRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<NotificationEntity>>> getNotifications() async {
    return await remoteDataSource.getNotifications();
  }

  @override
  Future<Either<Failure, List<NotificationEntity>>> getUnreadNotifications() async {
    return await remoteDataSource.getUnreadNotifications();
  }

  @override
  Future<Either<Failure, int>> getUnreadCount({required String lang}) async {
    return await remoteDataSource.getUnreadCount(lang: lang);
  }
}
