import 'dart:convert';

import 'package:intl/intl.dart';

class WorkoutModel {
    int id;
    int captainId;
    int userId;
    String? title;
    DateFormat date;
    String status;
    DateTime createdAt;
    DateTime updatedAt;

    WorkoutModel({
        required this.id,
        required this.captainId,
        required this.userId,
        this.title,
        required this.date,
        required this.status,
        required this.createdAt,
        required this.updatedAt,
    });

    factory WorkoutModel.fromRawJson(String str) => WorkoutModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory WorkoutModel.fromJson(Map<String, dynamic> json) => WorkoutModel(
        id: json["id"],
        captainId: json["captain_id"],
        userId: json["user_id"],
        title: json["title"],
        date: json["date"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "captain_id": captainId,
        "user_id": userId,
        "title": title,
        "date": date,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
