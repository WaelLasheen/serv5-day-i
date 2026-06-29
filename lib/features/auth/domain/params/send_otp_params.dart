class SendOtpParams {
  final String phone;

  SendOtpParams({required this.phone});

  Map<String, String> toJson() {
    return {'phone': phone};
  }
}
