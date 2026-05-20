import 'dart:convert';

LoginModel signupModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String signupModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  String firstName;
  String lastName;
  String email;
  String? userType;

  LoginModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    this.userType,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    firstName: json["firstName"],
    lastName: json["lastName"],
    email: json["email"],
    userType: json["userType"],
  );

  Map<String, dynamic> toJson() => {
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "userType": userType,
  };
}
