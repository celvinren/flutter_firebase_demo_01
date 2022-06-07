import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final Map<String, CustomizedTheme> themeColors = {
  "default": CustomizedTheme(
    mobileAppViewCircularProgressIndicatorColor: const Color(0xff19c7c1),
    appbarColor: const Color(0xff3e3e3e),
    startUpPageBG: Colors.blue,
    loginPageBG: const Color(0xff007BFF),
    loginPageGetSart: const Color(0xFFE6E6E6),
    loginPageLogoBorderGlowColor: Colors.white24,
    homePageBG: Colors.black,
    homePagePrimaryText: Colors.white,
    selectAppsSubTitleText: const Color(0xff9E9EA5),
    selectAppsGreenCheck: const Color(0xff51D8AF),
    selectAppsRedCheck: const Color(0xffE52626),
    selectAccountPageDisconnectedTileBGColor: const Color(0xff5b5a61),
    selectAccountPageSelectedTileBGColor: const Color(0xff17C993),
    selectAccountPageDeSelectedTileBGColor: const Color(0xff707070),
    selectAccountPageNextActive: const Color(0xff007BFF),
    selectAccountPageNextInactive: const Color(0xff2C2C2E),
    summaryPageCardBG: const Color(0xff1d1b1d),
    summaryPageGoalCardTitleColor: const Color(0xffF62364),
    summaryPageGoalCardBGColor: const Color(0xff2C2C2E),
    summaryPageGoalCardProgressInactiveColor: const Color(0xff5b5a61),
    summaryPageRevenuesCardColor: const Color(0xfffe5712),
    summaryPageOrdersCardColor: const Color(0xffFD9F10),
    summaryPageAverageValueCardColor: const Color(0xff02caf8),
    summaryPageRevenueDayValueComparisonCardNegativeColor: const Color(0xffff5353),
    summaryPageFeedbackDeviderColor: const Color(0xff3b3b3d),
    breakdownPageBarChartGridLineColor: const Color(0xff4E5052), //const Color(0xff282C31),
    detailViewBackgroundColor: const Color(0xff1D1B1D),
  )
};

class CustomizedTheme {
  Color mobileAppViewCircularProgressIndicatorColor;
  Color appbarColor;
  Color startUpPageBG;
  Color loginPageBG;
  Color loginPageGetSart;
  Color loginPageLogoBorderGlowColor;
  Color homePageBG;
  Color homePagePrimaryText;
  Color selectAppsSubTitleText;
  Color selectAppsGreenCheck;
  Color selectAppsRedCheck;
  Color selectAccountPageDisconnectedTileBGColor;
  Color selectAccountPageSelectedTileBGColor;
  Color selectAccountPageDeSelectedTileBGColor;
  Color selectAccountPageNextActive;
  Color selectAccountPageNextInactive;
  Color summaryPageCardBG;
  Color summaryPageGoalCardTitleColor;
  Color summaryPageRevenuesCardColor;
  Color summaryPageOrdersCardColor;
  Color summaryPageAverageValueCardColor;
  Color summaryPageGoalCardBGColor;
  Color summaryPageGoalCardProgressInactiveColor;
  Color summaryPageRevenueDayValueComparisonCardNegativeColor;
  Color summaryPageFeedbackDeviderColor;
  Color breakdownPageBarChartGridLineColor;
  Color detailViewBackgroundColor;

  CustomizedTheme({
    required this.mobileAppViewCircularProgressIndicatorColor,
    required this.appbarColor,
    required this.startUpPageBG,
    required this.loginPageBG,
    required this.loginPageGetSart,
    required this.loginPageLogoBorderGlowColor,
    required this.homePageBG,
    required this.homePagePrimaryText,
    required this.selectAppsSubTitleText,
    required this.selectAppsGreenCheck,
    required this.selectAppsRedCheck,
    required this.selectAccountPageDisconnectedTileBGColor,
    required this.selectAccountPageSelectedTileBGColor,
    required this.selectAccountPageDeSelectedTileBGColor,
    required this.selectAccountPageNextActive,
    required this.selectAccountPageNextInactive,
    required this.summaryPageCardBG,
    required this.summaryPageGoalCardTitleColor,
    required this.summaryPageRevenuesCardColor,
    required this.summaryPageOrdersCardColor,
    required this.summaryPageAverageValueCardColor,
    required this.summaryPageGoalCardBGColor,
    required this.summaryPageGoalCardProgressInactiveColor,
    required this.summaryPageRevenueDayValueComparisonCardNegativeColor,
    required this.summaryPageFeedbackDeviderColor,
    required this.breakdownPageBarChartGridLineColor,
    required this.detailViewBackgroundColor,
  });
}

