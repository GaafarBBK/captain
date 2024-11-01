import 'dart:convert';

class SetModel {
    int id;
    int exercisesId;
    int workoutId;
    int setNo;
    int reps;
    int weight;
    String status;
    DateTime createdAt;
    DateTime updatedAt;

    SetModel({
        required this.id,
        required this.exercisesId,
        required this.workoutId,
        required this.setNo,
        required this.reps,
        required this.weight,
        required this.status,
        required this.createdAt,
        required this.updatedAt,
    });

    factory SetModel.fromRawJson(String str) => SetModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory SetModel.fromJson(Map<String, dynamic> json) => SetModel(
        id: json["id"],
        exercisesId: json["exercises_id"],
        workoutId: json["workout_id"],
        setNo: json["set_no"],
        reps: json["reps"],
        weight: json["weight"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "exercises_id": exercisesId,
        "workout_id": workoutId,
        "set_no": setNo,
        "reps": reps,
        "weight": weight,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
