import 'package:fitbiz_cards/src/order_cards/order_common_class/order_middle_title_arrow_card_header.dart';
import 'package:fitbiz_common_card/fitbiz_common_card.dart';
import 'package:fitbiz_progress_bar/fitbiz_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// ![](https://storage.googleapis.com/amaka_fitbiz_flutter_images_ref/cards/order_top_5_products.png)
class FitbizOrderTopFiveProductsCard extends FitbizOrderMiddleTitleArrowCardHeader {
  FitbizOrderTopFiveProductsCard({
    Key? key,
    required String cardTitle,
    required List<TopFiveProductsData> topFiveProductsData,
    bool? isShowArrow,
  }) : super(
          key: key,
          cardTitle: cardTitle,
          isShowArrow: isShowArrow ?? true,
          bodyPageList: [
            Column(
              children: topFiveProductsData.map((e) {
                return Column(
                  children: [
                    FitbizOneRowWhiteMiddleLineProgressBarChart(
                      value: e.currentValue,
                      target: e.targetValue,
                      mainColor: themeColors['default']!.summaryPageOrdersCardColor,
                      backgroundColor: themeColors['default']!.summaryPageGoalCardProgressInactiveColor,
                      valueText: e.currentValue.toInt().toString(),
                      middleText: e.productName,
                      middleTextColor: Colors.white,
                      tailText: 'Yesterday',
                      tailBarChartNumberText: e.yesterdayValue.toInt().toString(),
                    ),
                    if (topFiveProductsData.indexOf(e) != topFiveProductsData.length - 1) SizedBox(height: 20.h),
                  ],
                );
              }).toList(),
            )
          ],
        );
}

class TopFiveProductsData {
  final int currentValue;
  final int targetValue;
  final int yesterdayValue;
  final String productName;

  TopFiveProductsData({
    required this.currentValue,
    required this.targetValue,
    required this.yesterdayValue,
    required this.productName,
  });
}
