import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widget/notification_item.dart';
import '../widget/offer_item.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 21.0.w,vertical: 16.0.h),
        child: ListView.builder(
            clipBehavior: Clip.none,
            itemCount: 20,
            itemBuilder: (context, index) {
              return NotificationItem(
                onTap: () {},
              );
            }),
      ),
    );
  }
}
