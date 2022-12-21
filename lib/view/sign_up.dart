import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ptoolz/themes/app_colors.dart';
import 'package:ptoolz/themes/text_styles.dart';
import 'package:ptoolz/translations/lang_keys.dart';

import '../components/my_elevated_button.dart';
import '../controller/sign_up_controller.dart';
import '../routes/app_routes.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);
  var controller = Get.find<SignUpController>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 35.0.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 10.0.h),
                Obx(() => Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            controller.isClientSelected(true);
                          },
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                  controller.isClientSelected.value
                                      ? "assets/icon/radio_selected.svg"
                                      : "assets/icon/radio_un_selected.svg",
                                  height: 25.0.h,
                                  width: 25.0.w),
                              SizedBox(width: 14.0.w),
                              Text(
                                LangKeys.client.tr,
                                style: lightTextStyle.copyWith(
                                    color: textSubTitle, fontSize: 16.0.sp),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 36.0.w),
                        InkWell(
                          onTap: () {
                            controller.isClientSelected(false);
                          },
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                  !controller.isClientSelected.value
                                      ? "assets/icon/radio_selected.svg"
                                      : "assets/icon/radio_un_selected.svg",
                                  height: 25.0.h,
                                  width: 25.0.w),
                              SizedBox(width: 14.0.w),
                              Text(
                                LangKeys.serviceProvider.tr,
                                style: lightTextStyle.copyWith(
                                    color: textSubTitle, fontSize: 16.0.sp),
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
                SizedBox(height: 30.0.h),
                Form(
                  autovalidateMode: AutovalidateMode.always,
                  key: _formKey,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          LangKeys.username.tr,
                          style: mediumTextStyle.copyWith(
                              color: textSubTitle, fontSize: 14.0.sp),
                        ),
                        SizedBox(height: 4.0.h),
                        TextFormField(
                            controller: controller.userName,
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                return LangKeys.enterUsername.tr;
                              }
                              return null;
                            },
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 16.0.w),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0.r),
                                  borderSide: BorderSide(
                                      width: 1.0.w, color: grey), //<-- SEE HERE
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0.r),
                                  borderSide: BorderSide(
                                      width: 1.0.w, color: grey), //<-- SEE HERE
                                ))),
                        SizedBox(height: 14.0.h),
                        Text(
                          LangKeys.fullName.tr,
                          style: mediumTextStyle.copyWith(
                              color: textSubTitle, fontSize: 14.0.sp),
                        ),
                        SizedBox(height: 4.0.h),
                        TextFormField(
                            controller: controller.fullName,
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                return LangKeys.enterFullName.tr;
                              }
                              return null;
                            },
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 16.0.w),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0.r),
                                  borderSide: BorderSide(
                                      width: 1.0.w, color: grey), //<-- SEE HERE
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0.r),
                                  borderSide: BorderSide(
                                      width: 1.0.w, color: grey), //<-- SEE HERE
                                ))),
                        SizedBox(height: 14.0.h),
                        Text(
                          LangKeys.email.tr,
                          style: mediumTextStyle.copyWith(
                              color: textSubTitle, fontSize: 14.0.sp),
                        ),
                        SizedBox(height: 4.0.h),
                        TextFormField(
                            controller: controller.email,
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                return LangKeys.enterEmail.tr;
                              }
                              if (!GetUtils.isEmail(value)) {
                                return LangKeys.emailNotValid.tr;
                              }
                              return null;
                            },
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 16.0.w),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0.r),
                                  borderSide: BorderSide(
                                      width: 1.0.w, color: grey), //<-- SEE HERE
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0.r),
                                  borderSide: BorderSide(
                                      width: 1.0.w, color: grey), //<-- SEE HERE
                                ))),
                        SizedBox(height: 14.0.h),
                        Text(
                          LangKeys.mobileNumber.tr,
                          style: mediumTextStyle.copyWith(
                              color: textSubTitle, fontSize: 14.0.sp),
                        ),
                        SizedBox(height: 4.0.h),
                        Container(
                          height: 50.h,
                          decoration: BoxDecoration(
                              border: Border.all(width: 1.0.w, color: grey),
                              borderRadius: BorderRadius.circular(10.0.r)),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: TextFormField(
                                  controller: controller.mobile,
                                  textDirection: TextDirection.ltr,
                                  keyboardType: TextInputType.phone,
                                  validator: (value) {
                                    if (value!.trim().isEmpty) {
                                      return LangKeys.enterMobileNumber.tr;
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      hintText: "",
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 10.0.w),
                                      border: InputBorder.none),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  showCountryPicker(
                                    context: context,
                                    //Optional.  Can be used to exclude(remove) one ore more country from the countries list (optional).
                                    // exclude: <String>['sa', 'ey'],
                                    favorite: <String>['sa', 'eg'],
                                    countryFilter: <String>['sa', 'eg'],

                                    //Optional. Shows phone code before the country name.
                                    showPhoneCode: true,
                                    searchAutofocus: false,
                                    onSelect: (Country country) {
                                      controller.phoneCode(country.phoneCode);
                                      controller
                                          .countryCode(country.countryCode);
                                      print(
                                          'Select country: ${country.countryCode}');
                                      print(
                                          'Select phoneCode: ${country.displayNameNoCountryCode}');
                                    },
                                    // Optional. Sets the theme for the country list picker.
                                    countryListTheme: CountryListThemeData(
                                      // Optional. Sets the border radius for the bottomsheet.
                                      bottomSheetHeight:
                                          ScreenUtil().screenHeight / 2,

                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10.0.r),
                                        topRight: Radius.circular(10.0.r),
                                      ),
                                      // Optional. Styles the search field.
                                      inputDecoration: InputDecoration(
                                        labelText: 'بحث',
                                        hintText: 'ابدأ الكتابة للبحث',
                                        prefixIcon: const Icon(Icons.search),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: primary.withOpacity(0.2),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                child: Row(
                                  children: [
                                    Obx(() => Text(
                                        "+${controller.phoneCode.value}",
                                        textDirection: TextDirection.ltr,
                                        style: mediumTextStyle.copyWith(
                                            color: Colors.black,
                                            fontSize: 16.0.sp))),
                                    const Icon(Icons.keyboard_arrow_down),
                                  ],
                                ),
                              ),
                              SizedBox(width: 12.0.w)
                            ],
                          ),
                        ),
                        // TextFormField(
                        //     validator: (value) {
                        //       if (value!.trim().isEmpty) {
                        //         return LangKeys.enterMobileNumber.tr;
                        //       }
                        //       return null;
                        //     },
                        //     keyboardType: TextInputType.phone,
                        //     decoration: InputDecoration(
                        //       contentPadding:
                        //           EdgeInsets.symmetric(horizontal: 10.0.w),
                        //       enabledBorder: OutlineInputBorder(
                        //         borderRadius: BorderRadius.circular(10.0.r),
                        //         borderSide: BorderSide(
                        //             width: 1.0.w, color: grey), //<-- SEE HERE
                        //       ),
                        //       border: OutlineInputBorder(
                        //         borderRadius: BorderRadius.circular(10.0.r),
                        //         borderSide: BorderSide(
                        //             width: 1.0.w,
                        //             color: Colors.grey), //<-- SEE HERE
                        //       ), //<-- SEE HERE
                        //     )),
                        SizedBox(height: 14.0.h),
                        Text(
                          LangKeys.password.tr,
                          style: mediumTextStyle.copyWith(
                              color: textSubTitle, fontSize: 14.0.sp),
                        ),
                        SizedBox(height: 4.0.h),
                        TextFormField(
                            controller: controller.password,
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                return LangKeys.enterPassword.tr;
                              }
                              return null;
                            },
                            obscureText: true,
                            obscuringCharacter: "*",
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10.0.w),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0.r),
                                borderSide: BorderSide(
                                    width: 1.0.w, color: grey), //<-- SEE HERE
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0.r),
                                borderSide: BorderSide(
                                    width: 1.0.w,
                                    color: Colors.grey), //<-- SEE HERE
                              ), //<-- SEE HERE
                            )),
                        SizedBox(height: 25.0.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              LangKeys.termsConditionsPrivacy.tr,
                              style: lightTextStyle.copyWith(
                                  color: primary,
                                  fontSize: 15.0.sp,
                                  decoration: TextDecoration.underline),
                            ),
                            SizedBox(
                              width: 25.0.w,
                              height: 25.0.h,
                              child: Obx(() => Checkbox(
                                    value: controller.isTermsChecked.value,
                                    onChanged: (value) {
                                      controller.isTermsChecked(value);
                                    },
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(5.0.r),
                                    ),
                                    side: BorderSide(
                                      // ======> CHANGE THE BORDER COLOR HERE <======
                                      color: grey1,
                                      // Give your checkbox border a custom width
                                      width: 1.0.w,
                                    ),
                                  )),
                            ),
                          ],
                        ),
                        SizedBox(height: 40.0.h),
                        MyElevatedButton(
                            width: ScreenUtil().screenWidth,
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                bool? isValid =
                                    await controller.isMobileValid();
                                if (!isValid!) {
                                  Get.snackbar(LangKeys.error.tr,
                                      LangKeys.mobileNumberInvalid.tr);
                                  return;
                                }
                                if (controller.isTermsChecked.isFalse) {
                                  Get.snackbar(LangKeys.error.tr,
                                      LangKeys.termsConditionsPrivacy.tr);
                                  return;
                                }
                                if (controller.isClientSelected.isFalse) {
                                  Get.toNamed(AppRoutes.serviceList);
                                } else {
                                  controller.signup();
                                }
                              }
                            },
                            height: 48.0.h,
                            borderRadius: BorderRadius.circular(10.0.r),
                            child: Obx(
                              () => Text(
                                  controller.isClientSelected.isTrue
                                      ? LangKeys.signUp.tr
                                      : LangKeys.next.tr,
                                  style: heavyTextStyle.copyWith(
                                      fontSize: 16.0.sp, color: Colors.white)),
                            )),
                        SizedBox(height: 20.0.h),
                      ]),
                )
              ],
            ),
          ),
        ));
  }
}