// Color mobileAppViewCircularProgressIndicatorColor = Color(0xff19c7c1);
// Color startUpPageBG = Colors.blue;
// Color loginPageBG = Color(0xFF8185E2);
// Color loginPageLogoBorderGlowColor = Colors.white24;

double textLineHeight = 1.5;
double introductionTextSize = 19.sp;
double labelTextSize = 16.sp; //today, yesterday
double settingsTitle = 25.sp; //apps, connected app

class AppThemeData {
  static ThemeData appThemeData() {
    return ThemeData(
      primaryColor: Colors.black,
      backgroundColor: Colors.black,
      fontFamily: "Bariol",
      primaryTextTheme: const TextTheme(),
    );
  }

  static ThemeData loginPageThemeData() {
    //+3
    return ThemeData(
      primaryColor: Colors.black,
      backgroundColor: Colors.black,
      brightness: Brightness.dark,
      fontFamily: "Bariol",
      // accentTextTheme: TextTheme(
      //   caption: TextStyle(color: Colors.white, fontSize: 26.sp, fontWeight: FontWeight.w500),
      // ),
      primaryTextTheme: TextTheme(
        headline1: TextStyle(color: Colors.white, fontSize: 26.sp, fontWeight: FontWeight.w500),
        headline2: TextStyle(color: Colors.white, fontSize: 25.sp, fontWeight: FontWeight.normal),
        headline3: TextStyle(color: Colors.white, fontSize: 26.sp, fontWeight: FontWeight.normal),
      ),
    );
  }

  static ThemeData inAppPurchasePageThemeData() {
    //+3
    return ThemeData(
      primaryColor: Colors.black,
      backgroundColor: Colors.black,
      brightness: Brightness.dark,
      fontFamily: "Bariol",
      textTheme: TextTheme(
        headline1: TextStyle(color: themeColors['default']!.selectAccountPageNextActive, fontSize: 20.sp, fontWeight: FontWeight.normal),
        headline2: TextStyle(color: themeColors['default']!.selectAccountPageNextActive, fontSize: 26.sp, fontWeight: FontWeight.bold),
      ),
      primaryTextTheme: TextTheme(
        headline1: TextStyle(color: Colors.white, fontSize: 26.sp, fontWeight: FontWeight.bold),
        headline2: TextStyle(color: Colors.white, fontSize: introductionTextSize, fontWeight: FontWeight.bold, height: textLineHeight),
        headline3: TextStyle(color: Colors.white, fontSize: 26.sp, fontWeight: FontWeight.normal),
        headline4: TextStyle(color: Colors.white, fontSize: introductionTextSize, fontWeight: FontWeight.normal),
        subtitle1: TextStyle(
            color: themeColors['default']!.selectAppsSubTitleText, fontSize: 19.sp, fontWeight: FontWeight.normal, height: textLineHeight),
        // subtitle2: TextStyle(color: themeColors['default']!.selectAppsSubTitleText, fontSize: 20.sp, fontWeight: FontWeight.normal),
        // caption: TextStyle(color: Colors.white, fontSize: 26.sp, fontWeight: FontWeight.bold),
      ),
      // accentTextTheme: TextTheme(
      //   headline1: TextStyle(
      //       color: themeColors['default']!.selectAppsSubTitleText, fontSize: 19.sp, fontWeight: FontWeight.normal, height: textLineHeight),
      //   headline2: TextStyle(color: themeColors['default']!.selectAppsSubTitleText, fontSize: 20.sp, fontWeight: FontWeight.normal),
      //   caption: TextStyle(color: Colors.white, fontSize: 26.sp, fontWeight: FontWeight.bold),
      // ),
    );
  }

