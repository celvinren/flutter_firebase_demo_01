import 'package:fitbiz_cards/src/transaction_cards/transaction_common_card_header.dart';
import 'package:fitbiz_common_card/fitbiz_common_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// ![](https://storage.googleapis.com/amaka_fitbiz_flutter_images_ref/cards/average_total_card.gif)
class FitbizTransactionTotalCard extends FitbizTransactionTotalCommonCardHeader {
  FitbizTransactionTotalCard({
    Key? key,
    required String cardTitle,
    required String valueFirstPage,
    required String subValueFirstPage,
    required String valueSecondPage,
    required String subValueSecondPage,
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
                    SizedBox(width: 10.w),
                    Text(
                      subValueFirstPage,
                      style: AppThemeData.summaryPageThemeData()
                          .textTheme
                          .subtitle1!
                          .copyWith(color: themeColors['default']!.selectAppsSubTitleText),
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
                    SizedBox(width: 10.w),
                    Text(
                      subValueSecondPage,
                      style: AppThemeData.summaryPageThemeData()
                          .textTheme
                          .subtitle1!
                          .copyWith(color: themeColors['default']!.selectAppsSubTitleText),
                    ),
                  ],
                ),
              ],
            ),
          ],
        );
}
