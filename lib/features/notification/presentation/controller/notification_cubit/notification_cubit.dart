import 'package:day_i/features/notification/domain/use_cases/get_notifications_use_case.dart';
import 'package:day_i/features/notification/domain/use_cases/get_unread_notifications_count_use_case.dart';
import 'package:day_i/features/notification/domain/use_cases/get_unread_notifications_use_case.dart';
import 'package:day_i/features/notification/presentation/controller/notification_cubit/notification_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationCubit extends Cubit<NotificationState> {
  final GetNotificationsUseCase getNotificationsUseCase;
  final GetUnreadNotificationsUseCase getUnreadNotificationsUseCase;
  final GetUnreadNotificationsCountUseCase getUnreadNotificationsCountUseCase;

  NotificationCubit({
    required this.getNotificationsUseCase,
    required this.getUnreadNotificationsUseCase,
    required this.getUnreadNotificationsCountUseCase,
  }) : super(NotificationInitial());

  Future<void> fetchNotifications() async {
    emit(NotificationLoading());
    final result = await getNotificationsUseCase.call();
    result.fold(
      (failure) {
        if (!isClosed) emit(NotificationError(message: failure.message));
      },
      (notifications) {
        if (!isClosed) emit(NotificationLoaded(notifications: notifications));
      },
    );
  }

  Future<void> fetchUnreadNotifications() async {
    emit(NotificationLoading());
    final result = await getUnreadNotificationsUseCase.call();
    result.fold(
      (failure) {
        if (!isClosed) emit(NotificationError(message: failure.message));
      },
      (notifications) {
        if (!isClosed) emit(UnreadNotificationsLoaded(notifications: notifications));
      },
    );
  }

  Future<void> fetchUnreadCount({required String lang}) async {
    final result = await getUnreadNotificationsCountUseCase.call(lang: lang);
    result.fold(
      (failure) {
        if (!isClosed) emit(NotificationError(message: failure.message));
      },
      (count) {
        if (!isClosed) emit(UnreadNotificationCountLoaded(count: count));
      },
    );
  }
}
