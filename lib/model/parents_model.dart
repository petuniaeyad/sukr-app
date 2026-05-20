// To parse this JSON data, do
//
//     final parentsModel = parentsModelFromJson(jsonString);

import 'dart:convert';

ParentsModel parentsModelFromJson(String str) =>
    ParentsModel.fromJson(json.decode(str));

String parentsModelToJson(ParentsModel data) => json.encode(data.toJson());

class ParentsModel {
  String? childName;
  String? gender;
  String? typeOfDiabetes;
  String? age;
  String? height;
  String? weight;
  String? profilePic;
  String? nickName;
  String? childLink;
  String? nationalNumber;

  ParentsModel({
    required this.childName,
    required this.gender,
    required this.typeOfDiabetes,
    required this.age,
    required this.height,
    required this.weight,
    required this.profilePic,
    required this.nickName,
    required this.childLink,
    required this.nationalNumber,
  });

  factory ParentsModel.fromJson(Map<String, dynamic> json) => ParentsModel(
    childName: json["childName"],
    gender: json["gender"],
    typeOfDiabetes: json["typeOfDiabetes"],
    age: json["age"],
    height: json["height"],
    weight: json["weight"],
    profilePic: json["profilePic"],
    nickName: json["nickName"],
    childLink: json["childLink"],
    nationalNumber: json["nationalNumber"],
  );

  Map<String, dynamic> toJson() => {
    "childName": childName,
    "gender": gender,
    "typeOfDiabetes": typeOfDiabetes,
    "age": age,
    "height": height,
    "weight": weight,
    "profilePic": profilePic,
    "nickName": nickName,
    "childLink": childLink,
    "nationalNumber": nationalNumber,
  };
}
