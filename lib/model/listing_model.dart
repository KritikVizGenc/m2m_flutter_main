// To parse this JSON data, do
//
//     final Listing = ListingFromJson(jsonString);

import 'dart:convert';

Listing ListingFromJson(String str) => Listing.fromJson(json.decode(str));

String ListingToJson(Listing data) => json.encode(data.toJson());

class Listing {
    Listing({
       required this.id,
       required this.roleName,
       required this.createdAt,
       required this.updatedAt,
       required this.userTables,
    });

    int id;
    String roleName;
    DateTime createdAt;
    DateTime updatedAt;
    List<UserTable> userTables;

    factory Listing.fromJson(Map<String, dynamic> json) => Listing(
        id: json["id"],
        roleName: json["role_name"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        userTables: List<UserTable>.from(json["user_tables"].map((x) => UserTable.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "role_name": roleName,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "user_tables": List<dynamic>.from(userTables.map((x) => x.toJson())),
    };
}

class UserTable {
    UserTable({
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

    factory UserTable.fromJson(Map<String, dynamic> json) => UserTable(
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