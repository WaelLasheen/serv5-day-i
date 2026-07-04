class CompanyEntity {
  final int id;
  final String name;
  final String domain;
  final String email;
  final String phone;
  final String industry;
  final int planId;
  final String url;
  final String createdAt;

  const CompanyEntity({
    required this.id,
    required this.name,
    required this.domain,
    required this.email,
    required this.phone,
    required this.industry,
    required this.planId,
    required this.url,
    required this.createdAt,
  });
}
