import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ptoolz/themes/app_colors.dart';
import 'package:ptoolz/themes/text_styles.dart';

import '../controller/home_controller.dart';
import '../translations/lang_keys.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Ptoolz",
              style: blackTextStyle.copyWith(
                  fontSize: 20.0.sp, color: Colors.black)),
          centerTitle: true,
          actions: [
            TextButton(
                onPressed: () {},
                child: Text("\$ 122",
                    style: blackTextStyle.copyWith(
                        fontSize: 17.0.sp, color: textCurrency)))
          ]),
      drawer: Drawer(),
      backgroundColor: Colors.white,
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            type: BottomNavigationBarType.shifting,
            selectedLabelStyle: heavyTextStyle.copyWith(fontSize: 12.0.sp),
            currentIndex: controller.currentIndex.value,
            onTap: (index) {
              controller.currentIndex.value = index;
            },
            selectedItemColor: primary,
            unselectedItemColor: Colors.black,
            items: [
              BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(
                  "assets/icon/home_nav.svg",
                  width: 24.0.w,
                  height: 24.0.h,
                  color: primary,
                ),
                icon: SvgPicture.asset(
                  "assets/icon/home_nav.svg",
                  width: 24.0.w,
                  height: 24.0.h,
                  color: Colors.black,
                ),
                label: LangKeys.home.tr,
              ),
              BottomNavigationBarItem(
                  activeIcon: SvgPicture.asset(
                    "assets/icon/offers_nav.svg",
                    width: 24.0.w,
                    height: 24.0.h,
                    color: primary,
                  ),
                  icon: SvgPicture.asset(
                    "assets/icon/offers_nav.svg",
                    width: 24.0.w,
                    height: 24.0.h,
                    color: Colors.black,
                  ),
                  label: LangKeys.offers.tr),
              BottomNavigationBarItem(
                  activeIcon: SvgPicture.asset(
                    "assets/icon/orders_nav.svg",
                    width: 24.0.w,
                    height: 24.0.h,
                    color: primary,
                  ),
                  icon: SvgPicture.asset(
                    "assets/icon/orders_nav.svg",
                    width: 24.0.w,
                    height: 24.0.h,
                    color: Colors.black,
                  ),
                  label: LangKeys.myOrders.tr),
              BottomNavigationBarItem(
                  activeIcon: SvgPicture.asset(
                    "assets/icon/notifications_nav.svg",
                    width: 24.0.w,
                    height: 24.0.h,
                    color: primary,
                  ),
                  icon: SvgPicture.asset(
                    "assets/icon/notifications_nav.svg",
                    width: 24.0.w,
                    height: 24.0.h,
                    color: Colors.black,
                  ),
                  label: LangKeys.notifications.tr),
            ],
          )
          ),
      body: Obx(() => controller.screens[controller.currentIndex.value]),
    );
  }
}
