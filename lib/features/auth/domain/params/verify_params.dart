class VerifyParams {
  final String phone;
  final String otp;

  VerifyParams({required this.phone, required this.otp});

  Map<String, String> toJson() {
    return {'phone': phone, 'otp': otp};
  }
}
