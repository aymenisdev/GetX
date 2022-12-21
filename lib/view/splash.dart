import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ptoolz/controller/splash_controller.dart';

class Splash extends StatelessWidget {
  Splash({Key? key}) : super(key: key);
  SplashController controller = Get.put(SplashController());
  //  SplashController controller1 = Get.find<SplashController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        height: ScreenUtil().screenHeight,
        width: ScreenUtil().screenWidth,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 255, 30, 218).withOpacity(1),
            Color.fromARGB(255, 46, 13, 38).withOpacity(1)
          ],
        )),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/icon/logo_name_sp.png",
                      width: 111.0.w, height: 74.0.h),
                  SizedBox(width: 10.0.w),
                  Image.asset("assets/icon/logo_sp.png",
                      width: 90.0.w, height: 90.0.h),
                ],
              ),
            ),
            Text(
              "V.2",
              style: TextStyle(color: Colors.white, fontSize: 14.0.sp),
            ),
            SizedBox(height: 46.w),
          ],
        ),
      ),
    );
  }
}
