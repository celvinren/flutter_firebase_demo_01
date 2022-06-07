import 'dart:math';

import 'package:fitbiz_cards/src/order_cards/order_common_class/order_middle_title_arrow_card_header.dart';
import 'package:fitbiz_common_card/fitbiz_common_card.dart';
import 'package:fitbiz_progress_bar/fitbiz_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// ![](https://storage.googleapis.com/amaka_fitbiz_flutter_images_ref/cards/order_comparison_card.png)
class FitbizOrderComparisonCard extends FitbizOrderMiddleTitleArrowCardHeader {
  FitbizOrderComparisonCard({
    Key? key,
    required String cardTitle,
    required num orderCurrentValue,
    required num orderPreviousValue,
    bool? isShowArrow,
  }) : super(
          key: key,
          cardTitle: cardTitle,
          isShowArrow: isShowArrow,
          bodyPageList: [
            Column(
              children: [
                FitbizOneRowLineProgressBarChart(
                  mainColor: themeColors['default']!.summaryPageOrdersCardColor,
                  valueText: orderCurrentValue.ceil().toString(),
                  middleText: "Orders",
                  tailText: "Today",
                  value: orderCurrentValue.ceil(),
                  target: [orderCurrentValue.toDouble(), orderPreviousValue.toDouble()].reduce(max).ceil(),
                ),
                SizedBox(height: 20.h),
                FitbizOneRowLineProgressBarChart(
                  mainColor: Color(0xff444448),
                  valueText: orderPreviousValue.ceil().toString(),
                  middleText: "Orders",
                  tailText: "Yesterday",
                  value: orderPreviousValue.ceil(),
                  target: [orderCurrentValue.toDouble(), orderPreviousValue.toDouble()].reduce(max).ceil(),
                ),
              ],
            ),
          ],
        );
}