  static ThemeData selectAccPageThemeData() {
    //+3
    return ThemeData(
      primaryColor: Colors.black,
      backgroundColor: Colors.black,
      brightness: Brightness.dark,
      fontFamily: "Bariol",
      textTheme: TextTheme(
        headline1:
            TextStyle(color: themeColors['default']!.selectAppsSubTitleText, fontSize: introductionTextSize, fontWeight: FontWeight.normal),
        headline2: TextStyle(color: themeColors['default']!.selectAccountPageNextActive, fontSize: 26.sp, fontWeight: FontWeight.bold),
        headline3: TextStyle(
            color: themeColors["default"]!.selectAccountPageDisconnectedTileBGColor, fontSize: 21.sp, fontWeight: FontWeight.normal),
        headline4: TextStyle(
            color: themeColors["default"]!.selectAccountPageDisconnectedTileBGColor, fontSize: 16.sp, fontWeight: FontWeight.bold),
        bodyText1: TextStyle(color: themeColors["default"]!.selectAppsGreenCheck, fontSize: 14.sp, fontWeight: FontWeight.bold),
        bodyText2: TextStyle(color: themeColors["default"]!.selectAppsRedCheck, fontSize: 14.sp, fontWeight: FontWeight.bold),
      ),
      primaryTextTheme: TextTheme(
        headline1: TextStyle(color: Colors.white, fontSize: settingsTitle, fontWeight: FontWeight.bold), //available app
        headline2: TextStyle(color: Colors.white, fontSize: 21.sp, fontWeight: FontWeight.bold), //provider title
        headline3: TextStyle(color: Colors.white, fontSize: 26.sp, fontWeight: FontWeight.normal),
        headline4: TextStyle(color: Colors.white, fontSize: 19.sp, fontWeight: FontWeight.normal), //provider description
        headline5: TextStyle(color: Colors.white, fontSize: 19.sp, fontWeight: FontWeight.bold),
      ),
      // accentTextTheme: TextTheme(
      //   headline1:
      //       TextStyle(color: themeColors['default']!.selectAppsSubTitleText, fontSize: introductionTextSize, fontWeight: FontWeight.normal),
      //   headline2: TextStyle(color: themeColors['default']!.selectAccountPageNextActive, fontSize: 26.sp, fontWeight: FontWeight.bold),
      //   headline3: TextStyle(
      //       color: themeColors["default"]!.selectAccountPageDisconnectedTileBGColor, fontSize: 21.sp, fontWeight: FontWeight.normal),
      //   headline4: TextStyle(
      //       color: themeColors["default"]!.selectAccountPageDisconnectedTileBGColor, fontSize: 16.sp, fontWeight: FontWeight.bold),
      // ),
    );
  }

  static ThemeData goalInfoPageThemeData() {
    //+3
    return ThemeData(
      primaryColor: Colors.black,
      backgroundColor: Colors.black,
      brightness: Brightness.dark,
      fontFamily: "Bariol",
      primaryTextTheme: TextTheme(
        headline1: TextStyle(color: Colors.white, fontSize: 28.sp, fontWeight: FontWeight.w500),
        headline2: TextStyle(color: Colors.white, fontSize: 19.sp, fontWeight: FontWeight.normal),
        headline3: TextStyle(color: Colors.white, fontSize: 15.sp, fontWeight: FontWeight.normal),
        headline4: TextStyle(color: Colors.white, fontSize: 26.sp, fontWeight: FontWeight.normal),
      ),
    );
  }

  static ThemeData settingPageThemeData() {
    //+3
    return ThemeData(
      primaryColor: Colors.black,
      backgroundColor: Colors.black,
      brightness: Brightness.dark,
      fontFamily: "Bariol",
      primaryTextTheme: TextTheme(
        headline1: TextStyle(color: Colors.white, fontSize: settingsTitle, fontWeight: FontWeight.bold), //title -2
        headline2: TextStyle(
            color: themeColors['default']!.selectAppsSubTitleText,
            fontSize: introductionTextSize,
            fontWeight: FontWeight.normal), //desc & email -2
        headline3: TextStyle(color: themeColors['default']!.selectAppsSubTitleText, fontSize: 24.sp, fontWeight: FontWeight.normal), //name
        headline4: TextStyle(color: Colors.white, fontSize: 26.sp, fontWeight: FontWeight.normal), //log out button
        headline5: TextStyle(color: Colors.white, fontSize: 20.sp, fontWeight: FontWeight.bold),
      ),
    );
  }

