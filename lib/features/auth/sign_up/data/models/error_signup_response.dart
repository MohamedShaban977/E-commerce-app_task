
class ErrorSignupResponse {
  ErrorSignupResponse({
    this.password,
    this.username,
  });

  final List<String>? password;
  final List<String>? username;

  factory ErrorSignupResponse.fromJson(Map<String, dynamic> json) => ErrorSignupResponse(
    password: json["password"] == null ? [] : List<String>.from(json["password"]!.map((x) => x)),
    username: json["username"] == null ? [] : List<String>.from(json["username"]!.map((x) => x)),
  );

}