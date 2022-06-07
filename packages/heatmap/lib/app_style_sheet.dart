import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class APPStyleSheet {
  static double get pageHorizontalMargin => 17;
  static double get cardHorizontalPadding => 15;
  static TextStyle get myAppBarTextStyle =>
      TextStyle(color: Colors.white, fontSize: 26.sp, fontWeight: FontWeight.bold, fontFamily: "Bariol");
  // static TextStyle get myAppBarSubtitleTextStyle =>
  //     TextStyle(color: themeColors['default']!.selectAppsSubTitleText, fontSize: 14.sp, fontWeight: FontWeight.bold, fontFamily: "Bariol");

  static TextStyle get buttonTextStyle =>
      TextStyle(color: Colors.white, fontSize: 24.sp, fontWeight: FontWeight.bold, fontFamily: "Bariol");
  static Size get buttonSize => Size(362.w, 70.h);

  static TextStyle get locationFilterGroupTitleTextStyle =>
      TextStyle(color: Colors.white, fontSize: 19.sp, fontWeight: FontWeight.bold, fontFamily: "Bariol");
  static TextStyle get locationFilterTileTitleTextStyle =>
      TextStyle(color: Colors.black, fontSize: 17.sp, fontWeight: FontWeight.w500, fontFamily: "Bariol");
}
