import 'package:day_i/features/companies/domain/entity/company_entity.dart';

class CompanyModel {
  final int id;
  final String name;
  final String domain;
  final String email;
  final String phone;
  final String industry;
  final int planId;
  final String url;
  final String createdAt;

  const CompanyModel({
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

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
      id: json['id'],
      name: json['name'],
      domain: json['domain'],
      email: json['email'],
      phone: json['phone'],
      industry: json['industry'],
      planId: json['plan_id'],
      url: json['url'],
      createdAt: json['created_at'],
    );
  }

  CompanyEntity toEntity() {
    return CompanyEntity(
      id: id,
      name: name,
      domain: domain,
      email: email,
      phone: phone,
      industry: industry,
      planId: planId,
      url: url,
      createdAt: createdAt,
    );
  }
}
