import 'package:dartz/dartz.dart';
import 'package:day_i/core/utils/errors/failure.dart';
import 'package:day_i/features/notification/domain/repositories/notification_repository.dart';

class GetUnreadNotificationsCountUseCase {
  final NotificationRepository repository;

  GetUnreadNotificationsCountUseCase({required this.repository});

  Future<Either<Failure, int>> call({required String lang}) async {
    return await repository.getUnreadCount(lang: lang);
  }
}
