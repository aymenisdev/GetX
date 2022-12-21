class GlobalModel {
  GlobalModel({
    this.status,
    this.code,
    this.msg,
  });

  String? status;
  dynamic code;
  String? msg;

  factory GlobalModel.fromJson(Map<String, dynamic> json) => GlobalModel(
        status: json["status"],
        code: json["code"],
    msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "msg": msg,
      };
}
