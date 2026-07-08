class ContactInfoModel {
  final String phone;
  final String email;
  final String address;

  ContactInfoModel({
    required this.phone,
    required this.email,
    required this.address,
  });

  factory ContactInfoModel.fromJson(Map<String, dynamic> json) {
    return ContactInfoModel(
      phone: json['phone'] ?? '',
      email: json['email'] ?? '',
      address: json['address'] ?? '',
    );
  }
}
