
/*
{
"username": "kortobaa2",
 "password": "kortobaa",
 "email":"kortobaa@kortobaa.com",
 "first_name":"kortobaa",
 "last_name":"kortobaa"
 }
 */
class SignUpRequest {
  SignUpRequest({
    required this.username,
    required this.password,
    required this.email,
    required this.firstName,
    required this.lastName,
  });

  String username;
  String password;
  String email;
  String firstName;
  String lastName;

  Map<String, dynamic> toJson() => {
    "username": username,
    "password": password,
    "email": email,
    "first_name": firstName,
    "last_name": lastName,
  };
}