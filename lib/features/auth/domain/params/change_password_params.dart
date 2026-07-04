class ChangePasswordParams {
  final String password;
  final String passwordConfirmation;
  final String bearerToken;

  ChangePasswordParams({
    required this.password,
    required this.passwordConfirmation,
    required this.bearerToken,
  });

  Map<String, String> toJson() {
    return {
      'password': password,
      'password_confirmation': passwordConfirmation,
    };
  }
}
