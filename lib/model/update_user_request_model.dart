class UpdateUserRequestModel {
  UpdateUserRequestModel({
    required this.name,
    required this.surname,
    required this.avatar,
    required this.aboutMe,
    required this.city,
    required this.work,
  });
  String? name;
  String? surname;
  String? avatar;
  String? aboutMe;
  String? city;
  String? work;

  UpdateUserRequestModel.fromJson(Map<String, dynamic> json){
    name = json['name'];
    surname = json['surname'];
    avatar = json['avatar'];
    aboutMe = json['about_me'];
    city = json['city'];
    work = json['work'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['surname'] = surname;
    _data['avatar'] = avatar;
    _data['about_me'] = aboutMe;
    _data['city'] = city;
    _data['work'] = work;
    return _data;
  }
}