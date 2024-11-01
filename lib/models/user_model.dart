import 'dart:convert';

class UserModel {
  int id;
  String name;
  String email;
  String? avatarUrl;
  String? bio;
  String? phoneNumber;
  DateTime createdAt;
  DateTime updatedAt;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.avatarUrl,
    this.bio,
    this.phoneNumber,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserModel.fromRawJson(String str) =>
      UserModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        avatarUrl: json["avatar_url"],
        bio: json["bio"],
        phoneNumber: json["phone_number"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "avatar_url": avatarUrl,
        "bio": bio,
        "phone_number": phoneNumber,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
