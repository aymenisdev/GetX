import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ptoolz/themes/app_colors.dart';

import '../themes/text_styles.dart';

class NotificationItem extends StatelessWidget {
  // final Service data;
  final VoidCallback onTap;

  const NotificationItem({
    Key? key,
    // required this.data,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: AlignmentDirectional.topStart,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10.0.h),
            decoration: BoxDecoration(
                border: Border.all(color: grey2, width: 0.5.w),
                borderRadius: BorderRadius.all(Radius.circular(10.0.r))),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 16.0.w, vertical: 10.0.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("طلب جديد",
                              style: heavyTextStyle.copyWith(
                                color: Colors.black,
                                fontSize: 14.0.sp,
                              )),
                          Text("1 د",
                              style: mediumTextStyle.copyWith(
                                color: timeNotification,
                                fontSize: 13.0.sp,
                              )),
                        ],
                      ),
                      SizedBox(height: 10.0.h),
                      Text(
                        "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق.",
                        style: mediumTextStyle.copyWith(
                          color: Colors.black,
                          fontSize: 14.0.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          PositionedDirectional(
            top: -7.0.h,
            start: -5.0.w,
            child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 10.0.r,
                child: SvgPicture.asset("assets/icon/ic_dot_notification.svg",
                    width: 10.0.w, height: 10.0.h)),
          )
        ],
      ),
    );
  }
}
