import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ptoolz/controller/offers_page_controller.dart';
import 'package:ptoolz/themes/app_colors.dart';
import 'package:ptoolz/themes/text_styles.dart';
import 'package:ptoolz/translations/lang_keys.dart';

class OffersPage extends StatefulWidget {
  OffersPage({Key? key}) : super(key: key);

  @override
  State<OffersPage> createState() => _OffersPageState();
}

class _OffersPageState extends State<OffersPage>
    with SingleTickerProviderStateMixin {
  OffersPageController controller = Get.put(OffersPageController());

  @override
  void initState() {
    controller.tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              height: 56.0.h,
              decoration: const BoxDecoration(
                color: primary,
              ),
              child: TabBar(
                controller: controller.tabController,
                indicator: const BoxDecoration(
                  color: tabBarSelected,
                ),
                labelColor: Colors.white,
                labelStyle: heavyTextStyle.copyWith(fontSize: 17.0.sp),
                unselectedLabelColor: Colors.white,
                tabs: [
                  Tab(
                    text: LangKeys.pending.tr,
                  ),
                  Tab(
                    text: LangKeys.active.tr,
                  ),
                  Tab(
                    text: LangKeys.complete.tr,
                  ),
                ],
              ),
            ),
            // tab bar view here
            Expanded(
              child: TabBarView(
                controller: controller.tabController,
                children: controller.screens,
              ),
            ),
          ],
        ));
  }
}
