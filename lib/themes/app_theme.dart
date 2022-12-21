import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ptoolz/themes/text_styles.dart';

import 'app_colors.dart';

var lightTheme =  ThemeData(
    fontFamily: "AvenirLight",
    backgroundColor:Colors.white,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: primary,
    appBarTheme: AppBarTheme(
        iconTheme: const IconThemeData(color: Colors.black),
        systemOverlayStyle: const SystemUiOverlayStyle(
          // Status bar color
          statusBarColor: Colors.white,
          // Status bar brightness (optional)
          statusBarIconBrightness: Brightness.dark,
          // For Android (dark icons)
          statusBarBrightness:
          Brightness.dark, // For iOS (dark icons)
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: false,
        titleSpacing: 0.0,
        titleTextStyle: lightTextStyle.copyWith(color: primary,
            fontSize: 15.0.sp)));