import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ptoolz/model/category/category.dart';
import 'package:ptoolz/themes/app_colors.dart';

import '../themes/text_styles.dart';
import '../utils/constants.dart';

class ServiceItem extends StatelessWidget {
  final Category data;
  final bool isChecked;
  final VoidCallback onTap;

  const ServiceItem({
    Key? key,
    required this.data,
    this.isChecked = true,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            width: ScreenUtil().screenWidth,
            padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 10.0.h),
            decoration: BoxDecoration(
                border: Border.all(
                    color: isChecked ? primary : grey1,
                    width: isChecked ? 1.5.w : 1.0.w),
                borderRadius: BorderRadius.all(Radius.circular(10.0.r))),
            child: Stack(children: [
              SvgPicture.asset(
                  isChecked
                      ? "assets/icon/radio_selected.svg"
                      : "assets/icon/radio_un_selected.svg",
                  height: 20.0.h,
                  width: 20.0.w),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    data.departmentName ?? "",
                    style: heavyTextStyle.copyWith(
                        color: Colors.black, fontSize: 18.0.sp),
                  ),
                  SizedBox(width: 20.0.w),
                  SizedBox(
                    width: 42.0.w,height: 42.0.h,
                    child: Image.network(
                      "${Constants.imageUrl}${data.departmentIcon ?? ""}",

                    ),
                  )
                  // SvgPicture.asset(
                  //   data.departmentIcon ?? "",
                  //   width: 42.0.w,
                  //   height: 42.0.h,
                  // )
                ],
              )
            ]),
          ),
        ),
        SizedBox(height: 10.0.h)
      ],
    );
  }
}

class Contsants {}
