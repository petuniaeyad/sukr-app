import 'dart:convert';

SignupModel signupModelFromJson(String str) =>
    SignupModel.fromJson(json.decode(str));

String signupModelToJson(SignupModel data) => json.encode(data.toJson());

class SignupModel {
  String firstName;
  String lastName;
  String email;
  String? userType;

  SignupModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    this.userType,
  });

  factory SignupModel.fromJson(Map<String, dynamic> json) => SignupModel(
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
