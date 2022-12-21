import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ptoolz/controller/sign_in_controller.dart';
import 'package:ptoolz/themes/app_colors.dart';
import 'package:ptoolz/themes/text_styles.dart';
import 'package:ptoolz/translations/lang_keys.dart';

import '../components/my_elevated_button.dart';
import '../routes/app_routes.dart';
import '../utils/inpu_validation_mixin.dart';

class SignIn extends StatelessWidget with InputValidationMixin{
  SignIn({Key? key}) : super(key: key);
  SignInController controller = Get.put(SignInController());
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/icon/logo_name_sn.png",
                        width: 83.0.w, height: 56.0.h),
                    SizedBox(width: 10.0.w),
                    Image.asset("assets/icon/logo_sn.png",
                        width: 68.0.w, height: 68.0.h),
                  ],
                ),
                SizedBox(height: 45.0.h),
                Text(
                  LangKeys.signInNow.tr,
                  style: heavyTextStyle.copyWith(
                      color: Colors.black, fontSize: 20.0.sp),
                ),
                SizedBox(height: 7.0.h),
                Text(
                  LangKeys.pleaseEnterTheDetailsBelowToContinue.tr,
                  style: lightTextStyle.copyWith(
                      color: textSubTitle, fontSize: 16.0.sp),
                ),
                SizedBox(height: 34.0.h),
                Obx(() =>
                 Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            controller.isMobileSelected(true);
                          },
                          child: Row(
                            children: [
                              SvgPicture.asset(controller.isMobileSelected.value
                                  ? "assets/icon/radio_selected.svg"
                                  : "assets/icon/radio_un_selected.svg",height: 25.0.h,width: 25.0.w),
                              SizedBox(width: 14.0.w),
                              Text(
                                LangKeys.mobile.tr,
                                style: lightTextStyle.copyWith(
                                    color: textSubTitle, fontSize: 16.0.sp),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 36.0.w),
                        InkWell(
                          onTap: () {
                            controller.isMobileSelected(false);
                          },
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                  !controller.isMobileSelected.value
                                      ? "assets/icon/radio_selected.svg"
                                      : "assets/icon/radio_un_selected.svg",height: 25.0.h,width: 25.0.w),
                              SizedBox(width: 14.0.w),
                              Text(
                                LangKeys.email.tr,
                                style: lightTextStyle.copyWith(
                                    color: textSubTitle, fontSize: 16.0.sp),
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
                SizedBox(height: 34.0.h),
                Form(
                  autovalidateMode: AutovalidateMode.always,
                  key: _formKey,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                         LangKeys.usernameOrEmail.tr,
                          style: mediumTextStyle.copyWith(
                              color: textSubTitle, fontSize: 14.0.sp),
                        ),
                        SizedBox(height: 4.0.h),
                        TextFormField(
                          controller: controller.userName,
                          validator: (value){
                            if(value!.trim().isEmpty){
                              return LangKeys.enterUsernameOrEmail.tr;
                            }
                            return null;
                          },
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
                          LangKeys.password.tr,
                          style: mediumTextStyle.copyWith(
                              color: textSubTitle, fontSize: 14.0.sp),
                        ),
                        SizedBox(height: 4.0.h),
                        TextFormField(
                            controller: controller.password,
                            validator: (value) {
                              if(value!.trim().isEmpty){
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
                        Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                              onPressed: () {},
                              child: Text(
                              LangKeys.forgotPassword.tr,
                                style: lightTextStyle.copyWith(
                                    color: primary,
                                    fontSize: 16.0.sp,
                                    decoration: TextDecoration.underline),
                              )),
                        ),
                        SizedBox(height: 40.0.h),
                        MyElevatedButton(
                          width: ScreenUtil().screenWidth,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              controller.login();
                            }
                          },
                          height: 48.0.h,
                          borderRadius: BorderRadius.circular(10.0.r),
                          child: Text(LangKeys.signIn.tr,
                              style: heavyTextStyle.copyWith(
                                  fontSize: 16.0.sp, color: Colors.white)),
                        ),
                        SizedBox(height: 50.0.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              LangKeys.doNotHaveAnAccount.tr,
                              style: mediumTextStyle.copyWith(
                                  color: textSubTitle, fontSize: 16.0.sp),
                            ),
                            TextButton(
                                onPressed: () {
                                  Get.toNamed(AppRoutes.signUp);
                                },
                                child: Text(
                                  LangKeys.subscription.tr,
                                  style: mediumTextStyle.copyWith(
                                      color: textRadioBtn,
                                      fontSize: 16.0.sp,
                                      decoration: TextDecoration.underline),
                                ))
                          ],
                        )
                      ]),
                )
              ],
            ),
          ),
        ));
  }
}
