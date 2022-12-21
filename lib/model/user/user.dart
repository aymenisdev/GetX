class User {
  User({
    this.id,
    this.userName,
    this.fullName,
    this.email,
    this.mobile,
    this.country,
    this.city,
    this.region,
    this.address,
    this.latitude,
    this.longitude,
    this.activity,
    this.delivery,
    this.registrationDate,
    this.avatar,
    this.lastSeen,
    this.balance,
    this.accountTypeId,
    this.student,
    this.universityContractId,
    this.numberOfUse,
    this.deleted,
  });

  int? id;
  String? userName;
  String? fullName;
  String? email;
  String? mobile;
  int? country;
  int? city;
  int? region;
  String? address;
  dynamic latitude;
  dynamic longitude;
  int? activity;
  dynamic delivery;
  String? registrationDate;
  String? avatar;
  String? lastSeen;
  int? balance;
  int? accountTypeId;
  int? student;
  int? universityContractId;
  int? numberOfUse;
  int? deleted;


  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    userName: json["userName"],
    fullName: json["fullName"],
    email: json["email"],
    mobile: json["mobile"],
    country: json["country"],
    city: json["city"],
    region: json["region"],
    address: json["address"],
    latitude: json["latitude"],

    longitude: json["longitude"],
    activity: json["activity"],
    delivery: json["delivery"],
    registrationDate: json["registrationDate"],
    avatar: json["avatar"],
    lastSeen: json["lastSeen"],
    balance: json["balance"],
    accountTypeId: json["accountTypeId"],
    student: json["student"],
    universityContractId: json["universityContractId"],
    numberOfUse: json["numberOfUse"],
    deleted: json["deleted"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userName": userName,
    "fullName": fullName,
    "email": email,
    "mobile": mobile,
    "country": country,
    "city": city,
    "region": region,
    "address": address,
    "latitude": latitude,
    "longitude": longitude,
    "activity": activity,
    "delivery": delivery,
    "registrationDate": registrationDate,
    "avatar": avatar,
    "lastSeen": lastSeen,
    "balance": balance,
    "accountTypeId": accountTypeId,
    "student": student,
    "universityContractId": universityContractId,
    "numberOfUse": numberOfUse,
    "deleted": deleted,
  };
}
