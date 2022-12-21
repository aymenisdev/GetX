import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../themes/app_colors.dart';
import '../themes/text_styles.dart';

class OnBoardingController extends GetxController {
  var onBoardList = <PageViewModel>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    introList();
    super.onInit();
  }

  void introList() {
    onBoardList.add(PageViewModel(
      titleWidget: Text(
        "طباعه",
        style: heavyTextStyle.copyWith(color: Colors.black, fontSize: 24.0.sp),
      ),
      bodyWidget: Center(
          child: Text(
        "أرسل طلبك مجاناً واحصل على أفضل عرض للطباعة في أسرع وقت",
        style:
            mediumTextStyle.copyWith(color: bodyIntroText, fontSize: 16.0.sp),
        textAlign: TextAlign.center,
      )),
      image: SvgPicture.asset("assets/images/intro_printing.svg"),
    ));
    onBoardList.add(PageViewModel(
      titleWidget: Text(
        "مونتاج",
        style: heavyTextStyle.copyWith(color: Colors.black, fontSize: 24.0.sp),
      ),
      bodyWidget: Center(
          child: Text(
        "قدم طلبك مجاناً واحصل على افضل عرض لخدمات المونتاج والدبلجة الاحترافية",
        style:
            mediumTextStyle.copyWith(color: bodyIntroText, fontSize: 16.0.sp),
        textAlign: TextAlign.center,
      )),
      image: SvgPicture.asset("assets/images/intro_produced.svg"),
    ));
    onBoardList.add(PageViewModel(
      titleWidget: Text(
        "تصوير",
        style: heavyTextStyle.copyWith(color: Colors.black, fontSize: 24.0.sp),
      ),
      bodyWidget: Center(
          child: Text(
        "احجز مصورك الخاص لأحداثك الشخصية وقتما تشاء",
        style:
            mediumTextStyle.copyWith(color: bodyIntroText, fontSize: 16.0.sp),
        textAlign: TextAlign.center,
      )),
      image: SvgPicture.asset("assets/images/intro_photo.svg"),
    ));
    onBoardList.add(PageViewModel(
      titleWidget: Text(
        "تاجير كاميرات",
        style: heavyTextStyle.copyWith(color: Colors.black, fontSize: 24.0.sp),
      ),
      bodyWidget: Center(
          child: Text(
        "نوفر لك تأجير جميع انواع الكاميرات وملحقاتها لجلسات التصوير الخاصة بك",
        style:
            mediumTextStyle.copyWith(color: bodyIntroText, fontSize: 16.0.sp),
        textAlign: TextAlign.center,
      )),
      image: SvgPicture.asset("assets/images/intro_camera_rental.svg"),
    ));
    onBoardList.add(PageViewModel(
      titleWidget: Text(
        "الترجمة",
        style: heavyTextStyle.copyWith(color: Colors.black, fontSize: 24.0.sp),
      ),
      bodyWidget: Center(
          child: Text(
        "احصل على ترجمة معتمدة لجميع اللغات",
        style:
            mediumTextStyle.copyWith(color: bodyIntroText, fontSize: 16.0.sp),
        textAlign: TextAlign.center,
      )),
      image: SvgPicture.asset("assets/images/intro_translation.svg"),
    ));
    onBoardList.add(PageViewModel(
      titleWidget: Text(
        "هدايا",
        style: heavyTextStyle.copyWith(color: Colors.black, fontSize: 24.0.sp),
      ),
      bodyWidget: Center(
          child: Text(
        "صمم هدية وقدمها لمن تريد في أسرع وقت ممكن",
        style:
            mediumTextStyle.copyWith(color: bodyIntroText, fontSize: 16.0.sp),
        textAlign: TextAlign.center,
      )),
      image: SvgPicture.asset("assets/images/intro_gifts.svg"),
    ));
    onBoardList.add(PageViewModel(
      titleWidget: Text(
        "الخدمات الدراسية",
        style: heavyTextStyle.copyWith(color: Colors.black, fontSize: 24.0.sp),
      ),
      bodyWidget: Center(
          child: Text(
        "توفر المناهج و المحاضرات المخصصة لطلاب المدارس و الجامعات ك نسخ برمجية ٱو مرفقة بطلب طباعة",
        style:
            mediumTextStyle.copyWith(color: bodyIntroText, fontSize: 16.0.sp),
        textAlign: TextAlign.center,
      )),
      image: SvgPicture.asset("assets/images/intro_study_services.svg"),
    ));
    onBoardList.add(PageViewModel(
      titleWidget: Text(
        "الشركات و المؤسسات",
        style: heavyTextStyle.copyWith(color: Colors.black, fontSize: 24.0.sp),
      ),
      bodyWidget: Center(
          child: Text(
        "توفر لك خدمات تصميم الهوية الالكترونية و الخدمات المستندية المتعلقة بالهوية الالكترونية , بالإضافة  إلى خدمة إعداد التقارير السنوية",
        style:
            mediumTextStyle.copyWith(color: bodyIntroText, fontSize: 16.0.sp),
        textAlign: TextAlign.center,
      )),
      image: SvgPicture.asset("assets/images/intro_companies.svg"),
    ));
  }
}
