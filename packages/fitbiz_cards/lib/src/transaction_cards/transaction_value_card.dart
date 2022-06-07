import 'package:fitbiz_cards/src/transaction_cards/transaction_common_card_header.dart';
import 'package:fitbiz_common_card/fitbiz_common_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// ![](https://storage.googleapis.com/amaka_fitbiz_flutter_images_ref/cards/average_total_card.gif)
class FitbizTransactionValueCard extends FitbizTransactionTotalCommonCardHeader {
  FitbizTransactionValueCard({
    Key? key,
    required String cardTitle,
    required String valueFirstPage,
    required String valueSecondPage,
    double? contentHeight,
    bool? isShowArrow,
  }) : super(
          key: key,
          cardTitle: cardTitle,
          isShowArrow: isShowArrow,
          contentHeight: contentHeight,
          bodyPageList: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.ideographic,
                  children: [
                    Text(
                      valueFirstPage,
                      style: AppThemeData.summaryPageThemeData().primaryTextTheme.bodyText2,
                    ),
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      valueSecondPage,
                      style: AppThemeData.summaryPageThemeData().primaryTextTheme.bodyText2,
                    ),
                  ],
                ),
              ],
            ),
          ],
        );
}
