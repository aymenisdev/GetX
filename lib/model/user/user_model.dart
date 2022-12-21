import 'package:ptoolz/model/global_model.dart';

import 'user_data.dart';

class UserModel extends GlobalModel {
  UserModel({this.data});

  UserData? data;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        data: json["data"] != null ? UserData.fromJson(json["data"]) : null,
      )
        ..status = json['status'] as String?
        ..code = json['code']
        ..msg = json['msg'] as String?;

  @override
  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
      };
}
