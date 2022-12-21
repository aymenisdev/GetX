import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ptoolz/model/service.dart';
import 'package:ptoolz/themes/app_colors.dart';

import '../themes/text_styles.dart';

class ServiceHomeItem extends StatelessWidget {
  final Service data;
  final VoidCallback onTap;

  const ServiceHomeItem({
    Key? key,
    required this.data,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: grey2, width: 0.5.w),
            borderRadius: BorderRadius.all(Radius.circular(10.0.r))),
        child: Column(
          children: [
            SvgPicture.asset(
              data.icon ?? "", width: 110.0.w,
              height: 110.0.h,
            ),
            SizedBox(height: 5.0.h),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 5.0.w),
              child: Text(
                data.name ?? "",
                style: heavyTextStyle.copyWith(
                    color: Colors.black, fontSize: 15.0.sp, overflow: TextOverflow.ellipsis,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

