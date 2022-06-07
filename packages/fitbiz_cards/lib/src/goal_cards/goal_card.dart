import 'package:fitbiz_cards/src/goal_cards/goal_common_card_header.dart';
import 'package:fitbiz_cards/src/helper/number_helper.dart';
import 'package:fitbiz_common_card/fitbiz_common_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

/// ![](https://storage.googleapis.com/amaka_fitbiz_flutter_images_ref/cards/revenue_total_card.gif)
class FitbizGoalCard extends FitbizGoalCommonCardHeader {
  FitbizGoalCard({
    Key? key,
    required String cardTitle,
    required double contentHeight,
    required num currentRevenueValue,
    required num currentOrderValue,
    required num currentAverageValue,
    required num currentRevenueTargetValue,
    required num currentOrderTargetValue,
    required num currentAverageTargetValue,
    required num previousRevenueValue,
    required num previousOrderValue,
    required num previousAverageValue,
    required num previousRevenueTargetValue,
    required num previousOrderTargetValue,
    required num previousAverageTargetValue,
    bool? isShowArrow,
    required String defaultCurrencySymbal,
  }) : super(
          key: key,
          cardTitle: cardTitle,
          isShowArrow: isShowArrow,
          contentHeight: contentHeight,
          bodyPageList: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      CircularPercentIndicator(
                        radius: 100.0,
                        lineWidth: 8.0,
                        percent: currentRevenueValue == 0 || currentRevenueTargetValue == 0
                            ? 0.0
                            : (currentRevenueValue / currentRevenueTargetValue > 1
                                ? 1
                                : currentRevenueValue / currentRevenueTargetValue),
                        backgroundColor: themeColors['default']!.summaryPageRevenuesCardColor.withAlpha(75),
                        progressColor: themeColors['default']!.summaryPageRevenuesCardColor,
                        animateFromLastPercent: true,
                        animation: true,
                        circularStrokeCap: CircularStrokeCap.round,
                      ),
                      CircularPercentIndicator(
                        radius: 120.0,
                        lineWidth: 8.0,
                        percent: currentOrderValue == 0 || currentOrderTargetValue == 0
                            ? 0.0
                            : (currentOrderValue / currentOrderTargetValue > 1
                                ? 1
                                : currentOrderValue / currentOrderTargetValue),
                        backgroundColor: themeColors['default']!.summaryPageOrdersCardColor.withAlpha(75),
                        progressColor: themeColors['default']!.summaryPageOrdersCardColor,
                        animateFromLastPercent: true,
                        animation: true,
                        circularStrokeCap: CircularStrokeCap.round,
                      ),
                      CircularPercentIndicator(
                        radius: 140.0,
                        lineWidth: 8.0,
                        percent: currentAverageValue == 0 || currentAverageTargetValue == 0
                            ? 0.0
                            : (currentAverageValue / currentAverageTargetValue > 1
                                ? 1
                                : currentAverageValue / currentAverageTargetValue),
                        backgroundColor: themeColors['default']!.summaryPageAverageValueCardColor.withAlpha(75),
                        progressColor: themeColors['default']!.summaryPageAverageValueCardColor,
                        animateFromLastPercent: true,
                        animation: true,
                        circularStrokeCap: CircularStrokeCap.round,
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          defaultCurrencySymbal + currencyFormat.format(currentRevenueValue),
                          style: AppThemeData.summaryPageThemeData().primaryTextTheme.headline3,
                        ),
                        Text(
                          "Sales",
                          style: AppThemeData.summaryPageThemeData().textTheme.headline1!.copyWith(
                              color: themeColors['default']!.summaryPageRevenuesCardColor, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 15.h),
                        Text(
                          currentOrderValue.ceil().toString(),
                          style: AppThemeData.summaryPageThemeData().primaryTextTheme.headline3,
                        ),
                        Text(
                          "Orders",
                          style: AppThemeData.summaryPageThemeData().textTheme.headline1!.copyWith(
                              color: themeColors['default']!.summaryPageOrdersCardColor, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 15.h),
                        Text(
                          defaultCurrencySymbal + currencyFormat.format(currentAverageValue),
                          style: AppThemeData.summaryPageThemeData().primaryTextTheme.headline3,
                        ),
                        Text(
                          "Avg. Transaction Value",
                          style: AppThemeData.summaryPageThemeData().textTheme.headline1!.copyWith(
                              color: themeColors['default']!.summaryPageAverageValueCardColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      CircularPercentIndicator(
                        radius: 100.0,
                        lineWidth: 8.0,
                        percent: previousRevenueValue == 0 || previousRevenueTargetValue == 0
                            ? 0.0
                            : (previousRevenueValue / previousRevenueTargetValue > 1
                                ? 1
                                : previousRevenueValue / previousRevenueTargetValue),
                        backgroundColor: themeColors['default']!.summaryPageRevenuesCardColor.withAlpha(75),
                        progressColor: themeColors['default']!.summaryPageRevenuesCardColor,
                        animateFromLastPercent: true,
                        animation: true,
                        circularStrokeCap: CircularStrokeCap.round,
                      ),
                      CircularPercentIndicator(
                        radius: 120.0,
                        lineWidth: 8.0,
                        percent: previousOrderValue == 0 || previousOrderTargetValue == 0
                            ? 0.0
                            : (previousOrderValue / previousOrderTargetValue > 1
                                ? 1
                                : previousOrderValue / previousOrderTargetValue),
                        backgroundColor: themeColors['default']!.summaryPageOrdersCardColor.withAlpha(75),
                        progressColor: themeColors['default']!.summaryPageOrdersCardColor,
                        animateFromLastPercent: true,
                        animation: true,
                        circularStrokeCap: CircularStrokeCap.round,
                      ),
                      CircularPercentIndicator(
                        radius: 140.0,
                        lineWidth: 8.0,
                        percent: previousAverageValue == 0 || previousAverageTargetValue == 0
                            ? 0.0
                            : (previousAverageValue / previousAverageTargetValue > 1
                                ? 1
                                : previousAverageValue / previousAverageTargetValue),
                        backgroundColor: themeColors['default']!.summaryPageAverageValueCardColor.withAlpha(75),
                        progressColor: themeColors['default']!.summaryPageAverageValueCardColor,
                        animateFromLastPercent: true,
                        animation: true,
                        circularStrokeCap: CircularStrokeCap.round,
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          defaultCurrencySymbal + currencyFormat.format(previousRevenueValue),
                          style: AppThemeData.summaryPageThemeData().primaryTextTheme.headline3,
                        ),
                        Text(
                          "Sales",
                          style: AppThemeData.summaryPageThemeData().textTheme.headline1!.copyWith(
                              color: themeColors['default']!.summaryPageRevenuesCardColor, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 15.h),
                        Text(
                          previousOrderValue.ceil().toString(),
                          style: AppThemeData.summaryPageThemeData().primaryTextTheme.headline3,
                        ),
                        Text(
                          "Orders",
                          style: AppThemeData.summaryPageThemeData().textTheme.headline1!.copyWith(
                              color: themeColors['default']!.summaryPageOrdersCardColor, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 15.h),
                        Text(
                          defaultCurrencySymbal + currencyFormat.format(previousAverageValue),
                          style: AppThemeData.summaryPageThemeData().primaryTextTheme.headline3,
                        ),
                        Text(
                          "Avg. Transaction Value",
                          style: AppThemeData.summaryPageThemeData().textTheme.headline1!.copyWith(
                              color: themeColors['default']!.summaryPageAverageValueCardColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        );
}
