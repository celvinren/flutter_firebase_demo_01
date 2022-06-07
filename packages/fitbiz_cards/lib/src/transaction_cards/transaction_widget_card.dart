import 'package:fitbiz_cards/src/transaction_cards/transaction_common_card_header.dart';
import 'package:fitbiz_common_card/fitbiz_common_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// ![](https://storage.googleapis.com/amaka_fitbiz_flutter_images_ref/cards/average_total_card.gif)
class FitbizTransactionAverageTimeCard extends FitbizTransactionTotalCommonCardHeader {
  FitbizTransactionAverageTimeCard({
    Key? key,
    required String cardTitle,
    required int valueFirstPageHour,
    required int valueFirstPageMins,
    required int valueFirstPageSecs,
    required int valueSecondPageHour,
    required int valueSecondPageMins,
    required int valueSecondPageSecs,
    double? contentHeight,
    bool? isShowArrow,
  }) : super(
          key: key,
          cardTitle: cardTitle,
          isShowArrow: isShowArrow,
          contentHeight: contentHeight,
          bodyPageList: [
            valueFirstPageHour == 0 && valueFirstPageMins == 0 && valueFirstPageSecs == 0
                ? NoDataAvailableWidget()
                : Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.ideographic,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                if (valueFirstPageHour != 0)
                                  TextSpan(
                                    text: valueFirstPageHour.toString(),
                                    style: AppThemeData.summaryPageThemeData().primaryTextTheme.bodyText2,
                                  ),
                                if (valueFirstPageHour != 0)
                                  TextSpan(
                                    text: " hr ",
                                    style: AppThemeData.summaryPageThemeData()
                                        .textTheme
                                        .headline6!
                                        .copyWith(color: themeColors['default']!.selectAppsSubTitleText),
                                  ),
                                if (valueFirstPageMins != 0)
                                  TextSpan(
                                    text: valueFirstPageMins.toString(),
                                    style: AppThemeData.summaryPageThemeData().primaryTextTheme.bodyText2,
                                  ),
                                if (valueFirstPageMins != 0)
                                  TextSpan(
                                    text: " min ",
                                    style: AppThemeData.summaryPageThemeData()
                                        .textTheme
                                        .headline6!
                                        .copyWith(color: themeColors['default']!.selectAppsSubTitleText),
                                  ),
                                if (valueFirstPageSecs != 0)
                                  TextSpan(
                                    text: valueFirstPageSecs.toString(),
                                    style: AppThemeData.summaryPageThemeData().primaryTextTheme.bodyText2,
                                  ),
                                if (valueFirstPageSecs != 0)
                                  TextSpan(
                                    text: " sec ",
                                    style: AppThemeData.summaryPageThemeData()
                                        .textTheme
                                        .headline6!
                                        .copyWith(color: themeColors['default']!.selectAppsSubTitleText),
                                  )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
            valueSecondPageHour == 0 && valueSecondPageMins == 0 && valueSecondPageSecs == 0
                ? NoDataAvailableWidget()
                : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                if (valueSecondPageHour != 0)
                                  TextSpan(
                                    text: valueSecondPageHour.toString(),
                                    style: AppThemeData.summaryPageThemeData().primaryTextTheme.bodyText2,
                                  ),
                                if (valueSecondPageHour != 0)
                                  TextSpan(
                                    text: " hr ",
                                    style: AppThemeData.summaryPageThemeData()
                                        .textTheme
                                        .headline6!
                                        .copyWith(color: themeColors['default']!.selectAppsSubTitleText),
                                  ),
                                if (valueSecondPageMins != 0)
                                  TextSpan(
                                    text: valueSecondPageMins.toString(),
                                    style: AppThemeData.summaryPageThemeData().primaryTextTheme.bodyText2,
                                  ),
                                if (valueSecondPageMins != 0)
                                  TextSpan(
                                    text: " min ",
                                    style: AppThemeData.summaryPageThemeData()
                                        .textTheme
                                        .headline6!
                                        .copyWith(color: themeColors['default']!.selectAppsSubTitleText),
                                  ),
                                if (valueSecondPageSecs != 0)
                                  TextSpan(
                                    text: valueSecondPageSecs.toString(),
                                    style: AppThemeData.summaryPageThemeData().primaryTextTheme.bodyText2,
                                  ),
                                if (valueSecondPageSecs != 0)
                                  TextSpan(
                                    text: " sec ",
                                    style: AppThemeData.summaryPageThemeData()
                                        .textTheme
                                        .headline6!
                                        .copyWith(color: themeColors['default']!.selectAppsSubTitleText),
                                  )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
          ],
        );
}
