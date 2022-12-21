import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widget/offer_item.dart';
import '../widget/order_item.dart';

class Orders extends StatelessWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 21.0.w,vertical: 16.0.h),
          child: Column(
            children: [
              Text("sss"),
              ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return OrderItem(
                      onTap: () {},
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