  static ThemeData notificationPageThemeData() {
    //+3
    return ThemeData(
      primaryColor: Colors.black,
      backgroundColor: Colors.black,
      brightness: Brightness.dark,
      fontFamily: "Bariol",
      textTheme: TextTheme(
        headline1: TextStyle(color: themeColors['default']!.selectAppsSubTitleText, fontSize: 15.sp, fontWeight: FontWeight.bold),
        headline2: TextStyle(color: themeColors['default']!.selectAppsSubTitleText, fontSize: 19.sp, fontWeight: FontWeight.normal),
        headline3: TextStyle(color: themeColors['default']!.selectAccountPageNextActive, fontSize: 19.sp, fontWeight: FontWeight.bold),
      ),
      primaryTextTheme: TextTheme(
        headline1: TextStyle(color: themeColors['default']!.selectAppsSubTitleText, fontSize: 15.sp, fontWeight: FontWeight.bold),
        headline2: TextStyle(color: Colors.white, fontSize: introductionTextSize, fontWeight: FontWeight.normal, height: textLineHeight),
        headline3: TextStyle(color: Colors.white, fontSize: 25.sp, fontWeight: FontWeight.bold),
        headline4: TextStyle(color: Colors.white, fontSize: introductionTextSize, fontWeight: FontWeight.normal, height: textLineHeight),
        headline5: TextStyle(color: Colors.white, fontSize: 13.sp, fontWeight: FontWeight.bold),
        headline6: TextStyle(color: Colors.white, fontSize: 28.sp, fontWeight: FontWeight.bold),
        subtitle1: TextStyle(color: Colors.white, fontSize: 17.sp, fontWeight: FontWeight.normal),
        subtitle2: TextStyle(color: Colors.white, fontSize: labelTextSize, fontWeight: FontWeight.bold),
        bodyText1: TextStyle(color: themeColors['default']!.selectAppsSubTitleText, fontSize: 14.sp, fontWeight: FontWeight.bold),
        bodyText2: TextStyle(color: Colors.white, fontSize: 26.sp, fontWeight: FontWeight.normal),
      ),
      // accentTextTheme: TextTheme(
      //   headline1: TextStyle(color: themeColors['default']!.selectAppsSubTitleText, fontSize: 15.sp, fontWeight: FontWeight.bold),
      //   headline2: TextStyle(color: themeColors['default']!.selectAppsSubTitleText, fontSize: 19.sp, fontWeight: FontWeight.normal),
      //   headline3: TextStyle(color: themeColors['default']!.selectAccountPageNextActive, fontSize: 19.sp, fontWeight: FontWeight.bold),
      // ),
    );
  }

