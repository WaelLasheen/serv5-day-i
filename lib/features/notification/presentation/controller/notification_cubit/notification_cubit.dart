import 'package:day_i/features/notification/domain/use_cases/get_notifications_use_case.dart';
import 'package:day_i/features/notification/presentation/controller/notification_cubit/notification_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationCubit extends Cubit<NotificationState> {
  final GetNotificationsUseCase getNotificationsUseCase;

  NotificationCubit({required this.getNotificationsUseCase})
      : super(NotificationInitial());

  Future<void> fetchNotifications() async {
    emit(NotificationLoading());
    final result = await getNotificationsUseCase.call();
    result.fold(
      (failure) => emit(NotificationError(message: failure.message)),
      (notifications) => emit(NotificationLoaded(notifications: notifications)),
    );
  }
}
