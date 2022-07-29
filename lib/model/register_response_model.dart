
import 'dart:convert';

RegisterResponseModel registerResponseModel(String str) =>
    RegisterResponseModel.fromJson(json.decode(str));

class RegisterResponseModel {
  RegisterResponseModel({
    required this.newUser,
  });
  late final NewUser newUser;

  RegisterResponseModel.fromJson(Map<String, dynamic> json){
    newUser = NewUser.fromJson(json['newUser']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['newUser'] = newUser.toJson();
    return _data;
  }
}

class NewUser {
  NewUser({
    required this.id,
    required this.name,
    required this.surname,
    required this.email,
    required this.password,
    required this.userRole,
    required this.updatedAt,
    required this.createdAt,
  });
  late final int id;
  late final String name;
  late final String surname;
  late final String email;
  late final String password;
  late final int userRole;
  late final String updatedAt;
  late final String createdAt;

  NewUser.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    surname = json['surname'];
    email = json['email'];
    password = json['password'];
    userRole = json['user_role'];
    updatedAt = json['updatedAt'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['surname'] = surname;
    _data['email'] = email;
    _data['password'] = password;
    _data['user_role'] = userRole;
    _data['updatedAt'] = updatedAt;
    _data['createdAt'] = createdAt;
    return _data;
  }
}