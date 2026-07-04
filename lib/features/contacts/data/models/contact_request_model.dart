class ContactRequestModel {
  final String email;
  final String subject;
  final String message;

  ContactRequestModel({
    required this.email,
    required this.subject,
    required this.message,
  });

  Map<String, dynamic> toJson() {
    return {'email': email, 'subject': subject, 'message': message};
  }
}
