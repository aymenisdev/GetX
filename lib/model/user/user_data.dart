import 'package:ptoolz/model/global_model.dart';

import 'user.dart';

class UserData  {
  UserData({
    this.user,
    this.token,
  });

  User? user;
  String? token;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    user: User.fromJson(json["user"]),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "user": user?.toJson(),
    "token": token,
  };
}