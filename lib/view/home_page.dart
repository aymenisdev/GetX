import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controller/home_page_controller.dart';
import '../widget/service_home_item.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  HomePageController controller = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 13.0.h),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 2 / 1.85,
                crossAxisSpacing: 21.0.w,
                mainAxisSpacing: 10.0.h,
                crossAxisCount: 2),
            itemCount: controller.dataList.length,
            itemBuilder: (BuildContext ctx, index) {
              return ServiceHomeItem(
                  data: controller.dataList[index], onTap: () {});
            }),
      ),
    );
  }
}
