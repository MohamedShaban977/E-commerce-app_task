class LoginRequest {
  LoginRequest({
    required this.username,
    required this.password,
  });

  String username;
  String password;

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
      };
}