  static ThemeData summaryPageThemeData() {
    //+3
    return ThemeData(
      primaryColor: Colors.black,
      backgroundColor: Colors.black,
      brightness: Brightness.dark,
      fontFamily: "Bariol",
      textTheme: TextTheme(
        headline1: TextStyle(color: themeColors['default']!.selectAppsSubTitleText, fontSize: 19.sp, fontWeight: FontWeight.normal),
        headline2: TextStyle(color: themeColors['default']!.selectAppsSubTitleText, fontSize: 13.sp, fontWeight: FontWeight.bold),
        headline3: TextStyle(color: themeColors['default']!.selectAppsSubTitleText, fontSize: 11.sp, fontWeight: FontWeight.bold),

        // headline1: TextStyle(
        //     color: themeColors['default']!.summaryPageRevenuesCardColor, fontSize: 20.sp, fontWeight: FontWeight.bold), //card title
        // headline2:
        //     TextStyle(color: themeColors['default']!.summaryPageOrdersCardColor, fontSize: 20.sp, fontWeight: FontWeight.bold), //card title
        // headline3: TextStyle(
        //     color: themeColors['default']!.summaryPageAverageValueCardColor, fontSize: 20.sp, fontWeight: FontWeight.bold), //card title
        headline4: TextStyle(
            color: themeColors['default']!.summaryPageGoalCardTitleColor, fontSize: 20.sp, fontWeight: FontWeight.bold), //card title
        headline5: TextStyle(color: themeColors['default']!.selectAccountPageNextActive, fontSize: 18.sp, fontWeight: FontWeight.bold),
        headline6: TextStyle(color: Colors.white, fontSize: 21.sp, fontWeight: FontWeight.bold),

        // headline6: TextStyle(color: Colors.white, fontSize: 20.sp, fontWeight: FontWeight.bold), //card title goal detail
        // weekday comparison tail value green
        subtitle1: TextStyle(color: themeColors['default']!.selectAppsGreenCheck, fontSize: 16.sp, fontWeight: FontWeight.bold),
        // weekday comparison tail value red
        // subtitle2: TextStyle(
        //     color: themeColors['default']!.summaryPageRevenueDayValueComparisonCardNegativeColor,
        //     fontSize: 16.sp,
        //     fontWeight: FontWeight.bold),
        bodyText1: TextStyle(color: Colors.white, fontSize: 23.sp, fontWeight: FontWeight.normal),
        bodyText2: TextStyle(color: Colors.white, fontSize: 26.sp, fontWeight: FontWeight.bold),
        caption: TextStyle(color: Colors.white, fontSize: 28.sp, fontWeight: FontWeight.bold),
      ),
      primaryTextTheme: TextTheme(
        headline1: TextStyle(color: Colors.white, fontSize: 32.sp, fontWeight: FontWeight.bold),
        headline2: TextStyle(color: Colors.white, fontSize: 46.sp, fontWeight: FontWeight.bold),
        headline3: TextStyle(color: Colors.white, fontSize: 22.sp, fontWeight: FontWeight.bold),
        // headline4: TextStyle(color: Colors.white, fontSize: 22.sp, fontWeight: FontWeight.normal),
        headline5: TextStyle(
            color: Colors.white, fontSize: introductionTextSize, fontWeight: FontWeight.normal, height: textLineHeight), //introduction
        headline6: TextStyle(color: Colors.white, fontSize: 14.sp, fontWeight: FontWeight.bold),
        subtitle1: TextStyle(color: Colors.white, fontSize: 15.sp, fontWeight: FontWeight.normal),
        subtitle2: TextStyle(color: Colors.white, fontSize: 34.sp, fontWeight: FontWeight.bold),
        bodyText1: TextStyle(color: Colors.white, fontSize: 20.sp, fontWeight: FontWeight.bold),
        bodyText2: TextStyle(color: Colors.white, fontSize: 31.sp, fontWeight: FontWeight.bold), //value big number
        caption: TextStyle(color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.bold), // weekday comparison tail value
      ),
      // accentTextTheme: TextTheme(
      // headline1: TextStyle(color: themeColors['default']!.selectAppsSubTitleText, fontSize: 19.sp, fontWeight: FontWeight.bold),
      // headline2: TextStyle(color: themeColors['default']!.selectAppsSubTitleText, fontSize: 13.sp, fontWeight: FontWeight.bold),
      // headline3: TextStyle(color: themeColors['default']!.selectAppsSubTitleText, fontSize: labelTextSize, fontWeight: FontWeight.bold),
      // headline4: TextStyle(color: themeColors['default']!.selectAppsSubTitleText, fontSize: labelTextSize, fontWeight: FontWeight.bold),
      // headline5: TextStyle(color: themeColors['default']!.selectAppsSubTitleText, fontSize: 28.sp, fontWeight: FontWeight.bold),
      // headline6:
      //     TextStyle(color: themeColors['default']!.selectAppsSubTitleText, fontSize: introductionTextSize, fontWeight: FontWeight.normal),
      // subtitle1: TextStyle(color: themeColors['default']!.selectAppsSubTitleText, fontSize: 11.sp, fontWeight: FontWeight.bold),
      // subtitle2: TextStyle(
      //     color: themeColors['default']!.selectAppsSubTitleText,
      //     fontSize: introductionTextSize,
      //     fontWeight: FontWeight.normal,
      //     height: textLineHeight),
      // bodyText1: TextStyle(color: themeColors['default']!.selectAppsSubTitleText, fontSize: 12.sp, fontWeight: FontWeight.bold),
      // bodyText2: TextStyle(color: Colors.white, fontSize: 21.sp, fontWeight: FontWeight.bold),
      // ),
    );
  }
}
