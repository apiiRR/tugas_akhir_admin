// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) =>
    ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  String email;
  String employeeId;
  String name;
  String phone;
  String position;
  String? photo;
  String? createdAt;
  String? uid;

  ProfileModel({
    required this.email,
    required this.employeeId,
    required this.name,
    required this.phone,
    required this.position,
    required this.photo,
    required this.createdAt,
    required this.uid,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        createdAt: json["createdAt"],
        email: json["email"],
        employeeId: json["employeeId"],
        name: json["name"],
        phone: json["phone"],
        position: json["position"],
        photo: json["photo"],
        uid: json["uid"],
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt,
        "email": email,
        "employeeId": employeeId,
        "name": name,
        "phone": phone,
        "position": position,
        "photo": photo,
        "uid": uid
      };
}
