import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ptoolz/controller/offers_page_controller.dart';
import 'package:ptoolz/themes/app_colors.dart';
import 'package:ptoolz/themes/text_styles.dart';
import 'package:ptoolz/translations/lang_keys.dart';

import '../controller/orders_page_controller.dart';

class OrdersPage extends StatefulWidget {
  OrdersPage({Key? key}) : super(key: key);

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage>
    with SingleTickerProviderStateMixin {
  OrdersPageController controller = Get.put(OrdersPageController());

  @override
  void initState() {
    controller.tabController = TabController(length: 2, vsync: this);
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
                    text: LangKeys.postedOrders.tr,
                  ),
                  Tab(
                    text: LangKeys.completedOrders.tr,
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
