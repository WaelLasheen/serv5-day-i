import 'package:day_i/features/notification/domain/entities/notification_entity.dart';
import 'package:equatable/equatable.dart';

abstract class NotificationState extends Equatable {
  const NotificationState();

  @override
  List<Object?> get props => [];
}

class NotificationInitial extends NotificationState {}

class NotificationLoading extends NotificationState {}

class NotificationLoaded extends NotificationState {
  final List<NotificationEntity> notifications;

  const NotificationLoaded({required this.notifications});

  @override
  List<Object?> get props => [notifications];
}

class NotificationError extends NotificationState {
  final String message;

  const NotificationError({required this.message});

  @override
  List<Object?> get props => [message];
}

class UnreadNotificationsLoaded extends NotificationState {
  final List<NotificationEntity> notifications;

  const UnreadNotificationsLoaded({required this.notifications});

  @override
  List<Object?> get props => [notifications];
}

class UnreadNotificationCountLoaded extends NotificationState {
  final int count;

  const UnreadNotificationCountLoaded({required this.count});

  @override
  List<Object?> get props => [count];
}
