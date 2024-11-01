import 'dart:convert';

class ExerciseModel {
  String name;
  String type;
  String muscle;
  String equipment;
  String difficulty;
  String instructions;

  ExerciseModel({
    required this.name,
    required this.type,
    required this.muscle,
    required this.equipment,
    required this.difficulty,
    required this.instructions,
  });

  factory ExerciseModel.fromRawJson(String str) =>
      ExerciseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ExerciseModel.fromJson(Map<String, dynamic> json) => ExerciseModel(
        name: json["name"],
        type: json["type"],
        muscle: json["muscle"],
        equipment: json["equipment"],
        difficulty: json["difficulty"],
        instructions: json["instructions"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "type": type,
        "muscle": muscle,
        "equipment": equipment,
        "difficulty": difficulty,
        "instructions": instructions,
      };
}
