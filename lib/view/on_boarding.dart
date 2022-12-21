import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:ptoolz/controller/on_boarding_controller.dart';
import 'package:ptoolz/themes/text_styles.dart';

import '../routes/app_routes.dart';
import '../services/storage_service.dart';
import '../themes/app_colors.dart';
import 'loading_view.dart';

class OnBoarding extends StatelessWidget {
  OnBoarding({Key? key}) : super(key: key);
  final storage = Get.find<StorageService>();
  OnBoardingController controller = Get.put(OnBoardingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Obx(() => !controller.isLoading.value
              ? IntroductionScreen(
                  pages: controller.onBoardList,
                  showSkipButton: true,
                  back: Text("السابق",
                      style: heavyTextStyle.copyWith(color: darkGrey,fontSize: 16.0.sp)),
                  skip: Text("تخطي",
                      style: heavyTextStyle.copyWith(color: bodyIntroText,fontSize: 16.0.sp)),
                  done: Text("بداية",
                      style: heavyTextStyle.copyWith(color: primary,fontSize: 16.0.sp)),
                  onDone: () {
                    storage.setIntro(true);
                    Get.offAllNamed(AppRoutes.signIn);
                  },
                  baseBtnStyle: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                  dotsDecorator: DotsDecorator(
                      size: Size.square(5.0.r),
                      activeSize: Size(10.0.w, 10.0.h),
                      activeColor: primary,
                      color: Colors.black26,
                      spacing:  EdgeInsets.symmetric(horizontal: 3.0.w),
                      activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0.r))),
                  showNextButton: true,
                  showDoneButton: true,
                  showBackButton: false,
                  globalBackgroundColor: Colors.white,
                  next: Text(
                    "التالي",
                    style: heavyTextStyle.copyWith(color: primary),
                  ),
                  skipStyle: TextButton.styleFrom(primary: Colors.red),
                  onSkip: () {
                    storage.setIntro(true);
                    Get.offAllNamed(AppRoutes.signIn);
                  },
                )
              : const Center(child: LoadingView()))),
    );
  }
}
