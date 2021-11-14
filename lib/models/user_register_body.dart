class UserRegisterBody {
  final String name;
  final String phone;
  final String password;
  final String confirmPassword;

  UserRegisterBody({
    required this.name,
    required this.phone,
    required this.password,
    required this.confirmPassword,
  });
}
