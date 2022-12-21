import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../model/user/user.dart';

class StorageService extends GetxService {
  String? languageCode;
  String? countryCode;
  String? deviceId;
  String? version;

  Future<StorageService> init() async {
    
    await GetStorage.init();
    languageCode = GetStorage().read('languageCode');
    countryCode = GetStorage().read('countryCode');
    // languageCode ??= Get.deviceLocale!.languageCode;
    languageCode ??= "ar";
    return this;
  }

  User? getUser() {
    if (GetStorage().read("user") != null) {
      return User.fromJson(GetStorage().read("user"));
    }
    return null;
  }



  //
  // String? getFcmToken() {
  //   if (GetStorage().read("token") != null) {
  //     return GetStorage().read("token");
  //   }
  //   return null;
  // }
  //
  // void setFcmToken(String value) {
  //   GetStorage().write("token", value);
  // }
  //
  String? getToken() {
    if (GetStorage().read("token") != null) {
      return GetStorage().read("token");
    }
    return null;
  }
  //
  void setUserToken(String value) {
    GetStorage().write("token", value);
  }

  // bool isAuth() {
  //   if (GetStorage().read("token") != null) {
  //     return true;
  //   }
  //   return false;
  // }

  void clearApp() {
    GetStorage().remove("user");
    GetStorage().remove("token");
  }

  void write(String key, dynamic value) {
    GetStorage().write(key, value);
  }

  bool isIntro() {
    if (GetStorage().read("is_intro") != null) {
      return GetStorage().read("is_intro");
    } else {
      return false;
    }
  }

  void setIntro(bool isIntro) {
    GetStorage().write("is_intro", isIntro);
  }


  void setUser(User value) {
    GetStorage().write(
        "user",
        User(
                id: value.id,
                accountTypeId: value.accountTypeId,
                activity: value.activity,
                address: value.address,
                avatar: value.avatar,
                balance: value.balance,
                email: value.email,
                city: value.city,
                country: value.country,
                latitude: value.latitude,
                longitude: value.longitude,
                mobile: value.mobile,
                deleted: value.deleted,
                delivery: value.delivery,
                fullName: value.fullName,
                lastSeen: value.lastSeen,
                numberOfUse: value.numberOfUse,
                region: value.region,
                registrationDate: value.registrationDate,
                student: value.student,
                universityContractId: value.universityContractId,
                userName: value.userName)
            .toJson());
  }




}
