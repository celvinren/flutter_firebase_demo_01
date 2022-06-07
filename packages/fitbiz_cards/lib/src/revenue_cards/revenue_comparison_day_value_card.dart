import 'dart:math';

import 'package:fitbiz_cards/fitbiz_cards.dart';
import 'package:fitbiz_common_card/fitbiz_common_card.dart';
import 'package:fitbiz_progress_bar/fitbiz_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// ![](https://storage.googleapis.com/amaka_fitbiz_flutter_images_ref/cards/order_comparison_card.png)
class FitbizRevenueComparisonDayValueCard extends FitbizRevenueMiddleTitleArrowCardHeader {
  FitbizRevenueComparisonDayValueCard({
    Key? key,
    required String cardTitle,
    required num? revenueCurrentValue,
    required num? revenuePreviousValue,
    required String defaultCurrencySymbal,
    bool? isShowArrow,
  }) : super(
          key: key,
          cardTitle: cardTitle,
          isShowArrow: isShowArrow,
          body: Column(children: [
            FitbizOneRowLineProgressBarChart(
              mainColor: themeColors['default']!.summaryPageRevenuesCardColor,
              valueText: defaultCurrencySymbal + "$revenueCurrentValue",
              middleText: "Sales",
              tailText: "Today",
              value: revenueCurrentValue ?? 0.0,
              target: [(revenueCurrentValue ?? 0.0).toDouble(), (revenuePreviousValue ?? 0.0).toDouble()].reduce(max),
            ),
            SizedBox(height: 20.h),
            FitbizOneRowLineProgressBarChart(
              mainColor: Color(0xff444448),
              valueText: defaultCurrencySymbal + "$revenuePreviousValue",
              middleText: "Sales",
              tailText: "Yesterday",
              value: revenuePreviousValue ?? 0.0,
              target: [(revenueCurrentValue ?? 0.0).toDouble(), (revenuePreviousValue ?? 0.0).toDouble()].reduce(max),
            ),
          ]),
        );
}
