// To parse this JSON data, do
//
//     final attedanceModel = attedanceModelFromJson(jsonString);

import 'dart:convert';


AttedanceModel attedanceModelFromJson(String str) =>
    AttedanceModel.fromJson(json.decode(str));

String attedanceModelToJson(AttedanceModel data) => json.encode(data.toJson());

class AttedanceModel {
  Check checkIn;
  Check? checkOut;
  int status;
  String date;
  String userId;

  AttedanceModel(
      {required this.userId,
      required this.checkIn,
      required this.checkOut,
      required this.status,
      required this.date});

  factory AttedanceModel.fromJson(Map<String, dynamic> json) => AttedanceModel(
        userId: json["userId"],
        checkIn: Check.fromJson(json["checkIn"]),
        checkOut:
            json["checkOut"] == null ? null : Check.fromJson(json["checkOut"]),
        status: json["status"],
        date: json["date"],
      );

  Map<String, dynamic> toJson() => {
        "checkIn": checkIn.toJson(),
        "status": status,
        "date": date,
      };
}

class Check {
  DateTime time;
  String photo;

  Check({
    required this.time,
    required this.photo,
  });

  factory Check.fromJson(Map<String, dynamic> json) => Check(
        time: DateTime.parse(json["time"]),
        photo: json["photo"],
      );

  Map<String, dynamic> toJson() => {
        "time": time.toIso8601String(),
        "photo": photo,
      };
}
