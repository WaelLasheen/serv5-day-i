class ChangePasswordParams {
  final String password;
  final String passwordConfirmation;

  ChangePasswordParams({
    required this.password,
    required this.passwordConfirmation,
  });

  Map<String, String> toJson() {
    return {
      'password': password,
      'password_confirmation': passwordConfirmation,
    };
  }
}
