import 'package:fitbiz_cards/src/revenue_cards/revenue_common_classes/revenue_sliderable_middle_title_arrow_card_header.dart';
import 'package:fitbiz_common_card/fitbiz_common_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

/// ![](https://storage.googleapis.com/amaka_fitbiz_flutter_images_ref/cards/revenue_total_card.gif)
class FitbizRevenuePartOfDayCard extends FitbizRevenueSlidableWithMiddleTitleArrowCardHeader {
  FitbizRevenuePartOfDayCard({
    Key? key,
    required String cardTitle,
    required double contentHeight,
    required String currentMidnightValue,
    required String currentMorningValue,
    required String currentAfternoonValue,
    required String currentEveningValue,
    required String previousMidnightValue,
    required String previousMorningValue,
    required String previousAfternoonValue,
    required String previousEveningValue,
    bool? isShowArrow,
  }) : super(
          key: key,
          cardTitle: cardTitle,
          contentHeight: contentHeight,
          isShowArrow: isShowArrow,
          bodyPageList: [
            Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Container(
                  constraints: BoxConstraints(
                      minWidth: 345.w, maxWidth: 345.w, minHeight: contentHeight, maxHeight: contentHeight),
                  child: Column(
                    // alignment: WrapAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            constraints: BoxConstraints(minWidth: 345.w / 2, maxWidth: 345.w / 2),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset("assets/images/part_of_day_midnight.svg"),
                                SizedBox(height: 15.h),
                                Text(
                                  currentMidnightValue,
                                  style: AppThemeData.summaryPageThemeData().primaryTextTheme.bodyText2,
                                ),
                                SizedBox(height: 5.h),
                                Text(
                                  "12AM-6AM",
                                  style: AppThemeData.summaryPageThemeData().primaryTextTheme.subtitle1!.copyWith(
                                      color: themeColors["default"]!.selectAppsSubTitleText,
                                      fontWeight: FontWeight.normal),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            constraints: BoxConstraints(minWidth: 345.w / 2, maxWidth: 345.w / 2),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset("assets/images/part_of_day_morning.svg"),
                                SizedBox(height: 15.h),
                                Text(
                                  currentMorningValue,
                                  style: AppThemeData.summaryPageThemeData().primaryTextTheme.bodyText2,
                                ),
                                SizedBox(height: 5.h),
                                Text(
                                  "6AM-12PM",
                                  style: AppThemeData.summaryPageThemeData().primaryTextTheme.subtitle1!.copyWith(
                                      color: themeColors["default"]!.selectAppsSubTitleText,
                                      fontWeight: FontWeight.normal),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 60.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            constraints: BoxConstraints(minWidth: 345.w / 2, maxWidth: 345.w / 2),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset("assets/images/part_of_day_afternoon.svg"),
                                SizedBox(height: 15.h),
                                Text(
                                  currentAfternoonValue,
                                  style: AppThemeData.summaryPageThemeData().primaryTextTheme.bodyText2,
                                ),
                                SizedBox(height: 5.h),
                                Text(
                                  "12PM-6PM",
                                  style: AppThemeData.summaryPageThemeData().primaryTextTheme.subtitle1!.copyWith(
                                      color: themeColors["default"]!.selectAppsSubTitleText,
                                      fontWeight: FontWeight.normal),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            constraints: BoxConstraints(minWidth: 345.w / 2, maxWidth: 345.w / 2),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset("assets/images/part_of_day_evening.svg"),
                                SizedBox(height: 15.h),
                                Text(
                                  currentEveningValue,
                                  style: AppThemeData.summaryPageThemeData().primaryTextTheme.bodyText2,
                                ),
                                SizedBox(height: 5.h),
                                Text(
                                  "6PM-12AM",
                                  style: AppThemeData.summaryPageThemeData().primaryTextTheme.subtitle1!.copyWith(
                                      color: themeColors["default"]!.selectAppsSubTitleText,
                                      fontWeight: FontWeight.normal),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  constraints: BoxConstraints(
                      minWidth: 345.w, maxWidth: 345.w, minHeight: contentHeight, maxHeight: contentHeight),
                  child: Divider(
                    thickness: 1,
                    color: Color(0xff3B3B3D),
                  ),
                ),
                Container(
                  constraints: BoxConstraints(
                      minWidth: 345.w, maxWidth: 345.w, minHeight: contentHeight, maxHeight: contentHeight),
                  child: VerticalDivider(
                    thickness: 1,
                    color: Color(0xff3B3B3D),
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                Container(
                  constraints: BoxConstraints(
                      minWidth: 345.w, maxWidth: 345.w, minHeight: contentHeight, maxHeight: contentHeight),
                  child: Column(
                    // alignment: WrapAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            constraints: BoxConstraints(minWidth: 345.w / 2, maxWidth: 345.w / 2),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset("assets/images/part_of_day_midnight.svg"),
                                SizedBox(height: 15.h),
                                Text(
                                  previousMidnightValue,
                                  style: AppThemeData.summaryPageThemeData().primaryTextTheme.bodyText2,
                                ),
                                SizedBox(height: 5.h),
                                Text(
                                  "12AM-6AM",
                                  style: AppThemeData.summaryPageThemeData()
                                      .primaryTextTheme
                                      .subtitle1!
                                      .copyWith(color: themeColors["default"]!.selectAppsSubTitleText),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            constraints: BoxConstraints(minWidth: 345.w / 2, maxWidth: 345.w / 2),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset("assets/images/part_of_day_morning.svg"),
                                SizedBox(height: 15.h),
                                Text(
                                  previousMorningValue,
                                  style: AppThemeData.summaryPageThemeData().primaryTextTheme.bodyText2,
                                ),
                                SizedBox(height: 5.h),
                                Text(
                                  "6AM-12PM",
                                  style: AppThemeData.summaryPageThemeData()
                                      .primaryTextTheme
                                      .subtitle1!
                                      .copyWith(color: themeColors["default"]!.selectAppsSubTitleText),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 60.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            constraints: BoxConstraints(minWidth: 345.w / 2, maxWidth: 345.w / 2),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset("assets/images/part_of_day_afternoon.svg"),
                                SizedBox(height: 15.h),
                                Text(
                                  previousAfternoonValue,
                                  style: AppThemeData.summaryPageThemeData().primaryTextTheme.bodyText2,
                                ),
                                SizedBox(height: 5.h),
                                Text(
                                  "12PM-6PM",
                                  style: AppThemeData.summaryPageThemeData()
                                      .primaryTextTheme
                                      .subtitle1!
                                      .copyWith(color: themeColors["default"]!.selectAppsSubTitleText),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            constraints: BoxConstraints(minWidth: 345.w / 2, maxWidth: 345.w / 2),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset("assets/images/part_of_day_evening.svg"),
                                SizedBox(height: 15.h),
                                Text(
                                  previousEveningValue,
                                  style: AppThemeData.summaryPageThemeData().primaryTextTheme.bodyText2,
                                ),
                                SizedBox(height: 5.h),
                                Text(
                                  "6PM-12AM",
                                  style: AppThemeData.summaryPageThemeData()
                                      .primaryTextTheme
                                      .subtitle1!
                                      .copyWith(color: themeColors["default"]!.selectAppsSubTitleText),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  constraints: BoxConstraints(
                      minWidth: 359.w, maxWidth: 359.w, minHeight: contentHeight, maxHeight: contentHeight),
                  child: Divider(
                    thickness: 1,
                    color: Color(0xff3B3B3D),
                  ),
                ),
                Container(
                  constraints: BoxConstraints(
                      minWidth: 359.w, maxWidth: 359.w, minHeight: contentHeight, maxHeight: contentHeight),
                  child: VerticalDivider(
                    thickness: 1,
                    color: Color(0xff3B3B3D),
                  ),
                ),
              ],
            ),
          ],
        );
}
