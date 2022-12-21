class Category {
  Category({
    this.id,
    this.departmentName,
    this.departmentIcon,
  });

  int? id;
  String? departmentName;
  String? departmentIcon;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        departmentName: json["departmentName"],
        departmentIcon: json["departmentIcon"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "departmentName": departmentName,
        "departmentIcon": departmentIcon,
      };
}
