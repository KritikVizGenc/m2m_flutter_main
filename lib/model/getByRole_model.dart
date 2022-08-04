// To parse this JSON data, do
//
//     final getByRoleModel = getByRoleModelFromJson(jsonString);

import 'dart:convert';

List<GetByRoleModel> getByRoleModelFromJson(String str) =>
    List<GetByRoleModel>.from(
        json.decode(str).map((x) => GetByRoleModel.fromJson(x)));

String getByRoleModelToJson(List<GetByRoleModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetByRoleModel {
  GetByRoleModel({
    required this.id,
    required this.name,
    required this.surname,
    required this.email,
    required this.password,
    required this.userRole,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  String surname;
  String email;
  String password;
  int userRole;
  DateTime createdAt;
  DateTime updatedAt;

  factory GetByRoleModel.fromJson(Map<String, dynamic> json) => GetByRoleModel(
        id: json["id"],
        name: json["name"],
        surname: json["surname"],
        email: json["email"],
        password: json["password"],
        userRole: json["user_role"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "surname": surname,
        "email": email,
        "password": password,
        "user_role": userRole,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
