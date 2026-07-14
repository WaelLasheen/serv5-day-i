import 'package:dartz/dartz.dart';
import 'package:day_i/core/utils/errors/failure.dart';
import 'package:day_i/features/notification/domain/entities/notification_entity.dart';
import 'package:day_i/features/notification/domain/repositories/notification_repository.dart';

class GetUnreadNotificationsUseCase {
  final NotificationRepository repository;

  GetUnreadNotificationsUseCase({required this.repository});

  Future<Either<Failure, List<NotificationEntity>>> call() async {
    return await repository.getUnreadNotifications();
  }
}
