import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ptoolz/controller/service_list_controller.dart';
import 'package:ptoolz/view/loading_view.dart';
import 'package:ptoolz/widget/service_item.dart';

import '../components/my_elevated_button.dart';
import '../controller/sign_up_controller.dart';
import '../themes/text_styles.dart';
import '../translations/lang_keys.dart';

class ServiceList extends StatelessWidget {
  ServiceList({Key? key}) : super(key: key);
  final controller = Get.find<SignUpController>();

  @override
  Widget build(BuildContext context) {
    controller.indexSelected = -1;
    controller.getCategory();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 35.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.0.h),
            Text(
              LangKeys.chooseServiceCategories.tr,
              style: heavyTextStyle.copyWith(
                  color: Colors.black, fontSize: 18.0.sp),
            ),
            SizedBox(height: 24.0.h),
            Expanded(
              flex: 1,
              child: Obx(() => !controller.isLoading.value
                  ? GetBuilder<SignUpController>(
                      id: "selectedService",
                      builder: (controller) {
                        return ListView.builder(
                            itemCount: controller.categoryList.length,
                            itemBuilder: (context, index) {
                              return ServiceItem(
                                data: controller.categoryList[index],
                                isChecked: controller.indexSelected == index,
                                onTap: () {
                                  controller.indexSelected = index;
                                  controller.update(['selectedService']);
                                },
                              );
                            });
                      })
                  : const Center(
                      child: LoadingView(),
                    )),
            ),
            SizedBox(height: 20.0.h),
            MyElevatedButton(
              width: ScreenUtil().screenWidth,
              onPressed: () {
                if (controller.indexSelected == -1) {
                  Get.snackbar(
                      LangKeys.error.tr, LangKeys.chooseServiceCategories.tr);
                  return;
                }
                controller.signup();
              },
              height: 48.0.h,
              borderRadius: BorderRadius.circular(10.0.r),
              child: Text(LangKeys.signUp.tr,
                  style: heavyTextStyle.copyWith(
                      fontSize: 16.0.sp, color: Colors.white)),
            ),
            SizedBox(height: 20.0.h),
          ],
        ),
      ),
    );
  }
}
