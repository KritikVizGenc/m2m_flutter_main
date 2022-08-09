// To parse this JSON data, do
//
//     final getMyMenteesModel = getMyMenteesModelFromJson(jsonString);

import 'dart:convert';

List<GetMyMenteesModel> getMyMenteesModelFromJson(String str) =>
    List<GetMyMenteesModel>.from(
        json.decode(str).map((x) => GetMyMenteesModel.fromJson(x)));

GetMyMenteesModel myMenteesFromJson(String str) =>
    GetMyMenteesModel.fromJson(json.decode(str));

String getMyMenteesModelToJson(List<GetMyMenteesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetMyMenteesModel {
  GetMyMenteesModel({
    required this.id,
    required this.userId,
    required this.relId,
    required this.createdAt,
    required this.updatedAt,
    required this.userTableId,
    required this.myMenteesId,
    required this.myMenteesName,
    required this.myMenteesSurname,
    required this.myMenteesEmail,
    required this.myMenteesPassword,
    required this.myMenteesUserRole,
    required this.myMenteesRatingAverage,
    required this.myMenteesRating,
    required this.myMenteesCreatedAt,
    required this.myMenteesUpdatedAt,
  });

  int id;
  int userId;
  int relId;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic userTableId;
  int myMenteesId;
  String myMenteesName;
  String myMenteesSurname;
  String myMenteesEmail;
  String myMenteesPassword;
  int myMenteesUserRole;
  double myMenteesRatingAverage;
  List<int> myMenteesRating;
  DateTime myMenteesCreatedAt;
  DateTime myMenteesUpdatedAt;

  factory GetMyMenteesModel.fromJson(Map<String, dynamic> json) =>
      GetMyMenteesModel(
        id: json["id"],
        userId: json["user_id"],
        relId: json["rel_id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        userTableId: json["userTableId"],
        myMenteesId: json["myMentees.id"],
        myMenteesName: json["myMentees.name"],
        myMenteesSurname: json["myMentees.surname"],
        myMenteesEmail: json["myMentees.email"],
        myMenteesPassword: json["myMentees.password"],
        myMenteesUserRole: json["myMentees.user_role"],
        myMenteesRatingAverage: json["myMentees.ratingAverage"].toDouble(),
        myMenteesRating: List<int>.from(json["myMentees.rating"].map((x) => x)),
        myMenteesCreatedAt: DateTime.parse(json["myMentees.createdAt"]),
        myMenteesUpdatedAt: DateTime.parse(json["myMentees.updatedAt"]),
      );

  get myMentorsId => null;

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "rel_id": relId,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "userTableId": userTableId,
    "myMentees.id": myMenteesId,
    "myMentees.name": myMenteesName,
    "myMentees.surname": myMenteesSurname,
    "myMentees.email": myMenteesEmail,
    "myMentees.password": myMenteesPassword,
    "myMentees.user_role": myMenteesUserRole,
    "myMentees.ratingAverage": myMenteesRatingAverage,
    "myMentees.rating": List<dynamic>.from(myMenteesRating.map((x) => x)),
    "myMentees.createdAt": myMenteesCreatedAt.toIso8601String(),
    "myMentees.updatedAt": myMenteesUpdatedAt.toIso8601String(),
  };
}
