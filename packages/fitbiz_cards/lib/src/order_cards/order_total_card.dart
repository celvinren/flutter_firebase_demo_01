import 'package:fitbiz_cards/src/order_cards/order_common_class/order_slidable_middle_title_arrow_card_header.dart';
import 'package:fitbiz_common_card/fitbiz_common_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// ![](https://storage.googleapis.com/amaka_fitbiz_flutter_images_ref/cards/order_total_card.gif)
class FitbizOrderTotalCard extends FitbizOrderSlidableWithMiddleTitleArrowCardHeader {
  FitbizOrderTotalCard({
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
          isShowArrow: isShowArrow ?? true,
          contentHeight: contentHeight ?? 42.h,
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
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.ideographic,
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
