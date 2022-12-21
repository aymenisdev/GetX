import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ptoolz/themes/app_colors.dart';

import '../themes/text_styles.dart';

class OrderItem extends StatelessWidget {
  // final Service data;
  final VoidCallback onTap;

  const OrderItem({
    Key? key,
    // required this.data,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 10.0.h),
        decoration: BoxDecoration(
            border: Border.all(color: grey2, width: 0.5.w),
            borderRadius: BorderRadius.all(Radius.circular(10.0.r))),
        child: Column(
          children: [
            IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 14.0.h),
                      child: Text(
                        "هدايا",
                        textAlign: TextAlign.center,
                        style: heavyTextStyle.copyWith(
                          color: Colors.black,
                          fontSize: 16.0.sp,
                        ),
                      ),
                    ),
                  ),
                  VerticalDivider(
                    width: 0.5.w,
                    color: grey2,
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                              onTap: () {},
                              child: SvgPicture.asset("assets/icon/ic_edit.svg",
                                  width: 20.0.w, height: 20.0.h)),
                          VerticalDivider(
                            width: 0.5.w,
                            color: grey2,
                          ),
                          InkWell(
                            onTap: () {},
                            child: SvgPicture.asset("assets/icon/ic_trash.svg",
                                width: 20.0.w, height: 20.0.h),
                          ),
                        ]),
                  ),
                ],
              ),
            ),
            Divider(
              color: grey2,
              height: 1.0.h,
              thickness: 0.5.h,
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 10.0.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("هدية عيد ميلاد",
                      style: heavyTextStyle.copyWith(
                        color: Colors.black,
                        fontSize: 14.0.sp,
                      )),
                  SizedBox(height: 10.0.h),
                  Text(
                    "بحاجة الى هدية عيد ميلاد مناسبة لابنتي الصغيرة",
                    style: mediumTextStyle.copyWith(
                      color: Colors.black,
                      fontSize: 14.0.sp,
                    ),
                  ),
                  SizedBox(height: 8.0.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "رقم الطلب: ",
                            style: mediumTextStyle.copyWith(
                              color: Colors.black,
                              fontSize: 14.0.sp,
                            ),
                          ),
                          Text(
                            "122",
                            style: mediumTextStyle.copyWith(
                              color: Colors.black,
                              fontSize: 14.0.sp,
                            ),
                          )
                        ],
                      ),
                      Text(
                        "02:00 pm",
                        style: mediumTextStyle.copyWith(
                          color: Colors.black,
                          fontSize: 13.0.sp,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
