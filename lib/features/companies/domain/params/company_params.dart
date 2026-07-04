class CompanyParams {
  final String name;
  final String email;
  final String phone;
  final String industry;
  final int planId;

  const CompanyParams({
    required this.name,
    required this.email,
    required this.phone,
    required this.industry,
    required this.planId,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "phone": phone,
      "industry": industry,
      "plan_id": planId,
    };
  }
}
