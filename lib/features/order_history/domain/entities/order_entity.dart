class OrderEntity {
  final int id;
  final String code;
  final String title;
  final String date;
  final String status; // 'pending', 'approved', 'late'
  final double budget;
  final String platform; // 'facebook', 'instagram', 'google'
  final String? employeeName;
  final int? serviceId;
  final String? category;
  final int? executionDays;

  const OrderEntity({
    required this.id,
    required this.code,
    required this.title,
    required this.date,
    required this.status,
    required this.budget,
    required this.platform,
    this.employeeName,
    this.serviceId,
    this.category,
    this.executionDays,
  });
}

