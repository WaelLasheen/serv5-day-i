import 'package:equatable/equatable.dart';

class NotificationEntity extends Equatable {
  final int id;
  final String title;
  final String subtitle;
  final bool isRead;
  final DateTime createdAt;

  const NotificationEntity({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.isRead,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [id, title, subtitle, isRead, createdAt];
}
