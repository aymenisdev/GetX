import 'package:ptoolz/model/global_model.dart';

import 'category.dart';

class CategoryModel extends GlobalModel {
  CategoryModel({
    this.data,
  });

  List<Category>? data;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        data:
            List<Category>.from(json["data"].map((x) => Category.fromJson(x))),
      )
        ..status = json['status'] as String?
        ..code = json['code']
        ..msg = json['msg'] as String?;

  @override
  Map<String, dynamic> toJson() => {
        "data": List<Category>.from(data!.map((x) => x.toJson())),
      };
}
